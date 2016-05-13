//
//  PlayingCard.m
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit=_suit;

-(NSString *)label
{
    return [[PlayingCard rankStrings][self.rank]stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString*)suit;
{
    if([[PlayingCard validSuits]containsObject:suit])
        _suit=suit;
        
}
-(NSString *)suit
{
    if(_suit)
        return _suit;
    else
        return @"?";
}
+(NSArray *)validSuits
{
    return @[@"♣︎",@"♠︎",@"♥︎",@"♦︎"];
}
+(NSArray*)rankStrings
{
    return @[@"?", @"2",@"3",@"4",@"5",@"6",@"7",@"8", @"9",@"10", @"J", @"Q", @"K", @"A"];
}
+(NSUInteger)maxRank
{
    return [[PlayingCard rankStrings]count];
}

-(int)matchWithOtherCards:(NSArray *)otherCards
{
    int match=0;
    for(PlayingCard* card in otherCards)
    {
        if([self.suit isEqualToString:card.suit]){
            match+=3;
            self.matched=true;
        }
        if(self.rank==card.rank){
            match+=12;
            self.matched=true;
        }
    }
    return match;
}
@end
