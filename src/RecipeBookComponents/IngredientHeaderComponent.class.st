Class {
	#name : #IngredientHeaderComponent,
	#superclass : #HeaderComponent,
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
IngredientHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
IngredientHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
	tbsPullRight;
	callback: [ component goToRecipesListView ];
	with: [
		html text: 'Go back '.
		html tbsGlyphIcon iconLogout ]
]
