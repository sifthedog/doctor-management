# frozen_string_literal: true

class AppointmentsController < ApplicationController
  def index
    @appointments = Appoitnment.all.order('starts_at DESC')
  end
end
