require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
  

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry 
    if sender.balance > self.amount && self.status == "pending" && self.valid?
      sender.balance -= self.amount 
      receiver.balance += self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  

    def reverse_transfer
      if self.status == "complete"
        receiver.balance -= self.amount 
        sender.balance += self.amount 
        self.status = "reversed"
      end 
    end

  
  end #end of class transfer
