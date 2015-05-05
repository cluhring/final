require 'test_helper'

class ListTest < ActiveSupport::TestCase
  attr_reader :list

  def setup
    @list = List.create(title: "Chris' ToDos", status: "unarchived")
    @task1 = Task.create(title: "Task1",
                         status: "procrastinating",
                         description: "pass yo test",
                         due_date: 05/05/15,
                         list_id: list.id)
    @task2 = Task.create(title: "Task2",
                         status: "procrastinating",
                         description: "pass yo test",
                         due_date: 05/05/15,
                         list_id: list.id)
  end

  def test_list_is_valid
    assert list.valid?
    assert_equal "Chris' ToDos", list.title
    assert_equal "unarchived", list.status
  end

  def test_list_can_have_many_tasks
    assert_equal 2, list.tasks.count
  end

  def test_can_call_task_methods_on_list_object
    assert_equal "Task1", list.tasks.first.title
    assert_equal "Task2", list.tasks[1].title
  end

end
