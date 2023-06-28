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
       html div
        class: 'list-group list-group-horizontal';
        with: [
            html div
                class: 'list-group-item';
                with: [ html strong: 'All categories' ].
            categories do: [ :category |
                html div
                    class: 'list-group-item list-group-item-custom';
                    with: [ self renderCategoryLinkOn: html with: category ]
            ]
        ]
]

{ #category : #acccessing }
CategoriesComponent >> selectCategory: aCategory [
	recipes currentCategory: aCategory
]

{ #category : #hooks }
CategoriesComponent >> style [
    ^ '
    .list-group-horizontal {
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
    }
    .list-group-horizontal .list-group-item {
        margin-right: 10px;
    }
	 .list-group-item-custom {
    	  background-color: #f8f9fa;
   	 	  color: #333;
  	     border: none;
	 }
    '
]
