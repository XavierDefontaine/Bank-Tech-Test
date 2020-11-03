# Bank tech test

## Overview
A programme that allows a user to manage their personal finances via the command line.

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
- I worked off the acceptance criterias provided and wrote down user stories for clarity
- I used the IRB console to spike and follow up with meaningful tests
- I followed through with red/green/refactor until all criterias where met, and decided to add an edge case (error thrown if trying to withdraw more than the balance) for good measure
- I made sure my variables and methods were properly named and SRP followed to allow for flexible and maintanable code 
- I then decided to extract a class and separate the print function as a module as part of my final refactor

## Installation
* Clone the repo
* Run bundle install
* Run rspec to test

## How to run it

```

```

## Tech used
* Linter (Rubocop)
* RSpec / Simplecov (100% coverage achieved)
* Bundler (to manage dependencies)

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

## Specifications provided

### Requirements

* You should be able to interact with your code via a REPL like IRB.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

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

