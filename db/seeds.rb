# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
doctor = Doctor.create(email: "doctor@ra.com", password: "password")
doctor.confirm!

patient = Patient.create(email: "patient@ra.com", password: "password")
patient.confirm!

Auction.create(service: "Bad Sinus Infection")
