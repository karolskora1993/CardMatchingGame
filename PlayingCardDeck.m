//
//  PlayingCardDeck.m
//  CardMatchingGame
//
//  Created by apple on 13.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init
{
    self=[super init];
    
    if(self)
    {
        for(NSString *suit in [PlayingCard validSuits])
        {
            for(int i=1;i<[PlayingCard maxRank];i++)
            {
                PlayingCard* card=[[PlayingCard alloc]init];
                card.suit=suit;
                card.rank=i;
                [self addCard:card atTop:NO];
            }
        }
    }
    return self;
}

@end
