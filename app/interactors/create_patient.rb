# frozen_string_literal: true

class CreatePatient
  include Interactor

  before do
    cpf = context.patient_params[:cpf]

    context.fail!(error: 'CPF inválido.') if invalid_cpf?(cpf)
  end

  def call
    patient = Patient.create(context.patient_params)

    context.fail!(error: 'Já existe um paciente com este CPF.') unless patient.valid?
  end

  def invalid_cpf?(cpf)
    (
      cpf.size != 11 ||
      !cpf.scan(/\D/).empty? ||
      get_validation_remainder(cpf[0..8]) != cpf[-2].to_i ||
      get_validation_remainder(cpf[0..9]) != cpf[-1].to_i
    )
  end

  def get_validation_remainder(numbers)
    mod = numbers.size + 1

    sum = 0

    numbers.each_char.with_index do |char, i|
      sum += (mod - i) * char.to_i
    end

    (sum % 11) < 2 ? 0 : (11 - (sum % 11))
  end
end
