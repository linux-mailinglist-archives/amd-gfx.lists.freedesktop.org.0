Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D74FB6A5AB5
	for <lists+amd-gfx@lfdr.de>; Tue, 28 Feb 2023 15:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CDE10E200;
	Tue, 28 Feb 2023 14:20:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF1E10E200
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Feb 2023 14:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677594004; x=1709130004;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HpSQ1PizI63SLWLdOXUaQfPsd5UJVmxUZhcPqhd00Go=;
 b=D2Gc87tE2btok2GVtFmJ/Qt9b5kKhSKknnaAmbUinYOtN6P8RkUz1cAe
 yUButSKVIBnziIMWeQVSWzmfiWIB1IvSkPgeO+VV4j4vRMTT9Z+ZBhgEl
 gdrGq2Pa3p03okUhgFgpucCLRxsomjvvBdI0wbafu1x0303uaw0UDUx6p
 aAG+KSFlEfopOTfmeCrb6+Mao2jCCNFA1XPvc89DTSGqlmbGPyQpGW15f
 GS9Bj35FvGLLiL23My/f18Fw9RilMO4cu6dzYf7DzfKwaleTeRl/TlBMp
 3NZ0pDVznEBkhJHv+rKTf9yYce0/RpNvzqlucvAnKcRMZOXgnb72Wm2N7 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="398922796"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="398922796"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 06:19:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="763185348"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="763185348"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Feb 2023 06:19:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pX0pM-0005S7-0g;
 Tue, 28 Feb 2023 14:19:36 +0000
