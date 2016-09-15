class VersionsController < ApplicationController
  def show
    current_version = ENV.fetch("LATEST_IC_VERSION")
    running_version = params[:version] || "0.0.1"

    svg = if VersionParser.parse(current_version) > VersionParser.parse(running_version)
            File.read(Rails.root.join("app", "assets", "images", "update_available.svg"))
          else
            File.read(Rails.root.join("app", "assets", "images", "up_to_date.svg"))
          end

    respond_to do |format|
      format.svg { render inline: svg }
    end
  end
end
