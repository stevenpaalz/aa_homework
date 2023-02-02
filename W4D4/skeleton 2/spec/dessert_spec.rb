require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:cake) { Dessert.new("cake", 25, chef) }
  let(:chef) { double("chef") } 

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end
    it "sets a quantity" do
      expect(cake.quantity).to eq(25)
    end
    it "starts ingredients as an empty array" do
      expect(cake.ingredients).to be_empty
    end
    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake","not a num",chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(cake.ingredients).to_not include("flour")
      cake.add_ingredient("flour")
      expect(cake.ingredients).to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cake.add_ingredient("eggs")
      cake.add_ingredient("sugar")
      cake.add_ingredient("baking soda")
      unmixed = cake.ingredients.dup
      expect(unmixed).not_to eq(cake.mix!)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      prior_quant = cake.quantity.dup
      expect(cake.eat(5)).to be < prior_quant
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cake.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Giovani the Great Baker")
      expect(cake.serve).to eq("Chef Giovani the Great Baker has made 25 cakes!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
    end
  end
end
