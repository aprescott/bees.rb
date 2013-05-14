require "hive"

Bees.attempt_load("webrick") do
  WEBrick::HTTPStatus::StatusMessage[500] = Bees::STATUS
end
