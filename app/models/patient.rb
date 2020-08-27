# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :doctor

  def get_cpf
    cpf[0..2] + "." + cpf[3..5] + "." + cpf[6..8] + "-" + cpf[9..-1]
  end
end
