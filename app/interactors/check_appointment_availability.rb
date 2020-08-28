# frozen_string_literal: true

class CheckAppointmentAvailability
  include Interactor

  def call
    if [0, 6].include?(context.starts_at.wday) || context.starts_at.hour == 12
      context.fail!(error: 'A clínica apenas trabalha de segunda à sexta, das 9h-12h e das 13h-18h.')
    end

    context.fail!(error: 'Você não pode agendar para uma data passada.') if context.starts_at < Time.current

    unless Appointment.find_by(
      starts_at: context.starts_at,
      doctor_id: context.doctor_id,
      patient_id: context.patient_id
    ).nil?
      context.fail!(error: 'Já existe uma consulta para este horário')
    end
  end
end
