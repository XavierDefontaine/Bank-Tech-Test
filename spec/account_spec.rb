# frozen_string_literal: true
require './account'
describe Account do

  describe '#balance' do
    it 'starts at zero' do
      
    end
  end


  describe '#credit' do
    it 'Increases the balance amount' do
      subject.credit(1000)
      expect(balance).to eq 1000
    end
  end
end


# it "Balance of oyster card equals 0" do
#   expect(subject.balance).to eq 0
# end

# it "Top up oyster card with £2" do
#   expect{subject.top_up(2)}.to change{(subject.balance)}.by(2)
# end

# it "Limit for oyster card £90" do
#   limit = OysterCard::OYSTER_LIMIT
#   subject.top_up(limit)  
#  expect{subject.top_up(90) }.to raise_error("Maximum Limit")      
# end 

# it "Deduct £2 from oyster card" do
#   subject.top_up(10)
#   expect{subject.send(:deduct, 5)}.to change{(subject.balance)}.from(10).to(5)
# end