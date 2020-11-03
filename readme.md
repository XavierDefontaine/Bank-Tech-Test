# Bank tech test

## Overview
A programme that allows a user to manage their personal finances.
.

```
         _._._                       _._._
        _|   |_                     _|   |_
        | ... |_._._._._._._._._._._| ... |
        | ||| |  o  XAV'S   BANK o  | ||| |
        | """ |  """    """    """  | """ |
   ())  |[-|-]| [-|-]  [-|-]  [-|-] |[-|-]|  ())
  (())) |     |---------------------|     | (()))
 (())())| """ |  """    """    """  | """ |(())())
 (()))()|[-|-]|  :::   .-"-.   :::  |[-|-]|(()))()
 ()))(()|     | |~|~|  |_|_|  |~|~| |     |()))(()
    ||  |_____|_|_|_|__|_|_|__|_|_|_|_____|  ||
 ~ ~^^ @@@@@@@@@@@@@@/=======\@@@@@@@@@@@@@@ ^^~ ~
      ^~^~                                ~^~^
```
## My approach

- I used TDD and best OOP practices
- I worked off the acceptance criterias provided and wrote user stories for clarity
- I used the IRB console to spike and follow up with meaningful tests
- I followed the red/green/refactor until all criterias where met, and decided to add an edge case (error thrown if trying to withdraw more than the balance) for good measure
- I made sure my variables and methods were properly named and SRP followed to allow for flexible and maintanable code 
- As part of my final refactor, I decided to entirely change the data stored for each transaction to a Hash to help with clarity and extracted the print_statement function as a module.


### Requirements:
* The program should be interacted with via a REPL like IRB.
* And the data can be kept in memory and doesn't need to be stored to a database or else
### Acceptance criteria (provided)

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```
## Installation
* Clone the repo
* cd bank_test
* Run bundle install
* Run rspec to test

## How to run it via the console:

```
MacBook-Air:bank_test student$ irb
2.7.1 :001 > require './lib/account.rb'
2.7.1 :002 > account = Account.new
2.7.1 :003 > account = Account.new
 => #<Account:0x00007f94b1838e28 @balance=0, @statement=[]> 
2.7.1 :004 > account.deposit(1000, "10/01/2012")
 => [{:date=>"10/01/2012", :credit=>1000, :balance=>1000}] 
2.7.1 :005 > account.deposit(2000, "13/01/2012")
 => [{:date=>"10/01/2012", :credit=>1000, :balance=>1000}, {:date=>"13/01/2012", :credit=>2000, :balance=>3000}] 
2.7.1 :006 > account.withdraw(500, "14/01/2012")
 => [{:date=>"10/01/2012", :credit=>1000, :balance=>1000}, {:date=>"13/01/2012", :credit=>2000, :balance=>3000}, {:date=>"14/01/2012", :debit=>-500, :balance=>2500}] 
2.7.1 :007 > account.print_statement
date       || credit  || debit  || balance
14/01/2012 ||        || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```

## Tech used
* Linter: [Rubocop](https://github.com/rubocop-hq/rubocop)
* Test framework: [RSpec](https://github.com/rspec/rspec)
* 100% Test coverage with: [Simplecov]([https://github.com/simplecov-ruby/simplecov)
* Dependencies management: [Bundler](https://github.com/rubygems/bundler)

## User Stories

```
As a client
So I can be super cool
I want to open an empty account with Xav's bank

As a client
So I can add money to my bank account
I want to be able to deposit some funds

As a client
So I can take money out of my bank account
I want to be able to withdraw my funds

As a client
So I can not overspend
I want to be reminded when trying to withdraw over my limit

As a client
So I can see my transaction history
I want to be able to print my statement

As a client
So I do not have to scroll through thousands of transaction
I want to be able to see my transcations in reverse chronological order

As a client
So I can see how much I have left
I want to be able to see my balance by each transaction
```

# Bonus user story

```
As a client, 
So I can add an old deposit transaction missing
I want to add a deposit with an old date in the past and have my balance updated accordingly.
```
### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a forgotten deposit of 500 on 09-01-2012  
**When** they prints their bank statement  
**Then** they would see

```
date       || credit  || debit  || balance
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
09/01/2012 ||  500.00 ||        ||  500.00
```