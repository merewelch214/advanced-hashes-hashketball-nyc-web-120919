def game_hash()
# CREATE HOME PLAYERS
  home_player_arr = []
  home_names = ["Alan Anderson",
  "Reggie Evans",
  "Brook Lopez",
  "Mason Plumlee",
  "Jason Terry"] 
  home_numbers = [0,30,11,1,31]
  home_shoe = [16,14,17,19,15]
  home_points = [22, 12, 17, 26, 19]
  home_rebounds = [12, 12, 19, 11, 2]
  home_assists = [12,12,10,6,2]
  home_steals = [3,12,3,3,4]
  home_blocks = [1,12,1,8,11]
  home_slam = [1,7,15,5,1]
  
  home_player_arr  = []
  
  i = 0
  while i < home_names.length
    home_player_hash = {
      :player_name => home_names[i],
      :number => home_numbers[i],
      :shoe =>  home_shoe[i],
      :points => home_points[i],
      :rebounds => home_rebounds[i],
      :assists => home_assists[i],
      :steals => home_steals[i],
      :blocks => home_blocks[i],
      :slam_dunks => home_slam[i]
    }
    home_player_arr << home_player_hash
    i += 1
  end
  
# CREATE AWAY PLAYERS  
  away_player_arr = []
  away_names = ["Jeff Adrien",
  "Bismack Biyombo",
  "DeSagna Diop",
  "Ben Gordon",
  "Kemba Walker"] 
  away_numbers = [4,0,2,8,33]
  away_shoe = [18,16,14,15,15]
  away_points = [10, 12, 24, 33, 6]
  away_rebounds = [1, 4, 12, 3, 12]
  away_assists = [1,7,12,2,12]
  away_steals = [2,22,4,1,7]
  away_blocks = [7,15,5,1,5]
  away_slam = [2,10,5,0,12]
  
  away_player_arr  = []
  
  i = 0
  while i < away_names.length
    away_player_hash = {
      :player_name => away_names[i],
      :number => away_numbers[i],
      :shoe =>  away_shoe[i],
      :points => away_points[i],
      :rebounds => away_rebounds[i],
      :assists => away_assists[i],
      :steals => away_steals[i],
      :blocks => away_blocks[i],
      :slam_dunks => away_slam[i]
    }

    away_player_arr << away_player_hash
    
    i += 1
  end
  
  home_inner_hash = {
    :team_name => "Brooklyn Nets", 
    :colors => ["Black","White"], 
    :players => home_player_arr
  }
  
  away_inner_hash = {
    :team_name => "Charlotte Hornets", 
    :colors => ["Turquoise","Purple"], 
    :players => away_player_arr
  }
  
  final_hash = {
    :home => home_inner_hash, 
    :away => away_inner_hash 
  }
  return final_hash
end

def num_points_scored(player)
  full_hash = game_hash()
  full_hash.each do | ha, team | 
    team[:players].each do | i |
      if i[:player_name] == player
        return i[:points] 
      end
    end
  end 
end

def shoe_size(player)
  full_hash = game_hash()
  full_hash.each do | ha, team | 
    team[:players].each do | i |
      if i[:player_name] == player
        return i[:shoe] 
      end
    end
  end 
end

def team_colors(team)
  full_hash = game_hash()
  full_hash.each do |k,v|
    if v[:team_name] == team 
      return v[:colors]
    end
  end
end

def team_names()
  full_hash = game_hash()
  names_arr = []
  full_hash.each do |k,v| 
    names_arr << v[:team_name]
  end
  return names_arr
end

def player_numbers(team_n)
  full_hash = game_hash()
  num_arr = []
  full_hash.each do | ha, team | 
    if team[:team_name] == team_n
      team[:players].each do | i |
        num_arr << i[:number] 
      end
    end
  end 
  num_arr
end

def player_stats(player)
  full_hash = game_hash()
  stat_hash = {}
  full_hash.each do | aw, val |
    val[:players].each do |name, stats|
      if name[:player_name] == player
        stat_hash = 
          {:number => name[:number],
          :shoe => name[:shoe],
          :points => name[:points],
          :rebounds => name[:rebounds],
          :assists => name[:assists],
          :steals => name[:steals],
          :blocks => name[:blocks],
          :slam_dunks => name[:slam_dunks]}
      end
    end
  end
  return stat_hash
end

def big_shoe_rebounds()
  full_hash = game_hash()
  new_hash = {}
  new_arr = []
  full_hash.each do |a, v|
    v[:players].each do |i|
      new_hash = 
      {
        :player_name => i[:player_name],
        :shoe => i[:shoe],
        :rebounds => i[:rebounds]
      }
      new_arr << new_hash
    end
  end
  
  highest = 0
  num_rebounds = 0
  new_arr.each do |i|
    i.each do |k, v|
      if i[:shoe] > highest
        highest = i[:shoe]
        num_rebounds = i[:rebounds]
      end
    end
  end
  return num_rebounds
end  

def most_points_scored()
  full_hash = game_hash()
  new_arr = []
  full_hash.each do |a, v|
    v[:players].each do |i|
      new_hash = 
      {
        :player_name => i[:player_name],
        :points => i[:points]
      }
      new_arr << new_hash
    end
  end
  
  highest = 0 
  player = ""
  new_arr.each do |i|
    if i[:points] > highest
      highest = i[:points]
      player = i[:player_name]
    end
  end
  return player
end

def winning_team()
  away_points = 0 
  home_points = 0 
  
  full_hash = game_hash()
  full_hash.each do |a, v|
    v[:players].each do |i|
      if a == :home
        home_points += i[:points]   
      elsif a == :away
        away_points += i[:points]
      end
    end
  end 
  
  if home_points > away_points
    return "Brooklyn Nets"
  else return "Charlotte Hornets"
  end
end

def player_with_longest_name()
  length = 0
  p_name = ""
  full_hash = game_hash()
  full_hash.each do |a, v|
    v[:players].each do |i|
      if i[:player_name].length > length
        length = i[:player_name].length
        p_name = i[:player_name] 
      end
    end
  end
  p_name 
end  

def long_name_steals_a_ton?()
  num_steals = 0
  p_name = ""
  long_name = player_with_longest_name
  full_hash = game_hash()
  full_hash.each do |a, v| 
    v[:players].each do |i|
      if i[:steals] > num_steals
        num_steals = i[:steals]
        p_name = i[:player_name] 
      end
    end
  end
  return long_name == p_name
end
  