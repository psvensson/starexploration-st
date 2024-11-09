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
     size := 5.  
    "Create and configure the circle (star) shape"
    bodyElement := (BlEllipseGeometry new extent: self size@ self size ) asElement 
    	border: (BlBorder paint: Color black width: 2);
    	background: Color transparent.
]
