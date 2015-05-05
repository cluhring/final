require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  attr_reader :task
  def setup
    @list = List.create(title: "Chris' ToDos", status: "unarchived", id: 4)
    @task = Task.create(title: "Task1",
                        status: "procrastinating",
                        description: "pass yo test",
                        due_date: 05/05/15,
                        list_id: @list.id)
  end

  def test_task_is_valid
    assert task.valid?
    assert_equal "Task1", task.title
    assert_equal "procrastinating", task.status
    assert_equal "pass yo test", task.description
    assert_equal 05/05/15, task.due_date
    assert_equal 4, task.list_id
  end

  def test_tasks_respond_to_list
    assert_equal "Task1", @list.tasks.first.title
  end

end
