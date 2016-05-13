//
//  Deck.m
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property(strong, nonatomic) NSMutableArray* cards;

@end

@implementation Deck

-(NSArray *)cards
{
    if(!_cards)
        _cards=[[NSMutableArray alloc]init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if(self.cards)
    {
        if(atTop)
            [self.cards insertObject:card atIndex:0];
        else
            [self.cards addObject:card];
    }
}
-(Card*) pickRandomCard
{
    if([self.cards count])
    {
        unsigned index= arc4random() %[self.cards count];
        Card* card=[self.cards objectAtIndex:index];
        [self.cards removeObjectAtIndex:index];
        return card;
    }
    else
        return nil;
}
@end
