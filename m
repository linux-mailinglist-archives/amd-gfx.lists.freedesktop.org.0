Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7050645EF9
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Dec 2022 17:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B910E3F4;
	Wed,  7 Dec 2022 16:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0B10E3F2;
 Wed,  7 Dec 2022 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670430702; x=1701966702;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=vyOIPD1QcdoDOdc894HhvLtkRYWBJmy52hkMb/uhT/U=;
 b=CDdVhPnKRUxKVtff3Zhjznab3CE48srxQN+bhZZNIZiY8jw76m5e40xH
 iLA9xBpZNentJqBK1hUDuG5+MGNhW8qxLyuvhP++HXNlygMUgpHF1fCXT
 /gUsawqD+C5K6jp+7fUV8mnmZBITLt/vVp4eopi0PFhqhB1ALcSh5t+qs
 EDKfvfmcmit7LYaSWLXGzaMvQp6VDX9AODvAo1+wbIdghkKzDdnafvD7G
 OE3bPNdzPXFGBXpONpyfNUapxGemr/3Ic1HGuiot8TD0L6Ad2KrRgd5mV
 bx1xnrDQre5I+4waND3b28Wvz/YDu1ydwFrRTIKNCQErPvj2N380wM8fY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="297291830"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="297291830"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2022 08:31:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10554"; a="710122690"
X-IronPort-AV: E=Sophos;i="5.96,225,1665471600"; d="scan'208";a="710122690"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 07 Dec 2022 08:31:12 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1p2xKB-0000P9-1J;
 Wed, 07 Dec 2022 16:31:11 +0000
Date: Thu, 08 Dec 2022 00:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 591cd61541b9b95401e17dca24be486e32104cb8
Message-ID: <6390bfbe.rxwT5v2Rml4m2xt/%lkp@intel.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 591cd61541b9b95401e17dca24be486e32104cb8  Add linux-next specific files for 20221207

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202211090634.RyFKK0WS-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211242120.MzZVGULn-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211282102.QUr7HHrW-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301634.cejLlTJP-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211301840.y7rROb13-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202212070208.3FsKY80H-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

