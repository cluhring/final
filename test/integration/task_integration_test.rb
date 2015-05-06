require 'test_helper'

class ListIntegrationTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    list1 = List.create(title: "To Do 1", status: false, id: 505 )
    task2 = Task.create(title: "Task 1", status: true, description: "Groceries", due_date: "Friday" )
    task2 = Task.create(title: "Task 2", status: true, description: "Work Out", due_date: "Everyday" )
    task2 = Task.create(title: "Task 2", status: false, description: "Sleep", due_date: "After I Die" )
  end

  test "As an anonymous user, I can see stuff on List show page" do
    visit "/lists/505"
    assert page.has_content?("My Incomplete Tasks:")
    assert page.has_content?("To Do 1")
    find_link("Create a New List")
    find_link("See All Lists")
  end

  test "As an anonymous user, I can visit the archived lists page" do
    visit "/"
    refute page.has_content?("To Do 2")
    click_link_or_button('See All Lists')
    assert page.has_content?("All Lists")
    find_link("Back")
    assert page.has_content?("To Do 2")
  end

  test "As an anonymous user, I can edit my list title" do
    list1 = List.create(title: "To Do 1", status: false, id: 505 )
    visit "/"
    click_link('Edit')
    assert_equal "/lists/505/edit", current_path
    fill_in "list[title]", with: "Do To 3"
    click_link_or_button('Update List')
    assert_equal "/lists", current_path
    assert page.has_content?("Do To 3 List updated!")
    assert page.has_content?("Do To 3")
  end

  test "As an anonymous user, I can only delete a list if its archived, part 1" do
    list1 = List.create(title: "To Do 1", status: false, id: 505 )
    visit "/"
    click_link('Delete')
    assert page.has_content?("Sorry, the To Do 1 List cannot deleted because it is has not been archived!")
  end

  test "As an anonymous user, I can only delete a list if its archived, part 2" do
    visit "/"
    click_link_or_button('See All Lists')
    assert page.has_content?("To Do 2")
    click_link('Delete')
    assert page.has_content?("To Do 2 List deleted!")
    click_link_or_button('See All Lists')
    refute page.has_content?("To Do 2")
  end
end
