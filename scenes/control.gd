extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var background: AnimatedSprite2D = $"../background"

var max_value: float = 100.0  # Valor máximo da barra
var velocidade: float = 50.0  # Velocidade de incremento
var current_value: float = 0.0  # Valor atual da barra

func _ready():
	# Ajusta o tamanho inicial do preenchimento
	color_rect.size.x = 0

func _process(delta):
	# Incrementa o valor da barra
	current_value += velocidade * delta  # A barra vai aumentar com o tempo
	if current_value > max_value:
		current_value = 0  # Reinicia quando atinge o máximo

	# Atualiza a largura do preenchimento
	color_rect.size.x = (current_value / max_value) * 300
