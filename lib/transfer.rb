class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize (receiver, sender, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if @sender.balance < @amount
      
      return "Transaction rejected. Please check your account balance."
      @status = "rejected"

    elsif @status == "complete"
      puts "Transaction was already excuted"
    else
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    end
  end
  
end
