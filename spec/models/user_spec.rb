require 'rails_helper'

RSpec.describe User, type: :model do
 describe "validations" do
   it " requires a first name  " do
     user = User.new FactoryGirl.attributes_for(:user).merge({first_name: nil})
     user.valid?
     expect(user.errors).to have_key(:first_name)
   end
   it " requires a last name  " do
     user = User.new FactoryGirl.attributes_for(:user).merge({last_name: nil})
     user.valid?
     expect(user.errors).to have_key(:last_name)
   end

   it "requies a unique email" do
    # GIVEN: a user created a in the database
    user = FactoryGirl.create(:user)

    # WHEN: we try to create a user with the same email
    attributes         = FactoryGirl.attributes_for :user
    attributes[:email] = user.email
    user1 = User.new attributes
    user1.valid?

    # THEN: there is an error on the email field
    expect(user1.errors).to have_key :email
  end

 end
end
