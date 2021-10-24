class RecipesController < ApplicationController
 before_action :ensure_correct_user, only: [:edit]
 before_action :authenticate_user!, only: [:new]

  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build #buildで子モデルのインスタンスを作成
    @how_to_makes = @recipe.how_to_makes.build
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.all #追加分の子モデルを表示するため
    @how_to_makes = @recipe.how_to_makes.all
    @recipe_comment = RecipeComment.new
    @recipe_tags = @recipe.tags         #そのクリックした投稿に紐付けられているタグの取得。
  end

  def index
    @recipes = Recipe.all
    @user = current_user
  end
  
  def tag_index
     @tag_list = Tag.all              #ビューでタグ一覧を表示するために全取得。
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    tag_list = params[:recipe][:tag_name].split(nil)
    if @recipe.save
       @recipe.save_tag(tag_list)
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

  def search
    selection = params[:keyword]
    @recipes = Recipe.sort(selection)
  end

  def tag_search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @recipes = @tag.recipes.all
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
