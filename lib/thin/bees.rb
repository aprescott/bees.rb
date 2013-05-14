require "hive"

Bees.attempt_load("thin") do
  Thin::HTTP_STATUS_CODES[500] = Bees::STATUS_MESSAGE
end
