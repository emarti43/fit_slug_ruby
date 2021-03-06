# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
meals = Meal.create!([
  {
    name: "Chicken Tikka Masala", serving_size: "1 cup", kcal: 335,
    total_fat: 22, sat_fat: 12, polyun_fat: 0, monoun_fat: 0, cholesterol: 333,
    sodium: 2072, potassium: 1496, total_carb: 9, fiber: 4, sugar: 11,
    protein: 33, vitamin_a: 64, calcium: 0, vitamin_d: 0, vitamin_c: 26,
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
print "---------------- Created #{Meal.count} Meals----------------\n"

exercises = Exercise.create!([
  {name: "Bicep Curl"},
  {name: "Pull Ups"},
  {name: "Bench Press"},
  {name: "Squats"},
  {name: "Barbell Rows"}
  ])
print "---------------- Created #{Exercise.count} Exercises----------------\n"

muscles = Muscle.create!([
  {name: "Neck"},
  {name: "Traps (trapezius)"},
  {name: "Shoulders (deltoids)"},
  {name: "Chest (pectoralis)"},
  {name: "Biceps (biceps brachii)"},
  {name: "Forearm (brachioradialis)"},
  {name: "Abs (rectus abdominis)"},
  {name: "Quads (quadriceps)"},
  {name: "Calves (gastrocnemius)"},
  {name: "Triceps (tricpes brachii)"},
  {name: "Lats (latissimus dorsi)"},
  {name: "Middle Back (rhomboids)"},
  {name: "Lower Back"},
  {name: "Glutes (gluteus maximus and medius)"},
  {name: "Hamstrings (biceps femoris)"}
  ])
print "---------------- Created #{Muscle.count} Muscles ----------------\n"

users = User.create!([
  {name: "Example User", email: "user@example.com", password: "foobar",
   password_confirmation: "foobar"},
   {name: "binkobanko", email: "eggthomas@gmail.com", password: "foobar",
   password_confirmation: "foobar"}
  ])
print "---------------- Created #{User.count} Users ----------------\n"

exercise_records = ExerciseRecord.create!([
  {user_id: 1, exercise_id: Exercise.first.id, num_reps: 10, weight: 50, num_sets: 5},
  {user_id: 1, exercise_id: Exercise.first.id, num_reps: 10, weight: 50, num_sets: 5},
  {user_id: 1, exercise_id: Exercise.first.id, num_reps: 10, weight: 50, num_sets: 5},
  {user_id: 1, exercise_id: Exercise.first.id, num_reps: 10, weight: 50, num_sets: 5},
  {user_id: 1, exercise_id: Exercise.first.id, num_reps: 10, weight: 50, num_sets: 5},
  {user_id: 1, exercise_id: Exercise.first(2)[1].id, num_reps: 5, weight: 100, num_sets: 5},
  {user_id: 2, exercise_id: Exercise.first(2)[1].id, num_reps: 5, weight: 100, num_sets: 5},
  ])
print "---------------- Created #{ExerciseRecord.count} Exercise Records ----------------\n"

meal_records = MealRecord.create!([
  {user_id: 1, meal_id: 1, num_servings: 4},
  {user_id: 1, meal_id: 2, num_servings: 2},
  {user_id: 2, meal_id: 2, num_servings: 2}
  ])
print "---------------- Created #{MealRecord.count} Meal Records ----------------\n"

exercise_muscles = ExerciseMuscle.create!([
  {exercise_id: 1, muscle_id: 5},
  {exercise_id: 2, muscle_id: 5},
  {exercise_id: 2, muscle_id: 12},
  {exercise_id: 2, muscle_id: 2},
  {exercise_id: 3, muscle_id: 3},
  {exercise_id: 3, muscle_id: 4},
  {exercise_id: 4, muscle_id: 9},
  {exercise_id: 4, muscle_id: 8},
  {exercise_id: 5, muscle_id: 12},
  {exercise_id: 5, muscle_id: 5}
  ])
print "---------------- Created #{ExerciseMuscle.count} Exercise Muscles ----------------\n"
