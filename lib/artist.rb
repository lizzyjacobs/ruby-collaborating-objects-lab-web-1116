require "pry"

class Artist
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.all
    @@all.uniq
  end

  def save
    self.class.all << self
  end


  def add_song(song)
    songs << song
    song.artist  = self
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.find_by_name(name)
    self.all.detect do |artist|
      artist.name == name
    end
  end

  def self.create_by_name(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end

end
