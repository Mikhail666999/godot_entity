extends KinematicBody


onready var player = $"../../../player"

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3() 

export var speed = 2


func _physics_process(delta):
	direction = Vector3()
	move_and_slide(fall, Vector3.UP)
	if not is_on_floor():
		fall.y -= g.gravity
	
#	direction += transform.basis.x * speed
	if g.player_in_view:
		search_player()
		
#	g.text_chat = g.score_suspicion
	
	velocity = velocity.linear_interpolate(direction * speed, 10 * delta) 
	velocity = move_and_slide(velocity, Vector3.UP) 

func search_player():
	var server = get_viewport().world.direct_space_state
	var result_1 = server.intersect_ray(global_transform.origin,
													g.player_point_1,
													[self])
	var result_2 = server.intersect_ray(global_transform.origin,
													g.player_point_2,
													[self])
	var result_3 = server.intersect_ray(global_transform.origin,
													g.player_point_3,
													[self])
	var result_4 = server.intersect_ray(global_transform.origin,
													g.player_point_4,
													[self])
	var result_5 = server.intersect_ray(global_transform.origin,
													g.player_point_5,
													[self])
	var result_6 = server.intersect_ray(global_transform.origin,
													g.player_point_6,
													[self])
	var result_7 = server.intersect_ray(global_transform.origin,
													g.player_point_7,
													[self])
#	var result_8 = server.intersect_ray(global_transform.origin,
#													g.player_point_8,
#													[self])
	var result_9 = server.intersect_ray(global_transform.origin,
													g.player_point_9,
													[self])
	
	if result_1:
		if result_2:
			if result_3:
				if result_4:
					if result_5:
						if result_6:
							if result_7:
#								if result_8:
									if result_9:
										if result_9.collider == player: # 3
											g.score_suspicion = 3
										elif result_1.collider == player: # 1
											g.score_suspicion = 2
										elif result_2.collider == player: # 1
											g.score_suspicion = 2
										elif result_3.collider == player: # 1
											g.score_suspicion = 2
										elif result_4.collider == player: # 1
											g.score_suspicion = 2
										elif result_5.collider == player: # 2
											g.score_suspicion = 2
										elif result_6.collider == player: # 2
											g.score_suspicion = 2
										elif result_7.collider == player: # 2
											g.score_suspicion = 2
#										elif result_8.collider == player: # 2
#											g.score_suspicion = 2
										else:
											g.score_suspicion = 0
