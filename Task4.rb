=begin
Create ruby file which is runing with passed argument for example
ruby_script.rb pwd
Where pwd is command which ruby will run
Ruby should execute comannd which is passed and print it's output to console
If no argument is passed - print message 'Please pass argument to the script' - condition should be implemented as ternary operator  
=end

first_arg = ARGV[0]
puts ARGV[0].nil? ? "Please pass argument to the script" : `#{first_arg}`