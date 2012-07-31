require 'test_helper'

class Dashboard::Blog::PostsControllerTest < ActionController::TestCase
  setup do
    @dashboard_blog_post = dashboard_blog_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dashboard_blog_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dashboard_blog_post" do
    assert_difference('Dashboard::Blog::Post.count') do
      post :create, dashboard_blog_post: { text: @dashboard_blog_post.text, title: @dashboard_blog_post.title }
    end

    assert_redirected_to dashboard_blog_post_path(assigns(:dashboard_blog_post))
  end

  test "should show dashboard_blog_post" do
    get :show, id: @dashboard_blog_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dashboard_blog_post
    assert_response :success
  end

  test "should update dashboard_blog_post" do
    put :update, id: @dashboard_blog_post, dashboard_blog_post: { text: @dashboard_blog_post.text, title: @dashboard_blog_post.title }
    assert_redirected_to dashboard_blog_post_path(assigns(:dashboard_blog_post))
  end

  test "should destroy dashboard_blog_post" do
    assert_difference('Dashboard::Blog::Post.count', -1) do
      delete :destroy, id: @dashboard_blog_post
    end

    assert_redirected_to dashboard_blog_posts_path
  end
end
