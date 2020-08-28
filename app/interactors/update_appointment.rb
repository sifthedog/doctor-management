# frozen_string_literal: true

class UpdateAppointment
  include Interactor

  before do
    context.appointment = Appointment.find(context.id)

    check_appointment_availability = CheckAppointmentAvailability.call(
      starts_at: context.appointments_params.starts_at,
      doctor_id: context.appointments_params.doctor_id,
      patient_id: context.appointments_params.patient_id
    )
    unless check_appointment_availability.success?
      context.fail!(error:
        check_appointment_availability.error)
    end
  end

  def call
    ends_at = context.appointments_params.starts_at + 30.minute
    context.appointment.update(context.appointments_params.merge!(ends_at: ends_at))
  end
end
