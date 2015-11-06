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
    @comment = Comment.new
  end
#      food GET    /foods/:id(.:format)      foods#show

  def edit
    @food = Food.find(params[:id])
  end


  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to food_path(@food)

  end
#           PATCH  /foods/:id(.:format)      foods#update
#           PUT    /foods/:id(.:format)      foods#update
def destroy
  @food = Food.find(params[:id])
  @food.destroy
  flash.notice = "Your food has been destroyed!"
  redirect_to foods_path
end
#           DELETE /foods/:id(.:format)      foods#destroy

  private
  def food_params
    params.require(:food).permit(:name, :price, :location, :image)
  end

end
