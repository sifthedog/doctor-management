# frozen_string_literal: true

class DeleteDoctor
  include Interactor

  before do
    unless Patient.find_by(doctor_id: context.id).nil?
      context.fail!(error: 'Não foi possível excluir este médico. Existe(m) um ou mais pacientes ainda vinculados a ele.')
    end
  end

  def call
    doctor = Doctor.find(context.id)
    doctor.destroy
  end
end
