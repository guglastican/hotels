# Listing Types
puts "Started Seeding Listing Types..." unless Rails.env.test?

listing_types = [
  { title: "Accommodation", key: "accommodation" },
  { title: "Cafe", key: "cafe" },
  { title: "Restaurant", key: "restaurant" }
]

listing_types.each do |listing_type|
  ListingType.find_or_create_by(key: listing_type[:key]) do |r|
    r.title = listing_type[:title]
  end
end

puts "Finished Seeding Listing Types!" unless Rails.env.test?
