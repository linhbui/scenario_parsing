require 'csv'
file_name = ARGV[0]
csv_file_name = ARGV[1]

class ScenarioParser
  attr_reader :file_name, :csv_file_name

  def initialize(file_name, csv_file_name)
    @file_name = file_name
    @csv_file_name = csv_file_name
  end

  def parse
    CSV.open(csv_file_name, "wb") do |csv|
      csv << ['#', 'Subject', 'Subject Action', 'Other Data/Objects', 'Object Acted Upon']
      File.foreach(file_name) do |line|
        words = line.tr(',','').gsub(/[Tt]he /, '').split(' ')
        words[-1] = words[-1].tr('.', '')
        row = [words[0]]

        if %w(If For else).include?(words[1])
          row << words[1..-1].join(' ')
          csv << row
          next
        end

        words.each_with_index do |word, idx|
          next if idx == 0
          if word[-1] == 's'
            has_processed_verb = true
            subject = words[1...idx].join(' ')
            subject_action = word
            remaining = words[idx+1..-1].dup
            if index_of_preposition = remaining.find_index('with') || remaining.find_index('to')
              other_object = remaining[0...index_of_preposition].join(' ')
              object_acted_upon = remaining[index_of_preposition+1..-1].join(' ')
              row += [subject, subject_action, other_object, object_acted_upon]
            else
              row += [subject, subject_action, remaining.join(' ')]
            end
            csv << row
            break
          end
        end
      end
    end
  end
end

ScenarioParser.new(file_name, csv_file_name).parse

