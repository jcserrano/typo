Feature: Write Articles
  As a blog administrator
  In order to organize blog articles
  I want to be able create new categories and edit categories

Background:
  Given the blog is set up
  And I am logged into the admin panel
  Given I am on the admin content page
  When I follow "Categories"

Scenario: See categories view
  Then I should see "Categories"
  And I should see "Name"
  And I should see "Keywords"
  And I should see "Permalink"
  And I should see "Description"

Scenario: Create a new category
  Then I should be on the new category page
  When I fill in "Name" with "Category_1"
  And I fill in "Keywords" with "keyword_1"
  And I fill in "Description" with "Description_1"
  And I press "Save"
  Then I should be on the new category page
  And I should see "Category_1" 
  And I should see "keyword_1"
  And I should see "Description_1" 

Scenario: Editing an existing category 
  Then I should be on the new category page
  When I follow the edit page with category "General"
  Then I should be on the edit page with category "General"
  And I fill in "Description" with "Description_3"
  And I press "Save"
  Then I should be on the new category page
  And I should see "Description_3"