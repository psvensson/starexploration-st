Class {
	#name : #StarSystem,
	#superclass : #Object,
	#instVars : [
		'stars',
		'planets',
		'root',
		'builder'
	],
	#category : #'star-exploration'
}

{ #category : #accessing }
StarSystem >> addPlanet: aPlanet named: aName [
	planets at: aName put: aPlanet
]

{ #category : #accessing }
StarSystem >> addStar: aStar named: aName [
	stars at: aName put: aStar.
	aStar root: root
]

{ #category : #accessing }
StarSystem >> drawOrbitsOn: aCanvas using: bodyData [
    | tilt ellipse |
    
    bodyData do: [:body |
        tilt := body tilt * (Float pi / 180).
        
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
StarSystem >> getCenter [
    | centerX centerY |
    
    "Calculate the center coordinates"
    centerX := root width / 2.
    centerY := root height / 2.
    
    "Return the result as a Point"
    ^ Point x: centerX y: centerY.

]

{ #category : #accessing }
StarSystem >> getCenter: obj [
    | centerX centerY |
    
    "Calculate the center coordinates"
    centerX := obj width / 2.
    centerY := obj height / 2.
    
    "Return the result as a Point"
    ^ Point x: centerX y: centerY.

]

{ #category : #accessing }
StarSystem >> getProjectedCoords: obj angle: anAngle tilt: aTilt [
    | angle tilt center x y objX objY |
    
    "Calculate angle and tilt in radians"
    angle := (anAngle ifNil: [ obj angle * (Float pi / 180) ]).
    tilt := (aTilt ifNil: [ obj tilt * (Float pi / 180) ]).
    
    "Get the center coordinates"
    center := self getCenter.
    x := center x.
    y := center y.
    
    "Calculate the projected coordinates"
    objX := x + (obj a * (angle cos * tilt cos)) - (obj b * (angle sin * tilt sin)) + obj offsetX.
    objY := y + (obj a * (angle cos * tilt sin)) + (obj b * (angle sin * tilt cos)) + obj offsetY.
    
    "Return the result as a Point"
    ^ Point x: objX y: objY.

]

{ #category : #accessing }
StarSystem >> initialize [
	|blSpace|
	stars := Dictionary new.
	planets := Dictionary new.
	blSpace := BlSpace new.
	blSpace extent: 800@800; title: 'Star Exploration Game'.
	root := blSpace root.
	blSpace show.
]

{ #category : #accessing }
StarSystem >> sampleStarSystem [
	<gtExample>
	<description: 'Creating a small StarSystem from scratch to display in its own window '>
	| system star |
	system := StarSystem new.
	star := Star new.
	system addStar: star named: 'foostar'.
	^ system
]
