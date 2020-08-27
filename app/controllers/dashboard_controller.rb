class DashboardController < ApplicationController
  def index
    @doctors = Doctor.all

    result = GetStatistics.call(doctor_id: params[:doctor_id])

    if result.success?
      @distinct_patients = result.distinct_patients
      @total_appointments = result.total_appointments
    else
      render(file: 'public/500.html', status: :internal_server_error, layout: false)
    end
  end
end