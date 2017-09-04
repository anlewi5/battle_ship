class Board

  def empty_board
    a = [["A1", " "], ["A2", " "], ["A3", " "], ["A4", " "]]
    b = [["B1", " "], ["B2", " "], ["B3", " "], ["B4", " "]]
    c = [["C1", " "], ["C2", " "], ["C3", " "], ["C4", " "]]
    d = [["D1", " "], ["D2", " "], ["D3", " "], ["D4", " "]]
    render_board(a, b, c, d)
  end

  def render_board(a, b, c, d)
    puts ". 1 2 3 4"
    puts "A #{print_row(a)}"
    puts "B #{print_row(b)}"
    puts "C #{print_row(c)}"
    puts "D #{print_row(d)}"
  end

  def print_row(row)
    spot = ""
    row.each {|space| spot = spot + space[1]}
    spot
  end

end
