Class {
	#name : #RecipeWithEggsReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'book'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
RecipeWithEggsReport class >> filteredDescriptionsFrom: aRecipe [
	^ aRecipe magritteDescription
		select: [ :each | #(name ingredients) includes: each accessor
		selector ]

]

{ #category : #'instance creation' }
RecipeWithEggsReport class >> from: aBook ingredient: anIngredient [ 
	| recipes |
	recipes := aBook searchRecipesWithIngredient: anIngredient.
	^ self rows: recipes description: (self filteredDescriptionsFrom:recipes anyOne)
	
]

{ #category : #accessing }
RecipeWithEggsReport >> book [ 
	^ book
]

{ #category : #accessing }
RecipeWithEggsReport >> book: aBook [
	book := aBook
]
