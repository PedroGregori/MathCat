extends Button

func _on_pressed() -> void:
		disabled = true
		NormalModeGlobal.bonus += 0.50
		NormalModeGlobal.operations.append("+")
		print(NormalModeGlobal.bonus)
	
