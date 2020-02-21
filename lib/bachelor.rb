require 'pry'
def get_first_name_of_season_winner(data, season)
  data[season].find() {|n|n["status"]=="Winner"}["name"].split[0]
end

def get_contestant_name(data, occupation)
  allSeasons = data.values.flat_map{|n| n}
  allSeasons.reduce(0) do |sum, n |
    if n["occupation"]==occupation
        sum = n["name"]
    else sum = sum
    end
  end 
end

def count_contestants_by_hometown(data, hometown)
  allSeasons = data.values.flat_map{|n| n}
  allSeasons.reduce(0) do |sum, n|
    if n["hometown"] == hometown
      sum = sum + 1
    else 
      sum = sum
    end
  end
end

def get_occupation(data, hometown)
  allSeasons = data.values.flat_map{|n| n}
  allSeasons.find{|n|n["hometown"]==hometown}["occupation"]
end
def roundup(float)
  if (float-float.to_i) * (float-float.to_i) < 0.49999999999999999999
    float = float+0.5
  end
  return float.round(0).to_i
end 

def get_average_age_for_season(data, season)
  seasonContestants = data[season]
  allAgesAdded = seasonContestants.reduce(0)do |sum, n| 
  sum = sum + n["age"].to_i
  end
  numberOfContestants = seasonContestants.length
  return (allAgesAdded.to_f/numberOfContestants.to_f).round(0)
end
