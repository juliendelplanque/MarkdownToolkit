Class {
	#name : #MSanityChecker,
	#superclass : #Object,
	#instVars : [
		'markdownString'
	],
	#category : #'Markdown-Tools'
}

{ #category : #'as yet unclassified' }
MSanityChecker >> checkLinksWorks [
	| links |
	links := self extractLinks.
	links reject: #isHeadingLink thenDo: [ :link |
		self assert: link isWorking ]
]

{ #category : #'as yet unclassified' }
MSanityChecker >> extractLinks [
	^ MLinksExtractor parse: self markdownString
]

{ #category : #accessing }
MSanityChecker >> markdownString [
	^ markdownString
]

{ #category : #accessing }
MSanityChecker >> markdownString: anObject [
	markdownString := anObject
]
