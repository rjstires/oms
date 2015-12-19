require "rails_helper"

RSpec.describe InviteMailer, type: :mailer do
  describe "new_user_invite" do
    let(:mail) { InviteMailer.new_user_invite }

    it "renders the headers" do
      expect(mail.subject).to eq("New user invite")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
