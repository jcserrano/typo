Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end

Given /the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /the following comments exist/ do |comments_table|
  comments_table.hashes.each do |comment|
    Comment.create!(comment)
  end
end

Given /the articles with ids "(\d+)" and "(\d+)" were merged$/ do |id_1, id_2|
  article = Article.find(id_1)
  article.merge_with(id_2)
end

Then /"(.*?)" should be author of article with id "(\d+)"$/ do |user, id|
  article = Article.find(id)
  article.author.should == User.find_by_name(user).login
end

Then /"(.*?)" should not be author of article with id "(\d+)"$/ do |user, id|
  article = Article.find(id)
  article.author.should_not == User.find_by_name(user).login
end