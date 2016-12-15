require "rails_helper"

RSpec.describe Wish, type: :model do
  describe "validations" do
    it "create a wish" do
      wish = Wish.create( title: "gift" )
      expect(wish).to eq(Wish.last)
    end
  end
end
