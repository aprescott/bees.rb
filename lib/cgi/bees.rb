require "hive"

Bees.attempt_load("cgi") do
  CGI::HTTP_STATUS["SERVER_ERROR"] = "500 #{Bees::STATUS_MESSAGE}"
end
