class ApiEvents

  def self.fetch(owner: , repo: , event_type: )

    response = Typhoeus.get("https://api.github.com/repos/#{owner}/#{repo}/events")

    if response.code == 200
      message = "Events retrieved"
      selected_events = JSON.parse(response.body).select{|event| event["type"].downcase == event_type.downcase }
      message << " but no matching events of that type" if selected_events.empty?
    else
      message = "Owner / Repo combo not found"
    end

    return selected_events, message

  end

end
