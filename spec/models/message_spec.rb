require 'spec_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5033885946')
    message.save.should be_false
  end

  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5033885946')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end

  # it "accepts multiple numbers in the 'To' field separated by a comma" do
  #   message = Message.new(:body => 'where do you want to eat?',
  #                         :to => ['5036103316', '3343322700'],
  #                         :from => '5033885946')
  #   message.save.should be_true
  # end
end
