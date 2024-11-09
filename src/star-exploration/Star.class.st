Class {
	#name : #Star,
	#superclass : #CelestialBody,
	#instVars : [
		'spectralClass',
		'luminosityClass',
		'CEStar',
		'mass',
		'temperature',
		'spectralType',
		'age',
		'starElement',
		'test'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
Star >> initialize [       
    super initialize.
     size := 30.  
    "Create and configure the circle (star) shape"
    bodyElement := (BlEllipseGeometry new extent: self size@ self size ) asElement 
    	border: (BlBorder paint: Color orange width: 2);
    	background: Color transparent.

]

{ #category : #accessing }
Star >> test [
	^ test
]

{ #category : #accessing }
Star >> test: anObject [
	test := anObject
]
