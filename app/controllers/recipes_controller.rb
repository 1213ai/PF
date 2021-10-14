class RecipesController < ApplicationController
 before_action :ensure_correct_user, only: [:edit]
 before_action :authenticate_user!, only: [:new]

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build #buildで子モデルのインスタンスを作成
    @how_to_makes = @recipe.how_to_makes.build
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all #追加分の子モデルを表示するため
    @how_to_makes = @recipe.how_to_makes.all
    @recipe_comment = RecipeComment.new
  end

  def index
    @recipes = Recipe.all
    @user = current_user
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
   if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
   else
      render 'edit'
   end
  end


  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    @how_to_makes = @recipe.how_to_makes.all
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :catchcopy, :no_of_dish, :image, :sweetness, :spicy, :salty, :bitter_taste, :acidity,
                                  recipe_ingredients_attributes:[:ing_name, :quantity, :_destroy, :id],
                                  how_to_makes_attributes:[:explanation, :_destroy, :id])
  end


#他のユーザーが編集できないように
  def ensure_correct_user
    @recipe = Recipe.find(params[:id])
    unless @recipe.user == current_user
      redirect_to recipes_path
    end
  end
end
