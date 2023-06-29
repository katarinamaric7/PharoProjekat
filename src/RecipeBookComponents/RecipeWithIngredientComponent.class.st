Class {
	#name : #RecipeWithIngredientComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredient',
		'report'
	],
	#category : #RecipeBookComponents
}

{ #category : #hooks }
RecipeWithIngredientComponent >> children [
	^ super children copyWith: self report
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> createHeaderComponent [
	^ IngredientHeaderComponent from: self
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> goToRecipesListView [
	self answer
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> initialize [
	super initialize.
	self report: (RecipeWithEggsReport from: self book)
]

{ #category : #rendering }
RecipeWithIngredientComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'Recipes with eggs'.
	html horizontalRule.
	html render: self report ]

]

{ #category : #accessing }
RecipeWithIngredientComponent >> report [
	^ report
]

{ #category : #accessing }
RecipeWithIngredientComponent >> report: aReport [
	report := aReport
]
