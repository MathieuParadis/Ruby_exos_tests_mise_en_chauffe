require_relative '../lib/JM_trader'

describe "the rework method" do
  it "should return an array that gives the difference between an element i at position n and the biggest element in the rest of the array" do
    expect(rework_array([1, 2, 3])).to eq([2, 1])
    expect(rework_array([5, 8, 3])).to eq([3, -5])
    expect(rework_array([5, 8, 3, 67, 13, 90])).to eq([85, 82, 87, 23, 77])
  end
end


def rework_array(array)
  a1 = []

  #step 1: transform array into nested array: [1, 2, 3] => [[1, [2,3], [2, [3]], [3, []]]
  array.each_index{ |i|  a1.push([array[i], array.drop(i+1)]) }

  #step 2: reject the last entry which contains [] => [[1, [2,3], [2, [3]]]
  a2 = a1.reject{ |i| i.include?([])  }

  #step 3: get the max from the nested array => [[1,3], [2,3]]
  a3 = a2.map{ |i| i = [i[0], i[1].max] } 

  #step 4: calcul des max [2, 1]
  a4 = a3.map{ |i| i = - (i[0] - i[1]) }
end

describe "the day trader method" do
  it "should return array empty when input is an empty array" do
    expect(day_trader([])).to eq("array empty")
  end

  it "should return array empty when input is an empty array" do
    expect(day_trader([5, 4, 3, 2, 1])).to eq("Not good to buy")
    expect(day_trader([10000, 2200, 38, 4, 1])).to eq("Not good to buy")
    expect(day_trader([250, 222, 63, 9, 5])).to eq("Not good to buy")
  end

  it "should return array empty when input is an empty array" do
    expect(day_trader([1, 4, 3, 5, 1])).to eq("The best day to buy is day 1 with a value of 1, and the best day to sell is day 4 with a value of 5")
    expect(day_trader([290, 4, 33, 52, 221])).to eq("The best day to buy is day 2 with a value of 4, and the best day to sell is day 5 with a value of 221")
    expect(day_trader([671, 465, 3765, 5, 15])).to eq("The best day to buy is day 2 with a value of 465, and the best day to sell is day 3 with a value of 3765")
    expect(day_trader([16, 4, 3, 5, 1])).to eq("The best day to buy is day 3 with a value of 3, and the best day to sell is day 4 with a value of 5")
    expect(day_trader([71, 48, 343, 90, 111])).to eq("The best day to buy is day 2 with a value of 48, and the best day to sell is day 3 with a value of 343")

  end
end