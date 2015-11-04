/*
    Temperature.m
    Simple model object storing a temperature value, that can be set or get using the Celsius, Fahrenheit, or Kelvin scales.
    Ali Ozer
    Copyright (c) 2003-2006, Apple Computer, Inc., all rights reserved.
*/
/*
 IMPORTANT:  This Apple software is supplied to you by Apple Computer, Inc. ("Apple") in
 consideration of your agreement to the following terms, and your use, installation, 
 modification or redistribution of this Apple software constitutes acceptance of these 
 terms.  If you do not agree with these terms, please do not use, install, modify or 
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and subject to these 
 terms, Apple grants you a personal, non-exclusive license, under Apple�s copyrights in 
 this original Apple software (the "Apple Software"), to use, reproduce, modify and 
 redistribute the Apple Software, with or without modifications, in source and/or binary 
 forms; provided that if you redistribute the Apple Software in its entirety and without 
 modifications, you must retain this notice and the following text and disclaimers in all 
 such redistributions of the Apple Software.  Neither the name, trademarks, service marks 
 or logos of Apple Computer, Inc. may be used to endorse or promote products derived from 
 the Apple Software without specific prior written permission from Apple. Except as expressly
 stated in this notice, no other rights or licenses, express or implied, are granted by Apple
 herein, including but not limited to any patent rights that may be infringed by your 
 derivative works or by other works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO WARRANTIES, 
 EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, 
 MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS 
 USE AND OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR CONSEQUENTIAL 
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
 OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, 
 REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND 
 WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR 
 OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/
#import "Temperature.h"

@implementation Temperature

/* Since our storage is celsius, and the other values are just computed, we declare that a change in celsius causes change in fahrenheit and kelvin values.
*/
+ (void)initialize {
    if (self == [Temperature class]) {
        [self setKeys:[NSArray arrayWithObject:@"celsius"] triggerChangeNotificationsForDependentKey:@"fahrenheit"];
        [self setKeys:[NSArray arrayWithObject:@"celsius"] triggerChangeNotificationsForDependentKey:@"kelvin"];		
    }
}

/* Methods to set/get the celsius value simply work in terms of the stored value.  Strictly speaking, these two methods are not necessary, since the celsius value can be set/get with key value coding, that is, with setValue:forKey: and valueForKey:. However, having explicit methods that take the right kind of argument provide a better programming experience, both internally to this class and for any clients.
*/
- (void)setCelsius:(double)degreesC {
    celsius = degreesC;
}

- (double)celsius {
    return celsius;
}

/* These methods simply set the stored value in celsius based on the incoming kelvin or fahrenheit value, or get the value from celsius. 
*/
- (void)setKelvin:(double)degreesK {
    [self setCelsius:degreesK - 273.15];
}

- (double)kelvin {
    return [self celsius] + 273.15;
}

- (void)setFahrenheit:(double)degreesF {
    [self setCelsius:(degreesF - 32) / 1.8];
}

- (double)fahrenheit {
    return [self celsius] * 1.8 + 32;
}

@end
