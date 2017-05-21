Product.all.each do |product|
  # product.update(supplier_id: Supplier.all.sample.id)
  Image.create(url: product.image, product_id: product.id)
  Image.create(url: "https://wereviewthings.files.wordpress.com/2010/06/594-talk-nerdy-to-me1.jpg", product_id: product.id)
end
puts "Done!"