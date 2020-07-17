require 'pry'
require_relative "./bank_account.rb"

class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction  

    if self.status == "pending" && self.valid? && self.sender.balance > self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance = self.receiver.balance - self.amount
      #binding.pry
      self.sender.balance += self.amount
      self.status = "reversed"
      #binding.pry
    end
  end




end
customer1 = BankAccount.new("Cla")
customer2 = BankAccount.new("Lau")
transaction1 = Transfer.new(customer1, customer2, 30)
puts transaction1.sender.balance
puts transaction1.amount
#binding.pry
