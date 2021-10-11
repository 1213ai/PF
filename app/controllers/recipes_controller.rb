class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build #buildで子モデルのインスタンスを作成
    @how_to_makes = @recipe.how_to_makes.build
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all #追加分の子モデルを表示するため
    @how_to_makes = @recipe.how_to_makes.all
  end

  def index
    @recipes = Recipe.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "You have created recipe successfully."
    else
      @recipes = Recipe.all
      render 'index'
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all
    @how_to_makes = @recipe.how_to_makes.all
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all 
    @how_to_makes = @recipe.how_to_makes.all
   if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
      flash[:notice] = "You have created book successfully."
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
    params.require(:recipe).permit(:title, :catchcopy, :no_of_dish, :image, 
                                  recipe_ingredients_attributes:[:ing_name, :quantity, :_destroy], 
                                  how_to_makes_attributes:[:explanation, :_destroy])
  end
end
