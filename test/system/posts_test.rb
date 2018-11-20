require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Author", with: @post.author
    fill_in "Author Avatar", with: @post.author_avatar
    fill_in "Author Avatars", with: @post.author_avatars
    fill_in "Author Name", with: @post.author_name
    fill_in "Content", with: @post.content
    fill_in "Featuredmedia", with: @post.featuredmedia
    fill_in "Post Type", with: @post.post_type
    fill_in "Site", with: @post.site_id
    fill_in "Source Link", with: @post.source_link
    fill_in "Tags", with: @post.tags
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Author", with: @post.author
    fill_in "Author Avatar", with: @post.author_avatar
    fill_in "Author Avatars", with: @post.author_avatars
    fill_in "Author Name", with: @post.author_name
    fill_in "Content", with: @post.content
    fill_in "Featuredmedia", with: @post.featuredmedia
    fill_in "Post Type", with: @post.post_type
    fill_in "Site", with: @post.site_id
    fill_in "Source Link", with: @post.source_link
    fill_in "Tags", with: @post.tags
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  end
end
