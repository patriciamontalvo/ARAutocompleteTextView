//
//  ARAutoCompleteWordsTextView.m
//  ARTextViewAutocompletionExampleSwift
//
//  Created by Josejulio Martínez on 31/05/17.
//  Copyright © 2017 Lucas Farah. All rights reserved.
//

#import "ARAutoCompleteWordsTextView.h"

@implementation ARAutoCompleteWordsTextView

- (void)setupAutocompleteTextView
{
    [super setupAutocompleteTextView];
    
    // Default list to suggest
    self.autocomplete = @[ @"@alexruperez", @"@feverapp", @"@JavierQuerol", @"#alexruperez", @"#fever", @"#google", @"#facebook", @"#twitter", @"#hashtag" ];
    
    self.autocompleteDataSource = self;
}


#pragma mark - ARAutocompleteDataSource

- (NSString *)textView:(ARAutocompleteTextView *)textView completionForPrefix:(NSString *)prefix ignoreCase:(BOOL)ignoreCase
{
    
    NSString *stringToLookFor;
    NSArray *componentsString = [prefix componentsSeparatedByString:@" "];
    if (componentsString.count > 1 && [componentsString.lastObject isEqualToString:@""]) {
        componentsString = [NSMutableArray arrayWithArray:componentsString];
        [(NSMutableArray*)componentsString removeLastObject];
    }
    NSString *prefixLastComponent = [componentsString.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (ignoreCase)
    {
        stringToLookFor = [prefixLastComponent lowercaseString];
    }
    else
    {
        stringToLookFor = prefixLastComponent;
    }
    
    for (NSString *stringFromReference in self.autocomplete)
    {
        NSString *stringToCompare;
        if (ignoreCase)
        {
            stringToCompare = [stringFromReference lowercaseString];
        }
        else
        {
            stringToCompare = stringFromReference;
        }
        
        if ([stringToCompare hasPrefix:stringToLookFor])
        {
            return [stringFromReference stringByReplacingCharactersInRange:[stringToCompare rangeOfString:stringToLookFor] withString:@""];
        }
        
    }
    
    return @"";
}


@end
