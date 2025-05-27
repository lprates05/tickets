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
  bio: "Love live music and networking events."
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

