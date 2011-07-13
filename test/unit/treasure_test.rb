require 'test_helper'

class TreasureTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "that each treasure item is created with a name" do
    t = Treasure.new
    t.name = nil
    t.valid?
    refute_empty t.errors['name']
  end
  
  test "that each treasure item is created with a value" do
    t = Treasure.new
    t.value = nil
    t.valid?
    refute_empty t.errors['value']
  end

  test "that each treasure name is at least 5 characters" do
    t = Treasure.new
    t.name = 'a' * 4
    t.valid?
    refute_empty t.errors['name']
  end
  
  test "that each treasure name is no more than 200 characters" do
    t = Treasure.new
    t.name = 'a' * 301
    t.valid?
    refute_empty t.errors['name']
  end
  
  test "that the value of the treasure is more than 100 times the number of levels in the dungeon" do
    d = Dungeon.create(:name => 'Samis Dungeon', :levels => 4)
    t = Treasure.new
    t.dungeon = d
    t.value = d.levels * 100
    t.valid?
    refute_empty t.errors['value']
  end
  
end