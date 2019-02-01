Extension { #name : #MLink }

{ #category : #'*Markdown-Tools' }
MLink >> isWorking [
	^ (ZnEasy head: self url trimmed asZnUrl) isSuccess
]
