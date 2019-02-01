Class {
	#name : #MLinksExtractor,
	#superclass : #MLinkIslandGrammar,
	#category : #'Markdown-Parser'
}

{ #category : #rules }
MLinksExtractor >> link [
	^ super link token ==> [ :ppToken |
		MLink new
			startPosition: ppToken start;
			endPosition: ppToken stop;
			url: (String newFrom: ppToken parsedValue fifth);
			alt: (String newFrom: ppToken parsedValue second);
			yourself ]
]

{ #category : #accessing }
MLinksExtractor >> start [
	^ super start plus ==> [ :tokens |
		tokens flattened select: [ :t | t class = MLink ] ]
]
