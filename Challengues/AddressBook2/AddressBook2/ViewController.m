//
//  ViewController.m
//  AddressBook2
//
//  Created by Grimi on 7/22/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray * personsArray;
    __weak IBOutlet UITableView *tableViewContacts;
    BOOL editing;
}
- (IBAction)addContact:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:(NSCoder*)aDecoder];
    if (self) {
    Person * person1 = [[Person alloc] init];
    Person * person2 = [[Person alloc] init];
    Person * person3 = [[Person alloc] init];
    person1.firstName = @"Perrito";
    person1.lastName = @"Volador";
    person1.emailAddress = @"perrito.volador@hotmail.com";
    person1.phoneNumber = @"8120405";
    person2.firstName = @"Gato";
    person2.lastName = @"Volador";
    person2.emailAddress = @"gato.volador@hotmail.com";
    person2.phoneNumber = @"8145245";
    person3.firstName = @"Rana";
    person3.lastName = @"Feliz";
    person3.emailAddress = @"rana.feliz@hotmail.com";
    person3.phoneNumber = @"8560405";
    personsArray = [NSMutableArray arrayWithObjects:person1,person2,person3, nil];
    NSLog(@"Hola");
    }
    return self;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"things"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"things"];
    }
    NSLog(@"%@ %@",[[personsArray objectAtIndex:indexPath.row] firstName], [[personsArray objectAtIndex:indexPath.row] lastName]);
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[[personsArray objectAtIndex:indexPath.row] firstName], [[personsArray objectAtIndex:indexPath.row] lastName]];
    NSLog(@"%i",indexPath.row);
    
    return cell;
    
}

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [personsArray count];
}

-(int) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Persons";
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toShowView" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ShowViewController * showViewController = segue.destinationViewController;
    showViewController.recievedPerson = [personsArray objectAtIndex:tableViewContacts.indexPathForSelectedRow.row];

}
                                         

- (IBAction)addContact:(id)sender {
    editing = YES;
    Person * newContact = [[Person alloc] init];
    [self performSegueWithIdentifier:@"addContactIdentifier" sender:self];
    
}

@end
