class DashboardController < ApplicationController

  def bookings
    @bookings = current_user.bookings
    authorize(@bookings)
  end
end
