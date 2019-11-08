def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop,amount)
  pet_shop[:admin][:pets_sold] += amount
end

def stock_count(pet_shop)
  pet_shop[:pets].size
end

def pets_by_breed(pet_shop,pet_breed)
  array = []
  for pet in pet_shop[:pets]
    if (pet[:breed].include?(pet_breed))
      array.push(pet_breed)
    end
  end
  return array
end

def find_pet_by_name(pet_shop,name)
  result = Hash.new

  for pet in pet_shop[:pets]
    if(pet[:name] == name)
      result[:name] = (pet[:name])
    end
  end
  if (result.empty?)
  result = nil
end
  return result
end

def remove_pet_by_name(pet_shop,pet_name)
  for pet in pet_shop[:pets]
    if(pet[:name] == pet_name)
      pet.delete(:name)
  end
end
end

def add_pet_to_stock(pet_shop,pet_name)
  pet_shop[:pets].push(pet_name)
end

def customer_cash(customers)
  customers[:cash]
end

def remove_customer_cash(customer,amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  customer[:pets].size
end

def add_pet_to_customer(customer,pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer,pet)
  if (customer[:cash] >= pet[:price])
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop,pet,customer)
  if (customer_can_afford_pet(customer,pet))
    remove_customer_cash(customer,pet[:price])
    add_or_remove_cash(pet_shop,pet[:price])
    add_pet_to_customer(customer,pet)
    increase_pets_sold(pet_shop,pet[:price])
  end
end
