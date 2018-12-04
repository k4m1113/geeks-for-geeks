require 'open-uri'
require 'nokogiri'
require 'json'

k = JSON.parse(File.read('allProblems.json'))
k.each do |problem|
	camelName = problem["name"].split.map.with_index { |x,i| i == 0 ? x.downcase : x.capitalize  }.join
	
	html = open(problem["href"])
	doc = Nokogiri::HTML(html)
	question = doc.css('div.problemQuestion').map(&:text)
	File.open(camelName, "w") do |f|
		f.puts question
        end
end
