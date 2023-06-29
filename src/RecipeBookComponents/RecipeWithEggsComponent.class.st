Class {
	#name : #RecipeWithEggsComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredient',
		'report'
	],
	#category : #RecipeBookComponents
}

{ #category : #hooks }
RecipeWithEggsComponent >> children [
	^ super children copyWith: self report
]

{ #category : #acccessing }
RecipeWithEggsComponent >> createHeaderComponent [
	^ IngredientHeaderComponent from: self
]

{ #category : #acccessing }
RecipeWithEggsComponent >> goToRecipesListView [
	self answer
]

{ #category : #acccessing }
RecipeWithEggsComponent >> initialize [
	super initialize.
	self report: (RecipeWithEggsReport from: self book)
]

{ #category : #rendering }
RecipeWithEggsComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'Recipes with eggs'.
	html horizontalRule.
	html render: self report ]

]

{ #category : #accessing }
RecipeWithEggsComponent >> report [
	^ report
]

{ #category : #accessing }
RecipeWithEggsComponent >> report: aReport [
	report := aReport
]
