=begin
Create class which contain instance class and global variable
Create methods in class which do manipulations(puts, calculates something based on it etc) with eatch type of variable: local, instance, class, global
Create method in class which would use string interpolation(this can be simple puts one of variable)  
=end


$global = 'Human' #global variable


class Person
  
  attr_accessor :name, :age, :surname, :patronymic
  @@count_instances = 0 #class variable
  
   def initialize(name, age, surname, patronymic) # all this variables are instance variables
     @name = name
     @age = age
     @surname = surname
     @patronymic = patronymic
     @@count_instances +=1
   end
   
   def self.count_instances
    @@count_instances
  end
  
   def set_full_name
    "#{@surname} #{@name} #{@patronymic}"
  end
  
  def general_info # in this method all types of variables are used 
    full = set_full_name #full is the local variable which used only in this method
    puts " Hi, I'm a #{$global}.\n My fullname is #{full}.\n My age is #{age}.\n All information about me is described in the #{self.class} class.\n There currently #{Person.count_instances} instances of the class.\n"
  end
end

i = Person.new('Tарас', 25, 'Якушевич', 'Олексійович')



i.general_info
