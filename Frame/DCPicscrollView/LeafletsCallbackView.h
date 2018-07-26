//
//  LeafletsCallbackView.h
//  fdshajda
//
//  Created by 张加勇 on 16/4/12.
//  Copyright © 2016年 CGZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeafletsCallbackView : UIView
{
    void (^moreViewClick)();//声明一个block
}

- (id)initWithFrame:(CGRect)frame block:(void (^) ()) moreclick url:(NSString *)url zhanweitu:(NSString *)zhanweitu;
@end
