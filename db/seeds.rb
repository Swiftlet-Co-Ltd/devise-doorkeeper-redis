# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "Demo Frontend", redirect_uri: "", scopes: "", uid: "vOVtV_VxutdBoyU0Ua2WLrhDxcdsyzhRBPggloA2RzE", secret: "-Ng31BHpWWvZ590fSh_XTK7YVGch3FBs5guaWNHWxQY")
end

User.create(email: "test@example.com", password: "testtest")
