class FoodsController < ApplicationController
skip_before_action :authenticate, only: [:users]

#   Prefix Verb   URI Pattern               Controller#Action
#     foods GET    /foods(.:format)          foods#index
  def index
    @foods = Food.all.shuffle
    @weather = HTTParty.get("http://api.wunderground.com/api/#{WEATHER}/conditions/q/10010.json")
  end
#           POST   /foods(.:format)          foods#create
  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    @food.save
    redirect_to foods_path
  end
#  new_food GET    /foods/new(.:format)      foods#new
  def new
    @food = Food.new
  end
# edit_food GET    /foods/:id/edit(.:format) foods#edit

  def show
    @food = Food.find(params[:id])
    @comment = Comment.new

  end
#      food GET    /foods/:id(.:format)      foods#show

  def edit
    @food = Food.find(params[:id])
  end


  def update
    @food = Food.find(params[:id])
    if (current_user.id == @food.user_id) || (current_user.id == 2)
    @food.update(food_params)
    redirect_to food_path(@food)
    else
    redirect_to food_path
    flash.notice = "*you don't have access to edit this food*"
    end

  end
#           PATCH  /foods/:id(.:format)      foods#update
#           PUT    /foods/:id(.:format)      foods#update
def destroy
  @food = Food.find(params[:id])
  if (current_user.id == @food.user_id) || (current_user.id == 2)
    @food.destroy
    flash.notice = "Your food has been destroyed!"
    redirect_to foods_path
  else
    redirect_to food_path
    flash.notice = "*you don't have access to delete this food*"
  end
end
#           DELETE /foods/:id(.:format)      foods#destroy

  private
  def food_params
    params.require(:food).permit(:name, :price, :location, :image)
  end

end
