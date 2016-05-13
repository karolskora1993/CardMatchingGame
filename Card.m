//
//  Card.m
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "Card.h"

@implementation Card

-(NSString *)label
{
    if(!_label)
        _label=[[NSString alloc]init];
    return _label;
}
-(int)matchWithOtherCards:(NSArray *)otherCards
{
    int match=0;
    
    for(Card* card in otherCards)
    {
        if([self.label isEqualToString:card.label])
            match+=1;
    }
    return match;
}
@end
