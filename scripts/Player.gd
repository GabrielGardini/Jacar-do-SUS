extends KinematicBody2D

var motion = Vector2()
const speed = 100
var prevac = preload("res://level design/level 1/bullet.tscn")
#export (PackedScene) var vacina
#onready var vacina = preload("res://level design/level 1/bullet.tscn")
var vac_speed = 50
var timing = 0.4
var shot = 0
var delta = delta
onready var timer = $VacDelay
var vac_delay = 0.5


func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_left"):
		motion.x = -speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_up"):
		motion.y = -speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_down"):
		motion.y = speed
		move_and_slide(motion)
	if Input.is_action_pressed("ui_mouse_left_click") and timer.is_stopped():
		timer.start(vac_delay)
		shooting()
	else:
		motion.x = 0
		motion.y = 0

func shooting():
	var vac = prevac.instance()
	owner.add_child(vac)
	vac.set_global_position($Position2D.get_global_position())
	vac.set_rotation($".".get_rotation())
	pass