# frozen_string_literal: true

# Purpose: Parent class for all services. It provides a call method that can be used to call the service.
class ApplicationService
  def self.call(*args, &block)
    new(*args, &block).call
  end
end
