Class {
	#name : #RecipeReport,
	#superclass : #TBSMagritteReport,
	#instVars : [
		'book'
	],
	#category : #RecipeBookComponents
}

{ #category : #'instance creation' }
RecipeReport class >> from: aBook [
| report bookRecipes |
bookRecipes := aBook allRecipes.
report := self rows: bookRecipes description: bookRecipes anyOne
magritteDescription.
report book: aBook.
report addColumn: (MACommandColumn new 
				addCommandOn: report selector: #editRecipe: text: 'Edit';
				yourself;
				addCommandOn: report selector: #deleteRecipe: text: 'Delete';
				yourself ).
^ report
]

{ #category : #accessing }
RecipeReport >> book [ 
	^ book
]

{ #category : #accessing }
RecipeReport >> book: aBook [
	book := aBook

]
