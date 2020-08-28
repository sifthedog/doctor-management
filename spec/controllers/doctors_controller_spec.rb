# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  describe 'GET create' do
    before do
      allow(CreateDoctor).to receive(:call) do
        double('Interactor::Context', success?: success, doctor: doctor, error: '')
      end

      post :create, params: { doctor: doctor_attributes, doctor_id: 1 }
    end

    let(:doctor_attributes) do
      { name: 'John Doe', crm: '01234', crm_uf: 'SP' }
    end

    let(:doctor) { double(Doctor, name: 'John Doe', cpf: Faker::CPF.numeric, doctor_id: 1) }

    context 'service creation succeeds' do
      let(:success) { true }

      it { expect(response).to be_redirect }
      it { expect(flash[:notice]).to be_present }
    end

    context 'service creation fails' do
      let(:success) { false }

      it { expect(flash[:alert]).to be_present }
    end
  end
end
