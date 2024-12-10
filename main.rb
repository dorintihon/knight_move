def knight_moves(start, finish)
  queue = [[start, [start]]]
  visited = []

  knight_moves = [
    [2, 1], [2, -1], [-2, 1], [-2, -1],
    [1, 2], [1, -2], [-1, 2], [-1, -2]
  ]

  while !queue.empty?
    current, path = queue.shift
    x, y = current

    if current == finish
      return "You made it in #{path.length - 1} moves! Here's your path: #{path}"
    end

    visited << current

    knight_moves.each do |dx, dy|
      next_pos = [x + dx, y + dy]
      if valid_move?(next_pos) && !visited.include?(next_pos)
        queue << [next_pos, path + [next_pos]]
      end
    end
  end

  return []
end

def valid_move?(pos)
  x, y = pos
  x.between?(0, 7) && y.between?(0, 7)
end

print knight_moves([3,3],[4,3])
