# frozen_string_literal: true
require './account'
describe Account do

  describe '#balance' do
    it 'starts at zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#credit' do
    it 'Increases the balance amount' do
      expect{subject.credit(1000)}.to change{(subject.balance)}.by(1000)
    end
    it 'Also logs the date' do
      expect{subject.credit(1000)}.to change{(subject.balance)}.by(1000)
    end
    
  end
end
