Dir.glob(Rails.root.join("db", "seeds", "*.rb")) do |filename|
  load(filename)
end
