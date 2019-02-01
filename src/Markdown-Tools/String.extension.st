Extension { #name : #String }

{ #category : #'*Markdown-Tools' }
String >> asReferenceToHeading [
	"Follow the instructions described there: https://gist.github.com/asabaylus/3071099#gistcomment-1593627"
	^ ((self asLowercase select: [ :c | c isAlphaNumeric or: [ c = $- or: [ c = Character space ] ] ])
		splitOn: Character space) joinUsing: $-
]
