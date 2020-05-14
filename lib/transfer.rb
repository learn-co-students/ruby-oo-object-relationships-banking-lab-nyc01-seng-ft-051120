class Transfer
  attr_reader :status
  attr_accessor :sender, :receiver, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end

    def execute_transaction
      if valid? == true && sender.balance > self.amount && self.status == "pending"
        sender.balance -= amount
        receiver.balance += amount
        self.status == "complete"
      else
        reject_transfer
      end
    end
    
    def reject_transfer
      self.status == "rejected"
      "Your transaction has been rejected. Please check your account balance."
    end
end
