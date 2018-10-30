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
Category.destroy_all

science = Category.create(name: 'Science')
sports = Category.create(name: 'Sports')
history = Category.create(name: 'History')
books = Category.create(name: 'Books')
film = Category.create(name: 'Film')
music = Category.create(name: 'Music')
television = Category.create(name: 'Television')
video_games = Category.create(name: 'Video games')
computers = Category.create(name: 'Computers')
general_knowledge = Category.create(name: 'General knowledge')

def get_questions(category, id)
    questions = JSON.parse(RestClient.get("https://opentdb.com/api.php?amount=50&category=#{id}&type=multiple"))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: category)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

get_questions(science, 17)
get_questions(sports, 21)
get_questions(books, 10)
get_questions(film, 11)
get_questions(history, 23)
get_questions(music, 12)
get_questions(television, 14)
get_questions(video_games, 15)
get_questions(computers, 18)
get_questions(general_knowledge, 9)