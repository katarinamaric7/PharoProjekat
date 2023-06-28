Class {
	#name : #EggsHeaderComponent,
	#superclass : #HeaderComponent,
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
EggsHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
EggsHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
	tbsPullRight;
	callback: [ component goToRecipesListView ];
	with: [
		html text: 'Go back '.
		html tbsGlyphIcon iconLogout ]
]
