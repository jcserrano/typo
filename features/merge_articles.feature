Feature: Merge Articles
  As a blog administrator
  So that I can edit an article
  I want to be able to merge similar articles

Background: articles and users have been added to database

  Given the blog is set up

  Given the following users exist:
  | profile_id | login  | name  | password | email           |
  | 2          | juan   | Juan  | 123456   | juan@mail.com   |
  | 3          | pepe   | Pepe  | 123456   | pepe@mail.com   |

  Given the following articles exist:
  | id | title     | author | user_id | body      | published_at        | type    |
  | 3  | Article_1 | juan   | 2       | Content_1 | 2012-07-12 20:28:00 | Article |
  | 4  | Article_2 | pepe   | 3       | Content_2 | 2012-08-12 00:12:01 | Article |

  Given the following comments exist:
  | id | author | body      | article_id | user_id | created_at          | type    |
  | 1  | juan   | Comment_1 | 3          | 2       | 2012-08-12 09:15:00 | Comment |
  | 2  | pepe   | Comment_2 | 4          | 3       | 2012-29-12 20:05:00 | Comment |

Scenario: An user that isn't admin cannot merge articles
  When I go to the login page
  And I fill in "user_login" with "juan"
  When I fill in "user_password" with "123456"
  And I press "Login"
  Then I should see "Login successful"
  And I am on the edit page of article with id 3
  Then I should not see "Merge Articles"

Scenario: An user that is admin can merge articles
  When I go to the login page
  And I am logged into the admin panel
  And I am on the edit page of article with id 3
  Then I should see "Merge Articles"
  When I fill in "merge_with" with "4"
  And I press "Merge"
  Then I should be on the admin content page
  And I should see "Articles were successfully merged"

Scenario: When two articles are merged, a new article should contain the text of the two articles
  Given the articles with ids "3" and "4" were merged
  And I am on the home page
  Then I should see "Article_1"
  When I follow "Article_1"
  Then I should see "Content_1"
  And I should see "Content_2"

Scenario: The merged article contain the author of the two articles
  Given the articles with ids "3" and "4" were merged
  Then "Juan" should be author of article with id "3"
  And "Pepe" should not be author of article with id "3"

Scenario: The merged article contain the comments of the two articles
  Given the articles with ids "3" and "4" were merged
  And I am on the home page
  Then I should see "Article_1"
  When I follow "Article_1"
  Then I should see "Comment_1"
  And I should see "Comment_2"

Scenario: The title of the merged article is one of the two articles
  Given the articles with ids "3" and "4" were merged
  And I am on the home page
  Then I should see "Article_1"
  And I should not see "Article_2"