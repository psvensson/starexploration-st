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
		'builder',
		'bodyElement',
		'bodies'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
CelestialBody >> a [
 ^a
]

{ #category : #accessing }
CelestialBody >> addBody: body named: bodyName [
	bodies at: bodyName put: body
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
CelestialBody >> drawOrbitsOn: aCanvas [ 
    | orbitalTilt ellipse |
    
    bodies do: [:body |
        orbitalTilt := body tilt * (Float pi / 180).
        
        "Create the ellipse geometry with the extent and rotation"
        ellipse := BlEllipseGeometry new asElement
            relocate: (self getCenter + (body offsetX @  body offsetY));
            extent: (body a * 2) @ (body b * 2).
        builder target: ellipse; rotateBy: tilt; apply.    
        
        "Set the appearance and add the ellipse to the canvas"
        ellipse
            background: Color transparent;
            border: (BlBorder paint: Color orange width: 2).
        
        aCanvas addChild: ellipse.
    ].
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
    
    x := center x.
    y := center y.
    
    "Calculate the projected coordinates"
    objX := x + (self a * (angle cos * self tilt cos)) - (self b * (angle sin * self tilt sin)) + self offsetX.
    objY := y + (self a * (angle cos * self tilt sin)) + (self b * (angle sin * self tilt cos)) + self offsetY.
    
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
CelestialBody >> move: pos [
	bodyElement relocate: pos
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
CelestialBody >> root [
	^ root
]

{ #category : #accessing }
CelestialBody >> root: anObject [
	root := anObject.
	root addChild: bodyElement.
	bodyElement relocate: self getCenter / 2.
	
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
