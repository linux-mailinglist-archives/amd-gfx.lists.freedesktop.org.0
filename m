Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F96C7260
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Mar 2023 22:34:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616C10E4A3;
	Thu, 23 Mar 2023 21:34:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19BC10E4A3
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Mar 2023 21:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679607287; x=1711143287;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Vj88errHAqkc2MpwHVhcao8KxdNF/c5KYhxc9M4wdRg=;
 b=NLOcwkojp6Tqp1in5pshxOn+8bthGduxdmIzCjlSHtBvFTuyo0j2z0xe
 afOY9kFYlLWdNt0nIwGcgFlp89Or8naZj/u4eQKS3DDXjBMzowUlgC6Uj
 9m0/HpUyu2Mjy2CDHqUD8tHrR5/5Hu6AqJgiQyOUwH4BB+EZMralHLoNP
 pnAV6ZvU8fRuU8ChO7T2bnvUOONV4QULkuakA8/keaOylgvSa3dwyvpav
 Iqhr8Nodhkknkd1Smuyi/Nn0XqPFsK3A7Xxr8WkeSmhGEoBFli07/QoVI
 ENJ4lczS8fhI3rPkzN8YAJZb8d+lfRnAKWas+5fLHDQH/HVl+oe1Qxsbh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="339661229"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="339661229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 14:34:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684911011"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="684911011"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 14:34:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pfSa4-000Eii-1t;
 Thu, 23 Mar 2023 21:34:44 +0000
Date: Fri, 24 Mar 2023 05:34:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 7c4a254d78f89546d0e74a40617ef24c6151c8d1
Message-ID: <641cc5da.LRhzzaC4RvFK5EH/%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org, sound-open-firmware@alsa-project.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 7c4a254d78f89546d0e74a40617ef24c6151c8d1  Add linux-next specific files for 20230323

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303161521.jbGbaFjJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303231302.iY6qIfXA-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303232154.aXOXAWhg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13: warning: variable 'bw_needed' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:352:25: warning: variable 'link' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
gpio.c:(.init.text+0xec): undefined reference to `of_mm_gpiochip_add_data'
include/linux/mmzone.h:1749:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/soc/fsl/qe/tsa.c:140:26: sparse: sparse: incorrect type in argument 2 (different address spaces)
drivers/soc/fsl/qe/tsa.c:150:27: sparse: sparse: incorrect type in argument 1 (different address spaces)
mm/mmap.c:962 vma_merge() error: uninitialized symbol 'next'.
sound/soc/sof/ipc4-pcm.c:391 sof_ipc4_pcm_dai_link_fixup_rate() error: uninitialized symbol 'be_rate'.
sound/soc/sof/ipc4-topology.c:1132 ipc4_copier_set_capture_fmt() error: uninitialized symbol 'sample_valid_bits'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- i386-randconfig-m021
|   `-- mm-mmap.c-vma_merge()-error:uninitialized-symbol-next-.
|-- ia64-allmodconfig
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- loongarch-randconfig-r006-20230322
|   `-- include-linux-mmzone.h:error:error-Allocator-MAX_ORDER-exceeds-SECTION_SIZE
|-- m68k-randconfig-s041-20230323
|   |-- drivers-soc-fsl-qe-tsa.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-noderef-__iomem-got-void-noderef-__iomem-addr
|   `-- drivers-soc-fsl-qe-tsa.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__iomem-got-void-noderef-__iomem-addr
|-- microblaze-buildonly-randconfig-r003-20230323
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- powerpc-randconfig-s041-20230322
|   `-- gpio.c:(.init.text):undefined-reference-to-of_mm_gpiochip_add_data
|-- s390-randconfig-m031-20230321
|   |-- sound-soc-sof-ipc4-pcm.c-sof_ipc4_pcm_dai_link_fixup_rate()-error:uninitialized-symbol-be_rate-.
|   `-- sound-soc-sof-ipc4-topology.c-ipc4_copier_set_capture_fmt()-error:uninitialized-symbol-sample_valid_bits-.
`-- sparc-allyesconfig
    `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size

elapsed time: 1022m

configs tested: 95
configs skipped: 4

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
alpha                randconfig-r026-20230322   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r033-20230322   gcc  
arc                  randconfig-r043-20230322   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                  randconfig-r023-20230322   clang
arm                  randconfig-r046-20230322   clang
arm                         vf610m4_defconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
hexagon              randconfig-r041-20230322   clang
hexagon              randconfig-r045-20230322   clang
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
ia64                                defconfig   gcc  
ia64                 randconfig-r015-20230322   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r032-20230322   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                       m5208evb_defconfig   gcc  
m68k                 randconfig-r012-20230322   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r021-20230322   clang
nios2                               defconfig   gcc  
nios2                randconfig-r016-20230322   gcc  
openrisc             randconfig-r024-20230322   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r031-20230322   gcc  
parisc               randconfig-r034-20230322   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                     mpc83xx_defconfig   gcc  
powerpc                      obs600_defconfig   clang
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230322   gcc  
riscv                randconfig-r042-20230322   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230322   gcc  
s390                 randconfig-r035-20230322   clang
s390                 randconfig-r044-20230322   gcc  
sh                               allmodconfig   gcc  
sparc                               defconfig   gcc  
sparc                randconfig-r011-20230322   gcc  
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
x86_64                               rhel-8.3   gcc  
xtensa                  nommu_kc705_defconfig   gcc  
xtensa               randconfig-r013-20230322   gcc  
xtensa               randconfig-r025-20230322   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
