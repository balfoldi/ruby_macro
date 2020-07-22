
input = ARGV
require 'watir'
require 'launchy'
require 'nokogiri'
require 'open-uri'
require 'watir'
require 'clipboard'
require 'dotenv'
Dotenv.load('.env')
#activate if on windose ========= gem "ffi", :platforms => [:mswin, :mingw] 
#enter command if on linux "$ sudo apt-get install xsel"


abort("try '$ gitall *commit name*'") if input.empty? 


if input == ["new"]
	ARGV.clear
	puts "Chose repository name:"
	repo_name = gets.chomp
	puts "Chose first commit name:"
	commit_name = gets.chomp
	system("echo \"\e[36mLOADING, creating the repository #{repo_name} on github.com...\e[0m\"")
	browser = Watir::Browser.new(:firefox)
	#loggin
	browser.goto "github.com/new"
	browser.text_field(id: "login_field").set("balfoldi@yahoo.fr")
	browser.text_field(id: "password").set(ENV["PASSWORD"])	
	btn1 = browser.button value: 'Sign in'
	btn1.click
	#create repository
	browser.goto 'github.com/new'
	name_bar = browser.text_field(id: "repository_name")
	name_bar.set(repo_name)
	btn2 = browser.button value: 'Create repository'
	btn2.click
	browser.close
	#system("git remote add origin #{error}")
	system("git remote add origin git@github.com:BorisSIUS/#{repo_name}.git")
	puts "commit name" + (input = commit_name)
end

system("echo \"\e[36mLOADING, git add . '#{input}'...\e[0m\"")

system("git add .")

system("echo \"\e[36mLOADING, git commit -m '#{input}'...\e[0m\"")

system("git commit -m '#{input}'")

system("echo \"\e[36mLOADING, git push origin master '#{input}'...\e[0m\"")

system("git push origin master")

puts "git add_commit_push done"


exit
