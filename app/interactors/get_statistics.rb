class GetStatistics
  include Interactor

  def call
    base_query = Appointment

    unless context.doctor_id == ""
      base_query = base_query.where(doctor_id: context.doctor_id)
    end

    context.total_appointments = base_query.count
    context.distinct_patients = base_query
      .select(:patient_id)
      .distinct
      .count

    context
  end  
end