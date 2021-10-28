class SearchsController < ApplicationController
  def all_search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = all_search_for(@model, @content, @method)
  end

 private

  def match(model, content)
   if model == 'user'
     User.where(name: content)
   elsif model == 'recipe'
     Recipe.where(title: content)
   end
  end

   def forward(model, content)
     if model == 'user'
       User.where("name LIKE ?", "#{content}%")
     elsif model == 'recipe'
       Recipe.where("title LIKE ?", "#{content}%")
     end
   end

   def backward(model, content)
     if model == 'user'
       User.where("name LIKE ?", "%#{content}")
     elsif model == 'recipe'
       Recipe.where("title LIKE ?", "%#{content}")
     end
   end

   def partical(model, content)
     if model == 'user'
       User.where("name LIKE ?", "%#{content}%")
     elsif model == 'recipe'
       Recipe.where("title LIKE ?", "%#{content}%")
     end
   end

   def all_search_for(model, content, method)
     case method
     when 'match'
       match(model, content)
     when 'forward'
      forward(model, content)
     when 'backward'
       backward(model, content)
     when 'partical'
       partical(model, content)
     end
   end
end
