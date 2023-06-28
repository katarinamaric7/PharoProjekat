Class {
	#name : #RecipeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'recipe'
	],
	#category : #RecipeBookComponents
}

{ #category : #accessing }
RecipeComponent >> ingredients [ 
	^ recipe ingredients 
]

{ #category : #initialization }
RecipeComponent >> initialize [
	super initialize.
	recipe := Recipe new
]

{ #category : #accessing }
RecipeComponent >> instructions [ 
	^ recipe instructions
]

{ #category : #accessing }
RecipeComponent >> name [ 
	^ recipe name
]

{ #category : #accessing }
RecipeComponent >> recipe: aRecipe [
	recipe := aRecipe
]

{ #category : #rendering }
RecipeComponent >> renderContentOn: html [
	html heading level: 2; with: self name.
	html heading level: 3; with: 'Ingredients'.
	html text: self ingredients.         
   html heading level: 3; with: 'Instructions'.
	html text: self instructions.
            
]
