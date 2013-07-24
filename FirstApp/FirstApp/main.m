//
//  main.m
//  FirstApp
//
//  Created by Grimi on 7/1/13.
//  Copyright (c) 2013 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h> // Includes libraries which has classes that are helpful in order to make coding easier


//**************************************************************
// 3.1 The program calculates the number of seconds in ten years
//**************************************************************

int secondsInYears(){ // This tell the compiler that the program starts here, inside the brackets you will be able to write arguments
    
    int seconds = 60;
    int minutes = 60;
    int hours = 24;
    double days = 365.25;
    
    float secondsinyears =  seconds * minutes * hours * days * 10;
    
    // insert code here...
    //NSLog(@"The number of seconds in 10 years is :%f",secondsinyears);
    return (int) secondsinyears;
}

//**************************************************************
// 3.2 Conditional statements
//**************************************************************

void conditional(){
    int day = 9;
    day > 0 && day < 6 ? NSLog(@"I hope you're having a good week") : day < 8 ?  NSLog(@"Have a nice weekend!") : NSLog(@"Im sorry that is not a day of the week");
}



//**************************************************************
// 3.3 Switch Statement
//**************************************************************

void switchStatement(){
    
    int hurricaneCategory = 6;
    
    switch (hurricaneCategory) {
        case 1:
            NSLog(@"Category 1! \n Very dangerous winds will produce some damage");
            break;
        case 2:
            NSLog(@"Category 2! \n Extremely dangerous winds will cause extensive damage");
            break;
        case 3:
            NSLog(@"Category 3! \n Devstating damage will occur");
            break;
        case 4:
            NSLog(@"Category 4! \n Catastrophic damage will occur");
            break;
        case 5:
            NSLog(@"Category 5! \n You won't survive that one ;)");
            break;
        
        default:
            NSLog(@"Im sorry thats not a hurricane category, try a number from 1-5");
            break;
    }
}


//**************************************************************
// 3.4 Code Snippets                ***--- 30 seconds ---***
//**************************************************************

void codeSnippet(){
    for (int i = 1; i<4; i++) {
        // statements
    }
}


//**************************************************************
//                      Example
//**************************************************************

void maxvalues(){
    NSLog(@"SHRT_MIN:   %i",  SHRT_MIN);
    NSLog(@"SHRT_MAX:   %i",  SHRT_MAX);
    NSLog(@"SHRT_MAX:   %i",  USHRT_MAX);
    
}

//**************************************************************
//                      Main
//**************************************************************

int main(int argc, const char * argv[]) // This tell the compiler that the program starts here, inside the brackets you will be able to write arguments
{

    @autoreleasepool { // Memory management thingy!
        
        // insert code here...
        
        conditional();
        switchStatement();
        maxvalues();
        NSLog(@"The number of seconds in 10 years is :%i\n",secondsInYears()); // NSLog let us print information to the console log in this case "Hello, World" will be outputed
        
    }
    return 0; // This return a 0, returns can help us to identify errors in our programs
}




