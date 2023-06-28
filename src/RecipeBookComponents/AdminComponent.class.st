Class {
	#name : #AdminComponent,
	#superclass : #ScreenComponent,
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
AdminComponent >> createHeaderComponent [
	^ AdminHeaderComponent from: self
]

{ #category : #acccessing }
AdminComponent >> goToRecipesListView [
	self answer
]

{ #category : #rendering }
AdminComponent >> renderContentOn: html [
	super renderContentOn: html.
	html tbsContainer: [
		html heading: 'Admin crud'.
		html horizontalRule ]
]
