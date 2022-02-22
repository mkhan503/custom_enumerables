module Enumerable
  def my_each
    for i in self do
      yield i 
    end
    self
  end

  def my_each_with_index
    for i in (0..self.length - 1)
      yield(self[i], i)
    end
    self
  end

  def my_select
    
    return_array = []
    for i in self do 
      return_array << i if yield i == true
    end
    return_array

    # using my_each
    # return_array = []
    # self.my_each do |element| 
    # return_array << element if yield(element) == true
    # end
    # return_array
  end

  def my_all?
    for i in self do 
      return false if yield(i) == false
    end
    return true
  end
    #self.my_each do |element|
     # return false if yield(element) == false
    #end
    #return true
  #end
  def my_any?
    self.my_each do |element|
      return true if yield(element) == true
    end
    return false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element) == true
    end
    return true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |element|
        count += 1 if yield(element) == true
      end
    else
      count = self.length
    end
    count
  end

  def my_map
    return_array = []
    self.my_each do |element|
      return_array << yield(element)
    end
    return_array
  end

  def my_inject(initial_value=0)
    self.my_each do |element|
      initial_value = yield(initial_value, element)
    end
    initial_value
  end
end




class Array
  include Enumerable
  
end

