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
      1 => { id: 1, author: 'Стівен Кінг', name: 'Воно', status: 'Active', year: 2020 },
      2 => { id: 2, author: 'Джордж Орвелл', name: '1984'}
    }
  end

  def add_book(**args)
    allowed_keys = %i[status year author name]

    if args.has_key?(:name) && args.has_key?(:author)
      @books[@books.keys.max.to_i + 1 ] = { id: @books.keys.max.to_i + 1 } # auto increment id for a new book

      args.each do |key, value|
        if allowed_keys.include?(key)
          @books[@books.keys.max.to_i][key] = value
        end
      end
    else
      raise ArgumentError, 'Missing required keys: name and author'
    end
  end

  def find_book(parametr, value)
     result = @books.values.select do |book|
       book[parametr].downcase.include?(value.downcase)
    end
    result || 'Book is not found'
  end

  def change_status(parametr, value)
    result = find_book(parametr, value)

    return 'Book is not found' unless result
    
    result.each do |elem|
      if elem.has_key?(:status)
        current_status = elem[:status]
        current_status == 'Active' ? elem[:status] = 'Not active' : elem[:status] = 'Active'
      end
    end
  end
end

l = Library.new

p l.books

l.add_book(name: 'Долорес Клейборн', author: 'Стівен Кінг', status: 'Active')
l.add_book(name: 'Роза Меддер', author: 'Стівен Кінг')

p l.books

p l.find_book(:author, 'інг')

p l.books

