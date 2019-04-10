User.create(name: "Bryn B", email: "bryn@bucketlist.com", username: "brynb", password: "easypw")
User.create(name: "Grace R", email: "grace@bucketlist.com", username: "gracer", password: "otherpw")
User.create(name: "Zuma Z", email: "zuma@bucketlist.com", username: "zumaz", password: "puppypw")

Experience.create(name: "Learn to surf", bucketlist: "Life", experienced: true, user_id: 1, location_id: 1)
Experience.create(name: "Get motorcycle license", bucketlist: "Life", experienced: false, user_id: 1, location_id: 2)
Experience.create(name: "Go camping", bucketlist: "Summer", experienced: false, user_id: 1, location_id: 3)

Experience.create(name: "Visit Peru", bucketlist: "Life", experienced: true, user_id: 2, location_id: 4)
Experience.create(name: "Go to Dodger's game", bucketlist: "Summer", experienced: false, user_id: 2, location_id: 2)
Experience.create(name: "Go apple picking", bucketlist: "Fall", experienced: false, user_id: 2, location_id: 5)
Experience.create(name: "Go to Cinespia movie", bucketlist: "Summer", experienced: false, user_id: 2, location_id: 2)

Experience.create(name: "Do West Coast roadtrip", bucketlist: "Life", experienced: true, user_id: 3, location_id: 6)
Experience.create(name: "Hike Westridge", bucketlist: "Spring", experienced: false, user_id: 3, location_id: 2)
Experience.create(name: "Hike Griffith Park", bucketlist: "Spring", experienced: false, user_id: 3, location_id: 2)

Location.create(city: "Puerto Vallarta", country: "Mexico")
Location.create(city: "Los Angeles, CA", country: "U.S.")
Location.create(city: "Big Sur, CA", country: "U.S.")
Location.create(city: "Lima", country: "Peru")
Location.create(city: "Julian, CA", country: "U.S.")
Location.create(city: "West Coast", country: "U.S.")
