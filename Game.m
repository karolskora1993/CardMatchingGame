//
//  Game.m
//  CardMatchingGame
//
//  Created by apple on 13.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "Game.h"
#import "PlayingCard.h"

@interface Game()

@property(strong, nonatomic) NSMutableArray* cards;

@end

@implementation Game

-(Card *)cardAtIndex:(NSUInteger)index
{
    if(index < [self.cards count])
        return self.cards[index];
    else
        return nil;
}

-(NSMutableArray *)cards
{
    if(!_cards)
        _cards=[[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithNumberOfCards:(NSUInteger)size andDeck:(Deck *)deck
{
    self=[super init];
    if(self)
    {
        if(self.cards)
        {
            for(int i=0; i<size;i++)
            {
                Card* card=[deck pickRandomCard];
                if(card)
                {
                    [self.cards addObject:card];
                }
                else
                    return nil;
            }
        }
    }
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger)index
{
    static const int MISMATCH_PENALTY=2;
    static const int CHECK_PENALTY=1;
    

    Card* chosenCard=[self cardAtIndex:index];
    
        if(!chosenCard.isMatched)
        {
            if(chosenCard.isPicked)
                chosenCard.picked=NO;
            else{
                for(PlayingCard* otherCard in self.cards)
                {
                    if(otherCard.isPicked && !otherCard.isMatched){
                        int score=[chosenCard matchWithOtherCards:@[otherCard]];
                        if(score)
                        {
                            chosenCard.matched=YES;
                            otherCard.matched=YES;
                            self.score+=score;
                            break;
                        }
                        else{
                            score-=MISMATCH_PENALTY;
                            otherCard.picked=NO;
                        }
                    }
                }
                self.score-=CHECK_PENALTY;
                chosenCard.picked=YES;
            }
        }
}
@end
