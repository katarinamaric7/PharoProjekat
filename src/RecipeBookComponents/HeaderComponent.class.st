Class {
	#name : #HeaderComponent,
	#superclass : #WAComponent,
	#instVars : [
		'component'
	],
	#category : #RecipeBookComponents
}

{ #category : #'instance creation' }
HeaderComponent class >> from: aComponent [
	^ self new
	component: aComponent;
	yourself

]

{ #category : #accessing }
HeaderComponent >> component [
	^ component
]

{ #category : #accessing }
HeaderComponent >> component: anObject [
	component := anObject
]

{ #category : #rendering }
HeaderComponent >> renderBrandOn: html [
	html tbsNavbarHeader: [
		html tbsNavbarBrand
			url: self application url;
			with: 'RecipeBook' ]
]

{ #category : #acccessing }
HeaderComponent >> renderButtonsOn: html [
	self renderSimpleAdminButtonOn: html.
	self renderSearchButtonOn: html
]

{ #category : #rendering }
HeaderComponent >> renderContentOn: html [
	html tbsNavbar beDefault; with: [
		html tbsContainer: [
			self renderBrandOn: html.
			self renderButtonsOn: html
	]]
]

{ #category : #rendering }
HeaderComponent >> renderSearchButtonOn: html [
	html form: [
		html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToSearchView ];
		with: [
			html tbsGlyphIcon iconListAlt.
			html text: ' Search ' ]]
]

{ #category : #rendering }
HeaderComponent >> renderSimpleAdminButtonOn: html [
	html form: [
		html tbsNavbarButton
		tbsPullRight;
		callback: [ component goToAdministrationView ];
		with: [
		html tbsGlyphIcon iconListAlt.
		html text: ' Admin View' ]]
]
