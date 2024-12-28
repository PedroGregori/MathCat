extends Label
@onready var line_edit: LineEdit = $"../LineEdit"

func _ready() -> void:
	visible = false
	if Game.perfect == true:
		print(Game.perfect)
		await_to_toggle_visibility(0.5)
	elif Game.bad == true:
		text = "BAD!"
		await_to_toggle_visibility(0.5)
func await_to_toggle_visibility(delay):
	visible = true
	await get_tree().create_timer(delay).timeout
	visible = false
