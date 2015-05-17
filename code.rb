require 'pry'


# def matched_brackets?(arg)
# 	substring = arg.split('(')
# 	puts substring
# 	subarray = substring[1].split('')
# 	if subarray.include?('(')
# 		puts true
# 	else
# 		puts false
# 	end
# end

def matched_brackets?(arg)
	substring_array = arg.split('')
	hash = Hash[substring_array.each_with_index.map {|value, index| [index, value] }]
	left_bracket_index = []
	right_bracket_index = []
	hash.each do |key, value|
		if value == '('
			left_bracket_index << key
		elsif value == ')'
			right_bracket_index << key
		end
	end
	this_many_times = left_bracket_index.length
	this_many_times.times do |x| 
		x = left_bracket_index.unshift		
		bracket_index = left_bracket_index[0]
		if right_bracket_index.bsearch { |x| x > bracket_index }
			to_pop = right_bracket_index.bsearch { |x| x > bracket_index }
			right_bracket_index.delete(to_pop)
			left_bracket_index.delete(bracket_index)
		end
	end
	if left_bracket_index.empty? && right_bracket_index.empty?
		puts true
	else
		puts false
	end
end

matched_brackets?('()aas)(dgkha;(kls)jk)lag')
  