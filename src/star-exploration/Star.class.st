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
		'test',
		'builder'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
Star >> getCenter [
	^ (root bounds extent x) @ (root bounds extent y)
]

{ #category : #accessing }
Star >> initialize [
	| radius  |
        
    builder := BlTransformationBuilder new.    
    
    "Define the radius of the star"
    radius := 30.
    
    "Create and configure the circle (star) shape"
    starElement := (BlEllipseGeometry new extent: 30@30 ) asElement 
    	border: (BlBorder paint: Color orange width: 2);
    	background: Color transparent.

]

{ #category : #accessing }
Star >> move: pos [
	starElement relocate: pos
]

{ #category : #accessing }
Star >> root [
	^ root
]

{ #category : #accessing }
Star >> root: anObject [
	root := anObject.
	root addChild: starElement.
	starElement relocate: self getCenter / 2.
	
	"Everything below here is just goofing around and trying to rotate anything"
	
	"test := BlElement new
		  background: Color green;
		  geometry: BlSquare new;
		  margin: (BlInsets all: 1);
		  size: 18 @ 18.	
	
	
	builder target: test; rotateBy: 23; scaleBy: 5@5; apply.
	root addChild: test."

]

{ #category : #accessing }
Star >> test [
	^ test
]

{ #category : #accessing }
Star >> test: anObject [
	test := anObject
]
