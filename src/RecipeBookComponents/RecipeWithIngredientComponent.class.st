Class {
	#name : #RecipeWithIngredientComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredientInput',
		'report'
	],
	#category : #RecipeBookComponents
}

{ #category : #hooks }
RecipeWithIngredientComponent >> children [
	^ super children copyWith: self report
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> createHeaderComponent [
	^ IngredientHeaderComponent from: self
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> goToRecipesListView [
	self answer
]

{ #category : #acccessing }
RecipeWithIngredientComponent >> initialize [
	super initialize.
	self report: (RecipeWithEggsReport from: self book ingredient: ingredientInput)
]

{ #category : #rendering }
RecipeWithIngredientComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
	html heading: 'Recipes with eggs'.
	html horizontalRule.
	 html form: [
        html paragraph: [
            html text: 'Ingredient: '.
            ingredientInput := html textInput
                id: 'ingredientInput';
                yourself.
            html submitButton
                callback: [ self report: ingredientInput value ];
                with: 'Search'.
        ]
    ].
	html render: self report ]

]

{ #category : #accessing }
RecipeWithIngredientComponent >> report [
	^ report
]

{ #category : #accessing }
RecipeWithIngredientComponent >> report: aReport [
	report := aReport
]
