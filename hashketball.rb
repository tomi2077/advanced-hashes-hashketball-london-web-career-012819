require "pry"
def game_hash
  game_hash = {
  :home => {team_name:"Brooklyn Nets", colors:["Black", "White"], 
  :players => {"Alan Anderson" => {:number => 0, :shoe => "16", :points => 22, :rebounds => 12, :assists =>12, :steals => 3, 
  :blocks => 1, :slam_dunks => 1}, 
  "Reggie Evans" => {:number => 30, :shoe => "14", :points => 12, :rebounds => 12, :assists =>12, :steals => 12, 
  :blocks => 12, :slam_dunks => 7},
  "Brook Lopez" => {:number => 11, :shoe => "17", :points => 17, :rebounds => 19, :assists =>10, :steals => 3, 
  :blocks => 1, :slam_dunks => 15},
  "Mason Plumlee" => {:number => 1, :shoe => "19", :points => 26, :rebounds => 12, :assists =>6, :steals => 3, 
  :blocks => 8, :slam_dunks => 5},
  "Jason Terry" => {:number => 31, :shoe => "15", :points => 19, :rebounds => 2, :assists => 2, :steals => 4, 
  :blocks => 11, :slam_dunks => 1}}},
  
  :away => {team_name:"Charlotte Hornets", colors:["Turquoise", "Purple"], 
   :players => {"Jeff Adrien" => {:number => 4, :shoe => "18", :points => 10, :rebounds => 1, :assists =>1, :steals => 2, 
  :blocks => 7, :slam_dunks => 2}, 
  "Bismak Biyombo" => {:number => 0, :shoe => "16", :points => 12, :rebounds => 4, :assists =>7, :steals => 7, 
  :blocks => 15, :slam_dunks => 10},
  "DeSagna Diop" => {:number => 2, :shoe => "14", :points => 24, :rebounds => 12, :assists =>12, :steals => 4, 
  :blocks => 5, :slam_dunks => 5},
  "Ben Gordon" => {:number => 8, :shoe => "15", :points => 33, :rebounds => 3, :assists =>2, :steals => 1, 
  :blocks => 1, :slam_dunks => 0},
  "Brendan Haywood" => {:number => 33, :shoe => "15", :points => 6, :rebounds => 12, :assists => 12, :steals => 22, 
  :blocks => 5, :slam_dunks => 12}}}
  }
end

def num_points_scored(player_name)
  arr = []
  game_hash.each do |location,game_data|
    game_data.each do |attr, values|
      if attr == :players
        values.each do |person, stat|
          stat.each do |a,b|
            if person == player_name && a == :points
              arr << b
            end
          end
        end
      end
    end
  end
  return arr[0]
end

def shoe_size(player_name)
  arr = []
  game_hash.each do |location,game_data|
    game_data.each do |attr, values|
      if attr == :players
        values.each do |person, stat|
          stat.each do |a,b|
            if person == player_name && a == :shoe
              arr << b.to_i
            end
          end
        end
      end
    end
  end
  return arr[0]
end

def team_colors(team_name)
  if team_name == "Brooklyn Nets"
    return game_hash[:home][:colors]
  elsif team_name == "Charlotte Hornets"
    return game_hash[:away][:colors]
  else
  end
end

def team_names
  arr = []
  arr << game_hash[:home][:team_name] 
  arr << game_hash[:away][:team_name]
  return arr
end

def player_numbers(team_namesO)
  arr = []
  if game_hash[:home][:team_name] == team_namesO
    game_hash[:home][:players].each do |player,values|
      values.each do |a,b|
        if a == :number
          arr << b
        end
      end
    end
  arr
  elsif game_hash[:away][:team_name] == team_namesO
    game_hash[:away][:players].each do |player,values|
      values.each do |a,b|
        if a == :number
          arr << b
        end
      end
    end
  end
  arr
end

def player_stats(player_name)
  game_hash.keys.each do |data|
    if game_hash[data][:players].keys.include?(player_name)
      return game_hash[data][:players][player_name].each_with_object({}) do |(key, value), memo| 
        memo[key] = (key == :shoe ? value.to_i : value)
      end
    end
  end
end

def big_shoe_rebounds
  biggest_shoe = nil
  big_shoe_player_rebounds = nil
  game_hash.each do |home_or_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          stats.each do |stat_name, value|
            if stat_name == :shoe
              if biggest_shoe == nil
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[home_or_away][:players][player_name][:rebounds]
              elsif value > biggest_shoe
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[home_or_away][:players][player_name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  big_shoe_player_rebounds
end

 







  
  




        
            
        
  




