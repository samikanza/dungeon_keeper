class Treasure < ActiveRecord::Base
  belongs_to :dungeon
  validates :name,  :presence => true, 
                    :length => { :in => 5..300 }
                   
  validates :value, :presence => true,
                    :numericality => {:greater_than_or_equal_to => 101, :only_integer => true}
                   
  validates :dungeon, :presence => true
  
  validate :must_have_more_than_100_times_dungeon_level
  def must_have_more_than_100_times_dungeon_level 
    if dungeon.present?
      if self.value <= (dungeon.levels*100)
        errors.add(:value, 'the value of the treasure is not more than a hundred times the number of dungeon levels')
      end
    end
  end
                   
end
