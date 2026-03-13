extends Area2D

signal boss_died

@onready var top_detector: Area2D = $TopDetector
var is_dead = false
var max_health = 11

func _ready():
	body_entered.connect(_on_body_entered)
	top_detector.body_entered.connect(_on_top_detector_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if is_dead:
		return
		
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()


func _on_top_detector_body_entered(body: Node2D) -> void:
	if is_dead:
		return
		
	if body.is_in_group("Player"):
		if max_health > 0:
			max_health -= 1
			
			if body.has_method("bounce"):
				body.bounce()

		if max_health <= 0:
			die()


func die():
	is_dead = true
	emit_signal("boss_died")   # 👈 يبعت إشارة
	queue_free()
