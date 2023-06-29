Class {
	#name : #RecipeBookTest,
	#superclass : #TestCase,
	#instVars : [
		'book',
		'recipe',
		'first',
		'previousRepository'
	],
	#category : #RecipeBookTests
}

{ #category : #running }
RecipeBookTest >> setUp [
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.

	book := RecipeBook current.
	book removeAllRecipes.
	
	first := Recipe name: 'Chocolate Cake'
                         category: 'Desserts'
                      ingredients: 'Flour, Sugar, Chocolate, Butter, Eggs'
                     instructions: '1. Preheat the oven to 350°F...'.
	
	book addRecipe: first.
	
	recipe := Recipe name: 'Chicken Stir-Fry'
                         category: 'Main Course'
                      ingredients: 'Chicken, Vegetables, Soy Sauce Eggs'
                     instructions: '1. Heat the oil in a pan...'.
	
	book addRecipe: recipe.
]

{ #category : #running }
RecipeBookTest >> tearDown [
	VORepository setRepository: previousRepository
]

{ #category : #tests }
RecipeBookTest >> testAddRecipe [
	book addRecipe: recipe. 
	self assert: book recipeCount equals: 3.
	
]

{ #category : #tests }
RecipeBookTest >> testRecipeCount [
	self assert: book recipeCount equals: 2.
]

{ #category : #tests }
RecipeBookTest >> testRecipesByCategory [
	self assert: (book recipesByCategory: 'Desserts')
	size equals: 1
	
]

{ #category : #tests }
RecipeBookTest >> testRemoveAllRecipes [
	book removeAllRecipes.
	self assert: book recipeCount equals: 0.
]

{ #category : #tests }
RecipeBookTest >> testRemoveRecipe [
	book addRecipe: recipe.

   self assert: book recipeCount equals: 3.
    
	book removeRecipe: recipe.
	
	self assert: book recipeCount equals: 2.
]

{ #category : #acccessing }
RecipeBookTest >> testSearchRecipesWithIngredient [
   self assert: (book searchRecipesWithIngredient: 'Eggs')
	size equals: 2
]
