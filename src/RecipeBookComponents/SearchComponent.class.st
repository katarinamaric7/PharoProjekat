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
