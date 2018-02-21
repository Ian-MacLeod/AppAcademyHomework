require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", titleize: "Jim") }
  subject(:pudding) { Dessert.new("pudding", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(subject.type).to eq("pudding")
    end

    it "sets a quantity" do
      expect(subject.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(subject.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("pudding", "a lot", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(pudding.ingredients).to be_empty
      pudding.add_ingredient("milk")
      expect(pudding.ingredients).to include("milk")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      expect(pudding.ingredients).to receive(:shuffle!)
      pudding.mix!
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      pudding.eat(3)
      expect(pudding.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { pudding.eat(17) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(chef).to receive(:titleize)
      expect(subject.serve).to include("Jim")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(subject)
      subject.make_more
    end
  end
end
