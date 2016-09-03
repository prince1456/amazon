require 'rails_helper'

RSpec.describe Product, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    describe 'Validations' do
        it 'title should be present' do
            c = Product.new

            # WHEN: we run validations
            c.valid?
              p c
            # THEN: the record is invalid (it has errors)
            # expect(c).to be_invalid
            expect(c.errors).to have_key(:title)
            expect(c.errors).to have_key(:price)

        end

        it "description should be presence" do
          des = Product.new

          des.valid?

          expect(des.errors).to have_key(:description)


        end

        it "titile should be uniq" do

          Product.create ({title: "ali", description: "aflkfasljfj", price: 234})

          uniq = Product.new ({title: "ali", description: "affasfasflkfasljfj", price: 234})
# uniq.save
          uniq.valid?
          expect(uniq.errors).to have_key(:title)

        end

        it "price greather than 0" do

        uniq =   Product.new ({title: "ben", description: "aflkfasljfj", price: -23})


        # uniq.save
          uniq.valid?
          expect(uniq.errors).to have_key(:price)

        end
        it "requires title capitalize" do
          uniq =   Product.new ({title: "dallas", description: "aflkfasljfj", price: 288})
          uniq.save


            outcome = uniq.title

            #then: we get back a titleized title version of the title
            expect(outcome).to eq("Dallas")



        end
        it "search title and description" do
        a  = Product.new(title: "dallas", description: "dalas where are you", price: 2400)
        b =  Product.new(title: "dalla31123s", description: "dalas13  are y123123ou", price: 223)
        a.save
        b.save
          ss = Product.search("where")
          p ss[0].id
            expect(ss[0].id).to eq(a.id)

        end


    end
end
