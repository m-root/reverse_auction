# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
doctor1 = Doctor.create(email: "doctor1@ra.com", password: "password")
doctor1.confirm!
doctor2 = Doctor.create(email: "doctor2@ra.com", password: "password")
doctor2.confirm!

patient1 = Patient.create(email: "patient1@ra.com", password: "password")
patient1.confirm!
patient2 = Patient.create(email: "patient2@ra.com", password: "password")
patient2.confirm!
