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
		print("Correct! Generating new calculation...")
		if path_follow_2d.progress_ratio >= 0 and path_follow_2d.progress_ratio <= 0.3932:
			perfect = true
			good = false
			bad = false
			Game.score += 15 * NormalModeGlobal.bonus
			Game.perfect += 1
			change_text("PERFEITO!")
			show_feedback()
		elif path_follow_2d.progress_ratio >= 0.4103 and path_follow_2d.progress_ratio <= 0.7659:
			good = true
			perfect = false
			bad = false
			Game.score += 10 * NormalModeGlobal.bonus
			Game.good += 1
			change_text("BOM!")
			show_feedback()
		elif path_follow_2d.progress_ratio >= 0.7686 and path_follow_2d.progress_ratio <= 1:
			bad = true
			perfect = false
			good = false
			Game.score += 5 * NormalModeGlobal.bonus
			Game.bad += 1
			change_text("RUIM!")
			show_feedback()
		path_follow_2d.progress_ratio = 0
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
		if bad:
			Game.bad += 1
			change_text("ERROU!")
			show_feedback()
		label.call("_generate_calculation")
		print("Wrong, try again.")

# Função para esconder o feedback após um atraso
func hide_feedback_after_delay(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
	feedback.visible = false

func show_feedback():
	feedback.visible = true
	fade_in.play("fade_in")

func change_text(texto: String):
	feedback.text = texto

func _process(delta: float) -> void:
	if Game.freeze_game:
		line_edit.editable = false
