require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  
  
  def self.create
    song = self.new 
    song.save
    song 
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song 
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save 
    song 
  end 
  
  def self.find_by_name(name)
    @@all.find{ |song| song.name == name }
  end 
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song 
      return song 
    else
      song = self.create_by_name(name)
      return song 
    end 
  end 

  def self.alphabetical 
    songs = self.all
    songs.sort_by { |song| song.name } 
  end 
  
  def self.new_from_filename(file)
    file = file.split("-")
    file = file.map {|s| s.split(".")} 
    file.flatten!
    file = file.reject {|s| s.include?("mp3")}
    file = file.map {|s| s.strip!}
    artistname = file[0]
    songname = file[1]
    song = self.find_or_create_by_name(songname)
     
    song.artist_name = artistname 
    song  
  end 
  
  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
end

