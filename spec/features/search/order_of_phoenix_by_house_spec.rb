require 'rails_helper'

RSpec.describe "Order of the Pheonix Members Search" do
  it "should return members belonging to Gryffindor" do
    visit root_path

    select 'Gryffindor'
    click_on 'Search For Members'

    expect(current_path).to eq(search_path)
    expect(page).to have_content('Members: 21')
    expect(page).to have_css('.phoenix-member', count: 21)
    expect(page).to have_css('.phoenix-member-name', count: 21)
    expect(page).to have_css('.phoenix-member-role', count: 21)
    expect(page).to have_css('.phoenix-member-house', count: 21)
    expect(page).to have_css('.phoenix-member-patronus', count: 21)

    within(first('.phoenix-member')) do
      name = find('.phoenix-member-name').text
      expect(name).to_not be_empty
      role = find('.phoenix-member-role').text
      expect(role).to_not be_empty
      house = find('.phoenix-member-house').text
      expect(house).to_not be_empty
      patronus = find('.phoenix-member-patronus').text
      expect(patronus).to_not be_empty
    end
  end
end

# As a user,
# When I visit "/"
# And I Select "Gryffindor" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of the order of the phoenix members that belong to Gryffindor. (i.e. 21)
# And I should see a list with the detailed information for the 21 members of the Order of the Phoenix for house Gryffindor.
# And for each of the members I should see:
# - The name of the member
# - The members role (if it exists)
# - The house the member belongs to
# - The Patronus of the member (if it exists)
