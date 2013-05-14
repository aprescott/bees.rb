require "hive"

load_attempts = [
  "rack/bees",
  "thin/bees",
  "webrick/bees",
  "cgi/bees"
].map do |k|
  begin
    require k
  rescue Bees::HandlerLoadError => e
    puts "Failed to require #{k} -- skipping"

    # return nil on failure
    nil
  end
end

# nil load attempt value = failed to load
successful_loads = load_attempts.compact

# if we couldn't load anything at all one, bail
raise LoadError.new("Failed to override any handlers") unless successful_loads.length > 0
