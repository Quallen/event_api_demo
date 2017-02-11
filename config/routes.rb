Rails.application.routes.draw do
  match 'api_event_client/search' => 'api_event_client#search', via: [:get, :post]

  root 'api_event_client#search'
end
