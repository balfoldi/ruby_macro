require 'watir'
require 'pry'

# lauche mosila's browser and proced to search the input
def search_google (input)
  input = "No input" if input.empty?
  system("echo \"\e[36mLOADING, google search '#{input}'...\e[0m\"")
  abort("No input, abort...") if input.empty?
  browser = Watir::Browser.new(:firefox)
  browser.goto 'google.com'
  search_bar = browser.text_field(class: 'gsfi')
  search_bar.set(input)
  search_bar.send_keys(:enter)
end

def perform(input)
  #first loop
  search_google(input)
  #next loop
  puts "Input new search or press <ENTER> to exit"

  loop do
    input2 = STDIN.gets.chomp
    if input2.empty?
      abort('Exit google search')
    else
      search_google(input2)
    end
    puts "Input new search or press <ENTER> to exit"
  end
end

perform(ARGV.join(" "))
