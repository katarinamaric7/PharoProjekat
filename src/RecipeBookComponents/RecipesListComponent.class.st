Class {
	#name : #RecipesListComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipeComponents',
		'currentCategory'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
RecipesListComponent >> categoriesComponent [
	^ CategoriesComponent
		categories: self book allCategories
		recipes: self

]

{ #category : #hooks }
RecipesListComponent >> children [
	^ self recipeComponents, super children
]

{ #category : #accessing }
RecipesListComponent >> currentCategory [
	^ currentCategory

]

{ #category : #accessing }
RecipesListComponent >> currentCategory: aCategory [ 
	currentCategory := aCategory 
]

{ #category : #acccessing }
RecipesListComponent >> goToAdministrationView [
	self call: AdminComponent new
]

{ #category : #acccessing }
RecipesListComponent >> goToSearchView [
	self call: RecipeWithEggsComponent new
]

{ #category : #acccessing }
RecipesListComponent >> initialize [
	super initialize.
	recipeComponents := OrderedCollection new
]

{ #category : #acccessing }
RecipesListComponent >> readSelectedRecipes [
	^ self currentCategory
		ifNil: [ self book allRecipes  ]
		ifNotNil: [ self book recipesByCategory: self
			currentCategory ]
]

{ #category : #acccessing }
RecipesListComponent >> recipeComponentFor: aRecipe [
	^ RecipeComponent new recipe: aRecipe 

]

{ #category : #accessing }
RecipesListComponent >> recipeComponents [
	recipeComponents := self readSelectedRecipes 
	collect: [ :each | RecipeComponent new recipe: each ].
	^ recipeComponents

]

{ #category : #rendering }
RecipesListComponent >> renderContentOn: html [
	super renderContentOn: html.html tbsContainer: [
	html tbsRow showGrid;
		with: [
			html tbsColumn
				extraSmallSize: 12;
				smallSize: 2;
				mediumSize: 4;
				with: [
					html render: self categoriesComponent ].
	
		html tbsColumn
			extraSmallSize: 12;
			smallSize: 10;
			mediumSize: 8;	
			with: [
				self readSelectedRecipes  do: [ :r |
					html render: (self recipeComponentFor: r) ] ] ] ]
 
]
