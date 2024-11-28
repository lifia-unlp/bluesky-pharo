Class {
	#name : 'BaselineOfBlueskyAPI',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBlueskyPharo',
	#package : 'BaselineOfBlueskyPharo'
}

{ #category : 'baselines' }
BaselineOfBlueskyAPI >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec package: 'Bluesky-API' with: [ spec requires: #( 'NeoJSON' ) ].
		self neoJson: spec ]
]

{ #category : 'baselines' }
BaselineOfBlueskyAPI >> neoJson: spec [ 
	spec baseline: 'NeoJSON' with: [ 
		spec repository: 'github://svenvc/NeoJSON:master/repository' ]
]
