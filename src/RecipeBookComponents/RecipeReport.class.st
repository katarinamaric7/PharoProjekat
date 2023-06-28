Class {
	#name : #RecipeReport,
	#superclass : #TBSMagritteReport,
	#category : #RecipeBookComponents
}

{ #category : #'instance creation' }
RecipeReport class >> from: aBook [
| allBooks |
allBooks := aBook allRecipes.
^ self rows: allBooks description: allBooks anyOne
magritteDescription
]
