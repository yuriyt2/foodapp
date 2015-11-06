class FoodsController < ApplicationController


#   Prefix Verb   URI Pattern               Controller#Action
#     foods GET    /foods(.:format)          foods#index
  def index
    @foods = Food.all.shuffle
  end
#           POST   /foods(.:format)          foods#create
  def create
    @food = Food.new(food_params)
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
  end
#      food GET    /foods/:id(.:format)      foods#show

  def update
  end
#           PATCH  /foods/:id(.:format)      foods#update
#           PUT    /foods/:id(.:format)      foods#update
  def destroy
  end
#           DELETE /foods/:id(.:format)      foods#destroy

  private
  def food_params
    params.require(:food).permit(:name, :price, :location, :image)
  end

end
