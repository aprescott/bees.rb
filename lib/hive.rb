module Bees
  STATUS_MESSAGE = "The Bees They're In My Eyes"

  # custom error we can detect an inner require failure specifically
  # instead of an outer require failure
  class HandlerLoadError < LoadError; end

  # Attempt to run the HTTP status code override in the given
  # block. If the first try fails, require gem_name (might not
  # actually be a gem), and try yielding again.
  #
  # This allows us to do, e.g.,
  #
  #     require "rack/bees"
  #
  # as equivalent to
  #
  #     require "rack"
  #     require "rack/bees"
  #
  # If gem_name can't be require()d, a LoadError will be raised
  # as usual.
  def self.attempt_load(gem_name)
    begin
      skip_retry = false
      begin
        yield
      rescue NameError
        return if skip_retry
        require gem_name
        skip_retry = true
        retry
      end
    rescue LoadError
      raise HandlerLoadError.new("Failed to load handler")
    end
  end
end
