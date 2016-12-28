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

  # prompt.each do |key, value|
  #   score = value.length
  #
  #   puts "#{key}'s score is #{score}"
  #   student_score = {key => score}
  #   puts student_score
  #   return student_score
  # end
end

# generate_score(student_hash)

student_hash.each do |student_id, array_of_stuff|
  score = generate_score(array_of_stuff)
  puts "#{student_id}'s score is #{score}"
end
