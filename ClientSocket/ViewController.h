//
//  ViewController.h
//  ClientSocket
//
//  Created by yangrui on 2017/8/14.
//  Copyright © 2017年 yangrui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end


/** 
 
 长连接和短连接
 
1. socket 层上的协议 指的是 数据传输的格式

 
 xmpp 协议 是一款即时通讯协议,是可扩展的消息处理协议,是基于可扩展标记语言xml的协议,它用于即时通信(IM) 以及在线现场探测.
 
 
 
 以一封信为例:
 TCP /UDP (数据传输方式)  就相当于你选择的是邮政 还是顺丰一样
 http /xmpp (数据传输格式)  就相当于你选择的是中文 还是英文一样
 
 */

/** 
 
 即时通讯 ,又称实时通讯 (instant messaging )
 
 
 即时通讯的实现方式: 
 XMPP 
 环信
 
 1> xmpp : The Extensible Messageing and Presence Peotocal 可扩展通讯和表示协议
 2> xmpp 是一种基于xml 的即时通讯协议,xmpp 的官方文档是RFC 3920
    这个文档定义了登录\退出\获取好友\发送消息等的xml 数据传输协议
 3> xmpp 是一个典型的c/s 架构,基本的网络形式是客户端通过 tcp/ip 连接到服务器,通过socket 建立连接,然后在之上传输xmlliu
 4> xmpp 是一种类似于http 协议的一种数据传输协议,其过程就如同 "解包装 -> 包装"的过程.只需要理解其接受的数据类型及返回的数据类型,便可以很好的利用xmpp来进行数据通讯
 5> xmpp 官网 http://xmpp.org
 
 
 环信和xmpp 的关系?
 > xmpp  是一个开源组织,他把客户端和服务端的事情都做了,只是功能不够强大
 > 环信是在xmpp 的基础上进行改造 (二次开发)
 
 关于环信的具体说明:
 什么是环信?
 1> 环信是一个第三方平台,提供及时通信(IM- instant Messaging)的服务
 2> 环信是在xmpp 的基础上进行二次开发
 3> 环信在网络上传输的也是XML
 4> 使用环信,不用自己搭建服务器,节约成本
 5> 环信日活动30万以下,永久免费
 6> 2015 年上半年,易观发布中国移动IM云报告,环信稳居市场第一
 7> 公司如要开发即时通信,建议使用环信,市占份额大
 
 */



/** 集成环信的前提准备
 
 1> 注册成为环信的开发者  http://www.wasemob.com
 2> 在开发者后台创建app 获取key
 3> 下载官方sdk
 
 
 
 
 */

























