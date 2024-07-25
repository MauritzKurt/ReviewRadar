desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  starting = Time.now

  Review.delete_all
  Product.delete_all
  Company.delete_all
  User.delete_all

  # Create users
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

  #Create Companies
  companies = Array.new(10) do
    {
      name: Faker::Company.name
    }
  end

  companies << { name: "Google" }
  companies << { name: "Apple" }
  companies << { name: "Samsung" }
  companies << { name: "Microsoft" }

  companies.each do |company|
    name = company.fetch(:name).downcase

    company = Company.create(
      name: name.downcase,
      logo_image: Faker::Company.logo
    )
  end
end
