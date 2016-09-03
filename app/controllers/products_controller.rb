class ProductsController < ApplicationController

  # load_and_authorize_resource

    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_use!, only: [:create, :edit, :destroy, :update, :new]
    before_action :authorize, only: [:destroy, :update, :edit]

  def new
    @product = Product.new
    @category = Category.all
  end

  def index

      @products = Product.order(created_at: :desc ).page(params[:page]).per_page(10)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  def edit
    @product = Product.find params[:id]

    # authorize! :edit, @product

  end
  def update
      @product = Product.find params[:id]
    if @product.update params.require(:product).permit([:title, :description, :price, :category_id])
      redirect_to products_path
    else
      render :edit
    end
  end

  def create
    # we are using strong parameters feature of rails here to only allow
    # mass_assigning the attributes that we want to allow the user to set
    product_params = params.require(:product).permit([:title, :description, :price, :category_id])
    @product = Product.new product_params
    @product.user = current_user
    if @product.save
      # render json: params
      # redirect_to question_path({id: @question.id})
      # redirect_to question_path({id: @question})
      # redirect_to question_path(@question)
       redirect_to product_path(@product), notice: " Product created successfully"

    else
      render :new
    end
  end


  def show
      @product = Product.find params[:id]
      @category = @product.category
      @review = Review.new
      @like = Like.all
  end

  private

  def find_product
    @product = Product.find params[:id]
  end

  def authorize
    redirect_to root_path, alert: "access defined" unless can? :manage, @product
  end

end
