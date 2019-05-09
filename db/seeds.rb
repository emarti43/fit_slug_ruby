# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
meals = Meal.create!([
  {
    name: "Chicken Tikki Masala", serving_size: "2 cups", kcal: 707,
    total_fat: 43, sat_fat: 24, polyun_fat: 0, monoun_fat: 0, cholesterol: 333,
    sodium: 4144, potassium: 1496, total_carb: 19, fiber: 4, sugar: 11,
    protein: 66, vitamin_a: 64, calcium: 0, vitamin_d: 0, vitamin_c: 26,
    iron: 26, magnesium: 0, cobalamin: 0, vitamin_b6: 0
  },
  {
    name: "Sticky Rice", serving_size: "1/2 cup", kcal: 119,
    total_fat: 1, sat_fat: 0, polyun_fat: 0, monoun_fat: 0, cholesterol: 0,
    sodium: 145, potassium: 20, total_carb: 25, fiber: 0, sugar: 3,
    protein: 2, vitamin_a: 0, calcium: 0, vitamin_d: 0, vitamin_c: 0,
    iron: 26, magnesium: 0, cobalamin: 0, vitamin_b6: 0
  },
  ])
print "--------------created #{Meal.count} meals---------\n"

exercises = Exercise.create!([
  {name: "Bicep Curl"}, {name: "Pull Ups"}, {name: "Bench Press"},
  {name: "Squats"}, {name: "Barbell Rows"}
  ])
print "--------------created #{Exercise.count} exercises---------\n"

muscles = Muscle.create!([
  {name: "Neck"}, {name: "Traps (trapezius)"}, {name: "Shoulders (deltoids)"},
  {name: "Chest (pectoralis)"}, {name: "Biceps (biceps brachii)"},
  {name: "Forearm (brachioradialis)"}, {name: "Abs (rectus abdominis)"},
  {name: "Quads (quadriceps)"}, {name: "Calves (gastrocnemius)"},
  {name: "Triceps (tricpes brachii)"}, {name: "Lats (latissimus dorsi)"},
  {name: "Middle Back (rhomboids)"}, {name: "Lower Back"},
  {name: "Glutes (gluteus maximus and medius)"},
  {name: "Hamstrings (biceps femoris)"}
  ])
print "--------------created #{Muscle.count} muscles---------\n"
users = User.create!([
  {name: "Example User", email: "user@example.com", password: "foobar",
   password_confirmation: "foobar"}
  ])
