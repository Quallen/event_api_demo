require 'spec_helper'

feature "API event client" do

  scenario "success path with valid repo, owner, and event type" do
    visit root_path

    fill_in('repo', :with => "runlog")
    fill_in('owner', :with => "Quallen")
    fill_in('event', :with => "CreateEvent")

    click_button 'Search'

    # should see both a success flash message and the header thats displayed if events are present
    page.should have_content "Events retrieved"
    page.should have_content "Matching Events:"
  end

  scenario "failure path with invalid repo or owner" do
    visit root_path

    fill_in('repo', :with => "nonsense")
    fill_in('owner', :with => "nonsense")
    fill_in('event', :with => "nonsense")

    click_button 'Search'

    page.should have_content "Owner / Repo combo not found"
    page.should_not have_content "Matching Events:"
  end

end
