

When(/^I enter the client details$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the client in the list of clients$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the client successfully added message$/) do
  pending # express the regexp above with the code you wish you had
end


Given(/^I incorrectly complete the new client form$/) do
  #  no fields filled in

end

When(/^I submit new client$/) do
  click_on('Save Client')
end

Then(/^I should see a flash message$/) do
  expect(page).to have_content("Could not add new client")
  expect(page).to have_content("Photo can't be blank")
  expect(page).to have_content("Tel can't be blank")
  expect(page).to have_content("Website can't be blank")
  expect(page).to have_content("Email can't be blank")
end