require "hive"

Bees.attempt_load("rack") do
  # Note that this leaves Rack::Utils::SYMBOL_TO_STATUS_CODE
  # untouched, since we're overriding, so :the_bees_theyre_in_my_eyes
  # isn't usable. Which is desired behaviour, otherwise
  # :internal_server_error would be unusable!
  Rack::Utils::HTTP_STATUS_CODES[500] = Bees::STATUS_MESSAGE
end
