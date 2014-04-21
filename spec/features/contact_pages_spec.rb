require 'spec_helper'

describe Contact do
  it "prepopulates the 'To' field with a contact's number when clicked on" do
    visit contacts_path
    click_link "John"
    click_link "4569345698"
    page.should have_content "4569345698"
  end
end

# spec currently does not pass
