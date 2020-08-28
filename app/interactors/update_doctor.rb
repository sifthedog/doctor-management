# frozen_string_literal: true

class UpdateDoctor
  include Interactor

  def call
    doctor = Doctor.find(context.id)
    doctor.update(context.doctor_params)

    if doctor.valid?
      context.doctor = doctor
    else
      context.fail!(errors: doctor.errors.messages)
    end
  end
end
