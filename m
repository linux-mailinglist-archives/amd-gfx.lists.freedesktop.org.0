Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4795FC79B
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Oct 2022 16:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121710E2F7;
	Wed, 12 Oct 2022 14:42:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED69610E2E3
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Oct 2022 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665585760; x=1697121760;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=1qyW+GVUGeVRfhRVj7Mv0CU2cbdZUrFTiwU1yJb/dTg=;
 b=KoblSlTjzSiwSIQga97BeA2rgQ/W2SnPW5QmHISHzGHGDL0ss8XGSUp1
 iFCNXWlCNStDQY/0M4PdBNikbETPqjwicZ4qrAp1uWcChIM/5d7zMwgi2
 V9aS8aWfy9cDtsoHKoOsjAd/eV+rHAgLKl3aD+Naf+zRROYTmSSyoyLE1
 jLK71kLpUmpHTut9SpTWRAKZ03UpBUmR34mFuzBtRG8A97AFk6SZkp0Ji
 6FjBASYxek4lf727B8jml3lgy4OWkplmC4jyRbDO1Dyjfx52HigwYm9xb
 jpz/1PiiK80TJqML3Z/8gvUhCGQJUcec9N4g6gFUo576djm1gK0ZcmDRN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="305869255"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="305869255"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 07:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659953331"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="659953331"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 12 Oct 2022 07:42:28 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oicwG-0003u0-01;
 Wed, 12 Oct 2022 14:42:28 +0000
Date: Wed, 12 Oct 2022 22:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 f843795727e4f5612c612cd178db1557978da742
Message-ID: <6346d21a.rLmYiYOU73PR5G14%lkp@intel.com>
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
Cc: ntfs3@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org, loongarch@lists.linux.dev,
 linux-ext4@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: f843795727e4f5612c612cd178db1557978da742  Add linux-next specific files for 20221012

Error/Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com
https://lore.kernel.org/llvm/202210122108.67op7Ykg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/loongarch/kernel/traps.c:93:39: warning: Null pointer dereference: regs [ctunullpointer]
arch/loongarch/mm/init.c:166:24: warning: variable 'new' set but not used [-Wunused-but-set-variable]
arch/loongarch/mm/mmap.c:20:65: warning: Parameter 'filp' can be declared with const [constParameter]
fs/ext4/super.c:1744:19: warning: 'deprecated_msg' defined but not used [-Wunused-const-variable=]
grep: smatch_trinity_*: No such file or directory
mm/mmap.c:802 __vma_adjust() error: uninitialized symbol 'next_next'.
pahole: .tmp_vmlinux.btf: No such file or directory

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-r016-20221012
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-randconfig-s043-20221012
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- arm64-randconfig-s052-20221012
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- csky-randconfig-r013-20221012
|   `-- pahole:.tmp_vmlinux.btf:No-such-file-or-directory
|-- csky-randconfig-s042-20221012
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-allyesconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-defconfig
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a003
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a005
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a012
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a014
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-a016
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c001
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
|-- i386-randconfig-c021
|   `-- fs-ext4-super.c:warning:deprecated_msg-defined-but-not-used
clang_recent_errors
|-- arm-buildonly-randconfig-r005-20221012
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- arm-sp7021_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- arm64-buildonly-randconfig-r006-20221012
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:a-function-declaration-without-a-prototype-is-deprecated-in-all-versions-of-C-Werror-Wstrict-prototypes
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:a-function-declaration-without-a-prototype-is-deprecated-in-all-versions-of-C-and-is-treated-as-a-zero-parameter-prototype-in-C2x-conf
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:a-parameter-list-without-types-is-only-allowed-in-a-function-definition
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:conflicting-types-for-spin_unlock_irqrestore
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:expected-)
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:expected-identifier-or-(
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:expected-parameter-declarator
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:type-specifier-missing-defaults-to-int-ISO-C99-and-later-do-not-support-implicit-int
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:error:while-loop-outside-of-a-function
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-amdgpu_dm-amdgpu_dm.c:warning:variable-crtc_disable_count-set-but-not-used
|-- arm64-randconfig-r036-20221012
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-function-apply_alternatives_vdso
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r001-20221012
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- hexagon-randconfig-r005-20221012
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- hexagon-randconfig-r041-20221012
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- hexagon-randconfig-r045-20221012
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a002
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a004
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a011
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a013
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|-- i386-randconfig-a015
|   |-- fs-ext4-super.c:warning:unused-variable-deprecated_msg
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- mips-loongson2k_defconfig
|   `-- fs-ext4-super.c:warning:unused-variable-deprecated_msg

elapsed time: 729m

configs tested: 88
configs skipped: 3

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                        randconfig-a013
i386                                defconfig
arc                           tb10x_defconfig
x86_64                              defconfig
sh                         apsh4a3a_defconfig
x86_64                        randconfig-a011
arm                         cm_x300_defconfig
nios2                            alldefconfig
arm                        keystone_defconfig
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
powerpc                           allnoconfig
xtensa                       common_defconfig
riscv                randconfig-r042-20221012
arc                                 defconfig
powerpc                 mpc834x_mds_defconfig
x86_64                        randconfig-a015
s390                 randconfig-r044-20221012
powerpc                          allmodconfig
alpha                             allnoconfig
powerpc                      pasemi_defconfig
x86_64                          rhel-8.3-func
powerpc                     taishan_defconfig
i386                          randconfig-a001
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
x86_64                    rhel-8.3-kselftests
m68k                          atari_defconfig
riscv                             allnoconfig
x86_64                           rhel-8.3-kvm
ia64                                defconfig
i386                          randconfig-a003
mips                             allyesconfig
xtensa                              defconfig
s390                             allmodconfig
csky                              allnoconfig
xtensa                    smp_lx200_defconfig
arc                               allnoconfig
x86_64                           allyesconfig
arm                                 defconfig
sh                               allmodconfig
arc                  randconfig-r043-20221012
x86_64                        randconfig-a004
powerpc                       ppc64_defconfig
i386                          randconfig-a005
alpha                               defconfig
alpha                            allyesconfig
x86_64                        randconfig-a002
s390                             allyesconfig
arc                              allyesconfig
s390                                defconfig
x86_64                        randconfig-a006
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-c001
i386                          randconfig-a016
csky                                defconfig
ia64                         bigsur_defconfig
powerpc                    amigaone_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
m68k                          amiga_defconfig
mips                     decstation_defconfig
arm64                            allyesconfig
arm                              allyesconfig
ia64                             allmodconfig

clang tested configs:
x86_64                        randconfig-a016
x86_64                        randconfig-a012
hexagon              randconfig-r041-20221012
x86_64                        randconfig-a014
hexagon              randconfig-r045-20221012
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a013
x86_64                        randconfig-a005
i386                          randconfig-a015
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
mips                        qi_lb60_defconfig
mips                     loongson2k_defconfig
x86_64                          rhel-8.3-rust
arm                          sp7021_defconfig
arm                       netwinder_defconfig
powerpc                        icon_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
