require 'test_helper'

class NotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @notation = notations(:one)
  end

  test "should get index" do
    get notations_url, as: :json
    assert_response :success
  end

  test "should create notation" do
    assert_difference('Notation.count') do
      post notations_url, params: { notation: { bpm_notation_code: @notation.bpm_notation_code, can_handle_id: @notation.can_handle_id, can_produce_id: @notation.can_produce_id, compound_id: @notation.compound_id, dependencies_id: @notation.dependencies_id, is_constraint: @notation.is_constraint, name: @notation.name, resource: @notation.resource } }, as: :json
    end

    assert_response 201
  end

  test "should show notation" do
    get notation_url(@notation), as: :json
    assert_response :success
  end

  test "should update notation" do
    patch notation_url(@notation), params: { notation: { bpm_notation_code: @notation.bpm_notation_code, can_handle_id: @notation.can_handle_id, can_produce_id: @notation.can_produce_id, compound_id: @notation.compound_id, dependencies_id: @notation.dependencies_id, is_constraint: @notation.is_constraint, name: @notation.name, resource: @notation.resource } }, as: :json
    assert_response 200
  end

  test "should destroy notation" do
    assert_difference('Notation.count', -1) do
      delete notation_url(@notation), as: :json
    end

    assert_response 204
  end
end
