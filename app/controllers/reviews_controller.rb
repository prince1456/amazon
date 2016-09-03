class ReviewsController < ApplicationController
    def create
        @review = Review.new find_params
        @product = Product.find params[:product_id]
        @review.product = @product
        @category = Category.all
        respond_to do |format|
            if @review.save
                flash[:notice] = 'successfully Added'
                format.html { redirect_to product_path(@product)}
                format.js { render :create_success}
            else
                flash[:notice] = 'Fixed the errors'
                format.html {render '/products/show'}
                format.js { render :create_failure }
            end
        end
    end

    def destroy
        a = Product.find params[:product_id]
        # r = Review.find params[:id]
        @review = Review.find params[:id]
        respond_to do |format|
        @review.destroy
        format.html {redirect_to product_path(a), notice: 'review deleted!'}
        format.js {render}
        end
      end

    private

    def find_params
        params.require(:review).permit(:body, :rating)
    end
end
