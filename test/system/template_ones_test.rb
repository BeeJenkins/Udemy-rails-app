require "application_system_test_case"

class TemplateOnesTest < ApplicationSystemTestCase
  setup do
    @template_one = template_ones(:one)
  end

  test "visiting the index" do
    visit template_ones_url
    assert_selector "h1", text: "Template Ones"
  end

  test "creating a Template one" do
    visit template_ones_url
    click_on "New Template One"

    fill_in "String input 1", with: @template_one.string_input_1
    click_on "Create Template one"

    assert_text "Template one was successfully created"
    click_on "Back"
  end

  test "updating a Template one" do
    visit template_ones_url
    click_on "Edit", match: :first

    fill_in "String input 1", with: @template_one.string_input_1
    click_on "Update Template one"

    assert_text "Template one was successfully updated"
    click_on "Back"
  end

  test "destroying a Template one" do
    visit template_ones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Template one was successfully destroyed"
  end
end
