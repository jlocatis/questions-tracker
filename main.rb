#!/usr/bin/env ruby
require 'pry'

## INPUT/DISPLAY CODE

#load questions.txt file into program
def loadArray
	questions = []
	File.read('/Users/jamielocatis/questions.txt').each_line do |line|
		questions << line.delete("\n")
	end
	questions.each do |x|
		x[0..2] = ""
	end
	return questions
end

#add a question to the questions.txt file
def addQuestion(questions, question)
	question.join(" ")
	question = question.shift
	questions << question
end

#remove a question from the questions.txt file
def removeQuestion(questions, q_to_remove)
	q_to_remove = q_to_remove.to_i - 1
	questions.delete_at(q_to_remove)
	return questions
end

#update questions.txt after adding/removing a question
def updateTxtFile(questions)
	list_of_questions = ""
	questions.map! {|word|"#{word}\n"}
	questions.each do |x|
		front = questions.index(x) + 1
		list_of_questions << front.to_s + ". " + x.to_s
	end
	File.open('/Users/jamielocatis/questions.txt', 'w') do |file|
		file.write(list_of_questions)
		file.close
	end
end

## DISPLAY CODE

questions = loadArray()

input = ARGV

inputType = input.shift

if inputType == 'add'
	questions = addQuestion(questions, input)
	updateTxtFile(questions)
elsif inputType == 'rm'
	removeQuestion(questions, input[0])
	updateTxtFile(questions)
else
	file = File.open('/Users/jamielocatis/questions.txt')
		print file.read
end