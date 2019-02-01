Class {
	#name : #MTOCGenerator,
	#superclass : #Object,
	#instVars : [
		'markdownString',
		'endOfLine',
		'indentationCharacter',
		'generatedReferencesBag',
		'minHeadingLevel'
	],
	#category : #'Markdown-Tools'
}

{ #category : #accessing }
MTOCGenerator >> endOfLine [
	^ endOfLine
]

{ #category : #accessing }
MTOCGenerator >> endOfLine: anObject [
	endOfLine := anObject asString
]

{ #category : #extracting }
MTOCGenerator >> extractHeadings [
	^ MHeadingsExtractor parse: self markdownString
]

{ #category : #generating }
MTOCGenerator >> generate [
	| headings |
	headings := self extractHeadings.
	"Reset the minimum heading level (used to put right number of tabulations)."
	self minHeadingLevel: (headings collect: #level) min.
	"Reset the bag references already generated."
	generatedReferencesBag := Bag new.
	^ String streamContents: [ :stream | 
		| referenceToHeading |
		headings do: [ :heading | 
			self printIndentationLevel: heading level on: stream.
			referenceToHeading := self generateReferenceStringFor: heading.
			stream nextPutAll: '- '.
			self
				printMarkdownUrl: referenceToHeading text: heading content on: stream;
				printEOLOn: stream ] ]
]

{ #category : #private }
MTOCGenerator >> generateReferenceStringFor: aMHeading [
	| referenceToHeadingCandidate |
	referenceToHeadingCandidate := aMHeading content asReferenceToHeading.
	(generatedReferencesBag occurrencesOf: referenceToHeadingCandidate)
		in: [ :occurences | 
			occurences > 0
				ifTrue: [ 
					referenceToHeadingCandidate := referenceToHeadingCandidate , '-' , occurences asString ] ].
	generatedReferencesBag add: aMHeading content asReferenceToHeading.
	
	^ referenceToHeadingCandidate
]

{ #category : #accessing }
MTOCGenerator >> indentationCharacter [
	^ indentationCharacter
]

{ #category : #accessing }
MTOCGenerator >> indentationCharacter: anObject [
	indentationCharacter := anObject asCharacter
]

{ #category : #initialization }
MTOCGenerator >> initialize [
	super initialize.
	self endOfLine: Smalltalk os lineEnding.
	self indentationCharacter: Character tab.
]

{ #category : #accessing }
MTOCGenerator >> markdownString [
	^ markdownString
]

{ #category : #accessing }
MTOCGenerator >> markdownString: anObject [
	markdownString := anObject
]

{ #category : #private }
MTOCGenerator >> minHeadingLevel: anInteger [
	minHeadingLevel := anInteger
]

{ #category : #private }
MTOCGenerator >> printEOLOn: aStream [
	aStream nextPutAll: self endOfLine
]

{ #category : #private }
MTOCGenerator >> printIndentationLevel: headingLevel on: stream [
	headingLevel - minHeadingLevel
		timesRepeat: [ stream nextPut: self indentationCharacter ]
]

{ #category : #private }
MTOCGenerator >> printMarkdownUrl: urlString text: aString on: aStream [
	aStream
		nextPutAll: '[';
		nextPutAll: aString;
		nextPutAll: '](#';
		nextPutAll: urlString;
		nextPut: $)
]
