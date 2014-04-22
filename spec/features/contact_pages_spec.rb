require 'spec_helper'

describe Contact do
  it "prepopulates the 'To' field with a contact's number when clicked on" do
    visit new_contact_path
    contact = FactoryGirl.build(:contact)
    fill_in :Name, with: contact.name
    fill_in :Number, with: contact.number
    fill_in :Email, with: contact.email
    click_button "Create Contact"
    visit contacts_path
    click_link "#{contact.name}"
    click_link "#{contact.number}"
    find_field('message_to').value.should eq "#{contact.number}"
  end
end

# spec currently does not pass
