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
    @lines_arr = File.readlines(path, chomp: true)
  
    puts "Lines: #{count_lines}"
    puts "Empty lines: #{count_empty_lines}"
    puts "Lines with 'y': #{count_lines_with_y}"
  end

  private

  def count_lines
    @lines_arr.size
  end

  def count_empty_lines
    @lines_arr.count { |line| line.strip.empty? }
  end
    
  def count_lines_with_y
  @lines_arr.count { |line| line.downcase.include?("y") }
  end
end

f = FileAnalyzer.new('test.txt')


