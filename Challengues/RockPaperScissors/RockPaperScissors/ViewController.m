//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Don Bora on 4/24/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"
#import "Judge.h"
#import "Randomizer.h"

@interface ViewController ()
{
    NSArray*                choices;
    NSTimer*                timer;
    int                     count;


    __weak IBOutlet UILabel *countDownLabel;
    __weak IBOutlet UILabel *computerHandLabel;
    __weak IBOutlet UILabel *playerHandLabel;
}
- (IBAction)start:(id)sender;
- (IBAction)rock:(id)sender;
- (IBAction)paper:(id)sender;
- (IBAction)scissors:(id)sender;
@end

@implementation ViewController

-(void)showWinner
{
    Judge * decision = [[Judge alloc]init];
    
    NSString * computer;
    NSString * player;
    BOOL computerWon;
    BOOL bandera;
    player = playerHandLabel.text;
    computer = computerHandLabel.text;
    
        bandera = [computer isEqualToString: player];
    
    
    
    
    if (bandera){
        computerHandLabel.backgroundColor = [UIColor greenColor];
        playerHandLabel.backgroundColor = [UIColor greenColor];
        NSLog(@"%@   %@",player,computer);
        
    }
    else
    {
        computerWon = [decision didComputerWin:computer humanString:player];
       if (computerWon) {
            computerHandLabel.backgroundColor = [UIColor greenColor];
           NSLog(@"%@   %@",player,computer);
        }else{
            playerHandLabel.backgroundColor = [UIColor greenColor];
            NSLog(@"%@   %@",player,computer);
        }
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    choices = @[@"rock", @"paper", @"scissors"];
    count = 3;
    [self updateCount];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)updateCount
{
    countDownLabel.text = [NSString stringWithFormat:@"%i", count];
}


-(void)countDown
{
    count--;
    [self updateCount];
    
    if (count == 0) {
        
        [timer invalidate];
        count = 4;
        Randomizer * computerchoice = [[Randomizer alloc]init];
        computerHandLabel.text = [computerchoice random];
        [self showWinner];
    }
}


- (IBAction)start:(id)sender
{
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    playerHandLabel.backgroundColor = [UIColor whiteColor];
    computerHandLabel.backgroundColor = [UIColor whiteColor];

}

- (IBAction)rock:(id)sender
{
    playerHandLabel.text = @"rock";
}

- (IBAction)paper:(id)sender
{
    playerHandLabel.text = @"paper";
}

- (IBAction)scissors:(id)sender
{
    playerHandLabel.text = @"scissors";
}


@end
