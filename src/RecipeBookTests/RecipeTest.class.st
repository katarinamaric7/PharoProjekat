Class {
	#name : #RecipeTest,
	#superclass : #TestCase,
	#category : #RecipeBookTests
}

{ #category : #tests }
RecipeTest >> testRecipeInitialization [
   | recipe |
   recipe := Recipe 
		name: 'Chocolate Cake'
		category: 'Desserts'
      ingredients: 'Flour, Sugar, Chocolate, Butter, Eggs'
      instructions: '1. Preheat the oven to 350°F...'.

    self assert: recipe name equals: 'Chocolate Cake'.
    self assert: recipe category equals: 'Desserts'.
    self assert: recipe ingredients equals: 'Flour, Sugar, Chocolate, Butter, Eggs'.
    self assert: recipe instructions equals: '1. Preheat the oven to 350°F...'.
]
