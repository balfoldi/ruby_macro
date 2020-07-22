require 'launchy'

# lauche mosila's browser and proced to search the input
def search_google (input)
  input = "No input" if input.empty?
  system("echo \"\e[36mLOADING, google search '#{input}'...\e[0m\"")
  abort("No input, abort...") if input.empty?
  Launchy.open"https://www.google.com/search?q=#{input}"
end

def perform(input)
  #first loop
  search_google(input)
  #next loop
  puts "Input new search or press <ENTER> to exit"

  loop do
    input2 = STDIN.gets.chomp
    if input2.empty?
      abort('Exiting google search')
    else
      search_google(input2)
    end
    puts "Input new search or press <ENTER> to exit"
  end
end

perform(ARGV.join("+"))
