extends Label

@onready var plus: Button = $"../Plus"
@onready var minus: Button = $"../Minus"
@onready var mult: Button = $"../Mult"

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	if Input.is_action_pressed("resetbonus"):
		print("Segurando a tecla de resetar")
		plus.disabled = false
		minus.disabled = false
		mult.disabled = false
		NormalModeGlobal.bonus = 0
		var remove_operations = ["+", "-", "*"]
		for operation in remove_operations:
			NormalModeGlobal.operations.erase(operation)
	text = str("Bonus: ", NormalModeGlobal.bonus)
