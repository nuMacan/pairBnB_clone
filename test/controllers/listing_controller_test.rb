require 'test_helper'

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index_listing" do
    get listing_index_listing_url
    assert_response :success
  end

  test "should get new" do
    get listing_new_url
    assert_response :success
  end

  test "should get create" do
    get listing_create_url
    assert_response :success
  end

  test "should get pricing" do
    get listing_pricing_url
    assert_response :success
  end

  test "should get description" do
    get listing_description_url
    assert_response :success
  end

  test "should get photo_upload" do
    get listing_photo_upload_url
    assert_response :success
  end

  test "should get amenities" do
    get listing_amenities_url
    assert_response :success
  end

  test "should get location" do
    get listing_location_url
    assert_response :success
  end

  test "should get update" do
    get listing_update_url
    assert_response :success
  end

end
