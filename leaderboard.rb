require 'CSV'
require 'pp'

def prompt

  student_ids = {}

  CSV.foreach("data2.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
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

def generate_score(student_hash)
  score = 0

  prompt.each do |key, value|
    value.each do
      score = score + 1
    end
    puts "#{key}'s score is #{score}"
  end
end
generate_score(student_hash)
