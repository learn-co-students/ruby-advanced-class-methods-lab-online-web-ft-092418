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
    self.new.tap { |song| song.save}
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    artistname, songname = filename.split(" - ")
    songname.gsub!(".mp3","")
    song = self.new_by_name(songname)
    song.artist_name = artistname
    song
    #self.new_by_name(songname).tap{|song| song.artist_name = artist_name} 
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file).tap{|song| song.save}
  end
  
  def self.destroy_all
    @@all = []
  end
  
end
