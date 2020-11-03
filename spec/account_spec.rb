# frozen_string_literal: true

require './lib/account'
describe Account do
  describe '#balance' do
    it 'starts at zero' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#deposit' do

    before(:each) do
      subject.deposit(1000, '10/01/2012')
      subject.deposit(500, '13/01/2012')
    end

    it 'Increases the balance amount' do
      expect { subject.deposit(1000) }.to change { subject.balance }.by(1000)
    end

    it 'Logs the date of the transaction' do
      expect(subject.statement[0].date).to include('10/01/2012')
    end

    it 'Logs a second transaction date' do
      expect(subject.statement[0].date).to include('10/01/2012')
      expect(subject.statement[1].date).to include('13/01/2012')
    end

    it 'Logs the balance and credit value as positive ' do
      expect(subject.statement[0].credit).to eq(1000)
    end
  end

  describe '#withdraw' do
    let(:account) { Account.new(1200) }
    # allows to open a new account with 1200 on

    it 'Decreases the balance amount' do
      expect { account.withdraw(1000) }.to change { account.balance }.by(-1000)
    end

    it 'Also logs the date of the transaction' do
      account.withdraw(1000, '10/01/2012')
      expect(account.statement[0].date).to include('10/01/2012')
    end

    it 'Also logs the transaction value as negative and balance' do
      account.withdraw(1000, '10/01/2012')
      expect(account.statement[0].debit).to eq(-1000)
      expect(account.statement[0].balance).to eq(200)
    end

    it 'Raises an error if trying to withdraw more than the balance remainder' do
      expect { account.withdraw(2000) }.to raise_error 'Forget about it'
    end
  end

  describe '#print' do
    let(:account) { Account.new(900) }
    let(:transaction_1) { double("transaction 1", date: '10/01/2012', credit: 1000, balance: 1000) }
    let(:transaction_1) { double("transaction 2", date: '13/01/2012', credit: 500, balance: 1500) }

    it 'Debit transaction should be listed in the other column' do
      account.withdraw(500.00, '14/01/2012')
      expect{account.print_statement}.to output("date       || credit  || debit  || balance
14/01/2012 ||        || 500.00 || 400.00").to_stdout
    end
  end
  describe 'Feature Test' do
    it 'prints out the statement to the console' do
      subject.deposit(1000.00, '10/01/2012')
      subject.deposit(2000.00, '13/01/2012')
      subject.withdraw(500.00, '14/01/2012')
      expect{subject.print_statement}.to output("date       || credit  || debit  || balance
14/01/2012 ||        || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00").to_stdout
    end
  end
end
