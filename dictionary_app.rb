require 'http'
@complete = true
puts "Dictionary"
puts "Enter a word:"

def dictionary
  word = gets.chomp.downcase
  word_data =  HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=")
  @word_data = word_data.parse
end

 def define
  puts "-------------------"
  puts @word_data[0]["word"]
    @word_data.length.times do |i|
      puts "#{i+1}.) #{@word_data[i]["text"]}"
    end
  @complete = false
end

while @complete
  begin
    dictionary
    define
  rescue 
    puts "Not a valid word, Try again:"
  end
end
