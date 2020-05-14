class Transfer
  # your code here
  attr_accessor :sender, :receiver
  def initialize(sender, receiver, bank_account)
    @sender = sender
    @receiver = receiver
  end
end
