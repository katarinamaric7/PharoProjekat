Class {
	#name : #AdminHeaderComponent,
	#superclass : #HeaderComponent,
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
AdminHeaderComponent >> renderButtonsOn: html [
	html form: [ self renderDisconnectButtonOn: html ]
]

{ #category : #rendering }
AdminHeaderComponent >> renderDisconnectButtonOn: html [
	html tbsNavbarButton
	tbsPullRight;
	callback: [ component goToRecipesListView ];
	with: [
		html text: 'Disconnect '.
		html tbsGlyphIcon iconLogout ]
]
