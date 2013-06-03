class Pet
  attr_accessor :name, :type, :breed, :gender, :age, :toys, :owner

  def initialize(name, type, breed, gender, age, toys = [], owner = "shelter")
    @name = name
    @type = type
    @breed = breed
    @gender = gender
    @age = age
    @toys = toys
    @owner = owner
  end

  def to_s
    puts "#{@name} is a #{@gender} #{@breed} #{@type} who is #{@age} years old who likes #{@toys}"
  end
end


