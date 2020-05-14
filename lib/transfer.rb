class Transfer
  attr_reader :sender, :receiver, :amount
  attr_writer :balance
  attr_accessor :status

  @@total_transactions = []

  def initialize(sender, receiver, amount, status= "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@total_transactions << self
  end 

  def checking_status
    #rejects, complete, or reverses status
  end 

  def valid? 
    @sender.valid? && @receiver.valid?
  end 
  
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else 
      self.status= "rejected"
     "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      self.status= "rejected"
      "Transaction rejected. Please check your account balance."
     end 
    
  end 

end
