Class {
	#name : #ApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #RecipeBookComponents
}

{ #category : #testing }
ApplicationRootComponent class >> canBeRoot [
	^ true

]

{ #category : #'class initialization' }
ApplicationRootComponent class >> initialize [
	| app |
	app := WAAdmin register: self asApplicationAt: 'RecipeBook'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: TBSDeploymentLibrary.
		
]

{ #category : #hooks }
ApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
ApplicationRootComponent >> initialize [
	super initialize.
	main := RecipesListComponent new
]

{ #category : #accessing }
ApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
ApplicationRootComponent >> renderContentOn: html [
	html render: main
]

{ #category : #updating }
ApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'RecipeBook'
]
