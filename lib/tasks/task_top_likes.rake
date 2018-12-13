desc "Generates the 10 top liked artists of the day"
task task_top_likes: :environment do
  TopLikes.new.get_top
end