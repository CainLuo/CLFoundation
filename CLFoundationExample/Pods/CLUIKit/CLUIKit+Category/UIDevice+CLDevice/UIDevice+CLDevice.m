//
// __    ______  ______      __     ___    _
//   /  __)    /  \    (_    _) |    \  |  |
//  |  /      /    \     |  |   |  |\ \ |  |
//  | |      /  ()  \    |  |   |  | \ \|  |
//  |  \__  |   __   |  _|  |_  |  |  \    |
//  _\    )_|  (__)  |_(      )_|  |___\   |_
//
//  UIDevice+CLDevice.m
//
//  Created by Cain Luo on 11/10/16.
//  Copyright © 2016年 Cain Luo. All rights reserved.
//

#import "UIDevice+CLDevice.h"

#import <sys/utsname.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

#include <ifaddrs.h>
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#include <mach/mach.h> // 获取CPU信息所需要引入的头文件

#import <sys/ioctl.h>
#import <arpa/inet.h>

@implementation UIDevice (CLDevice)

#pragma mark - 设备相关
+ (NSString *)cl_getSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)cl_getDeviceName {
    
    return [[UIDevice currentDevice] name];
}

+ (NSString *)cl_getDeviceModelType {
    return [[UIDevice currentDevice] model];
}

+ (NSString *)cl_getUUIDString {
    
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

+ (BOOL)cl_isXDeviceModel {
    
    NSString *cl_modelName = [self cl_getCurrentDeviceModelName];
    
    BOOL cl_isX     = [cl_modelName isEqualToString:@"iPhone X"];
    BOOL cl_isXS    = [cl_modelName isEqualToString:@"iPhone XS"];
    BOOL cl_isXR    = [cl_modelName isEqualToString:@"iPhone XR"];
    BOOL cl_isXSMax = [cl_modelName isEqualToString:@"iPhone XS Max"];

    return cl_isX || cl_isXS || cl_isXR || cl_isXSMax;
}

+ (NSString *)cl_getCurrentDeviceModelName {
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSASCIIStringEncoding];
    
    if([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    
    if([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    if([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    if([platform isEqualToString:@"iPhone8,4"]) return @"iPhone SE";
    
    if([platform isEqualToString:@"iPhone9,1"]) return @"iPhone 7";
    if([platform isEqualToString:@"iPhone9,2"]) return @"iPhone 7 Plus";
    
    if([platform isEqualToString:@"iPhone10,1"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,4"]) return @"iPhone 8";
    if([platform isEqualToString:@"iPhone10,2"]) return @"iPhone 8 Plus";
    if([platform isEqualToString:@"iPhone10,5"]) return @"iPhone 8 Plus";
    
    if([platform isEqualToString:@"iPhone10,3"]) return @"iPhone X";
    if([platform isEqualToString:@"iPhone11,2"]) return @"iPhone XS";
    if([platform isEqualToString:@"iPhone11,4"]) return @"iPhone XS Max";
    if([platform isEqualToString:@"iPhone11,6"]) return @"iPhone XS Max";
    if([platform isEqualToString:@"iPhone11,8"]) return @"iPhone XR";
    
    if([platform isEqualToString:@"iPad4,1"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,2"]) return @"iPad Air";
    if([platform isEqualToString:@"iPad4,3"]) return @"iPad Air";
    
    if([platform isEqualToString:@"iPad4,4"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,5"]) return @"iPad Mini 2G";
    if([platform isEqualToString:@"iPad4,6"]) return @"iPad Mini 2G";
    
    if([platform isEqualToString:@"iPad4,7"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,8"]) return @"iPad Mini 3";
    if([platform isEqualToString:@"iPad4,9"]) return @"iPad Mini 3";
    
    if([platform isEqualToString:@"iPad5,1"]) return @"iPad Mini 4";
    if([platform isEqualToString:@"iPad5,2"]) return @"iPad Mini 4";
    
    if([platform isEqualToString:@"iPad5,3"]) return @"iPad Air 2";
    if([platform isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    
    if([platform isEqualToString:@"iPad6,3"]) return @"iPad Pro 9.7";
    if([platform isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7";
    
    if([platform isEqualToString:@"iPad7,3"]) return @"iPad Pro 10.5";
    if([platform isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5";

    if([platform isEqualToString:@"iPad6,7"]) return @"iPad Pro 12.9";
    if([platform isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9";
    
    if([platform isEqualToString:@"iPad6,11"]) return @"iPad 5";
    if([platform isEqualToString:@"iPad6,12"]) return @"iPad 5";

    if([platform isEqualToString:@"iPad7,1"]) return @"iPad Pro 12.9 inch 2nd gen";
    if([platform isEqualToString:@"iPad7,2"]) return @"iPad Pro 12.9 inch 2nd gen";
    if([platform isEqualToString:@"iPad7,3"]) return @"iPad Pro 10.5";
    if([platform isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5";
    if([platform isEqualToString:@"iPad7,5"]) return @"iPad 6";
    if([platform isEqualToString:@"iPad7,6"]) return @"iPad 6";

    if([platform isEqualToString:@"Watch1,1"]) return @"Apple Watch";
    if([platform isEqualToString:@"Watch1,2"]) return @"Apple Watch";
    
    if([platform isEqualToString:@"Watch2,6"]) return @"Apple Watch Series 1";
    if([platform isEqualToString:@"Watch2,7"]) return @"Apple Watch Series 1";
    
    if([platform isEqualToString:@"Watch2,3"]) return @"Apple Watch Series 2";
    if([platform isEqualToString:@"Watch2,4"]) return @"Apple Watch Series 2";
    
    if([platform isEqualToString:@"Watch3,1"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,2"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,3"]) return @"Apple Watch Series 3";
    if([platform isEqualToString:@"Watch3,4"]) return @"Apple Watch Series 3";

    if([platform isEqualToString:@"Watch4,1"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,2"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,3"]) return @"Apple Watch Series 4";
    if([platform isEqualToString:@"Watch4,4"]) return @"Apple Watch Series 4";

    if([platform isEqualToString:@"i386"]) return @"iPhone Simulator";
    
    if([platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
}

+ (BOOL)cl_isPhone {
    
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
}

+ (BOOL)cl_isPad {
    
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+ (BOOL)cl_isCarPlay API_AVAILABLE(ios(9.0)) {
    
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomCarPlay;
}

+ (BOOL)cl_isTV API_AVAILABLE(ios(9.0)) {
    
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomTV;
}

+ (BOOL)cl_isSimulator {
    
    return NSNotFound != [[self cl_getDeviceModelType] rangeOfString:@"Simulator"].location;
}

+ (BOOL)cl_isJailbroken {
    
    if ([self cl_isSimulator]) {
        
        return NO;
    }
    
    NSArray *cl_pathArray = @[@"/Applications/Cydia.app",
                              @"/private/var/lib/apt/",
                              @"/private/var/lib/cydia",
                              @"/private/var/stash"];
    
    for (NSString *cl_pathString in cl_pathArray) {
        
        if ([[NSFileManager defaultManager] fileExistsAtPath:cl_pathString]) {
            
            return YES;
        }
    }
    
    FILE *bash = fopen("/bin/bash", "r");
    
    if (bash != NULL) {
        
        fclose(bash);
        
        return YES;
    }
    
    NSString *cl_pathString = [NSString stringWithFormat:@"/private/%@", [self cl_getUUIDString]];
    
    BOOL cl_haveTest = [@"test" writeToFile:cl_pathString
                                 atomically:YES
                                   encoding:NSUTF8StringEncoding
                                      error:NULL];
    
    if (cl_haveTest) {
        
        [[NSFileManager defaultManager] removeItemAtPath:cl_pathString
                                                   error:nil];
        
        return YES;
    }
    
    return NO;
}

#pragma mark - CPU相关
+ (NSUInteger)cl_getCurrentDeviceCPUCount {
    return [NSProcessInfo processInfo].activeProcessorCount;
}

+ (CGFloat)cl_getCurrentDeviceAllCoreCPUUse {
    
    CGFloat cpu = 0;
    
    NSArray *cpus = [self cl_getCurrentDeviceSingleCoreCPUUse];
    
    if (cpus.count == 0) return -1;
    
    for (NSNumber *n in cpus) {
        cpu += n.floatValue;
    }
    return cpu;
}

+ (NSArray *)cl_getCurrentDeviceSingleCoreCPUUse {
    
    processor_info_array_t _cpuInfo, _prevCPUInfo = nil;
    mach_msg_type_number_t _numCPUInfo, _numPrevCPUInfo = 0;
    
    unsigned _numCPUs;
    NSLock *_cpuUsageLock;
    
    int _mib[2U] = {CTL_HW, HW_NCPU};
    
    size_t _sizeOfNumCPUs = sizeof(_numCPUs);
    
    int _status = sysctl(_mib, 2U, &_numCPUs, &_sizeOfNumCPUs, NULL, 0U);
    
    if (_status) {
        _numCPUs = 1;
    }
    
    _cpuUsageLock = [[NSLock alloc] init];
    
    natural_t _numCPUsU = 0U;
    
    kern_return_t err = host_processor_info(mach_host_self(), PROCESSOR_CPU_LOAD_INFO, &_numCPUsU, &_cpuInfo, &_numCPUInfo);
    
    if (err == KERN_SUCCESS) {
        
        [_cpuUsageLock lock];
        
        NSMutableArray *cpus = [NSMutableArray new];
        
        for (unsigned i = 0U; i < _numCPUs; ++i) {
            
            Float32 _inUse, _total;
            
            if (_prevCPUInfo) {
                
                _inUse = ((_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM])
                          + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]   - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE]));
                
                _total = _inUse + (_cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE] - _prevCPUInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE]);
                
            } else {
                
                _inUse = _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_USER] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_SYSTEM] + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_NICE];
                _total = _inUse + _cpuInfo[(CPU_STATE_MAX * i) + CPU_STATE_IDLE];
            }
            
            [cpus addObject:@(_inUse / _total)];
        }
        
        [_cpuUsageLock unlock];
        
        if (_prevCPUInfo) {
            
            size_t prevCpuInfoSize = sizeof(integer_t) * _numPrevCPUInfo;
            
            vm_deallocate(mach_task_self(), (vm_address_t)_prevCPUInfo, prevCpuInfoSize);
        }
        
        return cpus;
        
    } else {
        
        return nil;
    }
}

#pragma mark - 网络相关
+ (NSString *)cl_getCarrierName {
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    CTCarrier *carrier = [info subscriberCellularProvider];
    
    return [NSString stringWithFormat:@"%@", [carrier carrierName]];
}

+ (NSString *)cl_getCurrentRadioAccessTechnology {
    
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    
    return [[NSString alloc] initWithFormat:@"%@", info.currentRadioAccessTechnology];
}

+ (NSString *)cl_getCurrentDeviceIPAddresses {
    
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    
    struct ifconf ifc;
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    struct ifreq *ifr, ifrcopy;
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            ifr = (struct ifreq *)ptr;
            
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                
                len = ifr->ifr_addr.sa_len;
            }
            
            ptr += sizeof(ifr->ifr_name) + len;
            
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            
            ifrcopy = *ifr;
            
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            
            [ips addObject:ip];
        }
    }
    
    close(sockfd);
    
    NSString *deviceIP = @"";
    
    for (NSInteger i = 0; i < ips.count; i++) {
        
        if (ips.count > 0) {
            
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    
    return deviceIP;
}

+ (NSString *)cl_getCurrentDeviceIPAddressWithWiFi {
    return [self cl_getCurrentDeviceIPAddressWithName:@"en0"];
}

+ (NSString *)cl_getCurrentDeviceIPAddressWithCell {
    return [self cl_getCurrentDeviceIPAddressWithName:@"pdp_ip0"];
}

+ (NSString *)cl_getCurrentDeviceIPAddressWithName:(NSString *)name {
    
    if (name.length == 0) return nil;
    
    NSString *address = nil;
    
    struct ifaddrs *addrs = NULL;
    
    if (getifaddrs(&addrs) == 0) {
        
        struct ifaddrs *addr = addrs;
        
        while (addr) {
            
            if ([[NSString stringWithUTF8String:addr->ifa_name] isEqualToString:name]) {
                
                sa_family_t family = addr->ifa_addr->sa_family;
                
                switch (family) {
                        
                    case AF_INET: { // IPv4
                        
                        char str[INET_ADDRSTRLEN] = {0};
                        
                        inet_ntop(family, &(((struct sockaddr_in *)addr->ifa_addr)->sin_addr), str, sizeof(str));
                        
                        if (strlen(str) > 0) {
                            
                            address = [NSString stringWithUTF8String:str];
                        }
                        
                    } break;
                        
                    case AF_INET6: { // IPv6
                        
                        char str[INET6_ADDRSTRLEN] = {0};
                        
                        inet_ntop(family, &(((struct sockaddr_in6 *)addr->ifa_addr)->sin6_addr), str, sizeof(str));
                        
                        if (strlen(str) > 0) {
                            
                            address = [NSString stringWithUTF8String:str];
                        }
                    }
                        
                    default: break;
                }
                
                if (address) break;
            }
            
            addr = addr->ifa_next;
        }
    }
    
    freeifaddrs(addrs);
    
    return address ? address : @"The Device Don't Have IP Address";
}

#pragma mark - 存储相关
+ (int64_t)cl_getDiskSpace {
    
    NSError *cl_error = nil;
    
    NSDictionary *cl_homeDictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                              error:&cl_error];
    
    if (cl_error) {
        return -1;
    }
    
    int64_t cl_space =  [[cl_homeDictionary objectForKey:NSFileSystemSize] longLongValue];
    
    if (cl_space < 0) {
        cl_space = -1;
    }
    
    return cl_space;
}

+ (int64_t)cl_getDiskSpaceFree {
    
    NSError *cl_error = nil;
    
    NSDictionary *cl_homeDictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory()
                                                                                              error:&cl_error];
    
    if (cl_error) {
        return -1;
    }

    int64_t cl_spaceFree =  [[cl_homeDictionary objectForKey:NSFileSystemFreeSize] longLongValue];
    
    if (cl_spaceFree < 0) {
        cl_spaceFree = -1;
    }
    
    return cl_spaceFree;
}

+ (int64_t)cl_getDiskSpaceUsed {
    
    int64_t cl_totalSpace = [self cl_getDiskSpace];
    int64_t cl_spaceFree  = [self cl_getDiskSpaceFree];
    
    if (cl_totalSpace < 0 || cl_spaceFree < 0) {
        return -1;
    }
    
    int64_t cl_availableSpace = cl_totalSpace - cl_spaceFree;
    
    if (cl_availableSpace < 0) {
        cl_availableSpace = -1;
    }
    
    return cl_availableSpace;
}

#pragma mark - 内存相关
+ (int64_t)cl_getMemoryTotal {
    
    int64_t cl_memoryTotal = [[NSProcessInfo processInfo] physicalMemory];
    
    if (cl_memoryTotal < -1) {
        
        cl_memoryTotal = -1;
    }
    
    return cl_memoryTotal;
}

+ (int64_t)cl_getMemoryFree {
    
    mach_port_t cl_host_port = mach_host_self();
    mach_msg_type_number_t cl_host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t cl_page_size;
    vm_statistics_data_t cl_vm_stat;
    kern_return_t cl_kern;
    
    cl_kern = host_page_size(cl_host_port, &cl_page_size);
    
    if (cl_kern != KERN_SUCCESS) {
        return -1;
    }
    
    cl_kern = host_statistics(cl_host_port, HOST_VM_INFO, (host_info_t)&cl_vm_stat, &cl_host_size);
    
    if (cl_kern != KERN_SUCCESS) {
        return -1;
    }
    
    return cl_vm_stat.free_count * cl_page_size;
}

+ (int64_t)cl_getMemoryActive {
    
    mach_port_t cl_host_port = mach_host_self();
    mach_msg_type_number_t cl_host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(cl_host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(cl_host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &cl_host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.active_count * page_size;
}

+ (int64_t)cl_getMemoryInactive {
    
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    return vm_stat.inactive_count * page_size;
}

+ (int64_t)cl_getMemoryWired {
    
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }

    return vm_stat.wire_count * page_size;
}

+ (int64_t)cl_getMemoryPurgable {
    
    mach_port_t host_port = mach_host_self();
    mach_msg_type_number_t host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    vm_size_t page_size;
    vm_statistics_data_t vm_stat;
    kern_return_t kern;
    
    kern = host_page_size(host_port, &page_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    
    kern = host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size);
    
    if (kern != KERN_SUCCESS) {
        return -1;
    }
    return vm_stat.purgeable_count * page_size;
}

@end

