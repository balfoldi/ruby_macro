
#create folders and files
def create
  Dir.mkdir("lib")
  Dir.mkdir("db")
end

#Create files
def write#(input)
  File.write("app.rb","require 'dotenv'\nrequire 'csv'\nrequire 'json'\nrequire 'nokogiri'\nrequire 'google_drive'\nrequire 'launchy'\nrequire 'pry'\nrequire 'open-uri'\nrequire 'time'\n require'date'\nBundler.require", mode: "w")
  File.write("Gemfile","source 'https://rubygems.org'\ngem 'json'\nruby '2.5.1'\ngem 'rubocop', '~> 0.57.2'\ngem 'google_drive'\ngem 'dotenv'\ngem 'twitter'\ngem 'rspec'\ngem 'pry'\ngem 'nokogiri'", mode: "w")
  File.write("README.md","Ruby program in alpha stage.", mode: "w")
  File.write(".env","SECRET_VARIABLE='secret'", mode: "w")
  File.write(".gitignore",".env", mode: "w")
end

#execute bundle install
def exe#(input)
    #run bundle
    system("echo \"\e[36mLOADING, bundle...\e[0m\"")
    system("bundle install")
    #run git
    system("echo \"\e[36mLOADING, init...\e[0m\"")
    system("git init")
    #run rspec
    system("echo \"\e[36mLOADING, rspec...\e[0m\"")
    system("rspec --init")
    File.write("spec/app_spec.rb","require_relative 'app.rb'\n\ndescribe 'method perform' do\n  it 'something' do\n  end\nend", mode: "w")
end

def perform
  #ARGV == [] ? input = "app" : input = ARGV.join('_')
  create
  write#(input)
  exe#(input)
  system("echo \"\e[32mRuby folder initiated!\e[0m\"")
end

perform
