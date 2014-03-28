class Interval

	def proccess(number_list)
		return [] if invalid_number_list number_list

		@number_list = number_list
		@grouped_numbers = [];
		@index_first_group_number = nil
		
		@number_list.each_with_index do |number, index|
			proccess_current_number number, index
		end
		@grouped_numbers
	end

	private
	def proccess_current_number(number, index)
		if @index_first_group_number == nil
			@index_first_group_number = index
		else
			if number_is_not_this_group(number, index) || isLastNumberTheList(index)
				add_group_in_grouped_numbers number, index
			end
		end
	end

	def number_is_not_this_group(number, index)
		number - @number_list[index - 1] != 1
	end

	def invalid_number_list(number_list)
		number_list == nil || number_list == []
	end

	def isLastNumberTheList(index)
		@number_list.length == index + 1
	end

	def add_group_in_grouped_numbers(number, index)
		if index - @index_first_group_number > 1
			@grouped_numbers.push [@number_list[@index_first_group_number], @number_list[index - 1]]
		else
			@grouped_numbers.push [number]
		end
		
		@index_first_group_number = index
		if isLastNumberTheList(index)
			@grouped_numbers.push [number]
		end
	end
end