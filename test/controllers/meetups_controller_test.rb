require 'test_helper'

class MeetupsControllerTest < ActionDispatch::IntegrationTest
  test 'should show main page' do
    get '/meetups/index'
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should redirect to meetup page if there is not id in params' do
    get new_meetup_path
    assert_redirected_to meetups_path
  end

  test 'should redirect to main page if the id in params is not valid' do
    get meetup_path(1)
    assert_redirected_to meetups_path
  end

  test 'should create new meetup with title and description' do
    post meetups_path,
         params: { meetup: { title: 'title', description: 'description' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should update existing meetup and redirect to meetup#index' do
    patch meetup_path(Meetup.first),
          params: { meetup: { title: 'my new title' } }
    assert_redirected_to meetups_path
  end
end
