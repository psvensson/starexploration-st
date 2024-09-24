Class {
	#name : #CelestialBody,
	#superclass : #Object,
	#instVars : [
		'root',
		'tilt',
		'angle',
		'a',
		'b',
		'offsetX',
		'offsetY',
		'size',
		'builder'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
CelestialBody >> a [
 ^a
]

{ #category : #accessing }
CelestialBody >> angle [
"The angle is the position of this body around the body )if any) which it orbits"
	^ angle
]

{ #category : #accessing }
CelestialBody >> angle: anObject [
	angle := anObject
]

{ #category : #accessing }
CelestialBody >> b [
	^b
]

{ #category : #accessing }
CelestialBody >> getCenter [
    | centerX centerY |
    
    "Calculate the center coordinates"
    centerX := root width / 2.
    centerY := root height / 2.
    
    "Return the result as a Point"
    ^ Point x: centerX y: centerY.
]

{ #category : #accessing }
CelestialBody >> getProjectedCoords: center [
    | x y objX objY |
    
    "Calculate angle and tilt in radians"
    angle := self angle * (Float pi / 180) .
    tilt := self tilt * (Float pi / 180) .
    
    x := center x.
    y := center y.
    
    "Calculate the projected coordinates"
    objX := x + (self a * (angle cos * tilt cos)) - (self b * (angle sin * tilt sin)) + self offsetX.
    objY := y + (self a * (angle cos * tilt sin)) + (self b * (angle sin * tilt cos)) + self offsetY.
    
    "Return the result as a Point"
    ^ Point x: objX y: objY.
]

{ #category : #accessing }
CelestialBody >> initialize [
	builder := BlTransformationBuilder new.    
	size := 10.
	a := 100.
	b := 60.	
	tilt := 10.
	offsetX := 0.
	offsetX := 0.
]

{ #category : #accessing }
CelestialBody >> offsetX [
	^offsetX
]

{ #category : #accessing }
CelestialBody >> offsetX: anX [
	offsetX := anX
]

{ #category : #accessing }
CelestialBody >> offsetY [
	^offsetY
]

{ #category : #accessing }
CelestialBody >> offsetY: anY [
	offsetY := anY
	
]

{ #category : #accessing }
CelestialBody >> size1 [
	^ size
]

{ #category : #accessing }
CelestialBody >> size: anObject [
	size := anObject
]

{ #category : #accessing }
CelestialBody >> tilt [
	^ tilt
]

{ #category : #accessing }
CelestialBody >> tilt: anObject [
	tilt := anObject
]
