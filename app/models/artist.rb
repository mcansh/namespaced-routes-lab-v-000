class Artist < ActiveRecord::Base
  has_many :songs

  def self.sorted_artists_if_defined
    if preference = Preference.first && order = preference.artist_sort_order
      all.order(name: order)
    else
      all
    end
  end
end
