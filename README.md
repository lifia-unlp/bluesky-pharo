# bluesky-pharo
Bluesky API for Pharo Smalltalk

```Smalltalk
Metacello new
	baseline: 'BlueskyPharo';
	repository: 'github://lifia-unlp/bluesky-pharo:main';
	onConflictUseLoaded;
	onWarningLog;
	load.
```

# Basic examples

Inspirado en https://gist.github.com/pojntfx/72403066a96593c1ba8fd5df2b531f2d

```Smalltalk
"Obtener el did handle"
did := BlueskyApi new didForHandle: 'el.casco.com.ar'.

"Get an app password from here: https://staging.bsky.app/settings/app-passwords"
appPassword := 'your-app-pass-here'.

"Get API key with the app password"
apikey := BlueskyApi new apikeyForDid: did withPassword: appPassword.

"Get a user's feed"
posts := BlueskyApi new feedForHandle: 'el.casco.com.ar' withApikey: apikey andLimit: 10.

"Post on a user's feed"
response := BlueskyApi new postText: 'Hello from Pharo!' onDid: did withApikey: apikey.
```
