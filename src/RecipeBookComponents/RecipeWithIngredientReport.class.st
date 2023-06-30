Class {
	#name : #RecipeWithIngredientReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'book'
	],
	#category : #RecipeBookComponents
}

{ #category : #'instance creation' }
RecipeWithIngredientReport class >> from: aBook ingredient: anIngredient [
    | report recipes |
    recipes := aBook searchRecipesWithIngredient: anIngredient.
    report := self rows: recipes description: recipes anyOne
	magritteDescription.
	report book: aBook.
	^ report
]

{ #category : #accessing }
RecipeWithIngredientReport >> book [ 
	^ book
]

{ #category : #accessing }
RecipeWithIngredientReport >> book: aBook [
	book := aBook
]
