require "rails_helper"

RSpec.describe Wish, type: :model do
  describe "validations" do

    before(:each) do
      @wish = Wish.create(
                          user_id: 1,
                          title: "gift",
                          description: "wonderful gift",
                          link: "http://gift.com",
                          price: 100.0,
                          locked: true,
                          public: true,
                          favorite: true
                          )

    end

      it "create a wish" do
        expect(@wish.title).to eq("gift")
      end

      it "change wish name" do
        @wish.update(title: "wonderful gift")
        expect(@wish.title).to eq("wonderful gift")
      end


    it "is invalid without title" do
      wish = Wish.new(title: "")
      expect(wish).to_not be_valid

    end


  end
end
