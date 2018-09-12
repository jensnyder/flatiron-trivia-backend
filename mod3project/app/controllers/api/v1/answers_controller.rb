class Api::V1::AnswersController < ApplicationController 
    before_action :get_answer, only: [:update, :destroy]

    def index 
        @answers = Answer.all 
        render json: @answers 
    end

    def create
        render json: Answer.create(answer_params)
    end

    def update 
        @answer.update(answer_params)
        render json: Answer.find(params[:id])
    end

    def destroy 
        render json: @answer.destroy 
    end

    private

    def answer_params
        params.require(:answer).permit(:content, :correct, :question_id)
    end

    def get_answer 
        @answer = Answer.find(params[:id])
    end


end