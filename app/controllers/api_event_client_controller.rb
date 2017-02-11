class ApiEventClientController < ApplicationController
  def search

    if params[:repo].present?
      response = Typhoeus.get("https://api.github.com/repos/#{params[:owner]}/#{params[:repo]}/events")

      if response.code == 200
        flash.now[:notice] = "Events retrieved"
        @events = JSON.parse(response.body).select{|event| event["type"].downcase == params[:event].downcase }
        flash.now[:error] = "No matching events of that type" if @events.empty?
      else
        flash.now[:error] = "Owner / Repo combo not found"
      end

    end

  end
end
