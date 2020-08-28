# frozen_string_literal: true

require 'rails_helper'

describe ValidateCpf do
  subject(:context_success) { ValidateCpf.call(cpf: Faker::CPF.numeric) }
  subject(:context_failure) { ValidateCpf.call(cpf: '00000000000') }

  describe '.call' do
    context 'when given valid CPF' do
      it 'succeeds' do
        expect(context_success).to be_a_success
      end
    end

    context 'when given invalid CPF' do
      it 'fails' do
        expect(context_failure).to be_a_failure
      end

      it 'provides a failure message' do
        expect(context_failure.error).to be_present
      end
    end
  end
end
