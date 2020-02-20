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

def get_average_age_for_season(data, season)
  allSeasons = data.values.flat_map{|n| n}
   allSeasons.reduce{|sum, n| sum=sum+n["age"]}
end
