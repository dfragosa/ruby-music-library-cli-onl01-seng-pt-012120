require 'pry'
class Artist
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  
  def self.all
    @@all
  end
  
  def save
    self.class.all << self 
  end 
  
  def songs
    @songs
  end
  
  def self.destroy_all
    @@all.clear 
  end 
  
  def self.create(artist)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genre=(genre)
    @genre= genre
    genre.artist << self unless genre.artist.include? self
  end
end
