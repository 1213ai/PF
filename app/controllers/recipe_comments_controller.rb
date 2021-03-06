class RecipeCommentsController < ApplicationController

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@recipe_comment = RecipeComment.new(recipe_comment_params)
		@recipe_comment.recipe_id = @recipe.id
		@recipe_comment.user_id = current_user.id
		unless @recipe_comment.save
		  render 'recipes/show'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
  	recipe_comment = @recipe.recipe_comments.find(params[:id])
		recipe_comment.destroy
	end

	private
	def recipe_comment_params
		params.require(:recipe_comment).permit(:comment)
	end
end
