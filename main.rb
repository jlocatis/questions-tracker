require 'pry'

#find way to accept questions into hash, test if works
#find way to print hash to .txt file
#build the write function into a class (global hash)

## INPUT/DISPLAY CODE

def loadArray
	questions = []
	File.read('questions.txt').each_line do |line|
		questions << line.delete("\n")
	end
	questions.each do |x|
		x[0..2] = ""
	end
	return questions
end

def addQuestion(questions, question)
	question.join(" ")
	question = question.shift
	questions << question
end

def updateTxtFile(questions)
	list_of_questions = ""
	questions.map! {|word|"#{word}\n"}
	questions.each do |x|
		front = questions.index(x) + 1
		list_of_questions << front.to_s + ". " + x.to_s
	end
	File.open('questions.txt', 'w') do |file|
		file.write(list_of_questions)
		file.close
	end
end

def removeQuestion(questions, q_to_remove)
	q_to_remove = q_to_remove.to_i - 1
	questions.delete_at(q_to_remove)
	return questions
end
###

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
	file = File.open('questions.txt')
		print file.read
end