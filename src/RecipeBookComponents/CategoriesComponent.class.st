Class {
	#name : #CategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'recipes',
		'categories'
	],
	#category : #RecipeBookComponents
}

{ #category : #acccessing }
CategoriesComponent class >> categories: categories recipes: aScreen [
	^ self new categories: categories; recipes: aScreen
]

{ #category : #accessing }
CategoriesComponent >> categories [
	^ categories
]

{ #category : #accessing }
CategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection
]

{ #category : #accessing }
CategoriesComponent >> recipes [
	^ recipes 
]

{ #category : #accessing }
CategoriesComponent >> recipes: aComponent [
	recipes := aComponent
]

{ #category : #rendering }
CategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem
		class: 'active' if: aCategory = self recipes currentCategory;
		callback: [ self selectCategory: aCategory ];
		with: aCategory
]

{ #category : #rendering }
CategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [
		html tbsListGroupItem
			with: [ html strong: 'Categories' ].
			categories do: [ :cat |
				self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #acccessing }
CategoriesComponent >> selectCategory: aCategory [
	recipes currentCategory: aCategory
]
