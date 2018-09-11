class Api::V1::QuestionsController < ApplicationController 
    before_action :get_question, only: [:show]
    def index 
        @questions = Question.all 
        render json: @questions
    end

    def show 
        render json: @question
    end

    def create
        render json: Question.create(question_params)
    end

    private 

    def question_params 
        params.require(:question).permit(:content, :difficulty)
    end

    def get_question 
        @question = Question.find(params[:id])
    end
end