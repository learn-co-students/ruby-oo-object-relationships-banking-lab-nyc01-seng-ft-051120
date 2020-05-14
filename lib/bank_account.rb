require "pry"

class BankAccount
    attr_accessor :balance, :status, :transfer
    attr_reader :name

    @@all = []

    def initialize(name)   #acct_balance, status="open", transfer
        @name = name
        @balance = 1000
        @status = "open"
        # @transfer = transfer
        @@all << self
    end 

   
    def self.create_bank_acct
        @@all
    end 

    def deposit(amount)
        @balance += amount
        # binding.pry
    end

    def display_balance
        "Your balance is $#{@balance}."
    end 

    def valid?
        self.balance > 0 && self.status == "open"
    end 
    # def valid(acct_name)

        # if acct_name.status == "open" && acct_name.acct_balance > 0
        
     #if status = open and balance > 0 then it is valid   
    # end 

    def acct_name
        @name
    end 

    def close_account
        self.status = "closed"
    end 
end
