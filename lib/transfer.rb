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
      if sender.balance > 0 && receiver.balance > 0
        return true
    
        sender_acct = BankAccount.new
        first_transfer = Transfer.new(sender, receiver, 50)

        first_transfer.BankAccount = sender_acct

        
      end
  end

  def execute_transaction

  end

  def reverse_transfer

  end


end
