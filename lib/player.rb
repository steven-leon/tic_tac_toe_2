class Player
  attr_reader :name, :symbol
#   El método attr_reader crea automáticamente métodos de lectura
#    (también conocidos como getters) para las variables de instancia @name y @symbol.

# Esto significa que puedes acceder a los valores de name y symbol desde fuera de la clase,
# pero no puedes modificarlos directamente (esto protege los datos contra cambios accidentales).

# Equivalente manual: Si no usaras attr_reader, tendrías que escribir métodos así:

# ruby
# def name
#   @name
# end

# def symbol
#   @symbol
# end
# Usar attr_reader es más corto y limpio.


  def initialize(name, symbol) #Poner initialize es obligatorio como constructor
    @name = name
    @symbol = symbol
  end
end

# initialize es el constructor en Ruby. Este método se ejecuta automáticamente cuando creas una instancia de la clase.

# Toma dos parámetros (name y symbol) que se pasan al momento de crear un objeto de la clase Player.

# Variables de instancia (@name y @symbol):

# Al usar el prefijo @, defines variables de instancia, que almacenan información específica de ese objeto.
