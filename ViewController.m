//
//  ViewController.m
//  CardMatchingGame
//
//  Created by apple on 12.05.2016.
//  Copyright © 2016 karol. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Game.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;

@property (weak, nonatomic) IBOutlet UILabel *score;
- (IBAction)onCardButtonClick:(UIButton *)sender;
@property(strong, nonatomic) Deck* deck;
@property(strong, nonatomic) Game* game;

@end

@implementation ViewController

-(Deck *)deck
{
    if(!_deck)
        _deck=[[PlayingCardDeck alloc]init];
    return _deck;
}
-(Game *)game
{
    if(!_game)
        _game=[[Game alloc] initWithNumberOfCards:([self.cards count]) andDeck:self.deck];
    return _game;
}

- (IBAction)onCardButtonClick:(UIButton *)sender {
    
    NSUInteger index=[self.cards indexOfObject:sender];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
    
}
-(void)updateUI
{
    for(UIButton* cardButton in self.cards){
        NSUInteger index=[self.cards indexOfObject:cardButton];
        Card* card=[self.game cardAtIndex:index];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self imageForCard:card] forState:UIControlStateNormal];
        if(card.isMatched)
            [cardButton setEnabled:NO];
    }
    [self.score setText:[NSString stringWithFormat:@"score: %d",self.game.score]];
}
-(NSString*) titleForCard:(Card*)card
{
    if(card.isPicked){
        return card.label;
    }
    else
        return @"";
}
-(UIImage*) imageForCard:(Card*)card
{
    if(card.isPicked)
        return [UIImage imageNamed:@"cardfront"];
    else
        return [UIImage imageNamed:@"cardback"];
}
@end
