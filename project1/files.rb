directory_name = "myapp"
# tworzymy tablicę ze wzystkimi plikami w danej ścieżce, po czym przy pomocy injecta zliczamy wystąpienia danego rozszerzenia
file_data = Dir.glob(File.join(directory_name, "**", "*.*")).inject({}) do |hash, file_name|
  ext = File.extname(file_name)
  hash[ext] ||= 0
  hash[ext] +=1
  hash
end


#funkcja File.open tworzy nowy plik. Drugim argumentem jest tryb otwarcia pliku. Do bloku podajemy

File.open("raport.txt", "w") do |file|
  file_data.each do |k, v|
    file.puts "#{k}\t#{v}"
  end
end
