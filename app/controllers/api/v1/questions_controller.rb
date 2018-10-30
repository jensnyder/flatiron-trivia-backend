class Api::V1::QuestionsController < ApplicationController 
    before_action :get_question, only: [:show, :update, :destroy]
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

    def update 
        @question.update(question_params)
        render json: Question.find(params[:id])
    end

    def destroy
        render json: @question.destroy 
    end

    private 

    def question_params 
        params.require(:question).permit(:content, :difficulty, :category_id)
    end

    def get_question 
        @question = Question.find(params[:id])
    end
end