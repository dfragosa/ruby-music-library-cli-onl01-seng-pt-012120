require 'pry'
class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :songs 
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
    artist = self.new(artist)
    artist.save
    artist
  end 
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
    songs.collect {|song| song.genre}.uniq
   #songs.collect(&:genre).uniq
   #genre.uniq
  end
  
end
