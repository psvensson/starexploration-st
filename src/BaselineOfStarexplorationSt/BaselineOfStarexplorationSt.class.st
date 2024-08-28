Class {
	#name : #BaselineOfStarexplorationSt,
	#superclass : #BaselineOf,
	#category : #BaselineOfStarexplorationSt
}

{ #category : #loading }
BaselineOfStarexplorationSt class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'starexploration-st' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfStarexplorationSt >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'StarSystem'
		]
]
