# frozen_string_literal: true

class DeleteAppointment
  include Interactor

  def call
    appointment = Appointment.find(context.id)
    appointment.destroy
  end
end
