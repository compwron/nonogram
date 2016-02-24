file = ARGV[0] || "input.txt"

lines = File.readlines(file)

def sequences(colrow)
  colrow.split(" ").map(&:size).join(" ")
end

line_length = lines.map {|l| l.size }.max - 1 # remove trailing linebreaks
columns = 0.upto(line_length - 1).to_a.map {|i| {i => []}}.inject(:merge)

columns.each {|k, v|
  lines.each {|l|
    v << l[k]
  }
}

puts "columns"
p columns.map {|k, v|
  v.join("")
}.map {|col|
  sequences(col)
}

puts "rows"
p lines.map { |row|
  sequences(row)
}
