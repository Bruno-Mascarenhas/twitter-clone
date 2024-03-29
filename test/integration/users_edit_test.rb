# frozen_string_literal: true

require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:admin)
  end

  test 'uncessfull edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: '',
                                              email: 'invalid@invalid',
                                              password: 'foo',
                                              password_confirmation: 'bar' } }
    assert_template 'users/edit'
  end

  test 'successful edit' do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'foob'
    email = 'foo@valid.bar'
    patch user_path(@user), params: { user: { name: name, email: email,
                                              password: '',
                                              password_confirmation: '' } }
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test 'successful edit with friendly fowarding' do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = 'foo bar'
    email = 'bobo@valid.com'
    patch user_path(@user), params: { user: { name: name, email: email,
                                              password: '',
                                              password_confirmation: '' } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
