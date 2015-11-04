/* Temperature */

#import <Cocoa/Cocoa.h>

@interface Temperature : NSObject {
    double celsius;
}

- (void)setCelsius:(double)degreesC;
- (double)celsius;

- (void)setKelvin:(double)degreesK;
- (double)kelvin;

- (void)setFahrenheit:(double)degreesF;
- (double)fahrenheit;

@end
