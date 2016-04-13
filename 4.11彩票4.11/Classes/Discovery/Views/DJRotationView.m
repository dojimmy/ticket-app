//
//  DJRotationView.m
//  4.11幸运转盘4.11
//
//  Created by 邓金明 on 16/4/11.
//  Copyright © 2016年 邓金明. All rights reserved.
//

#import "DJRotationView.h"
#import "DJButton.h"

@interface DJRotationView ()

@property (weak, nonatomic) IBOutlet UIImageView *rotationWheel;

@property (nonatomic,strong) DJButton *selectedBtn;

@property (nonatomic,strong) CADisplayLink *link;

@end

@implementation DJRotationView

-(void)willMoveToSuperview:(UIView *)newSuperview{

    [super willMoveToSuperview:newSuperview];
    
    [self autoRotate];
}


+(instancetype)rotationView{

    return [[[NSBundle mainBundle] loadNibNamed:@"DJRotationView" owner:nil options:nil] lastObject];
    
}
- (IBAction)startPickBtnClick:(UIButton *)sender {
    
    [self.link invalidate];
    self.link = nil;
    
    CABasicAnimation *basicAni = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
    basicAni.delegate = self;
    
    //每个按钮旋转的弧度
    CGFloat angle = 2 * M_PI / 12;
    
    basicAni.toValue = @(2 * M_PI * 5 - self.selectedBtn.tag * angle);
    
    
    basicAni.duration = 3;
    
    
    [self.rotationWheel.layer addAnimation:basicAni forKey:nil];
    
    self.rotationWheel.userInteractionEnabled = NO;
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{


    //每个按钮旋转的弧度
    CGFloat angle = 2 * M_PI / 12;
    
    self.rotationWheel.transform = CGAffineTransformMakeRotation(2 * M_PI * 5 - self.selectedBtn.tag * angle);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"幸运号码" message:@"88888888" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        self.rotationWheel.userInteractionEnabled = YES;
        [self autoRotate];
    }];
    
    [alert addAction:confirm];
    
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    [[self viewController] presentViewController:alert animated:YES completion:nil];
    
//    [vc presentViewController:alert animated:YES completion:nil];
}



//得到此view 所在的viewController
 - (UIViewController*)viewController {
    for (UIView* next = self.superview; next; next =
         next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController
                                         class]]) {
            
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}





-(void)awakeFromNib{

    for (int i =0; i<12; i++) {
        
        DJButton *btn = [[DJButton alloc] init];
        
        btn.bounds = CGRectMake(0, 0, 68, 143);
        
        btn.center = self.rotationWheel.center;
        
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        
        
        CGFloat angle = 2 * M_PI / 12;
        
        btn.transform = CGAffineTransformMakeRotation(i * angle);
        
        
        
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        
        UIImage *norImage = [self clipImgWithImgName:@"LuckyAstrology" andIndex:i];
        
        [btn setImage:norImage forState:UIControlStateNormal];
        
        UIImage *selImage = [self clipImgWithImgName:@"LuckyAstrologyPressed" andIndex:i];
        
        
        [btn setImage:selImage forState:UIControlStateSelected];
        
        [self.rotationWheel addSubview:btn];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
    }
    
    
    
}

//自动旋转
-(void)autoRotate{

    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(autoRotation)];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}
//自动旋转的方法
-(void)autoRotation{

    self.rotationWheel.transform = CGAffineTransformRotate(self.rotationWheel.transform, M_PI_4 * 0.01);
}


//点击星座
-(void)btnClick:(DJButton *)btn{

    self.selectedBtn.selected = NO;
    
    btn.selected = YES;
    
    self.selectedBtn = btn;
    
    
}



//裁剪图片
-(UIImage *)clipImgWithImgName:(NSString *)imgName andIndex:(NSInteger)index{

    UIImage *img = [UIImage imageNamed:imgName];
    
    CGFloat w = img.size.width / 12;
    
    CGFloat h = img.size.height;
    
    CGFloat x = index * w;
    
    CGFloat y = 0;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    
    CGImageRef imgRef = CGImageCreateWithImageInRect(img.CGImage, CGRectMake(x * scale, y * scale, w * scale, h * scale));
    
    img = [UIImage imageWithCGImage:imgRef];
    
    CGImageRelease(imgRef);
    
    return img;
}

@end
