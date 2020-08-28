# frozen_string_literal: true

class UpdateAppointment
  include Interactor

  before do
    context.appointment = Appointment.find(context.id)
    context.doctor_id = context.appointment.patient[:doctor_id]

    params = context.appointments_params

    Time.zone = 'America/Sao_Paulo'
    context.starts_at = Time.zone.local(params['starts_at(1i)'].to_i,
                                        params['starts_at(2i)'].to_i,
                                        params['starts_at(3i)'].to_i,
                                        params['starts_at(4i)'].to_i,
                                        params['starts_at(5i)'].to_i)
    check_appointment_availability = CheckAppointmentAvailability.call(
      starts_at: context.starts_at,
      doctor_id: context.doctor_id,
      patient_id: context.appointments_params[:patient_id],
      appointment_id: context.appointment.id
    )
    unless check_appointment_availability.success?
      context.fail!(error:
        check_appointment_availability.error)
    end
  end

  def call
    ends_at = context.starts_at + 30.minute
    context.appointment.update(
      {
        patient_id: context.appointments_params[:patient_id],
        doctor_id: context.doctor_id,
        starts_at: context.starts_at,
        ends_at: ends_at
      }
    )
  end
end
