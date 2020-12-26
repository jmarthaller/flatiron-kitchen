class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        ingredient = Ingredient.new(params.require(:ingredient).permit(:name))
        if ingredient.save
            redirect_to ingredients_path
        else
            render :new
        end
    end


    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(params.require(:ingredient).permit(:name))

        if @ingredient.save
          redirect_to ingredients_path
        else
          render :edit
        end
    end
end
