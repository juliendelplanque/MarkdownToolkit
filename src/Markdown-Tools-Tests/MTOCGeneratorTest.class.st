Class {
	#name : #MTOCGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'tocGenerator'
	],
	#category : #'Markdown-Tools-Tests'
}

{ #category : #accessing }
MTOCGeneratorTest >> sampleMarkdown [
	^ '# Hello

## sub hello

### subsub hello

## Hello again

## Hello

## Hello'
]

{ #category : #running }
MTOCGeneratorTest >> setUp [
	super setUp.
	tocGenerator := MTOCGenerator new
							markdownString: self sampleMarkdown;
							endOfLine: String cr; "So it matches default EOL of Pharo's Strings."
							yourself.
]

{ #category : #tests }
MTOCGeneratorTest >> testGenerate [
	self assert: tocGenerator generate equals: '- [Hello](#hello)
	- [sub hello](#sub-hello)
		- [subsub hello](#subsub-hello)
	- [Hello again](#hello-again)
	- [Hello](#hello-1)
	- [Hello](#hello-2)
'
]

{ #category : #tests }
MTOCGeneratorTest >> testPrintEOLOn [
	self assert: (String streamContents: [ :s | tocGenerator printEOLOn: s ]) equals: String cr.
	tocGenerator endOfLine: String lf.
	self assert: (String streamContents: [ :s | tocGenerator printEOLOn: s ]) equals: String lf.
	tocGenerator endOfLine: String crlf.
	self assert: (String streamContents: [ :s | tocGenerator printEOLOn: s ]) equals: String crlf.
]

{ #category : #tests }
MTOCGeneratorTest >> testPrintIndentationLevelOn [
	tocGenerator minHeadingLevel: 0.
	self assert: (String streamContents: [ :s | tocGenerator printIndentationLevel: 1 on: s ]) equals: String tab.
	self assert: (String streamContents: [ :s | tocGenerator printIndentationLevel: 3 on: s ]) equals: String tab , String tab , String tab.
	
	tocGenerator indentationCharacter: Character space.
	self assert: (String streamContents: [ :s | tocGenerator printIndentationLevel: 1 on: s ]) equals: ' '.
	self assert: (String streamContents: [ :s | tocGenerator printIndentationLevel: 3 on: s ]) equals: '   '.
]

{ #category : #tests }
MTOCGeneratorTest >> testPrintMarkdownUrlTextOn [
	self assert: (String streamContents: [ :s | tocGenerator printMarkdownUrl: 'pharo' text: 'Pharo' on: s ]) equals: '[Pharo](#pharo)'.
]
