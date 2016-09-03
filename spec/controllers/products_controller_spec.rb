require 'rails_helper'

RSpec.describe ProductsController, type: :controller do


  describe "#new" do
    it " render the new template" do
      get :new

      expect(response).to render_template(:new)
    end
    it "open database " do
      get :new

          expect(assigns(:product)).to be_new(:product)
    end
  end


  describe "#create" do
    context "with valid information" do
        def valid_information
          post :create, params: { product: {title: "campaign title",
                                             description: "hello faskfljaslfjlaksj fasjlkasjfl alsjf llf lajfl j",
                                             price: 454} }
        end
        it "saves a record to the database" do
          count_before = Product.count
          valid_information
          count_after =  Product.count
          expect(count_after).to eq(count_before+1)
        end
        it "redirects to the campaingn show page" do
          valid_information
          expect(response).to redirect_to(product_path(Product.last))
        end
        it "flash test " do
          valid_information
          expect(flash[:notice]).to be
        end
    end

    context "with invalid information " do
        def invalid_information
          post :create, params: {product: {title: ""}}
        end
        it "render new template" do
          invalid_information
          expect(response).to render_template(:new)
        end
      it "dowsent save the record to the database" do
        count_before = Product.count
        invalid_information
        count_after = Product.count
        expect(count_after).to eq(count_before)
      end
    end
  end

describe "#edit" do
it  "render edit page" do
get: :edit
expect(response).to render_template(:products)
end
it "renders the show template" do
  # GIVEN: a campaign created in the database
  campaign = FactoryGirl.create(:campaign)

  # WHEN: we make a GET request with id of the campaign
  get :show, params: { id: campaign.id }

  # THEN: renders the show template
  expect(response).to render_template(:show)


end
