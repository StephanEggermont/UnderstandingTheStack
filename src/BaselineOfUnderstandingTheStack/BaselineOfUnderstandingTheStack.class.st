Class {
	#name : #BaselineOfUnderstandingTheStack,
	#superclass : #BaselineOf,
	#category : #BaselineOfUnderstandingTheStack
}

{ #category : #loading }
BaselineOfUnderstandingTheStack class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'UnderstandingTheStack' ]
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
BaselineOfUnderstandingTheStack >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'UnderstandingTheStack'
		]
]
