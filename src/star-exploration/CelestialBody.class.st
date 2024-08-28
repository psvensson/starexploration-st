Class {
	#name : #CelestialBody,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #'star-exploration'
}

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
CelestialBody >> getProjectedCoords: obj angle: anAngle tilt: aTilt [
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
