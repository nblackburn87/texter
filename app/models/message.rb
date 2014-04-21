class Message < ActiveRecord::Base
  before_create :send_message

private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => '',
      :user => '',
      :password => '',
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  end
end
