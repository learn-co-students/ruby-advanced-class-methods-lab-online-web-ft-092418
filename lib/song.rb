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
    self.new.tap { |song| song.save }
    #song = self.new
    #song.save
    #return song
  end
  
  def self.new_by_name(name)
    self.new.tap { |song| song.name = name }
    #song = self.new
    #song.name = name
  end
  
  def self.create_by_name(name)
    self.new_by_name(name).tap{ |song| song.save }
  end
  
  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name) 
      song
    else 
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(file)
    artist_name, song = file.split(" - ")
    song.gsub!(".mp3", "")
    self.new_by_name(song).tap { |song| song.artist_name = artist_name }
  end
  
  def self.create_from_filename(file)
    self.new_from_filename(file).tap { |song| song.save }
  end
  
  def self.destroy_all
    self.all.clear
  end
end
