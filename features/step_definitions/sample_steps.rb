Given "I visit bstackdemo website" do
  visit "https://www.bstackdemo.com/"
end
 
When "I add a product to the cart" do 
  expect(title).to eq("StackDemo")
  # Get product text
  @productOnPageText = find(:xpath, '//*[@id="1"]/p').text

  # Click on add to cart button
  find(:xpath, '//*[@id="1"]/div[4]').click
end
 
Then "I should see same product in cart section" do
  # If cart is open or not
  find(:xpath, '//*[@class="float-cart__content"]').visible?

  # Get product text
  @productOnCartText = find(:xpath, '//*[@id="__next"]/div/div/div[2]/div[2]/div[2]/div/div[3]/p[1]').text

  expect(@productOnCartText).to eq(@productOnPageText)
end
