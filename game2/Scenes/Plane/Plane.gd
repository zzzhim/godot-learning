extends CharacterBody2D

class_name Tappy

const JUMP: int = -350
var _gravity: float = ProjectSettings.get("physics/2d/default_gravity")
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var engine_sound: AudioStreamPlayer = $EngineSound


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	fly(delta)
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()
		
# 飞行
func fly(delta: float) -> void:
	velocity.y = velocity.y + _gravity * delta
	
	if Input.is_action_just_pressed("jump") == true:
		velocity.y = JUMP
		animation_player.play("jump")
	
# 死亡
func die() -> void:
	animated_sprite_2d.stop()
	engine_sound.stop()
	set_physics_process(false)
	SignalHub.emit_on_plane_died()
