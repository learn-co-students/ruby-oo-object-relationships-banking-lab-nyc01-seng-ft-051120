require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if @sender.balance >= @amount && @status == "pending" && self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end

#nick = BankAccount.new("Nick")
#nick.balance = 50
#
#chase = BankAccount.new("Chase")
#chase.balance = 100
#
#venmo = Transfer.new(nick, chase, 1000)