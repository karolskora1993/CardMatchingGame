//
//  Card.h
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(strong, nonatomic) NSString* label;
@property(nonatomic, getter=isPicked) BOOL picked;
@property(nonatomic, getter=isMatched) BOOL matched;

-(int)matchWithOtherCards:(NSArray*) otherCards;
@end
