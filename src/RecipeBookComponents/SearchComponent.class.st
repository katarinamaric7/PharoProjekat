Class {
	#name : #SearchComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredient',
		'report'
	],
	#category : #RecipeBookComponents
}

{ #category : #hooks }
SearchComponent >> children [
	^ super children copyWith: self report
]

{ #category : #acccessing }
SearchComponent >> createHeaderComponent [
	^ EggsHeaderComponent from: self
]

{ #category : #acccessing }
SearchComponent >> goToRecipesListView [
	self answer
]

{ #category : #acccessing }
SearchComponent >> initialize [
	super initialize.
	self report: (RecipeWithEggsReport from: self book)
]

{ #category : #rendering }
SearchComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'Recipes with eggs'.
	html horizontalRule.
	html render: self report ]

]

{ #category : #accessing }
SearchComponent >> report [
	^ report
]

{ #category : #accessing }
SearchComponent >> report: aReport [
	report := aReport
]
