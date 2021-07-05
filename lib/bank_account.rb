class BankAccount
    attr_reader :name
    attr_accessor :balance, :status, :transfer
    @@all = []
    

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def deposit(money)
        @balance += money
    end

    def display_balance
        "Your balance is $#{@balance}."
    end


    def valid?
        if @status == 'open' && @balance > 0
            true
        else
            false
        end
    end

    def close_account
       @status = 'closed' 
    end
end
