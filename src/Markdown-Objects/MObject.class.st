Class {
	#name : #MObject,
	#superclass : #Object,
	#instVars : [
		'startPosition',
		'endPosition'
	],
	#category : #'Markdown-Objects'
}

{ #category : #accessing }
MObject >> endPosition [
	^ endPosition
]

{ #category : #accessing }
MObject >> endPosition: anObject [
	endPosition := anObject
]

{ #category : #accessing }
MObject >> startPosition [
	^ startPosition
]

{ #category : #accessing }
MObject >> startPosition: anObject [
	startPosition := anObject
]
