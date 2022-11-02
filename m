Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1627616A6A
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Nov 2022 18:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF3BF10E534;
	Wed,  2 Nov 2022 17:17:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB51910E534
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Nov 2022 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667409428; x=1698945428;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=UMK2NX/oBDmrooKrh4Wg18WimdWEOzDYIRbKgmkpVdI=;
 b=jBTQqAF7Hwwhwv2/C86OahXv+AWxIj4hyuPtz0S+M/xXagZqCROqpy0z
 X9Cn7SZfrG+Mb6+Ug4Jqv+ir6RXqQRuJTvJpgbLOkP+Iryv1HEA1Bio0b
 RW+c+9xQnJDtScRdDMB8ZfgjWKHXBEuizIceWsnAbLJg7LsqkDgaHR8yY
 pq2r1j6MrjkFMYTL9Hhn7gcKcOK3UCClRDOkafbL8oPaVVBSa10KNtUBE
 Z7IADdncWpjOpbDzavTs9CWu7FFSa2Dp/Kk/4oHtdIJ/x8p6WqMPT2DW2
 o++I124ccZcZ06M+MBGaUSCgSN2/qjChqZNAFVBIHDsgoBIxyP2GI6hZs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="310579525"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="310579525"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 10:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="634346989"
X-IronPort-AV: E=Sophos;i="5.95,234,1661842800"; d="scan'208";a="634346989"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 02 Nov 2022 10:17:06 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oqHMP-000Exx-2I;
 Wed, 02 Nov 2022 17:17:05 +0000
Date: Thu, 03 Nov 2022 01:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 61c3426aca2c71052ddcd06c32e29d92304990fd
Message-ID: <6362a5f5.jxTLVW2fkVq53fOt%lkp@intel.com>
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
Cc: linux-arch@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 61c3426aca2c71052ddcd06c32e29d92304990fd  Add linux-next specific files for 20221102

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202210271517.snUEnhD0-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202211021422.8UpycNNp-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:4878: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5044:24: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_status' [-Wenum-conversion]
include/asm-generic/div64.h:222:35: warning: comparison of distinct pointer types lacks a cast
include/asm-generic/div64.h:234:32: warning: right shift count >= width of type [-Wshift-count-overflow]
lib/test_maple_tree.c:453:12: warning: result of comparison of constant 4398046511104 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
vmlinux.o: warning: objtool: select_reloc_root+0x3a3: unreachable instruction

Unverified Error/Warning (likely false positive, please contact us if interested):

lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- arc-randconfig-r024-20221031
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- arc-randconfig-r043-20221101
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- m68k-randconfig-m041-20221102
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|   |-- include-asm-generic-div64.h:warning:comparison-of-distinct-pointer-types-lacks-a-cast
|   `-- include-asm-generic-div64.h:warning:right-shift-count-width-of-type
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:This-comment-starts-with-but-isn-t-a-kernel-doc-comment.-Refer-Documentation-doc-guide-kernel-doc.rst
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:implicit-conversion-from-enum-anonymous-to-enum-dc_status
clang_recent_errors
`-- mips-randconfig-r031-20221101
    `-- lib-test_maple_tree.c:warning:result-of-comparison-of-constant-with-expression-of-type-unsigned-long-is-always-false

elapsed time: 722m

configs tested: 65
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
arc                                 defconfig
um                           x86_64_defconfig
s390                             allmodconfig
arc                  randconfig-r043-20221101
alpha                               defconfig
s390                                defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a004
x86_64                        randconfig-a011
x86_64                        randconfig-a002
s390                             allyesconfig
x86_64                        randconfig-a015
powerpc                           allnoconfig
x86_64                        randconfig-a006
x86_64                           rhel-8.3-syz
powerpc                          allmodconfig
x86_64                          rhel-8.3-func
arm                                 defconfig
x86_64                    rhel-8.3-kselftests
mips                             allyesconfig
sh                               allmodconfig
x86_64                              defconfig
arm                              allyesconfig
i386                                defconfig
x86_64                           rhel-8.3-kvm
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
arm64                            allyesconfig
ia64                             allmodconfig
i386                          randconfig-a003
x86_64                               rhel-8.3
i386                          randconfig-a014
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
alpha                            allyesconfig
i386                          randconfig-a012
m68k                             allyesconfig
i386                          randconfig-a016
i386                          randconfig-a005
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221101
hexagon              randconfig-r045-20221101
riscv                randconfig-r042-20221101
s390                 randconfig-r044-20221101
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a014
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a011
x86_64                          rhel-8.3-rust
i386                          randconfig-a013
i386                          randconfig-a004
i386                          randconfig-a015
i386                          randconfig-a006
x86_64               randconfig-a003-20221031
x86_64               randconfig-a002-20221031
x86_64               randconfig-a001-20221031
x86_64               randconfig-a005-20221031
x86_64               randconfig-a006-20221031
x86_64               randconfig-a004-20221031

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
