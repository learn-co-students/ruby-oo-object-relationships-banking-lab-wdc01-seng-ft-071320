require_relative "./bank_account.rb"
require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?  #returns true
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction #execute successful transaction b/t 2 acct
    if self.valid? && self.sender.balance >= self.amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.sender.balance < self.amount && !self.valid? 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed" 
    end
  end


end
