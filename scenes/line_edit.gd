extends LineEdit

var old_text := ""
var perfect = false
var good = false
var bad = false
signal number_submitted(number)
@onready var line_edit: LineEdit = $"."
@onready var label: Label = $"../Label"
@onready var score_label: Label = $"../ScoreLabel"
@onready var feedback: Label = $"../feedback"
@onready var fade_in: AnimationPlayer = $"../feedback/Fade_in"
@onready var path_follow_2d: PathFollow2D = $"../Precision Bar/Path2D/PathFollow2D"


func _ready() -> void:
	line_edit.text_changed.connect(_something)
	# Conecta os sinais de texto alterado e texto submetido
	connect("text_submitted", Callable(self, "_on_text_submitted"))
	grab_focus()

func _something(text: String) -> void:
	if text.is_empty() or text.is_valid_int() or (text == "-" and old_text.is_empty()): 
		old_text = text
	else:
		line_edit.text = old_text

func _on_text_submitted(submitted_text):
	emit_signal("number_submitted", submitted_text)
	check_answer(submitted_text)
	clear()
	print(submitted_text)

func check_answer(submitted_text: String) -> void:
	var converted = label.get("converted")
	if submitted_text == converted:
		path_follow_2d.progress_ratio = 0
		print("Correct! Generating new calculation...")
		if path_follow_2d.progress_ratio >= 0 and path_follow_2d.progress_ratio <= 0.3932:
			perfect = true
			good = false
			bad = false
			if perfect == true:
				Game.score += 15
				feedback.visible = true
				Game.perfect += 1
				fade_in.play("fade_in")
				change_text("PERFEITO!")
				hide_feedback_after_delay(1)
		elif path_follow_2d.progress_ratio >= 0.4103 and path_follow_2d.progress_ratio <= 0.7659:
			good = true
			perfect = false
			bad = false
			if good == true:
				Game.score += 10
				Game.good += 1
				feedback.visible = true
				fade_in.play("fade_in")
				change_text("BOM!")
				hide_feedback_after_delay(1)
		elif path_follow_2d.progress_ratio >= 0.7686 and path_follow_2d.progress_ratio <= 1:
			Game.score += 5
			Game.bad += 1
			bad = true
			perfect = false
			good = false
			if bad == true:
				feedback.visible = true
				fade_in.play("fade_in")
				change_text("RUIM!")
				hide_feedback_after_delay(1)
			
		label.call("_generate_calculation")
	elif submitted_text == "":
		pass
	else:
		path_follow_2d.progress_ratio = 0
		if Game.score >= 10:
			Game.score -= 10
		bad = true
		perfect = false
		good = false
		if bad == true:
			Game.bad += 1
			feedback.visible = true
			fade_in.play("fade_in")
			change_text("ERROU!")
			hide_feedback_after_delay(1)
		label.call("_generate_calculation")
		print("Wrong, try again.")

# Função para esconder o feedback após um atraso
func hide_feedback_after_delay(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
	feedback.visible = false

func change_text(texto: String):
	feedback.text = texto
