#encoding: utf-8
#!/usr/bin/env ruby
require 'time'
require 'json'
# read file
brm_list = []

File.open("brm_list.txt", "r:iso-8859-1") do |infile|
  while (line = infile.gets)
    puts line
    brm_list << {
      calendarId: "primary",
      resource:   {
        summary:     line.split(":")[0].gsub(/\s+/, ""),
        location:    "tokyo",
        description: line.split(":")[0].gsub(/\s+/, ""),
        start:       {
          dateTime: Time.strptime(line.split(":")[1].gsub(/\s+/, ""),"%Y年%m月%d日").to_datetime
        },
        end:         {
          dateTime: Time.strptime(line.split(":")[1].gsub(/\s+/, ""),"%Y年%m月%d日").to_datetime
        }

      }
    }

  end
end

puts (brm_list.to_json)
File.open("brm_list.json", 'w:iso-8859-1') { |file| file.write(brm_list.to_json) }