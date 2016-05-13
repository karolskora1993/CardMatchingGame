//
//  Game.h
//  CardMatchingGame
//
//  Created by apple on 13.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Game : NSObject

@property(nonatomic) int score;

-(instancetype)initWithNumberOfCards:(NSUInteger) size andDeck:(Deck*) deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card*)cardAtIndex:(NSUInteger)index;

@end
