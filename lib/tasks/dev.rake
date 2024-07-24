desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  starting = Time.now

  Review.delete_all
  Product.delete_all
  Company.delete_all
  User.delete_all

  people = Array.new(10) do
    {
      username: Faker::Name.first_name
    }
  end

  people << { username: "Alice" }
  people << { username: "Bob" }
  people << { username: "Carol" }
  people << { username: "Doug" }

  people.each do |person|
    username = person.fetch(:username).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      avatar_image: "https://robohash.org/#{username}"
    )
  end
end
