require 'CSV'
require 'pp'

def prompt

  student_ids = {}

  CSV.foreach("data2.csv", :headers => true, :header_converters => :symbol, :converters => :all) do |row|
    student_id = row[:student_id]

    unless student_ids.has_key? student_id
      student_ids[student_id] = []
    end
    strand_questions = student_ids[student_id]
    strand_questions.push Hash[row.headers[1..-1].zip(row)]
  end
  pp student_ids
end

prompt
