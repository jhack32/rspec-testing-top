module Enumerable
	def my_each
		return self unless block_given?
		for i in self
			yield i
		end
	end
	def my_each_with_index
		index = 0
		return self unless block_given?
		while index < self.size
			yield(self[index], index)
			index += 1
		end
	end
	def my_select
		result = []
		self.my_each { |x| result = x if yield(x) }
	end
	def my_all?
		self.my_each { |x| return false unless yield(x) }
	end
	def my_any?
		check = 0
		self.my_each do |x|
				if block_given?
					check += 1 if yield x
				else
					check += 1 if (x != nil && x != false)
				end
			end
				return true if check > 0
				return false if check == 0
		end
	def my_none?
		check = 0

		self.my_each do |x|
			if block_given?
				check += 1 if yield(x)
			else
				check += 1 if (x != nil && x != false)
			end
		end
			 return false if check > 0
			 return true if check == 0
	end
	def my_count(arg = nil)
		counts = 0
		self.my_each do |x|
			if block_given?
					counts += 1 if yield(x)
				elsif arg == nil
					counts += 1
				else
					counts += 1 if x == arg
				end
			end
		counts
	end
	def my_map(proc = nil)
		result = []
		if proc && block_given?
			self.my_each { |element| result << proc.call(yield(element)) }
		elsif proc && !block_given?
			self.my_each { |element| result << proc.call(element) }
		elsif proc.nil? && block_given?
			self.my_each { |element| result << yield(element) }
	  else
	  	self
		end
		result
	end
	def my_inject(initial = 0)
		self.my_each { |element| initial = yield(initial, element) }
		initial
	end

	def multiply_els array
		array.my_inject(1) { |product, element| product * element }
	end
end
