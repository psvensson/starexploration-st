Class {
	#name : #Planet,
	#superclass : #CelestialBody,
	#instVars : [
		'color'
	],
	#category : #'star-exploration'
}

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
	super initialize.
	
	color := Color orange
]
