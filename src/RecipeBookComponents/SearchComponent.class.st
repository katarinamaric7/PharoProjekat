Class {
	#name : #SearchComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredients'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
SearchComponent >> createHeaderComponent [
	^ SearchHeaderComponent from: self
]

{ #category : #acccessing }
SearchComponent >> goToRecipesListView [
	self answer
]

{ #category : #rendering }
SearchComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'Search Ingredient'.
	html horizontalRule. ]
]
