Class {
	#name : #RecipeWithIngredientReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'book'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
RecipeWithIngredientReport class >> filteredDescriptionsFrom: aRecipe [
	^ aRecipe magritteDescription
		select: [ :each | #(name ingredients) includes: each accessor
		selector ]

]

{ #category : #'instance creation' }
RecipeWithIngredientReport class >> from: aBook ingredient: anIngredient [
    | report recipes |
    recipes := aBook searchRecipesWithIngredient: anIngredient.
    report := self rows: recipes description: recipes 
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
