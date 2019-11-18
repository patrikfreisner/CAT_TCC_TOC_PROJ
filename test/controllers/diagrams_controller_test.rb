require 'test_helper'

class DiagramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diagram = diagrams(:one)
  end

  test "should get index" do
    get diagrams_url, as: :json
    assert_response :success
  end

  test "should create diagram" do
    assert_difference('Diagram.count') do
      post diagrams_url, params: { diagram: { bpm_diagram_code: @diagram.bpm_diagram_code, constraint_limit: @diagram.constraint_limit } }, as: :json
    end

    assert_response 201
  end

  test "should show diagram" do
    get diagram_url(@diagram), as: :json
    assert_response :success
  end

  test "should update diagram" do
    patch diagram_url(@diagram), params: { diagram: { bpm_diagram_code: @diagram.bpm_diagram_code, constraint_limit: @diagram.constraint_limit } }, as: :json
    assert_response 200
  end

  test "should destroy diagram" do
    assert_difference('Diagram.count', -1) do
      delete diagram_url(@diagram), as: :json
    end

    assert_response 204
  end
end
