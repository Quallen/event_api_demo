def visit_fill_in_and_search(repo: , owner: , event: )

  visit root_path

  fill_in('repo', :with => repo)
  fill_in('owner', :with => owner)
  fill_in('event', :with => event)

  click_button 'Search'

end
