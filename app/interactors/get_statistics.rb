# frozen_string_literal: true

class GetStatistics
  include Interactor

  def call
    base_query = Appointment

    base_query = base_query.where(doctor_id: context.doctor_id) unless context.doctor_id == ''

    context.total_appointments = base_query.count
    context.distinct_patients = base_query
                                .select(:patient_id)
                                .distinct
                                .count

    context
  end
end
