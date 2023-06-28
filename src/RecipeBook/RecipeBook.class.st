Class {
	#name : #RecipeBook,
	#superclass : #Object,
	#instVars : [
		'recipes'
	],
	#category : #RecipeBook
}

{ #category : #acccessing }
RecipeBook class >> createDemoRecipes [
	self current 
	addRecipe: (Recipe name: 'Chocolate Cake'
                         category: 'Desserts'
                      ingredients: 'Flour, Sugar, Chocolate, Butter, Eggs'
                     instructions: '1. Preheat the oven to 350°F...');
	addRecipe: (Recipe name: 'Chicken Stir-Fry'
                         category: 'Main Course'
                      ingredients: 'Chicken, Vegetables, Soy Sauce Eggs'
                     instructions: '1. Heat the oil in a pan...')
]

{ #category : #accessing }
RecipeBook class >> current [
	^ self selectAll
	ifNotEmpty: [ :x | x anyOne ]
	ifEmpty: [ self new save ]
]

{ #category : #'class initialization' }
RecipeBook class >> initialize [
	self reset


]

{ #category : #initialization }
RecipeBook class >> initializeVoyageOnMemoryDB [
	VOMemoryRepository new enableSingleton
]

{ #category : #testing }
RecipeBook class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
RecipeBook class >> reset [
	self initializeVoyageOnMemoryDB
]

{ #category : #adding }
RecipeBook >> addRatingToRecipe: aRecipe rating: anInteger [
    | foundRecipe |
    foundRecipe := recipes detect: [ :recipe | recipe = aRecipe ] ifNone: [0].
    foundRecipe ifNotNil: [foundRecipe rating: anInteger]
]

{ #category : #adding }
RecipeBook >> addRecipe: aRecipe [
   recipes add: aRecipe.
	aRecipe save.
	self save.
]

{ #category : #private }
RecipeBook >> allCategories [
^ (self allRecipes collect: [ :r | r category ]) asSet
]

{ #category : #acccessing }
RecipeBook >> allRecipes [
	^ recipes
]

{ #category : #testing }
RecipeBook >> hasRecipe: aRecipe [
    ^ recipes includes: aRecipe
]

{ #category : #initialization }
RecipeBook >> initialize [
	super initialize. 
   recipes := OrderedCollection new
]

{ #category : #acccessing }
RecipeBook >> recipeCount [
    ^ recipes size
]

{ #category : #acccessing }
RecipeBook >> recipesByCategory: aCategory [
    ^ recipes select: [ :recipe | recipe category = aCategory ]
]

{ #category : #acccessing }
RecipeBook >> recipesFirst [
	^ recipes first
]

{ #category : #removing }
RecipeBook >> removeAllRecipes [
	recipes do: [ :each | each remove ].
	recipes := OrderedCollection new.
	self save. 
]

{ #category : #removing }
RecipeBook >> removeRecipe: aRecipe [
   recipes remove: aRecipe ifAbsent: [ ].
	self save.
]

{ #category : #acccessing }
RecipeBook >> searchRecipesWithIngredient: anIngredient [
    ^ recipes select: [ :recipe | recipe ingredients includesSubstring: anIngredient ]
]
