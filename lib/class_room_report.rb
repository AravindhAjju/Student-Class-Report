class ClassRoomReport
  def self.students_report teacher: , in_file: false

    raise "Invalid Teacher" if teacher.blank?
    raise "No Details Found" if teacher.students.blank?

    if(in_file)
      FileUtils.mkdir_p "/tmp/class_room_report"
      output_file = File.new("/tmp/class_room_report/#{teacher.class_room.standard}.txt", "w")
    end

    grade_avg = teacher.students.joins(:scorecard).group("scorecards.grade").average("scorecards.total")
    grade_count = teacher.students.joins(:scorecard).group("scorecards.grade").count
    avg_count = {
      "ABOVE" => 0,
      "BELOW" => 0
    }

    subjects = %W(
      S1
      S2
      S3
      S4
    )

    output_file.puts "==============================================================" if in_file
    puts "=============================================================="
    puts "Scorecard: "
    output_file.puts "Scorecard: " if in_file
    puts "ID | #{subjects.join(" | ")} | Grand-Total | Grade | Average-compare"
    output_file.puts "ID | #{subjects.join(" | ")} | Grand-Total | Grade | Average-compare" if in_file

    teacher.students.includes(scorecard: :subject_scores).find_each(batch_size: 50).each do |student|
      data = {
        "ID" => student.identity
      }
      subjects.each do |subject_name|
        data[subject_name] = student.scorecard.subject_scores.detect do |subject_score|
          subject_score.name == subject_name
        end.score
      end
      data["Grand-Total"] = student.total
      data["Grade"] = student.grade
      data["Average-compare"] = student.total >= grade_avg[student.grade] ? "ABOVE" : "BELOW"

      avg_count[data["Average-compare"]] += 1

      puts "#{data["ID"]} | #{subjects.map{|s_name| data[s_name]}.join(" | ")} | #{data["Grand-Total"]} | #{data["Grade"]} | #{data["Average-compare"]}"
      output_file.puts "#{data["ID"]} | #{subjects.map{|s_name| data[s_name]}.join(" | ")} | #{data["Grand-Total"]} | #{data["Grade"]} | #{data["Average-compare"]}" if in_file
    end

    puts "=============================================================="
    output_file.puts "==============================================================" if in_file
    
    puts "Grade Report:"
    output_file.puts "Grade Report:" if in_file
    
    puts "Number of students in A Grade :: #{grade_count["A"]}"
    output_file.puts "Number of students in A Grade :: #{grade_count["A"]}" if in_file
    puts "Number of students in B Grade :: #{grade_count["B"]}"
    output_file.puts "Number of students in B Grade :: #{grade_count["B"]}" if in_file
    puts "Number of students in C Grade :: #{grade_count["C"]}"
    output_file.puts "Number of students in C Grade :: #{grade_count["C"]}" if in_file
    puts "Number of students above their grade average :: #{avg_count["ABOVE"]}"
    output_file.puts "Number of students above their grade average :: #{avg_count["ABOVE"]}" if in_file
    puts "Number of students above their grade average :: #{avg_count["BELOW"]}"
    output_file.puts "Number of students above their grade average :: #{avg_count["BELOW"]}" if in_file
    puts "=============================================================="
    output_file.puts "==============================================================" if in_file

    output_file.close()
    output_file
  end
end