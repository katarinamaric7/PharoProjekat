Class {
	#name : #ScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
ScreenComponent >> book [
	^ RecipeBook current 
]

{ #category : #hooks }
ScreenComponent >> children [
	^ { header }
]

{ #category : #acccessing }
ScreenComponent >> createHeaderComponent [
	^ HeaderComponent from: self
]

{ #category : #acccessing }
ScreenComponent >> initialize [
	super initialize.
	header := self createHeaderComponent
]

{ #category : #rendering }
ScreenComponent >> renderContentOn: html [
	html render: header
]
