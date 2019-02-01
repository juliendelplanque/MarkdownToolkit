Class {
	#name : #MLinkIslandGrammar,
	#superclass : #MGrammar,
	#instVars : [
		'link'
	],
	#category : #'Markdown-Parser'
}

{ #category : #rules }
MLinkIslandGrammar >> link [
	^ openSquareBracket , closeSquareBracket negate star , closeSquareBracket ,
	openParenthesis , closeParenthesis negate star , closeParenthesis
]

{ #category : #accessing }
MLinkIslandGrammar >> start [
	"Answer the production to start this parser with."
	
	^ link sea
]
