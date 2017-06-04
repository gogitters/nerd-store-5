# Product.all.each do |product|
#   # product.update(supplier_id: Supplier.all.sample.id)
#   Image.create(url: product.image, product_id: product.id)
#   Image.create(url: "https://wereviewthings.files.wordpress.com/2010/06/594-talk-nerdy-to-me1.jpg", product_id: product.id)
# end
# puts "Done!"

Category.create(name: "nerd")
Category.create(name: "geek")
Category.create(name: "cool")

Product.find_each do |product|
  CategoryProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
  CategoryProduct.create(product_id: product.id, category_id: Category.pluck(:id).sample)
end
