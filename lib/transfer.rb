class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
      if @status != "pending" || !(self.valid?) || @sender.balance < @amount
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @sender.deposit(@amount*-1)
        @receiver.deposit(@amount)
        @status = "complete"
      end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount*-1)
      @status = "reversed"
    end
  end
end
