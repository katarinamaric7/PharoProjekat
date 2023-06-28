Class {
	#name : #SearchComponent,
	#superclass : #ScreenComponent,
	#instVars : [
		'recipes',
		'ingredient'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
SearchComponent >> createHeaderComponent [
	^ SearchHeaderComponent from: self
]

{ #category : #acccessing }
SearchComponent >> goToRecipesListView [
	self answer
]

{ #category : #rendering }
SearchComponent >> renderContentOn: html [
	super renderContentOn: html.
	 html form: [
        html textInput
            value: ingredient ;
            callback: [:value | ingredient := value];
            yourself.
        html submitButton
            text: 'Search';
            callback: [ self searchRecipes ];
            yourself
    ].

]

{ #category : #acccessing }
SearchComponent >> searchRecipes [
    recipes := self session application book searchRecipesWithIngredient: ingredient
]
