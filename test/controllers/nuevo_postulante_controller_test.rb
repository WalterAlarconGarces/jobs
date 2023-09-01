require "test_helper"

class NuevoPostulanteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nuevo_postulante_index_url
    assert_response :success
  end
end
