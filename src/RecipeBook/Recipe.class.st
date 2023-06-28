Class {
	#name : #Recipe,
	#superclass : #Object,
	#instVars : [
		'name',
		'category',
		'ingredients',
		'instructions'
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

{ #category : #acccessing }
Recipe >> descriptionCategory [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Category';
		priority: 300;
		accessor: #category;
		yourself
]

{ #category : #acccessing }
Recipe >> descriptionIngredients [
	<magritteDescription>
	^ MAMemoDescription new
		label: 'Ingredients';
		priority: 200;
		accessor: #ingredients;
		beRequired;
		yourself
]

{ #category : #acccessing }
Recipe >> descriptionInstructions [
	<magritteDescription>
	^ MAMemoDescription new
		label: 'Instructions';
		priority: 200;
		accessor: #instructions;
		beRequired;
		yourself
]

{ #category : #'acessing-magritte' }
Recipe >> descriptionName [
	<magritteDescription>
	^ MAStringDescription new
		label: 'Name';
		priority: 100;
		accessor: #name;
		beRequired;
		yourself
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
