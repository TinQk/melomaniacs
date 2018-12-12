class TopLikes
  def initialize
  end

  def get_top
    array = []
    array = Artist.all.sort_by{|a| a.likes.count}.reverse
    10.times do |i|
    $newarr << array[i]
    return $newarr
  end
end
