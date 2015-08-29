namespace :cucumber_helper do
  desc "TODO"
  task steps: :environment do
    puts 'It worked'
    require 'hirb'
    extend Hirb::Console
    puts "CUCUMBER steps:"
    puts ""
    step_definition_dir = "features/step_definitions"

    Dir.glob(File.join(step_definition_dir,'**/*.rb')).each do |step_file|

      puts "File: #{step_file}"
      puts ""
      results = []
      File.new(step_file).read.each_line.each_with_index do |line, number|

        next unless line =~ /^\s*(?:Given|When|Then)\s+|\//
        res = /(?:Given|When|Then)[\s\(]*\/(.*)\/([imxo]*)[\s\)]*do\s*(?:$|\|(.*)\|)/.match(line)
        next unless res
        matches = res.captures
        results << OpenStruct.new(
            :steps => matches[0],
            :modifier => matches[1],
            :args => matches[2]
        )
      end
      table results, :resize => false, :fields=>[:steps, :modifier, :args]
      puts ""
    end
  end

end
