class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(filename)
    # filename.slice! "mp3"
    new_file = filename.split(" - ")
    new_song = self.new(new_file[1])
    new_song.artist_name = new_file[0]
    new_song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end




end
