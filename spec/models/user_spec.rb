require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "create a user" do
      user = User.create(name: "Juan",password:"12345678",email: "juan@mail.com")
      expect(user).to eq(User.last)
    end

    it "generates an error on create user with four digits" do
      user = User.create(name: "Juan",password:"1234",email: "juan@mail.com")
      expect(user).to be_invalid
    end

    it "generates an error on create user with invalid mail" do
      user = User.create(name: "Juan",password:"123456",email: "juan@mail")
      expect(user).to be_invalid
    end
  end



  describe 'associations' do
    it 'has_many' do
      association = described_class.reflect_on_association(:wishes)
      expect(association.macro).to eq :has_many
    end
    it 'has_many' do
      association = described_class.reflect_on_association(:followings)
      expect(association.macro).to eq :has_many
    end
  end
end
