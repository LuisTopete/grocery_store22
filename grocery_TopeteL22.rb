# Display a menu in the console for the user to interact with.
  # .5) Add new items to grocery store.
  # 1) Display item
  # 2) Add item to cart
  # 3) Remove from cart
  # 4) Show cost of cart

# Create a default array of hashes that represent items at a grocery store.
  # array = []

# Create a default array to store the user cart items
  # array = []

# Add new items to the grocery store.

# Items, Cart, total cost
# Product information (name, price, inventory count)

@items_in_store = [
  {name: "Rice", price: 5.00, inventory_count: "20"},
  {name: "Beans", price: 4.00, inventory_count: "12"},
  {name: "Soup", price: 1.50, inventory_count: "30"},
  {name: "Eggs", price: 7.00, inventory_count: "36"},
  {name: "Chicken", price: 4.75, inventory_count: "20"},
  {name: "Milk", price: 2.40, inventory_count: "20"},
  {name: "Mini Wheats", price: 6.00, inventory_count: "50"},
  {name: "Pork", price: 7.00, inventory_count: "15"},
  {name: "Cookies", price: 15.00, inventory_count: "10"},
  {name: "Apples", price: 0.75, inventory_count: "75"},
  {name: "Broccali", price: 0.30, inventory_count: "60"},
  {name: "Carrots", price: 1.00, inventory_count: "50"},
]

@items_in_cart = []

@money_customer_has = 0


# Display a menu in the console for the user to interact with.
  # .5) Add new items to grocery store.
  # 1) Display item
  # 2) Add item to cart
  # 3) Remove from cart
  # 4) Show cost of cart


def user_menu
  puts "\n" * 2
  puts "Hello! Welcome to our Grocery Store :)"
  puts "you have #{@money_customer_has}"
  puts "\n"
  puts "1) Add item to store"
  puts "2) Display items in cart"
  puts "3) Add items to cart"
  puts "4) Remove items from cart"
  puts "5) Total Cost of Cart"
  puts "6) Display items in Store"
  puts "7) Checkout"
  puts "8) Exit :("
  puts puts "\n" * 2
  user_input = gets.strip.to_i
  if user_input == 1
    puts "Add item to Store"
    add_item_store
  elsif user_input == 2
    puts "Display items in Cart"
    display_cart
  elsif user_input == 3
    puts "Add items to cart"
    add_item_cart
  elsif user_input == 4
    puts "remove items from cart"
    remove_item
  elsif user_input == 5
    puts "Total cost of cart"
    total_cost
  elsif user_input == 6
    puts "Display Items in store"
    display_item_store
  elsif user_input == 7
    puts "Checkout"
    checking_out_of_store
  elsif user_input == 8
    puts "Goodbye thank you for coming"
    puts "\n" * 2
    exit
  else
    puts "Error"
    user_menu
  end
end

def add_item_store
  puts "What is the name of the item?"
    item_name = gets.strip
  puts "How much is the item?"
    item_price = gets.strip.to_f
  puts "Quantity of item"
    item_quantity = gets.strip
  puts "Thank you"

  new_item = {name: item_name, price: item_price, 
  inventory_count: item_quantity}
  @items_in_store << new_item
  user_menu
end


def display_cart
  if @items_in_cart == []
    puts "Nothing in Cart"
  else
    @items_in_cart.each do |food|
      puts "--------------------------"
      puts "Item Name #{food[:name]}"
      puts "Item Price #{food[:price]}"
      puts "Item Store Quantity #{food[:inventory_count]}"
    end
  end
  user_menu
end

def add_item_cart
  
  puts "What item would you like to buy"
  @items_in_store.each_with_index do |food, i|
    puts "#{i + 1}. #{food[:name]}"
  end
  
  user_input = gets.strip.to_i
  @items_in_cart << @items_in_store[user_input - 1]
  user_menu
  
end

def remove_item
  
  puts "What item would you like to remove"
  number_of_items = 0
  @items_in_cart.each_with_index do |food, i|
    puts "#{i + 1}. #{food[:name]}"
  end

  user_input = gets.strip.to_i
  if user_input <= @items_in_cart.count
    if user_input == 0
      user_menu
    else
      item_removed = @items_in_cart.delete_at(user_input - 1)[:name]
    end
  else
    puts "please use an item number"
    puts "\n" * 2
    remove_item
  end
  puts "#{item_removed} has been removed from cart"
  user_menu
end

def total_cost
  puts "Items in Cart:"

  @items_in_cart.each do |food|
    puts "#{food[:name]}: #{food[:price]}"
  end

  food_cost = 0.00
  @items_in_cart.each do |food|
    food_cost += food[:price].to_f
  end
  puts "Your total cost is:"
  puts "$#{food_cost}"
  user_menu

end


def display_item_store
  puts "Our current store items are:"
  @items_in_store.each do |food|
    puts "#{food[:name]}"
  end
  user_menu
end


def user_money
  puts "How much money do you have?"
  @money_customer_has = gets.strip.to_f

end

def checking_out_of_store
  @items_in_cart.each do |food|
    food_cost += food[:price].to_f
  end

  tax_rate = 0.075

  puts "Food cost = #{food_cost} Taxes on purchase = #{food_cost + (food_cost * tax_rate)}"
  total_purchase = food_cost + (food_cost * tax_rate)

  if total_cost > @money_customer_has
    puts "Sorry, you don't have enough money"
    user_menu
  else
    puts "Thank you, Have a good day"
    quit
  end

end

user_money
user_menu