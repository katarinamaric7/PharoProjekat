Class {
	#name : #Recipe,
	#superclass : #Object,
	#instVars : [
		'name',
		'category',
		'ingredients',
		'instructions',
		'rating'
	],
	#category : #RecipeBook
}

{ #category : #accessing }
Recipe class >> name: aName category: aCategory ingredients: anIngredients instructions: anInstructions [ 
   | recipe |
   recipe := self new.
   recipe name: aName.
   recipe category: aCategory.
   recipe ingredients: anIngredients.
   recipe instructions: anInstructions.
    ^ recipe
]

{ #category : #accessing }
Recipe >> category [ 
	^ category 
]

{ #category : #accessing }
Recipe >> category: aCategory [
    category := aCategory
]

{ #category : #accessing }
Recipe >> ingredients [
    ^ ingredients
]

{ #category : #accessing }
Recipe >> ingredients: anIngredient [
	ingredients := anIngredient 
]

{ #category : #initialization }
Recipe >> initialize [
    super initialize.
    rating := 0
]

{ #category : #accessing }
Recipe >> instructions [
    ^ instructions
]

{ #category : #accessing }
Recipe >> instructions: anInstruction [
	instructions := anInstruction
]

{ #category : #accessing }
Recipe >> name [ 
	^ name
]

{ #category : #accessing }
Recipe >> name: aString [
	name := aString 
]

{ #category : #accessing }
Recipe >> rating [
    ^ rating
]

{ #category : #initialization }
Recipe >> rating: aRating [
    rating := aRating
]
