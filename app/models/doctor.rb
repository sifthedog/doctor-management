# frozen_string_literal: true

class Doctor < ApplicationRecord
  validates_uniqueness_of :crm, scope: %i[crm_uf]

  validates :name, presence: true
  validates :crm, presence: true
  validates :crm_uf, presence: true
end
