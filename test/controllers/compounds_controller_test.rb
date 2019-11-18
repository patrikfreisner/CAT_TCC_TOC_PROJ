require 'test_helper'

class CompoundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compound = compounds(:one)
  end

  test "should get index" do
    get compounds_url, as: :json
    assert_response :success
  end

  test "should create compound" do
    assert_difference('Compound.count') do
      post compounds_url, params: { compound: { name: @compound.name } }, as: :json
    end

    assert_response 201
  end

  test "should show compound" do
    get compound_url(@compound), as: :json
    assert_response :success
  end

  test "should update compound" do
    patch compound_url(@compound), params: { compound: { name: @compound.name } }, as: :json
    assert_response 200
  end

  test "should destroy compound" do
    assert_difference('Compound.count', -1) do
      delete compound_url(@compound), as: :json
    end

    assert_response 204
  end
end
