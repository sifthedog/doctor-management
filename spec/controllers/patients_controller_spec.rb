require "rails_helper"

RSpec.describe PatientsController, type: :controller do
  describe "GET create" do
    before do
      allow(CreatePatient).to receive(:call) do
        double("Interactor::Context", success?: success, patient: patient, error: '')
      end

      post :create, params: {patient: patient_attributes, doctor_id: 1}
    end

    let(:patient_attributes) do
      { name: "John Doe", cpf: Faker::CPF.numeric, birth_date: Time.now }
    end

    let(:patient){ double(Patient, name: "John Doe", cpf: Faker::CPF.numeric, doctor_id: 1) }

    context "service creation succeeds" do
      let(:success){ true }

      it{ expect(response).to be_redirect }
      it{ expect(flash[:notice]).to be_present }
    end

    context "service creation fails" do
      let(:success){ false }

      it{ expect(flash[:alert]).to be_present }
    end
  end
end