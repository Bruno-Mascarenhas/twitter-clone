# frozen_string_literal: true

require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get root_path
    assert_response :success
    assert_select 'title', 'Home | tutorial'
  end

  test 'should get help' do
    get help_path
    assert_response :success
    assert_select 'title', 'Help | tutorial'
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', 'About | tutorial'
  end

  test 'should get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', 'Contact | tutorial'
  end
end
