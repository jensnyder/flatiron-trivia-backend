# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'rest-client'
require 'pry'

Question.destroy_all
Answer.destroy_all

def get_questions
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=40&category=9&difficulty=hard&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
            result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1])
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end

end

get_questions
