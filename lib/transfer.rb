class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

def initialize(sender, receiver, amount = 50)
  @sender = sender
  @receiver = receiver
  @status = "pending"
  @amount = amount

end
 
def valid? 
  @sender.valid?  && @receiver.valid?
end

def execute_transaction
  if @status == "pending" && valid?
    if @sender.balance >= @amount
      @sender.balance = @sender.balance - @amount 
      @receiver.balance = @receiver.balance + @amount 
      @status = "complete"
      return @status 
    end
   end 
   @status = "rejected"
   "Transaction #{@status}. Please check your account balance."
end

def reverse_transfer
  if @status == "complete"
    @sender.balance = @sender.balance + @amount 
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed"
  end
end

end
