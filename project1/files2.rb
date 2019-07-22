require 'open-uri'

rows = File.open("raport.txt") {|f| f.readlines }.map {
  |e| e.chomp.split("\t")
}.sort_by { |e| e.last.to_i }.reverse.take(10)

labels = rows.map { |r| r.first }.join("|")
values = rows.map { |r| r.last }.join(",")

url = "https://chart.googleapis.com/chart?cht=p&chds=a&chs=600x350&chl=#{labels}&chd=t:#{values}"

image_content = open(url).read
File.open("raport.png", "w") { |f| f.write(image_content)}
