class CalendriersController < ApplicationController
  def index
  end

  def download
    send_file File.join(Rails.root, 'public', 'calendrier-when-to-plant.ics')
  end
end