Date: Tue, 28 Feb 2023 22:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 058f4df42121baadbb8a980c06011e912784dbd2
Message-ID: <63fe0d4a.ELRnTR/tsOu56isL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-usb@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 058f4df42121baadbb8a980c06011e912784dbd2  Add linux-next specific files for 20230228

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202302111601.jtY4lKrA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302170355.Ljqlzucu-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302210350.lynWcL4t-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_optc.c:294:6: warning: no previous prototype for 'optc3_wait_drr_doublebuffer_pending_clear' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:212:6: warning: no previous prototype for 'umc_v8_10_convert_error_address' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:212:6: warning: no previous prototype for function 'umc_v8_10_convert_error_address' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/umc_v8_10.c:437:37: warning: variable 'channel_index' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c:81:29: warning: variable 'ring' set but not used [-Wunused-but-set-variable]
include/asm-generic/div64.h:238:36: error: passing argument 1 of '__div64_32' from incompatible pointer type [-Werror=incompatible-pointer-types]

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/parisc/mm/fault.c:427 do_page_fault() error: uninitialized symbol 'msg'.
drivers/iommu/apple-dart.c:1281:1: sparse: sparse: symbol 'apple_dart_pm_ops' was not declared. Should it be static?
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
drivers/watchdog/imx2_wdt.c:442:22: sparse: sparse: symbol 'imx_wdt' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:446:22: sparse: sparse: symbol 'imx_wdt_legacy' was not declared. Should it be static?
net/bluetooth/hci_sync.c:2403 hci_pause_addr_resolution() warn: missing error code? 'err'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- alpha-randconfig-c041-20230226
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- alpha-randconfig-c043-20230226
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|   `-- include-asm-generic-div64.h:error:passing-argument-of-__div64_32-from-incompatible-pointer-type
|-- arc-randconfig-r033-20230226
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|   `-- include-asm-generic-div64.h:error:passing-argument-of-__div64_32-from-incompatible-pointer-type
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|   `-- include-asm-generic-div64.h:error:passing-argument-of-__div64_32-from-incompatible-pointer-type
|-- arm-randconfig-s041-20230226
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn30-dcn30_optc.c:warning:no-previous-prototype-for-optc3_wait_drr_doublebuffer_pending_clear
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-umc_v8_10_convert_error_address
|   |-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:variable-channel_index-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-vcn_v4_0.c:warning:variable-ring-set-but-not-used
|-- i386-randconfig-s001
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-randconfig-s003
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- ia64-allmodconfig
clang_recent_errors
`-- arm64-randconfig-r012-20230226
    `-- drivers-gpu-drm-amd-amdgpu-umc_v8_10.c:warning:no-previous-prototype-for-function-umc_v8_10_convert_error_address

elapsed time: 729m

configs tested: 161
configs skipped: 11

tested configs:
alpha                            alldefconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r003-20230226   gcc  
arc                                 defconfig   gcc  
arc                 nsimosci_hs_smp_defconfig   gcc  
arc                  randconfig-r004-20230226   gcc  
arc                  randconfig-r004-20230227   gcc  
arc                  randconfig-r021-20230226   gcc  
arc                  randconfig-r033-20230226   gcc  
arc                  randconfig-r034-20230226   gcc  
arc                  randconfig-r035-20230226   gcc  
arc                  randconfig-r043-20230226   gcc  
arc                  randconfig-r043-20230227   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm          buildonly-randconfig-r005-20230226   gcc  
arm          buildonly-randconfig-r005-20230227   clang
arm                                 defconfig   gcc  
arm                          ep93xx_defconfig   clang
arm                         lpc18xx_defconfig   gcc  
arm                        mvebu_v5_defconfig   clang
arm                       omap2plus_defconfig   gcc  
arm                  randconfig-r031-20230227   gcc  
arm                  randconfig-r046-20230226   gcc  
arm                  randconfig-r046-20230227   clang
arm                           sama7_defconfig   clang
arm                        spear3xx_defconfig   clang
arm                           stm32_defconfig   gcc  
arm                       versatile_defconfig   clang
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r003-20230227   clang
arm64                randconfig-r012-20230226   clang
arm64                randconfig-r024-20230226   clang
csky         buildonly-randconfig-r001-20230226   gcc  
csky         buildonly-randconfig-r004-20230226   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r022-20230227   gcc  
csky                 randconfig-r035-20230227   gcc  
hexagon              randconfig-r002-20230226   clang
hexagon              randconfig-r014-20230226   clang
hexagon              randconfig-r016-20230226   clang
hexagon              randconfig-r021-20230226   clang
hexagon              randconfig-r022-20230226   clang
hexagon              randconfig-r041-20230226   clang
hexagon              randconfig-r041-20230227   clang
hexagon              randconfig-r045-20230227   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                 randconfig-a001-20230227   clang
i386                 randconfig-a002-20230227   clang
i386                 randconfig-a003-20230227   clang
i386                 randconfig-a004-20230227   clang
i386                 randconfig-a005-20230227   clang
i386                 randconfig-a006-20230227   clang
i386                 randconfig-a011-20230227   gcc  
i386                 randconfig-a012-20230227   gcc  
i386                 randconfig-a013-20230227   gcc  
i386                 randconfig-a014-20230227   gcc  
i386                 randconfig-a015-20230227   gcc  
i386                 randconfig-a016-20230227   gcc  
i386                          randconfig-c001   gcc  
i386                 randconfig-r033-20230227   clang
ia64                             allmodconfig   gcc  
ia64                                defconfig   gcc  
ia64                 randconfig-r006-20230227   gcc  
ia64                 randconfig-r024-20230227   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r023-20230227   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                        mvme147_defconfig   gcc  
m68k                 randconfig-r005-20230227   gcc  
m68k                 randconfig-r011-20230226   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                         cobalt_defconfig   gcc  
mips                           gcw0_defconfig   gcc  
mips                           ip22_defconfig   clang
mips                      loongson3_defconfig   gcc  
mips                        qi_lb60_defconfig   clang
mips                 randconfig-r001-20230227   gcc  
mips                 randconfig-r015-20230226   gcc  
mips                 randconfig-r032-20230227   gcc  
mips                           rs90_defconfig   clang
mips                         rt305x_defconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r026-20230226   gcc  
nios2                randconfig-r032-20230226   gcc  
openrisc     buildonly-randconfig-r002-20230227   gcc  
openrisc             randconfig-r036-20230226   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r022-20230226   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230227   gcc  
powerpc                      pasemi_defconfig   gcc  
powerpc              randconfig-r023-20230226   clang
powerpc              randconfig-r025-20230227   gcc  
powerpc                    sam440ep_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r031-20230226   gcc  
riscv                randconfig-r042-20230226   clang
riscv                randconfig-r042-20230227   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r005-20230226   gcc  
s390                 randconfig-r026-20230227   gcc  
s390                 randconfig-r044-20230226   clang
s390                 randconfig-r044-20230227   gcc  
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r025-20230226   gcc  
sh                   randconfig-r036-20230227   gcc  
sh                            shmin_defconfig   gcc  
sparc        buildonly-randconfig-r001-20230227   gcc  
sparc        buildonly-randconfig-r006-20230227   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r006-20230226   gcc  
sparc                randconfig-r025-20230226   gcc  
sparc64              randconfig-r003-20230226   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64               randconfig-a001-20230227   clang
x86_64               randconfig-a002-20230227   clang
x86_64               randconfig-a003-20230227   clang
x86_64               randconfig-a004-20230227   clang
x86_64               randconfig-a005-20230227   clang
x86_64               randconfig-a006-20230227   clang
x86_64               randconfig-a011-20230227   gcc  
x86_64               randconfig-a012-20230227   gcc  
x86_64               randconfig-a013-20230227   gcc  
x86_64               randconfig-a014-20230227   gcc  
x86_64               randconfig-a015-20230227   gcc  
x86_64               randconfig-a016-20230227   gcc  
x86_64                        randconfig-k001   clang
x86_64                           rhel-8.3-bpf   gcc  
x86_64                          rhel-8.3-func   gcc  
x86_64                    rhel-8.3-kselftests   gcc  
x86_64                         rhel-8.3-kunit   gcc  
x86_64                           rhel-8.3-kvm   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                           rhel-8.3-syz   gcc  
x86_64                               rhel-8.3   gcc  
xtensa       buildonly-randconfig-r006-20230226   gcc  
xtensa               randconfig-r001-20230226   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
