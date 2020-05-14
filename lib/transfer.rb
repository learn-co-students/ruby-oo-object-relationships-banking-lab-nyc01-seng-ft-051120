class Transfer
  # your code here
  attr_accessor  :status
  attr_reader :sender, :receiver, :amount
  
  # @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    # @@all << self
  end

  def valid?
     @sender.valid? && @receiver.valid?
    #   true
    # else 
    #   false
    # end
  end

  def execute_transaction
     if valid? && self.status == 'pending' && sender.balance > amount
        receiver.balance += amount
       sender.balance -= amount
       self.status= 'complete'
    else
      # reject_transfer
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.status == 'complete' 
      receiver.balance -= amount
      sender.balance += amount
      self.status = 'reversed'
    end
  end
  
  # def reject_transfer
      
    # end

  # def rejected
    
    
  # self.status = 'rejected'
  # end

end
