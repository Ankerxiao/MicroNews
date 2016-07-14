//
//  RankVC.h
//  MicroNews
//
//  Created by Anker Xiao on 16/7/4.
//  Copyright © 2016年 AnkerXiao. All rights reserved.
//

#import "BaseVC.h"

#define CUANHONG_API @"http://www.weixinkd.com/v3/article/top/get.json?ad=1&device_type=1&uid=13737897&access=WIfI&version_code=303&type=1&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=0&device_platform=iphone&sign=39e9fe2d5fa83e52ddee572ff304610d&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=66A8DC9A-A153-4253-A7FB-DF3C1291580A"
#define QITIAN_API @"http://www.weixinkd.com/v3/article/top/get.json?ad=1&device_type=1&uid=13737897&access=WIfI&version_code=303&type=2&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=0&device_platform=iphone&sign=0f9999d05ced755ade8f4ec208a3f593&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=D2C098A9-21AB-4939-8C92-26151D131EF6"
#define ZONGBANG_API @"http://www.weixinkd.com/v3/article/top/get.json?ad=1&device_type=1&uid=13737897&access=WIfI&version_code=303&type=3&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=0&device_platform=iphone&sign=e49a22bb92f3019e8c3af3775611842b&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=DCD86B62-1FF9-4097-9D33-5023F21BB856"



//16个分类
#define XIAO_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=5&device_platform=iphone&sign=01ffb4229ac04909f3eb9eda20f3adab&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=2C13BD59-23FC-47CA-9BC5-D81F5F69A6AB"

#define MEI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=2&device_platform=iphone&sign=387ac0b70437236401aecce4ca8944b6&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=CE2DA561-8956-4B76-B2F6-FC6112B965C4"

#define JIAN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=3&device_platform=iphone&sign=523b9a2a87494196bb1558fdfe327bbf&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=84763603-3796-4807-A09C-8B0D1FDEC756"

#define YU_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=19&device_platform=iphone&sign=9302c896fb3243db54924094bddf26a3&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=275AA970-2780-4CD7-9490-5604E117E674"

#define SHE_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=25&device_platform=iphone&sign=a42a16d55874ae9456df4b8d7547d8a0&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=35DFD1D2-ACD8-4F0F-AB6C-E0E6DD01938C"

#define KE_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=10&device_platform=iphone&sign=041b5ea75a45424131b10b3f8634440f&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=32EC4776-5C7D-4023-ACFC-81B5971CEB5E"

#define TI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=1307&device_platform=iphone&sign=f2f3f8741bec04e7d804b117154ac7f4&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=77E6BB1F-53AE-4590-9C3E-03EAC27EC320"

#define SHENG_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=21&device_platform=iphone&sign=adb1f43839f88a03a550d2045c98636d&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=B6DD14D6-3DB5-4E33-A94F-53F7FBCDB5D3"

#define CAI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=11&device_platform=iphone&sign=9992e04add201486c52bd15a840b33a2&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=066E6053-5A8F-4D31-AC7C-44AC03BF84CD"

#define QI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=13&device_platform=iphone&sign=75c3e923fbfb53813a32dc5100792760&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=F6F911A5-B9B0-40FD-B20C-152438D0A33E"

#define TAN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=23&device_platform=iphone&sign=f59cdc408371441fd77659f73714e9ec&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=AF0CF083-769D-46D5-8254-5B31DAA52DB9"

#define MEIS_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=4&device_platform=iphone&sign=3c78a60a9f39e5c69225d1f579dcb98d&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=2B9EC02D-D99C-4CF4-8D35-027299D83924"

#define ZHI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=6&device_platform=iphone&sign=91145a1e37d5890b285932f1783c0fcd&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=BB09262A-71E2-413F-9A51-0F6894BD8578"

#define SHI_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=17&device_platform=iphone&sign=4a8906d070089c0d596d519f731d957e&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=931C4234-97AE-4FFB-BD52-2C4415711E76"

#define LV_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=7&device_platform=iphone&sign=457025904f96811b92007b12b70330f7&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=D72372CD-9B9F-4267-80FC-9667BA09668E"

#define YUL_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=8&device_platform=iphone&sign=1357f6f93927e8bc865bf6470357f974&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=B26EBC52-E120-4983-81A9-8BBAA8F44C17"

#define JIAO_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=9&device_platform=iphone&sign=0870fbab4728a87e503e891798b61163&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=F2C5DEB8-F286-4465-9103-B210CE4F14E0"

#define QING_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=18&device_platform=iphone&sign=0f880806ddf2432f05c902011986b20e&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=C15DFF74-70A8-47B4-9912-54BAC839B83B"

#define XIN_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=16&device_platform=iphone&sign=4f0cf31bc56f2cb29b5a04c45a1b40d3&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=0087256F-72E5-4C9F-BAFC-CDE9D14E566A"

#define CHONG_API @"http://www.weixinkd.com/v3/account/lists.json?access=WIfI&uid=13737897&device_type=1&version_code=303&os_version=9.2.1&device_brand=%E8%8B%B9%E6%9E%9C&device_model=iPad&page=1&catid=24&device_platform=iphone&sign=638ecf9375682158a2a73aec06ea1454&app_version=3.0.3&channel_code=80000000&openudid=9c0e321e1f550df652f08a74525b6c88&uuid=C284D116-9CC0-4633-8574-0FB894A1D702"

@interface RankVC : BaseVC

@end
