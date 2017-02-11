class ApiEventClientController < ApplicationController
  def search

    if params[:repo].present?
      response = Typhoeus.get("https://api.github.com/repos/#{params[:owner]}/#{params[:repo]}/events")
      response.code == 200 ? flash.now[:notice] = "Events retrieved" : flash.now[:error] = "Owner / Repo combo not found"

      if response.code == 200
        #puts JSON.parse(response.body)
        @events = JSON.parse(response.body).select{|event| event["type"].downcase == params[:event].downcase }
      end

    end

  end
end
