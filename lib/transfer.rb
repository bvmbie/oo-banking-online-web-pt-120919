class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
  def execute_transaction
    if @sender.balance < @amount && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    elsif @status = "complete"
      puts "Transaction was already excuted"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
end
