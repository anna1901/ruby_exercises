def bubble_sort(arr)
  sorted = false
  j = 1
  while sorted == false
    sorted = true
    (0...arr.length-j).each do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
    end
    j+=1
  end
  arr
end

def bubble_sort_by(arr)
  sorted = false
  j = 1
  while sorted == false
    sorted = true
    (0...arr.length-j).each do |i|
      if yield(arr[i],arr[i+1]) > 0
        arr[i], arr[i+1] = arr[i+1], arr[i]
        sorted = false
      end
    end
    j+=1
  end
  arr
end

a = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end

puts a
