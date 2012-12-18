require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
    @user = create(:user)
    @book = create(:book, :user => @user)
    @article = create(:article, :book => @book)
    login_as @user
  end

  test "should get new page" do
    get :new, :book_id => @book
    assert_response :success, @response.body
  end

  test "should create article" do
    post :create, :book_id => @book, :article => attributes_for(:article), :format => :json
    assert_response :success, @response.body
  end

  test "should show article" do
    get :show, :book_id => @book, :id => @article
    assert_response :success, @response.body
  end

  test "should update article" do
    put :update, :id => @article, :article => { :title => 'change' }, :format => :json
    assert_response :success, @response.body
    assert_equal 'change', @article.reload.title
  end
end