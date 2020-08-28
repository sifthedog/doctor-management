# frozen_string_literal: true

class CreateAppointment
  include Interactor

  before do
    context.appointment = Appointment.new(context.appointments_params)

    check_appointment_availability = CheckAppointmentAvailability.call(
      starts_at: context.appointment.starts_at,
      doctor_id: context.appointment.doctor_id,
      patient_id: context.appointment.patient_id
    )
    unless check_appointment_availability.success?
      context.fail!(error:
        check_appointment_availability.error)
    end
  end

  def call
    context.appointment.ends_at = context.appointment.starts_at + 30.minute
    context.appointment.save!
  end
end
