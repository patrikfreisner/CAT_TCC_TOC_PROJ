require 'test_helper'

class RelatedNotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @related_notation = related_notations(:one)
  end

  test "should get index" do
    get related_notations_url, as: :json
    assert_response :success
  end

  test "should create related_notation" do
    assert_difference('RelatedNotation.count') do
      post related_notations_url, params: { related_notation: { notation_id: @related_notation.notation_id, related_notation_id: @related_notation.related_notation_id } }, as: :json
    end

    assert_response 201
  end

  test "should show related_notation" do
    get related_notation_url(@related_notation), as: :json
    assert_response :success
  end

  test "should update related_notation" do
    patch related_notation_url(@related_notation), params: { related_notation: { notation_id: @related_notation.notation_id, related_notation_id: @related_notation.related_notation_id } }, as: :json
    assert_response 200
  end

  test "should destroy related_notation" do
    assert_difference('RelatedNotation.count', -1) do
      delete related_notation_url(@related_notation), as: :json
    end

    assert_response 204
  end
end
