require 'pry'
# Write your code here!
def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, #######
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien"  => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
            
          #######
        }
      }
    }
  }
  # binding.pry
  
  game_hash
end

def num_points_scored(player)
    game_hash.each do |key,value|
      if value[:players].include?(player)
        return value[:players][player][:points]
      end
    end 
end

def shoe_size(player)
  game_hash.each do |key,value|
    if value[:players].include?(player)
      return value[:players][player][:shoe]
    end
  end 
end 

def team_colors(team_name)
  game_hash.each do |key,value|
    if value[:team_name].include?(team_name)
      return value[:colors]
    end 
  end 
end

def team_names
  team_names = []
  game_hash.each do |key,value|
    team_names << value[:team_name]
  end 
  team_names
end

def player_numbers(team_name)
  players_number = []
  
  game_hash.each do |key,value|
    if value[:team_name].include?(team_name)
      value[:players].each do |key,value|
        players_number << value[:number]  
      end
    end 
  end 
  players_number
end 

def player_stats(name)
  game_hash.each do |key,value|
    if value[:players].include?(name)
      return value[:players][name]
    end 
  end 
end 

def big_shoe_rebounds
  shoe_size = []
  
  game_hash.each do |key,value|
    value[:players].keys.each do |player|
      shoe_size << shoe_size(player)        
    end
  end 
  shoe_size.sort!
  
  game_hash.each do |key,value|
    value[:players].each do |key,value|
      if value[:shoe] == shoe_size.last
        return value[:rebounds] 
      end
    end 
  end 
  
end 

def most_points_scored
  most_points = 0 
  player_high = " "
  
  game_hash.each do |key,value|
    value[:players].each do |key,value|
      if num_points_scored(key) > most_points
        most_points = num_points_scored(key)
          player_high = key
      end
    end 
  end 
  player_high
end 

def winning_team
  home_score = []
  away_score = []
  winning_team = []
  game_hash.each do |key,value|
    if key == :home
      winning_team << value[:team_name]
      value[:players].each do |key,value|
        home_score << num_points_scored(key)
      end
    elsif key == :away 
      winning_team << value[:team_name]
      value[:players].each do |key,value|
        away_score << num_points_scored(key)
      end
    end 
  end 
  home_score.sum > away_score.sum ? winning_team[0] : winning_team[1]
end 

def player_with_longest_name
  player_names = []
  game_hash.each do |key,value|
    value[:players].keys.each do |name|
      player_names << name 
    end 
  end 
  player_names.sort! { |a,b| a.length <=> b.length} 
  player_names.last
end 

def long_name_steals_a_ton?
  highest_steals = []
  game_hash.each do |key,value|
    value[:players].each do |key,value|
      highest_steals << value[:points]
    end 
  end 
  highest_steals.sort!
  long_name_stealer = highest_steals.last 
  binding.pry
  long_name_stealer == player_most_steals ? true : false 
  
end 

def player_most_steals
  player = " "
  steals = 0 
  
  game_hash.each do |key,value|
    value[:players].each do |key,value|
      if value[:steals] > steals
        player = key 
        steals = value[:steals]
      end
    end 
  end 
  player 
end 

binding.pry
# binding.pry
# player = "Jeff Adrien"
# num_points_scored(player)
# team_colors("Charlotte Hornets")
# team_names
# player_numbers("Charlotte Hornets")
# player_stats("Brendan Haywood")
# big_shoe_rebounds

# most_points_scored
# player_with_longest_name
# long_name_steals_a_ton?
player_most_steals


