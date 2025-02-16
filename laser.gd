extends Area2D

const speed = 750
var explosion_template = preload("res://explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position.y -= delta * speed
	print(position)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	var explosion = explosion_template.instantiate()
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	area.queue_free()
	queue_free()
