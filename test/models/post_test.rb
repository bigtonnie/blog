require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'draft? returns true for draft post' do
    assert Post.new(published_at: nil).draft?
  end

  test 'draft? returns false for published post' do
    refute Post.new(published_at: 1.year.ago).draft?
  end

  test 'draft? returns false for scheduled post' do
    refute Post.new(published_at: 1.year.from_now).draft?
  end

  test 'published? returns true for published post' do
    assert Post.new(published_at: 1.year.ago).published?
  end

  test 'published? returns false for draft post' do
    refute Post.new(published_at: nil).published?
  end

  test 'published? returns false for scheduled post' do
    refute Post.new(published_at: 1.year.from_now).published?
  end

  test 'scheduled? returns true for scheduled post' do
    assert Post.new(published_at: 1.year.from_now).scheduled?
  end

  test 'scheduled? returns false for draft post' do
    refute Post.new(published_at: nil).scheduled?
  end

  test 'scheduled? returns false for scheduled post' do
    refute Post.new(published_at: 1.year.ago).scheduled?
  end
end
