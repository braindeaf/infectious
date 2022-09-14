# frozen_string_literal: true
module Infectious
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
