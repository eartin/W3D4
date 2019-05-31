# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

ApplicationRecord.transaction do
  
  calvin = User.create!(username: 'Calvin Nguyen')
  eugene = User.create!(username: 'Eugene')
  bob = User.create!(username: 'Bob')
  hagrid = User.create!(username: 'Hagrid')
  harry = User.create!(username: 'Harry')
  hermione = User.create!(username: 'Hermione')
  ron = User.create!(username: 'Ron')
  dumbledore = User.create!(username: 'Dumbledore')
  draco = User.create!(username: 'Draco')
  nimbus = User.create!(username: 'Nimbus')
  andy = User.create!(username: 'Andy')

  #polls
  appacademy_poll = Poll.create!(title: "AppAcademy", author_id: andy.id)
  calvin_poll = Poll.create!(title: "Calvin's Poll", author_id: calvin.id)
  eugene_poll = Poll.create!(title: "Eugenes's Poll", author_id: eugene.id)

  #questions
  question1 = Question.create!(poll_id: appacademy_poll.id, text: Faker::Quote.yoda[0..-2] + "?")
  question2 = Question.create!(poll_id: appacademy_poll.id, text: Faker::Quote.yoda[0..-2] + "?")
  question3 = Question.create!(poll_id: appacademy_poll.id, text: Faker::Quote.yoda[0..-2] + "?")

  #answerchoices
  answerchoice11 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.hamlet_quote, question_id: question1.id)
  answerchoice12 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.hamlet_quote, question_id: question1.id)
  answerchoice13 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.hamlet_quote, question_id: question1.id)
  
  answerchoice21 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, question_id: question2.id)
  answerchoice22 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, question_id: question2.id)
  answerchoice23 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.as_you_like_it_quote, question_id: question2.id)
  
  answerchoice31 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, question_id: question3.id)
  answerchoice32 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, question_id: question3.id)
  answerchoice33 = AnswerChoice.create!(text: Faker::Quotes::Shakespeare.romeo_and_juliet_quote, question_id: question3.id)

  #responses
  Response.create!(responder_id: bob.id, answer_choice_id: answerchoice11.id)
  Response.create!(responder_id: bob.id, answer_choice_id: answerchoice21.id)
  
  
  Response.create!(responder_id: calvin.id, answer_choice_id: answerchoice12.id)
  Response.create!(responder_id: calvin.id, answer_choice_id: answerchoice22.id)

  

end