arch/loongarch/kernel/asm-offsets.c:265:6: warning: no previous prototype for 'output_pbe_defines' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:14:6: warning: no previous prototype for 'save_processor_state' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:26:6: warning: no previous prototype for 'restore_processor_state' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:38:5: warning: no previous prototype for 'pfn_is_nosave' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:48:5: warning: no previous prototype for 'swsusp_arch_suspend' [-Wmissing-prototypes]
arch/loongarch/power/hibernate.c:56:5: warning: no previous prototype for 'swsusp_arch_resume' [-Wmissing-prototypes]
arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
arch/powerpc/lib/qspinlock.c:304:2: error: call to undeclared function 'spin_end'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/lib/qspinlock.c:324:3: error: call to undeclared function 'spin_begin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
arch/powerpc/lib/qspinlock.c:331:2: error: call to undeclared function 'spin_cpu_relax'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn201/irq_service_dcn201.c:40:20: warning: no previous prototype for 'to_dal_irq_source_dcn201' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/gf100.c:451:1: warning: no previous prototype for function 'gf100_fifo_nonstall_block' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c:34:1: warning: no previous prototype for function 'nvkm_engn_cgrp_get' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: no previous prototype for function 'tu102_gr_load' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/nvfw/acr.c:49:1: warning: no previous prototype for function 'wpr_generic_header_dump' [-Wmissing-prototypes]
drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:21: warning: variable 'loc' set but not used [-Wunused-but-set-variable]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1474:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1489:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1859:38: warning: unused variable 'mtk8195_jpegdec_drvdata' [-Wunused-const-variable]
drivers/regulator/tps65219-regulator.c:310:60: warning: parameter 'dev' set but not used [-Wunused-but-set-parameter]
drivers/regulator/tps65219-regulator.c:370:26: warning: ordered comparison of pointer with integer zero [-Wextra]
include/linux/signal.h:113:11: error: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Werror,-Warray-bounds]
include/linux/signal.h:97:11: error: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Werror,-Warray-bounds]
vmlinux.o: warning: objtool: __btrfs_map_block+0x1d77: unreachable instruction

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/net/ipa/ipa_table.c:425 ipa_table_init_add() error: we previously assumed 'hash_mem' could be null (see line 416)

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- alpha-randconfig-r022-20221206
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   |-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|   |-- drivers-regulator-tps65219-regulator.c:warning:ordered-comparison-of-pointer-with-integer-zero
|   `-- drivers-regulator-tps65219-regulator.c:warning:parameter-dev-set-but-not-used
|-- arm-defconfig
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm-randconfig-r016-20221206
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
|   |-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-wpr_generic_header_dump
|   `-- drivers-gpu-drm-nouveau-nvkm-subdev-acr-lsfw.c:warning:variable-loc-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-irq-dcn201-irq_service_dcn201.c:warning:no-previous-prototype-for-to_dal_irq_source_dcn201
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-gf100_fifo_nonstall_block
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-nvkm_engn_cgrp_get
|   |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-tu102_gr_load
clang_recent_errors
|-- powerpc-randconfig-r003-20221207
|   |-- arch-powerpc-kernel-kvm_emul.o:warning:objtool:kvm_template_end():can-t-find-starting-instruction
|   |-- arch-powerpc-kernel-prom_init.o:warning:objtool:prom_init:unannotated-intra-function-call
|   |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_begin-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_cpu_relax-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- arch-powerpc-lib-qspinlock.c:error:call-to-undeclared-function-spin_end-ISO-C99-and-later-do-not-support-implicit-function-declarations
|   |-- include-linux-signal.h:error:array-index-is-past-the-end-of-the-array-(that-has-type-const-unsigned-long-)-Werror-Warray-bounds
|   `-- include-linux-signal.h:error:array-index-is-past-the-end-of-the-array-(that-has-type-unsigned-long-)-Werror-Warray-bounds
|-- s390-randconfig-r014-20221206
|   |-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mt8173_jpeg_drvdata
|   |-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mtk8195_jpegdec_drvdata
|   `-- drivers-media-platform-mediatek-jpeg-mtk_jpeg_core.c:warning:unused-variable-mtk_jpeg_drvdata
`-- s390-randconfig-r044-20221206
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-gf100.c:warning:no-previous-prototype-for-function-gf100_fifo_nonstall_block
    |-- drivers-gpu-drm-nouveau-nvkm-engine-fifo-runl.c:warning:no-previous-prototype-for-function-nvkm_engn_cgrp_get
    |-- drivers-gpu-drm-nouveau-nvkm-engine-gr-tu102.c:warning:no-previous-prototype-for-function-tu102_gr_load
    `-- drivers-gpu-drm-nouveau-nvkm-nvfw-acr.c:warning:no-previous-prototype-for-function-wpr_generic_header_dump

elapsed time: 739m

configs tested: 60
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                          rhel-8.3-rust
powerpc                           allnoconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
i386                          randconfig-a001
arc                                 defconfig
x86_64                           rhel-8.3-syz
i386                          randconfig-a003
arm                  randconfig-r046-20221206
s390                             allmodconfig
alpha                               defconfig
arc                  randconfig-r043-20221206
i386                                defconfig
i386                          randconfig-a005
arm                                 defconfig
x86_64                         rhel-8.3-kunit
s390                                defconfig
x86_64                           rhel-8.3-kvm
ia64                             allmodconfig
alpha                            allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig
sh                               allmodconfig
i386                          randconfig-a014
x86_64                        randconfig-a013
m68k                             allmodconfig
x86_64                        randconfig-a011
s390                             allyesconfig
powerpc                          allmodconfig
arc                              allyesconfig
i386                          randconfig-a012
i386                          randconfig-a016
mips                             allyesconfig
arm64                            allyesconfig
arm                              allyesconfig
x86_64                        randconfig-a015
x86_64                        randconfig-a004
x86_64                        randconfig-a002
i386                             allyesconfig
x86_64                        randconfig-a006

clang tested configs:
hexagon              randconfig-r041-20221206
i386                          randconfig-a002
hexagon              randconfig-r045-20221206
i386                          randconfig-a013
s390                 randconfig-r044-20221206
i386                          randconfig-a006
i386                          randconfig-a004
i386                          randconfig-a015
riscv                randconfig-r042-20221206
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
