Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26834706F72
	for <lists+amd-gfx@lfdr.de>; Wed, 17 May 2023 19:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA2A10E19F;
	Wed, 17 May 2023 17:29:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4D410E1D6
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 May 2023 17:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684344573; x=1715880573;
 h=date:from:to:cc:subject:message-id;
 bh=nSqVZysCqduEgBH88r+nOXyMT/oVrrLmi6R2ewfyuck=;
 b=ey5dYeqBK7ZgpjqNur8nDEObOY+mI6aXHYJYjYGijQRhadDiacTHyqx9
 UDsfMS6+pXhHQF9YMJBdIXnd6cyfUTJZe+DbS61ROa4eJgusvYfFsuWL9
 JXgkEleQwu6zhtJepF3IJ8vx7bdJETaZL6yMcHJa9csNuXw2HSSrztZHW
 0YLPctf376ki8aeUgZvcP7VTtsj8pFMR+hAJeHj/O8UpQRMEoMbb5Q7w1
 M8UUgk7cWtw/217HJAqJDBjemw/xkRP+byvMGvGYMltwl+yRFKEe8fLRw
 SLLE60n/1WBLMftx5CAlznK7fzCMWPxsQn6m1Yk9wf3/KfNdhpRM4dew/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350660146"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="350660146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 10:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="652314150"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="652314150"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 17 May 2023 10:29:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pzKxs-00096K-1m;
 Wed, 17 May 2023 17:29:28 +0000
