require 'test_helper'

class ListsControllerTest < ActionController::TestCase

  test "lists #index" do
    get :index
    assert_response :success
  end

  test "lists #archived" do
    get :archived
    assert_response :success
  end

  test '#list show' do
    assert_routing '/lists/2', controller: 'lists', action: 'show', id: "2"
    list = List.create(title: "To Do1")
    get :show, id: list.id
  end

  test '#list create' do
    post :create, list: {title: "To Do"}
    assert_response 302
    assert_redirected_to lists_path
  end

  test '#list new' do
    get :new
    assert_response :success
  end
end
