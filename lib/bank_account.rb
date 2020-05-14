class BankAccount
    attr_reader :name
    attr_accessor :balance, :status, :broke
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(amount)
        self.balance += amount
    end
    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if self.balance > 0 && self.status == "open"
            true
        else
            false
        end
    end

    def broke
       self.balance == 0
    end

    def close_account
        if self.status == "open"
            self.status = "closed"
        end
    end
end

