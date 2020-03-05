require 'pry'
class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist
    self.genre= genre if genre
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(song)
    song = self.new(name)
    song.save
    song
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include? self
  end
  
  def self.find_by_name(name)
      all.each.find(&:name)
     # binding.pry
    
  end
  
end
