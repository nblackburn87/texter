class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def new
    @contacts = Contact.all
    begin
      @contact = Contact.find(params[:contact_id])
      @message = Message.new(:to => @contact.number)
    rescue
      @message = Message.new
    end
  end

  def create
    recipients = params[:message][:to]
    if recipients.length > 10 && recipients.include?(',')
      recipients = recipients.split(',')
      recipients.each do |recipient|
        params[:message][:to] = recipient
        @message = Message.new message_params
        if @message.save
          flash[:notice] = "Your message was sent."
        else
          puts "At least one message failed to send."
        end
      end
      redirect_to messages_path
    else
      @message = Message.new message_params
      binding.pry
      if @message.save
        flash[:notice] = "Your message was sent."
        redirect_to messages_path
      else
        render 'new'
      end
    end
  end

  def show
    @message = Message.find params[:id]
  end

private
  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
