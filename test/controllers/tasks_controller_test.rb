require 'test_helper'

class TasksControllerTest < ActionController::TestCase

  test "tasks #archive" do
    assert_routing ':id/tasks/archive', controller: 'tasks', action: 'archive', id: ":id"
    assert_response :success
  end

  test '#task show' do
    assert_routing 'lists/1/tasks/2', controller: 'tasks', action: 'show', list_id: "1", id: "2"
    task = List.create(title: "To Do1")
    assert_response :success
  end

end
