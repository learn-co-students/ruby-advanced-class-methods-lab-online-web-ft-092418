require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create 
    song = self.new
    song.save
    song
  end 
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end 
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save 
    song
  end 
  
  def self.find_by_name(song_name)
    #binding.pry
    self.all.find {|song| song.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    unless find_by_name(song_name) == nil 
      find_by_name(song_name) 
    else 
      self.create_by_name(song_name)
    end 
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(song_name)
    song_arr = song_name.split("-")
    artist_name = song_arr[0].strip
    song_name = song_arr[1][0..-5].strip
    
    new_song = self.create_by_name(song_name)
    new_song.artist_name = artist_name
    new_song
  end 
  
  def self.create_from_filename(song_name)
    self.new_from_filename(song_name).save
  end 

  def self.destroy_all
    self.all.clear
  end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
