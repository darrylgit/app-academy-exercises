require_relative "list"

class TodoBoard

  def initialize(label = "no label")
    @board = Hash.new
  end

  def get_command
    print "\nEnter a command: "
    cmd, list, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      @board[list] = List.new(list)
    when 'ls'
      @board.each_key { |label| puts label }
    when 'showall'
      @board.each_value { |list| list.print }
    when 'mktodo'
      label, deadline, *description = args
      @board[list].add_item(label, deadline, description.join(" "))
    when 'up'
      args.map! { |arg| arg.to_i }
      @board[list].up(*args)
    when 'down'
      args.map! { |arg| arg.to_i }
      @board[list].down(*args)
    when 'swap'
      args.map! { |arg| arg.to_i }
      @board[list].swap(*args)
    when 'sort'
      @board[list].sort_by_date!
    when 'priority'
      @board[list].print_priority
    when 'print'
      args.length > 0 ? @board[list].print_full_item(args[0].to_i) : @board[list].print
    when 'toggle'
      @board[list].toggle_item(args[0].to_i)
    when 'rm'
      @board[list].remove_item(args[0].to_i)
    when 'purge'
      @board[list].purge
    when "quit"
      return false
    else 
      puts "Sorry, that command is not recognized."
    end

    true
  end

  def run
    until !self.get_command
    end

    "Program exited"
  end
end

new_board = TodoBoard.new

new_board.run