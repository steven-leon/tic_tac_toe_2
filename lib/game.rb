require_relative 'board'
require_relative 'player'

class Game
  def initialize #esto es constructor
    @board = Board.new
    @player1 = Player.new("Jugador 1", "X")
    @player2 = Player.new("Jugador 2", "O")
    @current_player = @player1 #esto se esta creando aqui, no como los otros que se estan instanciando
  end

  def play
    loop do
      @board.display
      player_move
      if game_over?
        @board.display
        announce_winner
        reset_game
      else
        switch_player
      end
    end
  end

  private

  def player_move
    move = nil
    loop do
      print "#{@current_player.name} (#{@current_player.symbol}), elige una casilla (1-9): "
      move = gets.chomp.to_i
      break if (1..9).include?(move) && @board.valid_move?(move) #se rompe el bucle si se cumplen estas condiciones
      #en ruby se puede usar break if, en lugar de escribir if condicional break end, nos ahorramos codigo

      puts "Movimiento inválido. Inténtalo de nuevo."
    end
    @board.update(move, @current_player.symbol)
  end

  def game_over?
    @board.winning_combination?(@current_player.symbol) || @board.full?
  end

  def announce_winner
    if @board.winning_combination?(@current_player.symbol) #esto busca el ganador mediante el simbolo "X" o "O"
      puts "#{@current_player.name} ha ganado 🎉"
    else
      puts "¡Es un empate! 🤝"
    end
  end

  def reset_game
    puts "¿Jugar de nuevo? (s/n)"
    answer = gets.chomp.downcase
    if answer == "s"
      @board.reset
      @current_player = @player1
    else
      puts "¡Gracias por jugar!"
      exit
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1 # si @current_player es @player1, cambia a @player2, sino a @player1
  end
end
