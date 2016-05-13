//
//  PlayingCard.h
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(strong, nonatomic) NSString*  suit;
@property(nonatomic) NSInteger rank;

+(NSArray*)validSuits;
+(NSUInteger)maxRank;
+(NSArray*)rankStrings;

@end
