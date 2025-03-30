class Board
    def initialize
      @grid = Array.new(9, " ") #crea 9 espacios vacios de " "
    end

    def display
      puts " #{@grid[0]} | #{@grid[1]} | #{@grid[2]} " # con todo esto dibujamos el michi
      puts "---+---+---"
      puts " #{@grid[3]} | #{@grid[4]} | #{@grid[5]} "
      puts "---+---+---"
      puts " #{@grid[6]} | #{@grid[7]} | #{@grid[8]} "
    end

    def update(position, symbol)
      @grid[position - 1] = symbol # position - 1 es que si se manda 9 seria, 9 - 1 = 8, posicion 8 del array, esto se manda desde game.rb
    end

    def valid_move?(position) #valid_move?, ese signo de interrogación, significa que debe devolver un booleano,
      #lo unico que hace esta función es verificar si un campo esta vacio o no
      position.between?(1, 9) && @grid[position - 1] == " " #si position esta entre (1,9) y si la posicion esta vacia
    end

    def winning_combination?(symbol)
      winning_patterns = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8], # Filas
        [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columnas
        [0, 4, 8], [2, 4, 6]             # Diagonales
      ]
      winning_patterns.any? { |pattern| pattern.all? { |index| @grid[index] == symbol } }
      #any verifica que un bloque este completo de 3 valores, y all verifica si ese bloque tiene los 3 valores con "x" u "o" para ver si hubo un ganador o no
      # |pattern| es cada bloque de arrays [0, 1, 2], [3, 4, 5], [6, 7, 8], etc, |index| recorre cada valor dentro de cada bloque de arrays
    end

    def full?
      @grid.none? { |cell| cell == " " } #abreviando, si cell esta vacio devuelve true, por lo cual .none? da false, ya que esta preguntando si el tablero esta lleno
    end
# @grid.none?: El método none? es un iterador que recorre todos los elementos de un arreglo (en este caso, el arreglo @grid).
#La lógica dentro del bloque determina si ningún elemento cumple una condición específica.

# { |cell| cell == " " }:

# Este bloque verifica cada celda en el arreglo.

# Pregunta: “¿El contenido de esta celda es igual a un espacio vacío (" ")?”.

# Si alguna celda está vacía (es " "), el bloque devuelve true, indicando que aún hay celdas vacías.

# El resultado de none?:

# Si ninguna celda está vacía (es decir, todas están llenas), none? devuelve true, lo que significa que el tablero está lleno.

# Si hay al menos una celda vacía, none? devuelve false, indicando que el tablero no está lleno.

    def reset
      @grid = Array.new(9, " ")
    end
  end
