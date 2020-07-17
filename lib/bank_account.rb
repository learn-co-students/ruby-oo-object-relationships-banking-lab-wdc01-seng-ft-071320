require 'pry'
class BankAccount
  attr_reader :name
  attr_accessor :balance, :status
#@@all_bank_accounts = []

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    #@@all_bank_accounts << self
  end

# def all
#     @@all_bank_accounts
# end


  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def valid?
    self.status == "open" && self.balance > 0
  end

  def close_account
    self.status = "closed"
  end


end


#binding.pry