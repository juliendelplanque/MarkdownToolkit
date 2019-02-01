Class {
	#name : #MHeadingsExtractor,
	#superclass : #MHeadingIslandGrammar,
	#category : #'Markdown-Parser'
}

{ #category : #rules }
MHeadingsExtractor >> heading [
	^ super heading token ==> [ :ppToken |
		MHeading new
			startPosition: ppToken start;
			endPosition: ppToken stop;
			level: ppToken parsedValue second size;
			content: (String newFrom: ppToken parsedValue third) trimLeft;
			yourself ]
]

{ #category : #accessing }
MHeadingsExtractor >> start [
	^ super start plus ==> [ :tokens |
		tokens flattened select: [ :t | t class = MHeading ] ]
]
