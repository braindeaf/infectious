module Infectious
  class Authorization < ApplicationRecord
    serialize :data, Hash
  end
end
