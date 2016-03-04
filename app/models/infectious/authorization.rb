module Infectious
  class Authorizations < ApplicationRecord
    serialize :data, Hash
  end
end
