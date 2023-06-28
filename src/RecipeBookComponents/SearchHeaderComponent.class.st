Class {
	#name : #SearchHeaderComponent,
	#superclass : #HeaderComponent,
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
SearchHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
SearchHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
	tbsPullRight;
	callback: [ component goToRecipesListView ];
	with: [
		html text: 'Go back '.
		html tbsGlyphIcon iconLogout ]
]
