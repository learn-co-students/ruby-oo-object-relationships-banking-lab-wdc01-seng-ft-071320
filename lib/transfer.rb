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

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
      if receiver.balance = self.amount + receiver.balance
      return self.status = "complete"
    else
      return self.status = "rejected"
    end
  end

  def reverse_transfer

  end


end
