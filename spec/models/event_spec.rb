require 'rails_helper'

RSpec.describe Event, type: :model do

  it "has valid factory" do
    event = build(:event)
    expect(event).to be_valid
  end

  context "New pasted event" do
    let(:event_in_the_past) { build(:past_event) }

    it "is not a valid event" do
      expect(event_in_the_past).to_not be_valid
    end

    it "is past cut off time" do
      expect(event_in_the_past.past_cutoff?).to be_truthy
    end

    it "is past start time" do
      expect(event_in_the_past.past_event?).to be_truthy
    end
  end

  context "New future event" do
    let(:event_in_the_future) { build(:future_event) }

    it "is a valid event" do
      expect(event_in_the_future).to be_valid
    end

    it "has no vacancies" do
      expect(event_in_the_future.has_vacancies?).to be_falsy
    end

    it "is not past cut off time" do
      expect(event_in_the_future.past_cutoff?).to be_falsy
    end

    it "is not past start time" do
      expect(event_in_the_future.past_event?).to be_falsy
    end
  end

  context "event with vacancy" do

    it "has vacancies" do
      category = create(:category)

      product = create(:product, category: category)
      event = create(:event, category: category)
      vacancy = create(:slot, event: event, product: product)

      expect(event.has_vacancies?).to be_truthy
    end
  end

  it "default order is by soonest date" do

    third = create(:event, :start_datetime => Time.zone.now + 3.weeks)
    first = create(:event, :start_datetime => Time.zone.now + 1.week)
    second = create(:event, :start_datetime => Time.zone.now + 2.weeks)

    event_dates = Event.all

    expect(event_dates).to eq([first, second, third])

  end
end
