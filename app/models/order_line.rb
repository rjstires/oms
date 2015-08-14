class OrderLine < ActiveRecord::Base
  include Filterable
  belongs_to :product
  belongs_to :team
  belongs_to :character
  belongs_to :customer
  belongs_to :order_line_status
  belongs_to :payment_status
  belongs_to :region
  belongs_to :faction

  has_one :category, through: :product

  scope :by_team,->(team) { where(team: team) }

  scope :status,->(id) {
    joins(:order_line_status)
    .where(:order_line_status => id)
    }

  scope :category,->(id) {
    joins(:product)
    .where(:products => {:category_id => id})
    }

  validates :product, presence: true
  validates :character, presence: true
  validates :customer, presence: true

  validates :order_line_status, presence: true
  validates :sale, presence: true
  validates :merchant_fee, presence: true
  validates :site_fee, presence: true
  validates :contractor_payment, presence: true
  validates :faction_id, presence: true
  validates :region_id, presence: true

  validates :order, presence: true, unless: :is_lead?
  validates :team, presence: true, unless: :is_lead?
  validates :payment_status, presence: true, unless: :is_lead?

  def is_lead?
    self.order_line_status.name == 'lead'
  end

  def is_completed?
    self.order_line_status.name.downcase == 'completed'
  end

  def complete
    self.update_attributes(order_line_status: OrderLineStatus.by_name('completed'), completed_at: DateTime.now)
  end

  def self.date_sort
    order(completed_at: :desc, scheduled_at: :desc, created_at: :desc)
  end

  def self.importJSON(file)
    json = parseJSON file
    events = json['events']

    events.each do |row|
      row['spec.name'].downcase!
      row['spec.class'].downcase!
      row['content_description'].downcase!
      row['content_category'].downcase!
      row['team'].downcase!
      row['customer'].downcase!
      row['customer.battle_tag'].downcase!
      row['customer.skype'].downcase!
      row['content_zone'].downcase!
      row['payment_status'].downcase!
      row['order_status'].downcase!
      row['mount_purchase'].downcase!
      row['gear_purchase'].downcase!
      row['play_style'].downcase!

      @order_number = row['order_number'] == "" ? 9999 : row['order_number']

      @date = DateTime.strptime(row['service_date'], '%m/%d/%Y')

      raise "Service date can not be empty when bulk uplodating." if @date == ""

      @sale = row['sale_price'].tr!('$', '').strip
      @sale_merchant = row['transaction_fee'].tr!('$', '').strip
      @sale_site = row['commission'].tr!('$', '').strip
      @sale_contractor = row['team_sale'].tr!('$', '').strip

      @team = Team.find_by!(name: row['team'])
      @classification = Classification.find_by!(name: row['spec.class'])
      @character = Character.find_by!(spec: row['spec.name'], classification: @classification)
      @customer = Customer.find_or_create_by!(
        email: row['customer'],
        battle_tag: row['customer.battle_tag'],
        skype: row['customer.skype'],
        )

      @order_line_status = OrderLineStatus.find_by!(name: row['order_status'])
      @payment_status = PaymentStatus.find_by!(name: row['payment_status'])
      @region = @team.region
      @faction = @team.faction

      if row['content_category'].include?('raid')
        @product_category = Category.find_or_create_by!(name: 'raiding')
      else
        @product_category = Category.find_or_create_by!(name: row['content_category'])
      end

      @product_zone = Zone.find_or_create_by!(name: row['content_zone'])
      @product_play_style = PlayStyle.find_or_create_by!(name: row['play_style'])
      @product_loot_option = LootOption.find_or_create_by!(name: row['gear_purchase'])
      @product_mount = Mount.find_or_create_by!(name: row['mount_purchase'])
      @product_difficulty = Difficulty.find_or_create_by!(name: 'normal')

      difficulties = ['heroic','mythic']
      difficulties.each do |d|
        @product_difficulty = Difficulty.find_or_create_by!(name: d) if row['content_category'].include? d
      end

      @product = Product.find_or_create_by!(
        description: row['content_description'],
        category: @product_category,
        zone: @product_zone,
        play_style: @product_play_style,
        loot_option: @product_loot_option,
        mount: @product_mount,
        difficulty: @product_difficulty
        )

      OrderLine.create! { |o|
        o.order = @order_number
        o.team = @team
        o.region = @region
        o.faction = @faction
        o.character = @character
        o.customer = @customer
        o.order_line_status = @order_line_status
        o.payment_status = @payment_status
        o.product = @product
        o.sale = @sale
        o.merchant_fee = @sale_merchant
        o.site_fee = @sale_site
        o.contractor_payment = @sale_contractor
        o.completed_at = @date
        o.scheduled_at = @date
        }
    end
  end


  def self.parseJSON(f)
    ActiveSupport::JSON.decode( File.read( f.path ) )
  end
end
