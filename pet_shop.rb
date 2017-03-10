def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number_to_increase)
  shop[:admin][:pets_sold] += number_to_increase
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  pets_array = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      pets_array.push(pet[:breed])
    end
  end
  return pets_array
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

def customer_pet_count(customers)
  return customers[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  if customer[:cash] >= pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(shop, pet, customer)
  if pet.nil? == false
    if customer_can_afford_pet(customer, pet) == true
      add_pet_to_customer(customer, pet)
      remove_pet_by_name(shop, pet[:name])
      increase_pets_sold(shop, 1)
      add_or_remove_cash(shop, pet[:price])
  end
  end

end
