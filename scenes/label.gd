extends Label

var rng = RandomNumberGenerator.new()
var num1 = 0
var num2 = 0
var cal = 0
var converted = ""

func _ready() -> void:
	_generate_calculation()

func _generate_calculation() -> void:
	num1 = rng.randi_range(1, 10)
	num2 = rng.randi_range(1, 10)
	cal = num1 + num2
	text = str(num1) + " + " + str(num2)
	converted = str(cal)
	print(num1, "+", num2)
