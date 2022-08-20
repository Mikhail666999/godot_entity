extends Area

onready var my_pos = $"../point_stels/1".translation
onready var anim = $"../AnimationPlayer"


func _on_view_body_entered(body):
	g.player_in_view = true
	print("player_witch")


func _on_view_body_exited(body):
	g.player_in_view = false
	g.score_suspicion = 0
	print("player_dont_witch")
	
