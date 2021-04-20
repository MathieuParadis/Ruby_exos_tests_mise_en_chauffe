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

def day_trader (array)
    if array == []
        p "array empty"
    elsif array == array.sort.reverse
        p "Not good to buy"
    else
    a = rework_array(array)

    #purchasing
    p purchasing_day = a.index(a.max) + 1
    p purchasing_price = array[purchasing_day-1]
    
    #selling
    p selling_price = a.max + purchasing_price
    p selling_day = array.drop(purchasing_day).index(array.drop(purchasing_day).max) + 1 + purchasing_day
    
    p "The best day to buy is day #{purchasing_day} with a value of #{purchasing_price}, and the best day to sell is day #{selling_day} with a value of #{selling_price}"

    end
end


 day_trader([674, 6, 55, 13, 89, 90, 2453, 1, 8908])