class LikesController < ApplicationController
before_action :authenticate_use!

  def create
    @review = Review.find params[:review_id]
    @like = Like.new user: current_user, review: @review

    respond_to do |format|
      if !(can? :like, @review)
        # redirect_to root_path, alert: "access denied"
      format.html { redirect_to root_path, alert: "access denied"}
      format.js { render :access_denied}


      elsif @like.save
        format.html {redirect_to product_path(@review.product_id), notice: "thank you "}
        format.js { render :create_success}

      else
        format.html {redirect_to product_path(@review.product_id), alert: like.errors.full.messages.join(", ")}
        format.js { render :create_failure}
      end
    end
  end


  def destroy
    @review = Review.find params[:review_id]
    @like = Like.find params[:id]
    respond_to do |format|
    if can? :destroy, @like
      @like.destroy
    format.html {  redirect_to product_path(@review.product_id), notice: "Unliked"}
    format.js { render}
    end
  end
  end

end
