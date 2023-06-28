Class {
	#name : #AdminComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'report'
	],
	#category : #RecipeBookComponents
}

{ #category : #hooks }
AdminComponent >> children [
	^ super children copyWith: self report
]

{ #category : #acccessing }
AdminComponent >> createHeaderComponent [
	^ AdminHeaderComponent from: self
]

{ #category : #acccessing }
AdminComponent >> goToRecipesListView [
	self answer
]

{ #category : #acccessing }
AdminComponent >> initialize [
	super initialize.
	self report: (RecipeReport from: self book)
]

{ #category : #rendering }
AdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'RecipeBook Admin'.
	html horizontalRule.
	html render: self report ]
]

{ #category : #accessing }
AdminComponent >> report [
	^ report
]

{ #category : #accessing }
AdminComponent >> report: aReport [
	report := aReport
]
