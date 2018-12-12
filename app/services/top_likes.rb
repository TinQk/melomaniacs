class TopLikes
  def initialize
  end

  def get_top
    array = []
    array = Artist.all.sort_by{|a| a.likes.count}.reverse
    0.upto(10) do |i|
      newarr << array[i]
    $newarr << array[0]
    $newarr << array[1]
    $newarr << array[2]
    $newarr << array[3]
    $newarr << array[4]
    $newarr << array[5]
    $newarr << array[6]
    $newarr << array[7]
    $newarr << array[8]
    $newarr << array[9]
    return $newarr
  end
end
