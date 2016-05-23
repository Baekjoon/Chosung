//
//  main.m
//  ChosungConvert
//
//  Created by Baekjoon Choi on 5/23/16.
//  Copyright © 2016 Megalusion. All rights reserved.
//

#import <Foundation/Foundation.h>

// ㄱ ㄴ ㄷ (3)
// ㅏ ㅑ (2)
// 없음 ㅇ ㅅ (3)

// 가 강 갓 갸 걍 걋  나 낭 낫 냐 냥 냣 다 당 닷 댜 댱 댯 (18개)
// --------------  ------------- --------------
//       가 (6개)        나 (6개)       다 (6개)
// ------- ------
//    ㅏ      ㅑ
// (2*3)*cho + 3*jung + jong = 번째
// (2, 0, 1) = 2*3*2 + 3*0 + 1 = 13
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 초성 ㄱ ㄲ ㄴ ㄷ ㄸ ㄹ ㅁ ㅂ ㅃ ㅅ ㅆ ㅇ ㅈ ㅉ ㅊ ㅋ ㅌ ㅍ ㅎ (19개)
        // 중성 21개
        // 종성 28개
        // 19 * 21 * 28
        // 0xAC00 + 21*28*cho + 28*jung + jong = 최
        NSArray *chosungs = @[@"ㄱ", @"ㄲ", @"ㄴ", @"ㄷ", @"ㄸ", @"ㄹ", @"ㅁ", @"ㅂ", @"ㅃ", @"ㅅ", @"ㅆ", @"ㅇ", @"ㅈ", @"ㅉ", @"ㅊ", @"ㅋ", @"ㅌ", @"ㅍ", @"ㅎ"];
        NSString *name = @"최백준";
        NSLog(@"%@",name);
        NSMutableString *result = [NSMutableString string];
        for (NSUInteger i=0; i<[name length]; i++) {
            unichar c = [name characterAtIndex:i];
            NSLog(@"%tu %C %zd", i, c, (NSInteger)c);
            NSInteger x = (NSInteger)c - 0xAC00;
            NSLog(@"%zd 번째", x);
            // 21*28*cho + 28*jung + jong = x
            // 28*(21*cho + jung) + jong = x
            NSInteger jong = x % 28;
            // 28*(21*cho + jung) = x
            x = x - jong;
            // 21*cho + jung = x
            x = x / 28;
            NSInteger jung = x % 21;
            x -= jung;
            // 21*cho = x
            NSInteger cho = x / 21;
            NSString *chosung = chosungs[cho];
            NSLog(@"%C %zd 번째 초성 %@", c, cho, chosung);
            [result appendString:chosung];
        }
        NSLog(@"%@",result);
    }
    return 0;
}
