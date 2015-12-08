class CreateCustomerContacts < ActiveRecord::Migration

  def up
    errors = []
    
    ## Create the new table.
    create_table :customer_contacts do |t|
      t.references :customer, index: true, foreign_key: true, null: false
      t.string :value, null: false
      t.integer :ctype, null: false

      t.timestamps null: false
    end

    ## Copy existing Skype and Battle tag addresses to new table.
    Customer.all.each do |c|

      unless c.battle_tag.nil?
        puts "Converting #{c.battle_tag}"
        @battle_tag = c.customer_contacts.new(
          ctype: CustomerContact.ctypes["battle_tag"],
          value: c.battle_tag
          )

        if @battle_tag.save
          puts "Converted battle tag successfully."
        else
          @battle_tag.errors.messages.map { |e| errors.push e }
        end

      end

      unless c.skype.nil?
        puts "Converting #{c.skype}"
        @skype = c.customer_contacts.new(
          ctype: CustomerContact.ctypes["skype"], 
          value: c.skype
          )

        if @skype.save
          puts "Converted skype successfully."
        else
          @skype.errors.messages.map { |e| errors.push e }
        end

      end
    end
    if errors.count > 0
      puts "Error(s) ~~~~~~~~~~~~~~~~"
      errors.map { |e| puts e  }
    else
      remove_column  :customers, :skype
      remove_column  :customers, :battle_tag
    end
  end

  def down
    drop_table :customer_contacts
  end

end
