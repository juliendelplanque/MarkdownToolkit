Class {
	#name : #MHeading,
	#superclass : #MObject,
	#instVars : [
		'level',
		'content'
	],
	#category : #'Markdown-Objects'
}

{ #category : #accessing }
MHeading >> content [
	^ content
]

{ #category : #accessing }
MHeading >> content: anObject [
	content := anObject
]

{ #category : #accessing }
MHeading >> level [
	^ level
]

{ #category : #accessing }
MHeading >> level: anObject [
	level := anObject
]
