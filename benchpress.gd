extends Node2D

@onready var weight = $VBoxContainer/weight
@onready var reps = $VBoxContainer/reps
@onready var sets = $VBoxContainer/sets
@onready var log_it = $log_it
@onready var benchbar = $ProgressBar3

var benchXP = 0
var benchXPhold = 0

func _ready():
	weight = 135
	reps = 5
	sets = 3
	

func _process(_delta):
	benchbar.value = Global.benchbarvalue
	benchbar.max_value = Global.benchbarmaxvalue

func _on_log_it_pressed():
	benchXP += Global.xpmultiplier(weight, reps, sets)
	benchXPhold = benchXP
	print(benchXP)
	Global.benchbarxp += benchXP
	benchbar.value += benchXP
	benchXP = 0
	#Global.benchbarxp = benchbar.value
	Global.benchbarmaxvalue = benchbar.max_value
	Global.benchbarvalue = benchbar.value


func _on_weight_value_changed(value):
	weight = value



func _on_reps_value_changed(value):
	reps = value




func _on_sets_value_changed(value):
	sets = value


func _on_progress_bar_3_value_changed(value):
	if benchbar.value == Global.benchbarmaxvalue:
		benchbar.value = 0 + (Global.benchbarmaxvalue - Global.benchbarvalue)
		Global.benchbarvalue - benchbar.value
		benchbar.max_value = benchbar.max_value * 1.25
		Global.benchlevel += 1
		print(benchbar.value)

	elif benchbar.value != benchbar.max_value:
		pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_seen.tscn")
