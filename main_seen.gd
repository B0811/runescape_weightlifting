extends Node2D


@onready var overhead = $overhead
@onready var squat = $squat
@onready var bench = $bench

@onready var squatbar = $squatbar
@onready var benchbar = $benchbar
@onready var overheadbar = $overheadbar



func _ready():
	benchbar.max_value = Global.benchbarmaxvalue
	benchbar.value = Global.benchbarvalue


func _on_overhead_pressed():
	print("no pain")


func _on_bench_pressed():
	get_tree().change_scene_to_file("res://benchpress.tscn")


func _on_squat_pressed():
	pass # Replace with function body.
