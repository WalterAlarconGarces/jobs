# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    @admin = User.new
    @admin.update_attribute(:email, "walarcon@gmail.com")
    @admin.update_attribute(:password, "123456")
    @admin.update_attribute(:admin, true)
    @admin.save

    
    

   
   

    