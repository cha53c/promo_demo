Then(/^not see the "(.*?)" link$/) do |link|
  # TODO find out how to check the user session has been logged out
  expect(page).not_to have_content(link)
end