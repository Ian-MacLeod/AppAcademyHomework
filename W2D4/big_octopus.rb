def sluggish_octopus(fishes)
  fishes.each do |fish|
    return fish if fish.length == fishes.max { |f| f.length }.length
  end
  nil
end

def dominant_octopus(fishes)
  fishes.sort_by(&:length).last
end

def clever_octopus(fishes)
  largest = fishes.first
  fishes.drop(1).each do |fish|
    largest = fish if fish.length > largest.length
  end
  largest
end

TILES_ARRAY = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
def slow_dance(dir)
  TILES_ARRAY.index(dir)
end

TILES_HASH = TILES_ARRAY.zip(0..TILES_ARRAY.length).to_h
def constant_dance(dir)
  TILES_HASH[dir]
end
