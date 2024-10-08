unless Rails.env.production?
  namespace :dev do
    desc 'Drop, create, migrate, seed database'
    task hard_reset: [
      :environment,
      'db:drop',
      'db:create',
      'db:migrate',
      'db:seed',
      'dev:sample_data'
    ] do
      p 'drop,create,migrate,seed,sample_data'
    end

    desc 'Delete all, keep database'
    task soft_reset: [
      :environment,
      'dev:delete_all',
      'dev:model_count'
    ]

    desc 'Add Users/Companies/Products/Reviews'
    task sample_data: [
      :environment,
      'dev:start_time',
      'dev:sample_users',
      'dev:sample_companies',
      'dev:sample_products',
      'dev:sample_reviews',
      'dev:end_time'
    ]

    desc 'Delete all'
    task delete_all: :environment do
      Review.delete_all
      Product.delete_all
      Company.delete_all
      User.delete_all
    end

    desc 'Task execution start time'
    task start_time: :environment do
      $starting_time = Time.now
    end

    desc 'Task execution end time'
    task end_time: :environment do
      ending_time = Time.now
      p "It took #{(ending_time - $starting_time).to_i} seconds to create sample data."
      p "There are now #{User.count} users."
      p "There are now #{Company.count} companies."
      p "There are now #{Product.count} products."
      p "There are now #{Review.count} reviews."
    end

    desc 'Total model count'
    task model_count: :environment do
      p "There are #{User.count + Company.count + Product.count + Review.count} total models."
    end

    desc 'Add Users'
    task sample_users: :environment do
      15.times do
        username = Faker::Name.first_name
        User.create(
          username:,
          password: 'password',
          email: "#{username}@example.com",
          avatar_image: "https://robohash.org/#{username}",
          verified: rand(2)
        )
      end

      User.create(
        username: 'Alice',
        password: 'password',
        email: 'Alice@example.com',
        admin: true,
        avatar_image: 'https://robohash.org/Alice',
        verified: true
      )
      User.create(
        username: 'Bob',
        password: 'password',
        email: 'Bob@example.com',
        admin: false,
        avatar_image: 'https://robohash.org/Bob',
        verified: false
      )
    end

    desc 'Add Companies'
    task sample_companies: :environment do
      15.times do
        name = Faker::Device.manufacturer
        Company.create(
          name:,
          description: Faker::Company.catch_phrase,
          logo_image: "logo_placeholder.png",
          url: "https://www.#{name.downcase}.com"
        )
      end
    end

    desc 'Add Products'
    task sample_products: :environment do
      75.times do
        name = Faker::Device.model_name
        Product.create(
          name:,
          logo_image: "product_logo_placeholder.png",
          url: 'https://google.com',
          description: Faker::ChuckNorris.fact,
          company_id: Company.all.sample.id
        )
      end
    end

    desc 'Add Reviews'
    task sample_reviews: :environment do
      types = [Company, Product]
      150.times do
        reviewable_type = types.sample
        Review.create(
          title: Faker::Movie.title,
          body: Faker::Movie.quote,
          reviewable_id: reviewable_type.all.sample.id,
          reviewable_type: reviewable_type.name,
          author_id: User.all.sample.id
        )
      end
    end
  end
end
