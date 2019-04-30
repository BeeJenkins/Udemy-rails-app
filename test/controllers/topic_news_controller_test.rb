require 'test_helper'

class TopicNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @topic_news = topic_news(:one)
  end

  test "should get index" do
    get topic_news_url
    assert_response :success
  end

  test "should get new" do
    get new_topic_news_url
    assert_response :success
  end

  test "should create topic_news" do
    assert_difference('TopicNew.count') do
      post topic_news_url, params: { topic_news: {  } }
    end

    assert_redirected_to topic_news_url(TopicNew.last)
  end

  test "should show topic_news" do
    get topic_news_url(@topic_news)
    assert_response :success
  end

  test "should get edit" do
    get edit_topic_news_url(@topic_news)
    assert_response :success
  end

  test "should update topic_news" do
    patch topic_news_url(@topic_news), params: { topic_news: {  } }
    assert_redirected_to topic_news_url(@topic_news)
  end

  test "should destroy topic_news" do
    assert_difference('TopicNew.count', -1) do
      delete topic_news_url(@topic_news)
    end

    assert_redirected_to topic_news_url
  end
end
