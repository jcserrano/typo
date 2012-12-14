When /^I follow the edit page with category "([^"]*)"$/ do |name|
  id = Category.find_by_name(name).id
  visit "/admin/categories/edit/#{id}"
end