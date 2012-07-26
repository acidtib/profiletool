require 'test_helper'

class WebsitePagesControllerTest < ActionController::TestCase
  setup do
    @website_page = website_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:website_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create website_page" do
    assert_difference('WebsitePage.count') do
      post :create, website_page: { body_html: @website_page.body_html, body_markdown: @website_page.body_markdown, path: @website_page.path, title: @website_page.title }
    end

    assert_redirected_to website_page_path(assigns(:website_page))
  end

  test "should show website_page" do
    get :show, id: @website_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @website_page
    assert_response :success
  end

  test "should update website_page" do
    put :update, id: @website_page, website_page: { body_html: @website_page.body_html, body_markdown: @website_page.body_markdown, path: @website_page.path, title: @website_page.title }
    assert_redirected_to website_page_path(assigns(:website_page))
  end

  test "should destroy website_page" do
    assert_difference('WebsitePage.count', -1) do
      delete :destroy, id: @website_page
    end

    assert_redirected_to website_pages_path
  end
end
