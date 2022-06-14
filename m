Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791F54B8EB
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jun 2022 20:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EC810E488;
	Tue, 14 Jun 2022 18:44:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62FA210E638
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jun 2022 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655232290; x=1686768290;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Ixr3mhKtmM5RFZXlc02iEkQAHMNIxZ03wnoAUFG9cx8=;
 b=LOIO7w8xPA/+/QyJhtd4oKAu4kVVZsUeov/678g+eUHiVIpvvKZt1VAv
 3duqf13MaRunO38+7C+tjHcZZPQmY2TeLLZ6FURnUMtrrpY3gypgjt/pR
 hanY21+Fgs4qFgz7ePjpZGFFGDVDpxxqeF0sPDK9tF29+veFZfdjkJIo1
 8dcFE/+fQUGrPF6yBpfL+8Akv/6XpnhLxcLG9fTXiC6Fi6olk4z2NNp1x
 KPITP5pwFxA90pu7RndTe4kIZar1brR53yeI7CXej0+wHSUCSvGEZIMgc
 aN7qiqUgHu9MscIrFmxfsyoY3kJzMpTy34d7DTE72AgiTN3y2X1tiOtCB A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="342672998"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="342672998"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 11:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; d="scan'208";a="535692441"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 14 Jun 2022 11:44:47 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1o1BWw-000MCp-U1;
 Tue, 14 Jun 2022 18:44:46 +0000
Date: Wed, 15 Jun 2022 02:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 35d872b9ea5b3ad784d7479ea728dcb688df2db7
Message-ID: <62a8d6fe.l9kTY7EU3b9NXYOz%lkp@intel.com>
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
 linux-staging@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 35d872b9ea5b3ad784d7479ea728dcb688df2db7  Add linux-next specific files for 20220614

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/include/ddc_service_types.h:130:17: warning: 'DP_SINK_BRANCH_DEV_NAME_7580' defined but not used [-Wunused-const-variable=]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9139:27: warning: variable 'abo' set but not used [-Wunused-but-set-variable]
drivers/staging/vme_user/vme.c:662:20: warning: dereference of NULL 'bridge' [CWE-476] [-Wanalyzer-null-dereference]
fs/f2fs/data.c:136:33: error: too many arguments to function 'f2fs_end_read_compressed_page'
fs/f2fs/data.c:138:25: error: too many arguments to function 'f2fs_put_page_dic'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arc-randconfig-r015-20220613
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- arm-randconfig-c002-20220612
|   `-- drivers-staging-vme_user-vme.c:warning:dereference-of-NULL-bridge-CWE
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- i386-debian-10.3
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- i386-debian-10.3-kselftests
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- m68k-randconfig-r005-20220613
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- nios2-allyesconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|-- sh-allmodconfig
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-include-ddc_service_types.h:warning:DP_SINK_BRANCH_DEV_NAME_7580-defined-but-not-used
|   `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used
|-- x86_64-rhel-8.3-kunit
|   |-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_end_read_compressed_page
|   `-- fs-f2fs-data.c:error:too-many-arguments-to-function-f2fs_put_page_dic
`-- xtensa-allyesconfig
    |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-abo-set-but-not-used
    `-- drivers-staging-rtl8723bs-hal-hal_btcoex.c:warning:variable-pHalData-set-but-not-used

clang_recent_errors
`-- riscv-randconfig-r035-20220613
    `-- arch-riscv-kernel-cpufeature.c:warning:variable-cpu_apply_feature-set-but-not-used

elapsed time: 727m

configs tested: 72
configs skipped: 3

gcc tested configs:
arm                              allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
arm                                 defconfig
arm64                               defconfig
ia64                                defconfig
ia64                             allmodconfig
ia64                             allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
arc                                 defconfig
h8300                            allyesconfig
sh                               allmodconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allmodconfig
parisc                           allyesconfig
parisc64                            defconfig
s390                                defconfig
s390                             allyesconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                               defconfig
sparc                            allyesconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
x86_64               randconfig-a014-20220613
x86_64               randconfig-a012-20220613
x86_64               randconfig-a011-20220613
x86_64               randconfig-a015-20220613
x86_64               randconfig-a013-20220613
x86_64               randconfig-a016-20220613
i386                 randconfig-a013-20220613
i386                 randconfig-a011-20220613
i386                 randconfig-a012-20220613
i386                 randconfig-a016-20220613
i386                 randconfig-a015-20220613
i386                 randconfig-a014-20220613
arc                  randconfig-r043-20220613
riscv                randconfig-r042-20220613
s390                 randconfig-r044-20220613
riscv                             allnoconfig
riscv                            allyesconfig
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                          rv32_defconfig
riscv                    nommu_virt_defconfig
riscv                               defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                         rhel-8.3-kunit
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz

clang tested configs:
hexagon              randconfig-r041-20220613
hexagon              randconfig-r045-20220613

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
