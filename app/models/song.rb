class Song < ActiveRecord::Base
  belongs_to :artist

  def artist_name
    self.try(:artist).try(:name)
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def self.sorted_songs_if_defined
    if preference = Preference.first && order = preference.artist_sort_order
      all.order(name: order)
    else
      all
    end
  end
end
