module ApplicationHelper
	def self.highrankuser
    user = User.all.map {|user| reputation = user.reputation_for(:votes).to_i , id = user.id }
    winner = user.sort_by{|x,y| x}.reverse
    first = winner.first
    winner2 = User.find_by_id(first.last)
    a = winner2.reputation_for(:votes).to_s
    winner2.email + (a)
  end
end
