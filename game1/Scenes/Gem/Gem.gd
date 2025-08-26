extends Area2D

class_name OurGem

signal gem_off_screen

const SPEED: float = 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = position.y + SPEED * delta
	
	if position.y > get_viewport_rect().end.y:
		print('end')
		gem_off_screen.emit()
		set_process(false)
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	#pass # Replace with function body.
	print("Gem hits paddle")
	set_process(false)
	queue_free()


func _on_gem_off_screen() -> void:
	pass # Replace with function body.
