extends Button
@onready var plus: Button = $"../Plus"
@onready var minus: Button = $"../Minus"


func _on_pressed():
	disabled = true
	NormalModeGlobal.bonus += 0.50
	NormalModeGlobal.operations.append("*")
	print(NormalModeGlobal.bonus)
