require 'spec_helper'

feature "API event client" do

  scenario "success path with valid repo, owner, and event type" do
    visit_fill_in_and_search(repo: "runlog", owner: "Quallen", event: "CreateEvent")

    # should see both a success flash message and the header thats displayed if events are present
    page.should have_content "Events retrieved"
    page.should have_content "Matching Events:"
  end

  scenario "valid repo/owner but no events" do
    visit_fill_in_and_search(repo: "runlog", owner: "Quallen", event: "nonsense")

    page.should have_content "Events retrieved"
    page.should have_content "No matching events of that type"
  end

  scenario "failure path with invalid repo or owner" do
    visit_fill_in_and_search(repo: "nonsense", owner: "nonsense", event: "nonsense")

    page.should have_content "Owner / Repo combo not found"
    page.should_not have_content "Matching Events:"
  end


end
