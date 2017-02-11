class ApiEventClientController < ApplicationController

  def search

    if params[:repo].present?
      @events, message = ApiEvents.fetch(repo: params[:repo], owner: params[:owner], event_type: params[:event])
      flash.now[:notice] = message
    end

  end
end
