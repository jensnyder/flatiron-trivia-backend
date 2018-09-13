class Api::V1::CategoriesController < ApplicationController
    def index
        @categories = Category.all
        render json: @categories
    end

    def show
        @category = Category.find_by(name: params[:name].capitalize)
        render json: @category, include: ['questions.answers']
       
    end
end
