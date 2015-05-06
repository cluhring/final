require 'test_helper'

class TaskIntegrationTest < ActionDispatch::IntegrationTest
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
  end
end
