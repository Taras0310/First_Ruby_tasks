=begin
Create class FileAnalyzer
Based on provided path, class should print out the following statistics of the file:
- number of lines in file
- number on empty lines in file
- number of lines containing letter 'y'
Class should not have any public accessible methods.
All statistics should be printed on class instance creation - FileAnalyzer.new('some_path')  
=end

class FileAnalyzer
  def initialize(path)
    @path = path
    lines_count = count_lines
    empty_count = count_empty_lines
    y_count = count_lines_with_y

    puts "Lines: #{lines_count}"
    puts "Empty lines: #{empty_count}"
    puts "Lines with 'y': #{y_count}"
  end

  private
  
  def work_with_file
    
   File.open(@path, "r") do |file|
      yield(file)
    end
  end


  def count_lines
    count_lines = 0
    
    work_with_file do |file|
      file.each_line {count_lines +=1}
    end
    
    count_lines
  end

  def count_empty_lines
    count_empty = 0
    
    work_with_file do |file|
      file.each_line {|line| count_empty +=1 if line.strip.empty?}
    end
    
    count_empty
  end
    
  def count_lines_with_y
    y_count = 0
    
    work_with_file do |file|
      file.each_line do |line|
        line = line.downcase
        line.each_char {|el| y_count +=1 if el == 'y'}
      end
    end
    
    y_count
  end
end

f = FileAnalyzer.new('test.txt')

