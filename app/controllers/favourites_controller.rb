class FavouritesController < ApplicationController
before_action :authenticate_use!
def create

  product = Product.find params[:product_id]
  if can? :favourite, product
        favourite = Favourite.new user: current_user, product: product
      if favourite.save
        redirect_to product_path(product), notice: "fsajlfj"
      else
        redirect_to product_path(product), alert: "lkjfkaljlsa"
      end
  else
    redirect_to product_path(product), notice: "you cant favourite your own product"
  end




  # product = Product.find params[:product_id]
  # @favourite = Favourite.new user: current_user, product: product
  # if !(can? :favourite, product)
  #   redirect_to root_path, alert: "access denied"
  # elsif @favourite.save
  #   redirect_to product_path(product), notice: "Thanks "
  # else
  #   redirect_to product_path(product), alert: favourite.errors.full.messages.join(", ")
  # end
end


def destroy
  product = Product.find params[:product_id]
  favourite = Favourite.find params[:id]
  if can? :destroy, favourite
    favourite.destroy
    redirect_to product_path(product), notce: "favourite removed"
  else
    redirect_to root_path, alert: "access denied!"
  end
end


end
