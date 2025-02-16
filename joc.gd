extends Node2D

var enemic_template = preload("res://enemigo.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$text_game_over.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var enemigo = enemic_template.instantiate()
	enemigo.position.x = randi_range(1, 8) * 60
	enemigo.connect("game_over", _on_game_over)
	add_child(enemigo)

func _on_game_over():
	print("Game Over")
	$text_game_over.visible = true
