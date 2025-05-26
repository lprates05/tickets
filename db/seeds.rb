# Clear all existing data
Ticket.destroy_all
Event.destroy_all
User.destroy_all
ActiveStorage::Attachment.destroy_all
ActiveStorage::Blob.destroy_all

puts "Old data cleared."

require "open-uri"

# Create sample users
user1 = User.create!(
  name: "Alice Example",
  email: "alice@example.com",
  password: "password",
  profile_photo: "https://picsum.photos/seed/alice/200/200",
  class_year: 2025,
  bio: "Loves live music and networking events."
)

user2 = User.create!(
  name: "Bob Example",
  email: "bob@example.com",
  password: "password",
  profile_photo: "https://picsum.photos/seed/bob/200/200",
  class_year: 2025,
  bio: "Sports enthusiast and occasional concertgoer."
)

puts "Users created."

# Define event categories
categories = ["Party", "Conference", "Professional", "Social", "Sports"]

# Create events
5.times do |i|
  selected_category = categories.sample
  puts "Creating event #{i + 1} with category: #{selected_category}" 

  event = Event.create!(
    name: "Sample Event #{i + 1}",
    category: selected_category,
    start_date: Date.today + rand(1..15),
    end_date: Date.today + rand(16..30),
    start_time: Time.parse("18:00"),
    end_time: Time.parse("23:00"),
    timezone: "Central Time (US & Canada)"
  )
  

  event.event_photo.attach(
    io: URI.open("https://picsum.photos/seed/event#{i}/400/300"),
    filename: "event#{i}.jpg",
    content_type: "image/jpeg"
  )
end

puts "Events created."

# Create tickets
Event.all.each do |event|
  Ticket.create!(
    price: rand(20..100),
    ticket_restrictions: ["No restrictions", "Partners welcome", "Students only"].sample,
    seller_id: user1.id,
    buyer_id: [nil, user2.id].sample,
    status: ["available", "unavailable"].sample,
    event_id: event.id
  ).tap do |ticket|
    ticket.ticket_photo.attach(
      io: URI.open("https://picsum.photos/seed/ticket#{ticket.id}/300/200"),
      filename: "ticket#{ticket.id}.jpg",
      content_type: "image/jpeg"
    )
  end
end

puts "Tickets created and photos attached!"
