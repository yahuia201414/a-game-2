extends StaticBody2D
@onready var animation_player = $AnimationPlayer


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		animation_player.play("2") # Replace with function body.
