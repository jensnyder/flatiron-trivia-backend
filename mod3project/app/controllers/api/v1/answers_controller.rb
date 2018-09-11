class Api::V1::AnswersController < ApplicationController 
    def index 
        @answers = Answer.all 
        render json: @answers 
    end

    def create
        render json: Answer.create(answer_params)
    end

    private

    def answer_params
        params.require(:answer).permit(:content, :correct, :question_id)
    end


end