//
//  ARAutoCompleteWordsTextView.h
//  ARTextViewAutocompletionExampleSwift
//
//  Created by Josejulio Martínez on 31/05/17.
//  Copyright © 2017 Lucas Farah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ARAutocompleteTextView.h"

@interface ARAutoCompleteWordsTextView : ARAutocompleteTextView <ARAutocompleteDataSource>

@property (nonatomic, copy) NSArray *autocomplete;


@end
