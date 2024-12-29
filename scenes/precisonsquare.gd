extends Path2D


@onready var path_follow_2d: PathFollow2D = $PathFollow2D

func _process(delta):
	if not Game.freeze_game:
		# Move ao longo do caminho ajustando o progresso
		path_follow_2d.progress_ratio += delta * 0.2  # Velocidade do movimento (ajuste 0.5 conforme necessário)
		# Opcional: Reinicia o progresso ao final
		if path_follow_2d.progress_ratio > 1:
			path_follow_2d.progress_ratio = 1.0
	if Game.freeze_game:
		path_follow_2d.progress = 0
