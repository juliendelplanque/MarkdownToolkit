Class {
	#name : #MHeadingIslandGrammar,
	#superclass : #MGrammar,
	#instVars : [
		'heading'
	],
	#category : #'Markdown-Parser'
}

{ #category : #rules }
MHeadingIslandGrammar >> heading [
	^ #startOfLine asParser , (hashMark min: 1 max: 6) , #newline asParser negate plus
]

{ #category : #accessing }
MHeadingIslandGrammar >> start [
	^ heading sea
]
