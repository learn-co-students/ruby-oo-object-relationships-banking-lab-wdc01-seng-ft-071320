require_relative "./bank_account.rb"
require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender,receiver,amount=50)
    @sender=sender
    @receiver=receiver
    @status="pending"
    @amount=amount
  end
  def valid?
    self.sender.valid? && self.receiver.valid? 
  end
  def execute_transaction 
    if sender.balance > self.amount && self.valid? && self.status == 'pending'
      sender.balance -= self.amount
      receiver.deposit(self.amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if self.status == "complete"
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = 'reversed'
      
    end
  end
end
