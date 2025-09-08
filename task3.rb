=begin
Create class Library
Library has list of books(hash)
Each book is stored by its id with following keys if present- id, author, year, status(available or not), name
Class should be able to:
- find book by name, author or id
- change status of book
- acquire new book  
=end

class Library
  
  attr_reader :books
  
  def initialize
  @books = {
  1 => { id: 1, author: "Стівен Кінг", name: "Воно", status: "Active", year: 2020 },
  2 => { id: 2, author: "Джордж Орвел", name: "1984" }
  }
  
  end

  def add_book(**args)
  
  allowed_keys = [:status, :year, :author, :name]
  
  if args.has_key?(:name) && args.has_key?(:author)
    m = @books.keys.max.to_i + 1
    @books[m] = { id: m } #auto increment id for a new book

    args.each do |key, value|
      if allowed_keys.include?(key)
        
         @books[m].merge!({ key => value })  
      end
    end

  else
    raise ArgumentError, "Missing required keys: name and author"
  end
  
  def find_a_book(parametr, value)
 
  
  result = @books.values.find { |book| book[parametr] == value }
  result || "No results found"
  
  end
  end

  def change_status(parametr, value)
    result = @books.values.find { |book| book[parametr] == value }
    
    return "No results found" unless result
    
    if result.has_key?(:status)
      current_status = result[:status]
   else
      return "Status is not set for this book"
   end
   
   current_status == "Active" ? result[:status] = "Not active" : result[:status] = "Active"
    
  end
  
end

l = Library.new
l.add_book( author: "Стівен Кінг",  name: "Долорес Клейборн")
p l.find_a_book(:name, "1984")

p l.change_status(:name,  1111)

p l.books

