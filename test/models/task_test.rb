require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  attr_reader :task, :list
  def setup
    @list = List.create(title: "Chris' ToDos", status: false, id: 4)
    @task = Task.create(title: "Task1",
                        status: false,
                        description: "pass yo test",
                        due_date: "2012-03-06 00:00:00 UTC",
                        list_id: list.id)
  end

  def test_task_is_valid
    assert task.valid?
    assert_equal "Task1", task.title
    assert_equal false, task.status
    assert_equal "pass yo test", task.description
    assert_equal 4, task.list_id
  end

  def test_tasks_respond_to_list
    assert_equal "Task1", list.tasks.first.title
  end

  def test_date_formatter_works
    assert_equal "March 6th, 2012", task.date

  end

end
