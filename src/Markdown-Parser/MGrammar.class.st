Class {
	#name : #MGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'asterik',
		'backTick',
		'backslash',
		'closeParenthesis',
		'closeSquareBracket',
		'exclamationMark',
		'hashMark',
		'minusSign',
		'openParenthesis',
		'openSquareBracket',
		'plusSign',
		'underscore'
	],
	#category : #'Markdown-Parser'
}

{ #category : #'rules - specials' }
MGrammar >> asterik [
	^ $* asParser
]

{ #category : #'rules - specials' }
MGrammar >> backTick [
	^ $` asParser
]

{ #category : #'rules - specials' }
MGrammar >> backslash [
	^ $\ asParser
]

{ #category : #'rules - specials' }
MGrammar >> closeParenthesis [
	^ $) asParser
]

{ #category : #'rules - specials' }
MGrammar >> closeSquareBracket [
	^ $] asParser
]

{ #category : #'rules - specials' }
MGrammar >> exclamationMark [
	^ $! asParser
]

{ #category : #'rules - specials' }
MGrammar >> hashMark [
	^ $# asParser
]

{ #category : #'rules - specials' }
MGrammar >> minusSign [
	^ $- asParser
]

{ #category : #'rules - specials' }
MGrammar >> openParenthesis [
	^ $( asParser
]

{ #category : #'rules - specials' }
MGrammar >> openSquareBracket [
	^ $[ asParser
]

{ #category : #'rules - specials' }
MGrammar >> plusSign [
	^ $+ asParser
]

{ #category : #'rules - specials' }
MGrammar >> underscore [
	^ $_ asParser
]
