require "application_system_test_case"

class TopicNewsTest < ApplicationSystemTestCase
  setup do
    @topic_news = topic_news(:one)
  end

  test "visiting the index" do
    visit topic_news_url
    assert_selector "h1", text: "Topic News"
  end

  test "creating a Topic new" do
    visit topic_news_url
    click_on "New Topic New"

    click_on "Create Topic new"

    assert_text "Topic new was successfully created"
    click_on "Back"
  end

  test "updating a Topic new" do
    visit topic_news_url
    click_on "Edit", match: :first

    click_on "Update Topic new"

    assert_text "Topic new was successfully updated"
    click_on "Back"
  end

  test "destroying a Topic new" do
    visit topic_news_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Topic new was successfully destroyed"
  end
end
