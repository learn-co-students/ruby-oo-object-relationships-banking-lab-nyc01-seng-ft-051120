require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  @@most_recent_transaction = nil
  @@previous_sender_balance = 1000
  @@previous_receiver_balance = 1000
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
    @@previous_sender_balance = sender.balance
    @@previous_receiver_balance = receiver.balance
  end

  

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if self != @@most_recent_transaction
      if self.valid? && sender.balance >= amount
          sender.balance -= amount 
          receiver.balance += amount
          @@most_recent_transaction = self
          self.status = "complete"
      else  
          self.status = "rejected"
          "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    self.status = "reversed" 
    receiver.balance = @@previous_receiver_balance
    sender.balance = @@previous_sender_balance
  end

end
