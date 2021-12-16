# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user1 = User.create(username: "mike1000")
@user2 = User.create(username: "johndoe")
@car1 = Car.create(brand: "Ford", model: "Fiesta 2021", seats_number: 5, transmision: "automatic", mileage: "unlimited", image: "https://www.actualidadmotor.com/wp-content/uploads/2021/09/ford-fiesta-1.jpg", price_for_day: 120, bags_number: 2, user_id: @user1.id)
@car2 = Car.create(brand: "BMW", model: "320i 2020", seats_number: 5, transmision: "automatic", mileage: "unlimited", image: "https://bmwco.vteximg.com.br/arquivos/ids/158217-1440-810/BMW-image-5F31-B39-KCFY-main-556.jpg", price_for_day: 199.9, bags_number: 2, user_id: @user1.id)
@car3 = Car.create(brand: "Mazda", model: "CX30 2019", seats_number: 5, transmision: "automatic", mileage: "unlimited", image: "https://mazdacol.vteximg.com.br/arquivos/ids/162482-1200-900/CX-5_KFL6_KCJ1LAA_46G_KD4_EXT_MAIN_TOURING_2.0L.jpg", price_for_day: 249.9, bags_number: 4, user_id: @user1.id)
Rental.create(start_date: "10-12-2021", end_date: "22-12-2021", city: "Medellin", user_id: @user1.id, car_id: @car1.id)
Rental.create(start_date: "15-12-2021", end_date: "10-01-2022", city: "Lima", user_id: @user1.id, car_id: @car2.id)
Rental.create(start_date: "18-12-2021", end_date: "31-12-2021", city: "Montego Bay", user_id: @user1.id, car_id: @car3.id)