extends Node2D

@onready var weight = $VBoxContainer/weight
@onready var reps = $VBoxContainer/reps
@onready var sets = $VBoxContainer/sets
@onready var log_it = $"log it"
@onready var back = $back
@onready var squatbar = $ProgressBar3

var squatXP = 0

func _ready():
	weight = 135
	reps = 5
	sets = 3
	

func _process(_delta):
	squatbar.value = Global.squatbarvalue
	squatbar.max_value = Global.squatbarmaxvalue

func _on_log_it_pressed():
	squatXP += Global.xpmultiplier(weight, reps, sets)
	
	Global.squatbarxp += squatXP
	squatbar.value += squatXP
	Global.squatbarxphold += squatXP
	squatXP = 0
	#Global.benchbarxp = benchbar.value
	Global.squatbarmaxvalue = squatbar.max_value
	Global.squatbarvalue = squatbar.value


func _on_weight_value_changed(value):
	weight = value



func _on_reps_value_changed(value):
	reps = value




func _on_sets_value_changed(value):
	sets = value


func _on_progress_bar_3_value_changed(value):
	if squatbar.value == Global.squatbarmaxvalue:
		squatbar.value = 0 + (Global.squatbarmaxvalue - Global.squatbarvalue)
		Global.squatbarvalue - squatbar.value
		squatbar.max_value = squatbar.max_value * 1.25
		Global.squatlevel += 1

	elif squatbar.value != squatbar.max_value:
		pass


func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_seen.tscn")
