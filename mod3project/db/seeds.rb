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


def get_science_questions
    science = Category.create(name: 'Science')
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=50&category=17&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: science)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

def get_sports_questions
  sports = Category.create(name: 'Sports')
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=50&category=21&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: sports)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

def get_history_questions
  history = Category.create(name: 'History')
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=50&category=23&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: history)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

def get_books_questions
  books = Category.create(name: 'Books')
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=50&category=10&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: books)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

def get_film_questions
  film = Category.create(name: 'Film')
    questions = JSON.parse(RestClient.get('https://opentdb.com/api.php?amount=50&category=11&type=multiple'))
    seed_data = questions['results'].map do |result|
        [
        result['question'],
        result['difficulty'],
        result['correct_answer'],
        result['incorrect_answers']
        ]
    end
    seed_data.each do |seed|
        question = Question.create(content: seed[0], difficulty: seed[1], category: film)
        Answer.create(content: seed[2], question: question, correct: true)
        seed[3].each do |answer|
            Answer.create(content: answer, question: question, correct: false)
        end
    end
end

get_science_questions
get_sports_questions
get_history_questions
get_books_questions
get_film_questions
