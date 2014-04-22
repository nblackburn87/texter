require 'spec_helper'

describe Message do
  it "can handle multiple valid phone numbers in the 'To' field" do
    visit new_message_path
    fill_in "To", with: "3343322700, 5036103316"
    fill_in "From", with: "5033885946"
    fill_in "Body", with: "Hi"
    click_button "Create Message"
    page.should have_content "Your message was sent."
  end
end
