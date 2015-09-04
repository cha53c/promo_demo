Given (/^I have an admin account for (.*?)$/) do |email|
  User.create!(email: email, password: '12345678', password_confirmation: '12345678', role: 'admin', confirmed_at: DateTime.new(1970,1,1))
end