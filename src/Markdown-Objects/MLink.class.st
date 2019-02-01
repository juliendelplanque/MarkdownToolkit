Class {
	#name : #MLink,
	#superclass : #MObject,
	#instVars : [
		'url',
		'alt'
	],
	#category : #'Markdown-Objects'
}

{ #category : #accessing }
MLink >> alt [
	^ alt
]

{ #category : #accessing }
MLink >> alt: anObject [
	alt := anObject
]

{ #category : #testing }
MLink >> isHeadingLink [
	^ self url trimmed beginsWith: '#'
]

{ #category : #accessing }
MLink >> url [
	^ url
]

{ #category : #accessing }
MLink >> url: anObject [
	url := anObject
]
