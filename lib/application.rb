require 'pry'

class IRV

  def initialize(ballots)
    @ballots = ballots
    @vote_count = {}
  end

  def ballots
    @ballots
  end

  def get_first_column
    @first_column = []
    @ballots.each do |ballot|
      @first_column << ballot.first
    end

  end

  def count_votes
    get_first_column
    @first_column.each do |element|
      @vote_count[element] = @first_column.count(element)
    end
    @vote_count
  end

  def find_highest_vote
    count_votes
    @vote_array = @vote_count.to_a
    @vote_array.sort_by! { |arry| arry[1] }
    @winning_candidate = @vote_array.last
  end

  def check_majority
    find_highest_vote
    if @winning_candidate[1].to_f/ballots.length > 0.5
      @winner = @winning_candidate[0]
    else
      delete_losers(find_losers)
    end
  end

  def find_losers
    losers_array = []
    @vote_array.each do |candidate|
      if losers_array.length == 0 || losers_array.last[1] == candidate[1]
        losers_array << candidate
      end
    end
    losers_array
  end

  def delete_losers(losers)
    losers.each do |loser|
      @ballots.each do |ballot|
        ballot.delete(loser[0])
      end
    end
  end

  def final_tally
    until @winner != nil
      check_majority
    end
    @winner
  end


end

