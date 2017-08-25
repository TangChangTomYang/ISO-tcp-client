//
//  ViewController.m
//  ClientSocket
//
//  Created by yangrui on 2017/8/14.
//  Copyright © 2017年 yangrui. All rights reserved.
//

#import "ViewController.h"
#import "GCDAsyncSocket.h"


@interface ViewController ()<GCDAsyncSocketDelegate>

@property (weak, nonatomic) IBOutlet UIButton *connectBtn;

@property (weak, nonatomic) IBOutlet UILabel *statusLb;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// 客户端的socket
@property(nonatomic, strong)GCDAsyncSocket *clientSocket;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
  
    
}




#pragma mark- GCDAsyncSocketDelegate 
// 当客户端的socket 和服务器端的socket成功建立连接就会调用这个房法
- (void)socket:(GCDAsyncSocket *)clientSock didConnectToHost:(NSString *)host port:(uint16_t)port{
   
    
    NSString *msg = [NSString  stringWithFormat:@"didConnectToHost : %@, port : %d",host,port];
     NSLog(@"didConnectsock :%@",clientSock);
    
    // 当建立socket连接后就需要监听socket 这样才能 读取到写入的数据
    [clientSock readDataWithTimeout:-1 tag:0];
    
    dispatch_async(dispatch_get_main_queue(), ^{
         self.statusLb.text = msg;
    });
    
    
    
    // 使用这个方法也可以 从当前线程往主线程中添加任务 并在主线程中执行
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
    }];
   
}

// 当客户端的socket 和服务端的socket 连接失败(连接不上)就会调用这个方法
-(void)socketDidDisconnect:(GCDAsyncSocket *)clientSocket withError:(NSError *)err{
    NSLog(@"socketDidDisconnect %@",clientSocket);
}


// 当客户端 读取到数据就会调用这个方法
-(void)socket:(GCDAsyncSocket *)clientSock didReadData:(NSData *)data withTag:(long)tag{

    // 解析读取到的数据
    
    NSLog(@"   读取到了数据: %@",data);
    
    // 继续监听socket
    
    [clientSock readDataWithTimeout:-1 tag:0];

}

#pragma mark- 私有方法


// 连接到服务器
-(void)connectToHost:(NSString *)host port:(NSInteger)port{
    self.clientSocket = nil;
    
    
    GCDAsyncSocket *clientSocket = [[GCDAsyncSocket alloc]initWithDelegate:self delegateQueue:dispatch_get_global_queue(0, 0)];
    
    // 连接到服务器 : 可以是IP 或者是域名
    NSError *err = nil;
    [clientSocket connectToHost:host onPort:port withTimeout:10 error:&err];
    
    self.clientSocket = clientSocket;
    
     NSLog(@"self.clientSocket:%@",self.clientSocket);
}

- (IBAction)connectBtnClick:(id)sender {
    
    [self connectToHost:@"127.0.0.1" port:52880];
}

@end
