require 'rails_helper'

RSpec.describe User, type: :model do
   context "validations" do
      let(:user) { create(:user)}

      it "requires an email" do
	 expect(user).to validate_presence_of(:email)
      end

      it "requires a unique email" do
	 expect(user).to validate_uniqueness_of(:email)
      end

      it "requires a unique email (case insensitive)" do
	 user.email = "JASON@TEAMTREEHOUSE.COM"
	 expect(user).to validate_uniqueness_of(:email)
      end
      it "requires the email address to look like an email address" do
	 user.email = "jason"
	 expect(user).to_not be_valid
      end
   end
   describe "#downcase_email" do
      let(:user_attributes) { {
            email: "STRING@STRING.COM",
	    first_name: "Kate",
	    last_name: "Young",
	    password: "password",
	    password_confirmation: "password" 
         }
      }

      it "makes the email attriubte lower case" do
         user = User.new(user_attributes)
         expect{ user.downcase_email }.to change{user.email}.
            from("STRING@STRING.COM").
            to("string@string.com")
      end
      it "downcases an email before saving" do
	 user = User.new(user_attributes)
	 expect(user.save).to be_truthy
	 expect(user.email).to eq("string@string.com")
      end
   end
end
