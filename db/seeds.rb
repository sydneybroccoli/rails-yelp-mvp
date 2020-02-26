require 'faker'

puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
10.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORY.sample
  )
  restaurant.save

  5.times do
    review = Review.new(
      rating: (0..5).to_a.sample,
      content: Faker::Hipster.sentences.join(' '),
      restaurant_id: restaurant.id
    )
    review.save!
    # restaurant.reviews = review
  end

  restaurant.save!
end
