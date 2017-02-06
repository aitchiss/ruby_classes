class Team

  attr_accessor :team_name, :players, :coach, :points


  def initialize(team_name, players, coach)
    @team_name = team_name
    @players = players
    @coach = coach
    @points = 0
  end

  def add_player(new_player)
    @players << new_player
  end

  def has_player?(player_searched)
    for player in @players
      if player == player_searched
        return true
      end
    end
    return false
  end

  def game_played(won_or_lost)
    if won_or_lost == "win"
      @points += 1
    end
  end

  # def get_name
  #   return @team_name
  # end

  # def get_players
  #   return @players
  # end

  # def get_coach()
  #   return @coach
  # end

  # def change_coach(new_coach)
  #   @coach = new_coach
  # end

end