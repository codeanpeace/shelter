#list available pets
#adopt pet
#give up pet

#shelter - pet - toys
#client - pet
#pet_available

require_relative "pet"
require_relative "owner"

#creating shelter
shelter = Owner.new("shelter", "[shelter's phone number]", "not applicable", "not applicable", "[shelter's address]", {})

#creating pets
shelter.pets["bogey"] = Pet.new("Bogey", "dog", "husky", "male", "8", ["rabbit", "sled"])
shelter.pets["snoopy"] = Pet.new("Snoopy", "dog", "beagle", "male", "3", ["typewriter"])
shelter.pets["garfield"] = Pet.new("Garfield", "cat", "tabby", "male", "5", ["lasagne", "bed"])
shelter.pets["tigger"] = Pet.new("Tigger", "cat", "tiger", "female", "2", ["mouse", "scratch post"])

#create client
john = Owner.new("John", "[John's phone number]", "male", "[John's age]", "[John's address]", {})

def transfer(pet, receiver, releaser)
  receiver.pets[pet.downcase] = releaser.pets[pet.downcase]
  releaser.pets.delete(pet)
end

#creating adoption
transfer("Tigger", john, shelter)


puts "Welcome to the shelter!"
puts "Before we get started, what is your name?"
client_name = gets.chomp.downcase
puts "What is your phone number?"
client_phone_number = gets.chomp.downcase
puts "Male or Female?"
client_gender = gets.chomp.downcase
puts "How old are you?"
client_age = gets.chomp.downcase
puts "What is your address?"
client_address = gets.chomp.downcase

client_name = Owner.new(client_name.upcase, client_phone_number, client_gender, client_age, client_address, {})

puts "Do you have a pet(s)? (Y)es or (N)o?"
own_pet = gets.chomp.downcase
if own_pet == "y" 
  another_pet = true
  while another_pet
    puts "Enter one pet's name at a time: "
    puts "Name: "
    pet_name = gets.chomp.downcase
    client_name.pets[pet_name] = pet_name
    puts "Do you have another pet? (Y)es or (N)o?"
    if gets.chomp.downcase == "n"
      another_pet = false
    end
  end
end


mode = 0

while mode != "q"

  puts "Would you like to adopt or return a pet?" 
  puts "(A)dopt | (R)eturn | (Q)uit : "

  mode = gets.chomp.downcase

  if mode == "a"
    #list available pets
    puts "Here is a list of all pets at the shelter: "
    shelter.pets.each { |pet_name, pet_object| puts pet_object }
    #ask which pet do you want to adopt
    puts "Which pet would you like to adopt?"
    adopted_pet = gets.chomp.downcase
    #transfer adopted pet to client from shelter
    transfer(adopted_pet, client_name, shelter)

  elsif mode == "r"
    #list client's pets
    puts "Here is a list of all your pets: "
    client_name.pets.each { |pet_name, pet_object| puts pet_name }
    client_name.pets.each { |pet_name, pet_object| puts pet_object }
    #ask which pet do you want to return
    puts "Which pet would you like to return?"
    returned_pet = gets.chomp.downcase
    #transfer returned pet to shelter from client
    transfer(returned_pet, shelter, client_name)

  else
    puts "Invalid mode!"

  end
end