extends Node


func xpmultiplier(a: float, b: float, c: float):
	return a * b * c / 10

func _ready():
	var result = xpmultiplier(100,8,3)
	print("the result is: ", result)
