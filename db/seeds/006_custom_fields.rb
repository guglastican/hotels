# Custom Fields
puts "Started Seeding Custom Fields..." unless Rails.env.test?

custom_fields = [
  {
    description: "BBQ facilities are available.",
    key: "bbq",
    subject_type: "Place",
    title: "BBQ"
  },
  {
    description: "Slow moving water without waves.",
    key: "calm_waters",
    subject_type: "Place",
    title: "Calm Waters"
  },
  {
    description: "Dogs are permitted.",
    key: "dog_friendly",
    subject_type: "Place",
    title: "Dog Friendly"
  }
]

custom_fields.each do |custom_field|
  CustomField.find_or_create_by(key: custom_field[:key]) do |r|
    r.description = custom_field[:description]
    r.subject_type = custom_field[:subject_type]
    r.title = custom_field[:title]
  end
end

puts "Finished Seeding Custom Fields!" unless Rails.env.test?