Date: Thu, 18 May 2023 01:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 065efa589871e93b6610c70c1e9de274ef1f1ba2
Message-ID: <20230517172842.Ssf2F%lkp@intel.com>
User-Agent: s-nail v14.9.24
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
Cc: linux-xfs@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-wireless@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-perf-users@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: INFO setup_repo_specs: /db/releases/20230517200055/lkp-src/repo/*/linux-next
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 065efa589871e93b6610c70c1e9de274ef1f1ba2  Add linux-next specific files for 20230517

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202304200812.6UqNDVZy-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202304220119.94Pw6YsD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305132244.DwzBUcUd-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202305171622.jKTovBvy-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/base/regmap/regcache-maple.c:113:23: warning: 'lower_index' is used uninitialized [-Wuninitialized]
drivers/base/regmap/regcache-maple.c:113:36: warning: 'lower_last' is used uninitialized [-Wuninitialized]
drivers/bluetooth/btnxpuart.c:1332:34: warning: unused variable 'nxpuart_of_match_table' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:6396:21: warning: variable 'count' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm.c:138:15: warning: variable 'feature_support' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:499:13: warning: variable 'j' set but not used [-Wunused-but-set-variable]
ld.lld: error: undefined symbol: __udivdi3

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/wireless/realtek/rtw88/mac.c:798 __rtw_download_firmware() warn: missing unwind goto?
fs/xfs/scrub/fscounters.c:459 xchk_fscounters() warn: ignoring unreachable code.
kernel/events/uprobes.c:478 uprobe_write_opcode() warn: passing zero to 'PTR_ERR'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_index-is-used-uninitialized
|   |-- drivers-base-regmap-regcache-maple.c:warning:lower_last-is-used-uninitialized
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- csky-randconfig-m041-20230517
|   |-- drivers-net-wireless-realtek-rtw88-mac.c-__rtw_download_firmware()-warn:missing-unwind-goto
|   `-- fs-xfs-scrub-fscounters.c-xchk_fscounters()-warn:ignoring-unreachable-code.
|-- csky-randconfig-r032-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- i386-randconfig-m021
|   `-- kernel-events-uprobes.c-uprobe_write_opcode()-warn:passing-zero-to-PTR_ERR
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-buildonly-randconfig-r005-20230517
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-randconfig-r023-20230517
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- ia64-randconfig-r031-20230517
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-buildonly-randconfig-r004-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-randconfig-c023-20230517
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-randconfig-c034-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-randconfig-r012-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- powerpc-randconfig-s033-20230517
|   `-- mm-kfence-core.c:sparse:sparse:cast-to-restricted-__le64
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- sparc-randconfig-r005-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-count-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_gfx.c:warning:variable-j-set-but-not-used
`-- x86_64-randconfig-m001
    `-- kernel-events-uprobes.c-uprobe_write_opcode()-warn:passing-zero-to-PTR_ERR
clang_recent_errors
|-- arm64-randconfig-r006-20230517
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dce-dmub_abm.c:warning:variable-feature_support-set-but-not-used
|-- i386-buildonly-randconfig-r001-20230515
|   `-- ld.lld:error:undefined-symbol:__udivdi3
`-- x86_64-randconfig-x052
    `-- drivers-bluetooth-btnxpuart.c:warning:unused-variable-nxpuart_of_match_table

elapsed time: 871m

configs tested: 127
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha        buildonly-randconfig-r002-20230517   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r013-20230517   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r043-20230517   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                        clps711x_defconfig   gcc  
arm                                 defconfig   gcc  
arm                          exynos_defconfig   gcc  
arm                            hisi_defconfig   gcc  
arm                  randconfig-r004-20230517   gcc  
arm                  randconfig-r046-20230517   clang
arm                           sama7_defconfig   clang
arm                           tegra_defconfig   gcc  
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
arm64                randconfig-r006-20230517   clang
arm64                randconfig-r011-20230517   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r024-20230517   gcc  
csky                 randconfig-r025-20230517   gcc  
csky                 randconfig-r032-20230517   gcc  
hexagon      buildonly-randconfig-r006-20230517   clang
hexagon                             defconfig   clang
hexagon              randconfig-r041-20230517   clang
hexagon              randconfig-r045-20230517   clang
i386                             allyesconfig   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                          randconfig-a001   gcc  
i386                          randconfig-a002   clang
i386                          randconfig-a003   gcc  
i386                          randconfig-a004   clang
i386                          randconfig-a005   gcc  
i386                          randconfig-a006   clang
i386                          randconfig-a011   clang
i386                          randconfig-a012   gcc  
i386                          randconfig-a013   clang
i386                          randconfig-a014   gcc  
i386                          randconfig-a015   clang
i386                          randconfig-a016   gcc  
ia64                             allmodconfig   gcc  
ia64         buildonly-randconfig-r005-20230517   gcc  
ia64                                defconfig   gcc  
ia64                        generic_defconfig   gcc  
ia64                 randconfig-r023-20230517   gcc  
ia64                 randconfig-r031-20230517   gcc  
ia64                 randconfig-r036-20230517   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
m68k                             allmodconfig   gcc  
m68k                         amcore_defconfig   gcc  
m68k                         apollo_defconfig   gcc  
m68k         buildonly-randconfig-r001-20230517   gcc  
m68k                                defconfig   gcc  
microblaze           randconfig-r034-20230517   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                      malta_kvm_defconfig   clang
mips                 randconfig-r015-20230517   clang
nios2                            allyesconfig   gcc  
nios2        buildonly-randconfig-r003-20230517   gcc  
nios2                               defconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc      buildonly-randconfig-r004-20230517   gcc  
powerpc              randconfig-r001-20230517   clang
powerpc              randconfig-r012-20230517   gcc  
powerpc              randconfig-r014-20230517   gcc  
powerpc              randconfig-r035-20230517   clang
powerpc                  storcenter_defconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r042-20230517   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r016-20230517   gcc  
s390                 randconfig-r044-20230517   gcc  
sh                               allmodconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                   randconfig-r003-20230517   gcc  
sh                   randconfig-r022-20230517   gcc  
sh                           se7751_defconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r005-20230517   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64                              defconfig   gcc  
x86_64                                  kexec   gcc  
x86_64                        randconfig-a001   clang
x86_64                        randconfig-a002   gcc  
x86_64                        randconfig-a003   clang
x86_64                        randconfig-a004   gcc  
x86_64                        randconfig-a005   clang
x86_64                        randconfig-a006   gcc  
x86_64                        randconfig-a011   gcc  
x86_64                        randconfig-a012   clang
x86_64                        randconfig-a013   gcc  
x86_64                        randconfig-a014   clang
x86_64                        randconfig-a015   gcc  
x86_64                        randconfig-a016   clang
x86_64                        randconfig-x051   gcc  
x86_64                        randconfig-x052   clang
x86_64                        randconfig-x053   gcc  
x86_64                        randconfig-x054   clang
x86_64                        randconfig-x055   gcc  
x86_64                        randconfig-x056   clang
x86_64                        randconfig-x061   gcc  
x86_64                        randconfig-x062   clang
x86_64                        randconfig-x063   gcc  
x86_64                        randconfig-x064   clang
x86_64                        randconfig-x065   gcc  
x86_64                        randconfig-x066   clang
x86_64                               rhel-8.3   gcc  
xtensa                    smp_lx200_defconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
