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

{ #category : #adding }
RecipeReport >> addRecipe [
	| recipe |
	recipe := self call: (self renderAddRecipeForm: Recipe new).
	recipe ifNotNil: [ book addRecipe: recipe.
		self refreshReport ]

]

{ #category : #accessing }
RecipeReport >> book [ 
	^ book
]

{ #category : #accessing }
RecipeReport >> book: aBook [
	book := aBook

]

{ #category : #acccessing }
RecipeReport >> deleteRecipe: aRecipe [
	(self confirm: 'Are you sure you want to permanently remove this recipe?')
	ifTrue: [ book removeRecipe: aRecipe.
		self refreshReport ]


]

{ #category : #acccessing }
RecipeReport >> editRecipe: aRecipe [
	| recipe |
	recipe := self call: (self renderEditRecipeForm: aRecipe).
	recipe ifNotNil: [ book save ]
]

{ #category : #acccessing }
RecipeReport >> refreshReport [
	self rows: book allRecipes .
	self refresh.

]

{ #category : #rendering }
RecipeReport >> renderAddRecipeForm: aRecipe [
^ aRecipe asComponent
addDecoration: (TBSMagritteFormDecoration buttons: { #save
-> 'Add recipe' . #cancel -> 'Cancel'});
yourself

]

{ #category : #rendering }
RecipeReport >> renderContentOn: html [
	html tbsGlyphIcon iconPencil.
	html anchor
		callback: [ self addRecipe ];
		with: 'Add recipe'.
	super renderContentOn: html
]

{ #category : #rendering }
RecipeReport >> renderEditRecipeForm: aRecipe [
	^ aRecipe asComponent addDecoration: (
		TBSMagritteFormDecoration buttons: {
		#save -> 'Save post'.
		#cancel -> 'Cancel'});
		yourself

]
