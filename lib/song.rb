require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def artist=(artist)
    @artist = artist
    if @artist != nil
      @artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if @genre != nil
      if !@genre.songs.include?(self)
        @genre.songs << self
      end
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    Song.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      new_song = self.create(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)

    parsedFileName = filename.split("-")
    binding.pry
    #new_song = Song.new()

  end

end
