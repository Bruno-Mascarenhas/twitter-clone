# frozen_string_literal: true

require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:admin).id,
                                     followed_id: users(:malory).id)
  end

  test 'should be valid' do
    assert @relationship.valid?
  end

  test 'should require a follower_id' do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  #   test 'should require a followed_id' do
  #     @relantionship.followed_id = nil
  #     assert_not @relantionship.valid?
  #   end
end
