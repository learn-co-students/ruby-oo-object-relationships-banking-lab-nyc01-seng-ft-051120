class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && sender.balance > amount && self.valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && receiver.balance > amount
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    else
      "We are unable to reverse your transaction"
    end
  end
end

# grant = BankAccount.new("Grant")
# tyler = BankAccount.new("Tyler")
# nick = BankAccount.new("Nick")
# yannick = BankAccount.new("Yannick")
# heath = BankAccount.new("Heath")
# heath.close_account

# big = Transfer.new(tyler, grant, 5000)
# transfer1 = Transfer.new(nick, grant, 100)
# ya = Transfer.new(yannick, grant, 999)
# transfer2 = Transfer.new(heath, grant, 1)

# binding.pry