class Api::V1::QuestionsController < ApplicationController 
    before_action :get_question, only: [:show]
    def index 
        @questions = Question.all 
        render json: @questions
    end

    def show 
        render json: @question
    end

    private 

    def get_question 
        @question = Question.find(params[:id])
    end
end