Class {
	#name : #Planet,
	#superclass : #CelestialBody,
	#instVars : [
		'a',
		'b',
		'size',
		'angle',
		'tilt',
		'color',
		'offsetX'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
Planet >> angle [
	^ angle
]

{ #category : #accessing }
Planet >> angle: anObject [
	angle := anObject
]

{ #category : #accessing }
Planet >> color [
	^ color
]

{ #category : #accessing }
Planet >> color: anObject [
	color := anObject
]

{ #category : #accessing }
Planet >> initialize [
	a := 100.
	b := 60.
	size := 10.
	tilt := 10.
	offsetX := 0.
	offsetX := 0.
	color := Color orange
]

{ #category : #accessing }
Planet >> size [
	^ size
]

{ #category : #accessing }
Planet >> size1 [
	^ size
]

{ #category : #accessing }
Planet >> size: anObject [
	size := anObject
]

{ #category : #accessing }
Planet >> tilt [
	^ tilt
]

{ #category : #accessing }
Planet >> tilt: anObject [
	tilt := anObject
]
