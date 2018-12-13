
class TopLikes
  def initialize
  end

  def get_top
    array = []
    array = Artist.all.sort_by{|a| a.likes.count}.reverse
    Toplike.delete_all
    10.times do |i|
      top = Toplike.new
      top.id = array[i].id
      top.save
    end
  end
end
