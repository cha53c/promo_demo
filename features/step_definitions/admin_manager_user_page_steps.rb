And (/^should have data for admin user$/) do
  # save_and_open_page
  expect(page).to have_text('Total: 1')
  expect(page).to have_text('Unconfirmed: 0')
  expect(page).to have_text('Never signed in: 0')
  expect(page).to have_text('Locked: 0')
  expect(page.all('tbody tr').count).to eq(1)
  expect(find(:xpath, "//table/tbody/tr/td[2]")).to have_content('admin@test.com')
  expect(find(:xpath, "//table/tbody/tr/td[3]")).to have_content('admin')
  expect(find(:xpath, "//table/tbody/tr/td[5]")).to have_content('1')
  expect(find(:xpath, "//table/tbody/tr/td[7]")).to have_link('Show')
end