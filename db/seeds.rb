#
Product.all.each do |x|
  x.update! category_id:  [1,2,3,4,5,6].sample

end


#
# 6.times do
#   Categories.create name:
#   Faker::Commerce.department
#
# end
