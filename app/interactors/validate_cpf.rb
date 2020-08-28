# frozen_string_literal: true

class ValidateCpf
  include Interactor

  def call
    context.fail!(error: 'CPF inválido.') if invalid_cpf?(context.cpf)
  end

  def invalid_cpf?(cpf)
    (
      known_invalid_cpfs.include?(cpf) ||
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

  def known_invalid_cpfs
    [
      "00000000000", "11111111111", "22222222222", "33333333333", "44444444444", 
      "55555555555", "66666666666", "77777777777", "88888888888", "99999999999"
    ]
  end
  
end
