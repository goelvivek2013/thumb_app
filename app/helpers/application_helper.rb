module ApplicationHelper
	def self.highrankuser
    user = User.all.map {|user| reputation = user.reputation_for(:votes).to_i , id = user.id }
    user.sort_by{|x,y| x}.reverse!
    winner = user.first
    winner = User.find_by_id(winner[1])
    a = winner.reputation_for(:votes).to_s
    winner.email + (a)
  end
end
