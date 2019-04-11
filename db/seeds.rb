User.create(name: "Bryn Ben", email: "bryn@bucketlist.com", username: "brynben1234", password: "easypw")
User.create(name: "Grace Roy", email: "grace@bucketlist.com", username: "royroy39", password: "otherpw")
User.create(name: "Zuma Zumerson", email: "zuma@bucketlist.com", username: "zumerson6", password: "puppypw")

Experience.create(name: "Learn to surf", bucketlist: "Life", experienced: true, user_id: 1, location_id: 1)
Experience.create(name: "Get motorcycle license", bucketlist: "Life", experienced: false, user_id: 1, location_id: 2)
Experience.create(name: "Climb Machu Picchu", bucketlist: "Life", experienced: false, user_id: 1, location_id: 4)
Experience.create(name: "Go to Cubs game", bucketlist: "Spring", experienced: false, user_id: 1, location_id: 8)
Experience.create(name: "Visit Grandma", bucketlist: "Spring", experienced: false, user_id: 1, location_id: 9)
Experience.create(name: "Go camping", bucketlist: "Summer", experienced: false, user_id: 1, location_id: 3)
Experience.create(name: "Go to the Hollywood Bowl", bucketlist: "Summer", experienced: false, user_id: 1, location_id: 7)
Experience.create(name: "Go apple picking", bucketlist: "Fall", experienced: false, user_id: 1, location_id: 5)
Experience.create(name: "Visit a pumpkin patch", bucketlist: "Fall", experienced: false, user_id: 1, location_id: 2)
Experience.create(name: "Watch Christmas movies", bucketlist: "Winter", experienced: false, user_id: 1, location_id: 2)
Experience.create(name: "Visit the snow", bucketlist: "Winter", experienced: false, user_id: 1, location_id: 10)


Experience.create(name: "Climb Machu Picchu", bucketlist: "Life", experienced: false, user_id: 2, location_id: 4)
Experience.create(name: "Go to Dodger's game", bucketlist: "Spring", experienced: false, user_id: 2, location_id: 2)
Experience.create(name: "Go to Cinespia movie", bucketlist: "Summer", experienced: false, user_id: 2, location_id: 2)
Experience.create(name: "Go camping", bucketlist: "Fall", experienced: false, user_id: 2, location_id: 10)
Experience.create(name: "Go apple picking", bucketlist: "Fall", experienced: false, user_id: 2, location_id: 5)
Experience.create(name: "Take a ski trip", bucketlist: "Winter", experienced: false, user_id: 1, location_id: 10)


Experience.create(name: "Learn to surf", bucketlist: "Life", experienced: true, user_id: 3, location_id: 3)
Experience.create(name: "Do West Coast roadtrip", bucketlist: "Life", experienced: true, user_id: 3, location_id: 6)
Experience.create(name: "Hike Westridge", bucketlist: "Spring", experienced: false, user_id: 3, location_id: 2)
Experience.create(name: "Hike Griffith Park", bucketlist: "Summer", experienced: false, user_id: 3, location_id: 2)
Experience.create(name: "Play in the leaves", bucketlist: "Fall", experienced: false, user_id: 3, location_id: 5)
Experience.create(name: "Make apple cider", bucketlist: "Winter", experienced: false, user_id: 3, location_id: 10)

Location.create(city: "Puerto Vallarta", country: "Mexico")
Location.create(city: "Los Angeles, CA", country: "U.S.")
Location.create(city: "Big Sur, CA", country: "U.S.")
Location.create(city: "Lima", country: "Peru")
Location.create(city: "Julian, CA", country: "U.S.")
Location.create(city: "West Coast", country: "U.S.")
Location.create(city: "Hollywood, CA", country: "U.S.")
Location.create(city: "Chicago, IL", country: "U.S.")
Location.create(city: "Portola Valley, CA", country: "U.S.")
Location.create(city: "Aspen, CO", country: "U.S.")
