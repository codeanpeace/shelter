class Owner
	attr_accessor :name, :phone_number, :gender, :age, :address, :pets

  def initialize (name, phone_number, gender, age, address, pets)
    @name = name
    @phone_number = phone_number
    @gender = gender
    @age = age
    @address = address
    @pets = pets
  end

  def to_s
    puts "#{@name} is owner of these #{@pets}"
  end
end