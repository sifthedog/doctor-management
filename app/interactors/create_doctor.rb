# frozen_string_literal: true

class CreateDoctor
  include Interactor

  def call
    Rails.logger.info context.doctor_params
    doctor = Doctor.create(context.doctor_params)

    if doctor.valid?
      context.doctor = doctor
    else
      context.fail!(errors: doctor.errors.messages)
    end
  end
end
