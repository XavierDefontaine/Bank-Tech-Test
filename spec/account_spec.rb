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
      expect { subject.credit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'Also logs the date of the transaction' do
      subject.credit(1000, '10/01/2012')
      expect(subject.statement).to include('10/01/2012')
    end

    it 'Also logs a second transaction date' do
      subject.credit(1000, '10/01/2012')
      subject.credit(500, '13/01/2012')
      expect(subject.statement).to include('10/01/2012', '13/01/2012')
    end

    it 'Also logs the transaction value as positive' do
      subject.credit(1000, '10/01/2012')
      expect(subject.statement).to include('10/01/2012' => 1000)
    end
  end

  describe '#debit' do
    let(:user) { Account.new(1200) }

    it 'Decreases the balance amount' do
      expect { user.debit(1000) }.to change { user.balance }.by(-1000)
    end

    it 'Also logs the date of the transaction' do
      user.debit(1000, '10/01/2012')
      expect(user.statement).to include('10/01/2012')
    end

    it 'Also logs the transaction value as negative' do
      user.debit(1000, '10/01/2012')
      expect(user.statement).to include('10/01/2012' => -1000)
    end

    it 'Raises an error if trying to withdraw more than the balance remainder' do
      expect { user.debit(2000) }.to raise_error
    end
  end
end
