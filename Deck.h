//
//  Deck.h
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card*) card atTop:(BOOL) atTop;
-(Card*) pickRandomCard;

@end
