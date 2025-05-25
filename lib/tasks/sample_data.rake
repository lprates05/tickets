namespace :sample do
  desc "Create sample users, events, and tickets"

  task generate: :environment do
    puts "🌱 Seeding sample data..."

    5.times do
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "password123",
        profile_photo: "https://picsum.photos/seed/#{rand(1000)}/200/200",
        class_year: [2024, 2025, 2026].sample,
        bio: Faker::Quote.famous_last_words
      )

      2.times do
        event = Event.create!(
          name: Faker::Music.band + " Bash",
          category: ["party", "conference", "social", "professional"].sample,
          start_date: Date.today + rand(1..30),
          end_date: Date.today + rand(31..60),
          start_time: Time.zone.parse("18:00"),
          end_time: Time.zone.parse("23:00"),
          timezone: "Central Time (US & Canada)",
          event_photo: "https://picsum.photos/seed/event#{rand(1000)}/400/300"
        )

        Ticket.create!(
          price: rand(10..50),
          ticket_restrictions: ["Booth students only", "Partners welcome", "Exclusive"].sample,
          ticket_photo: "https://picsum.photos/seed/ticket#{rand(1000)}/300/200",
          seller: user,
          event: event,
          status: "available"
        )
      end
    end

    puts "✅ Sample data created!"
  end
end
