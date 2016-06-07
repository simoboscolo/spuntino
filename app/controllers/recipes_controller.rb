class RecipesController < ApplicationController

	before_filter :authenticate_user!

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		# @user = User.find(params[:id])
		@list_of_ingredients = @recipe.ingredients.split(",")
		@preparation_phases = @recipe.procedure.split("/")
	end

	# create a new recipe 

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
 		@recipe.user_id = current_user.id

		if @recipe.save
			redirect_to @recipe
		else
			render 'new'
		end
	end

	# Update an exsisting recipe

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])

		if @recipe.update(recipe_params)
		 redirect_to @recipe
		else
		 render 'edit'
		end
	end

	# Delete a Recipe

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy

		redirect_to recipes_path
	end

	private

		def recipe_params
			params.require(:recipe).permit(:name, :preparation_time, :ingredients, :procedure)
		end
end
