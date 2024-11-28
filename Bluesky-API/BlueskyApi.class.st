Class {
	#name : 'BlueskyApi',
	#superclass : 'Object',
	#category : 'Bluesky-API',
	#package : 'Bluesky-API'
}

{ #category : 'session-handling' }
BlueskyApi >> apikeyForDid: did withPassword: password [ 

	| client |
	client := ZnClient new forJsonREST.
	client url: 'https://bsky.social/xrpc/com.atproto.server.createSession'.
	client contents: (Dictionary new 
							at: 'identifier' put: did; 
							at: 'password' put: password; 
							yourself). 
	client post.
	client isSuccess ifFalse: [ ^ nil ].
	^ client contents at: 'accessJwt'
]

{ #category : 'session-handling' }
BlueskyApi >> didForHandle: handle [

	| client |
	client := ZnClient new forJsonREST.
	client url: 'https://bsky.social/xrpc/com.atproto.identity.resolveHandle'.
	client queryAt: 'handle' put: handle.
	client get.
	client isSuccess ifFalse: [ ^ nil ].
	^ client contents at: 'did'
]

{ #category : 'feed' }
BlueskyApi >> feedForHandle: handle withApikey: apikey andLimit: maxPosts [

	| client |
	client := ZnClient new forJsonREST.
	client url: 'https://bsky.social/xrpc/app.bsky.feed.getAuthorFeed'.
	client queryAt: 'actor' put: handle.
	client queryAt: 'limit' put: maxPosts.
	client headerAt: 'Authorization' put: 'Bearer ' , apikey.
	client get.
	client isSuccess ifFalse: [ ^ nil ].
	^ client contents at: 'feed'
]

{ #category : 'feed' }
BlueskyApi >> textSummaryFeedForHandle: handle withApikey: apikey andLimit: maxPosts [

	^(self feedForHandle: handle withApikey: apikey andLimit: maxPosts) collect: [ :each |
		  each atPath: #( post record text ) ]
]
