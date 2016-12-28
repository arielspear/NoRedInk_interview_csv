require 'CSV'
require 'pp'

def prompt

  student_ids = {}

  CSV.foreach("data1.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    student_id = row[:student_id]

    unless student_ids.has_key? student_id
      student_ids[student_id] = []
    end
    topic = student_ids[student_id]
    topic.push Hash[row.headers[1..-1].zip(row)]

  end
  return student_ids
end

student_hash = prompt

def generate_score(array_of_stuff)
  return array_of_stuff.length
end

# generate_score(student_hash)
scores_by_student = {}

student_hash.each do |student_id, array_of_stuff|
  score = generate_score(array_of_stuff)
  puts "#{student_id}'s score is #{score}"

  scores_by_student[student_id] = score
end
scores_by_student = (scores_by_student.sort_by {|_key, value| value}).reverse
puts "#{scores_by_student} TADA!"
# make hash, push key (student id) and value (score) into Hash
