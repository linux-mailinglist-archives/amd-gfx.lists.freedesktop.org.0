Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52860E5FB
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Oct 2022 19:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A6F210E54C;
	Wed, 26 Oct 2022 17:00:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BEF10E54C
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Oct 2022 17:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666803605; x=1698339605;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=5Z+ixCtjM9zP5Cjx5S+C528BMvr3OqmySU4CCYG0r0g=;
 b=Ordoadk9Sbt24ma0J4+SdqRCQy+ebXhi+O8jCjZRdFwdsaY5smLasA9e
 d6NTkft3KXfyNHWouSIgZEpZJQuDstbTqF0TLmsIIQTFjZ6U9or9I2xZu
 QvLDYr3ywtsLUyDLJjqP/zmrJ2qrr76j062MKMTdUzHZqatGJyIiwH6M7
 0AEr59X2NQrNtq1SeZYP1NUi7ewVGWj4gp5jaan9hJnhXugZ+qd0qgWQW
 wprI0XWdCRZ1bakGZ4VRBY8pUpQebhALOYREI9k7iLx3HJdZw1JFLuZwr
 CGzKKMNu4wMYXgA5AxOkBGV/9hHGPQ2mRexi30dZthNwRXIhGlXJftOlM Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288399100"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="288399100"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 10:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="665361572"
X-IronPort-AV: E=Sophos;i="5.95,215,1661842800"; d="scan'208";a="665361572"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 26 Oct 2022 10:00:01 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1onjl2-0007dp-25;
 Wed, 26 Oct 2022 17:00:00 +0000
Date: Thu, 27 Oct 2022 00:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD SUCCESS WITH WARNING
 60eac8672b5b6061ec07499c0f1b79f6d94311ce
Message-ID: <63596772.FFBtfld6wjE45SXv%lkp@intel.com>
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
Cc: ntfs3@lists.linux.dev, netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mediatek@lists.infradead.org, linux-ext4@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 60eac8672b5b6061ec07499c0f1b79f6d94311ce  Add linux-next specific files for 20221026

Warning reports:

https://lore.kernel.org/linux-mm/202210090954.pTR6m6rj-lkp@intel.com
https://lore.kernel.org/linux-mm/202210110857.9s0tXVNn-lkp@intel.com
https://lore.kernel.org/linux-mm/202210111318.mbUfyhps-lkp@intel.com
https://lore.kernel.org/linux-mm/202210240729.zs46Cfzo-lkp@intel.com
https://lore.kernel.org/linux-mm/202210251946.eT92YAhG-lkp@intel.com
https://lore.kernel.org/linux-mm/202210261404.b6UlzG7H-lkp@intel.com
https://lore.kernel.org/llvm/202210060148.UXBijOcS-lkp@intel.com
https://lore.kernel.org/llvm/202210261759.MQ8VLHNW-lkp@intel.com

Warning: (recently discovered and may have been fixed)

lib/zstd/compress/huf_compress.c:460 HUF_getIndex() warn: the 'RANK_POSITION_LOG_BUCKETS_BEGIN' macro might need parens
security/apparmor/policy_unpack_test.c:149 policy_unpack_test_unpack_array_with_null_name() error: uninitialized symbol 'array_size'.
security/apparmor/policy_unpack_test.c:164 policy_unpack_test_unpack_array_with_name() error: uninitialized symbol 'array_size'.

Unverified Warning (likely false positive, please contact us if interested):

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link_dp.c:5230:16: warning: no previous prototype for function 'wake_up_aux_channel' [-Wmissing-prototypes]
drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:207:24: sparse: sparse: symbol 'test_callbacks' was not declared. Should it be static?
drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:219:21: sparse: sparse: symbol 'test_vctrl' was not declared. Should it be static?
drivers/net/ethernet/microchip/vcap/vcap_api_kunit.c:245:23: sparse: sparse: Using plain integer as NULL pointer
lib/zstd/decompress/zstd_decompress_block.c:1009 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:894 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:942 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_internal.h:206 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
mm/khugepaged.c:1729:3: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
mm/khugepaged.c:1729:3: warning: variable 'nr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
mm/khugepaged.c:1729:7: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
mm/khugepaged.c:1729:7: warning: variable 'nr' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-randconfig-s051-20221023
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   `-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- i386-randconfig-m021
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-huf_compress.c-HUF_getIndex()-warn:the-RANK_POSITION_LOG_BUCKETS_BEGIN-macro-might-need-parens
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEndSplitLitBuffer()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-zstd_decompress_internal.h-ZSTD_DCtx_get_bmi2()-warn:inconsistent-indenting
|-- loongarch-randconfig-s043-20221024
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- parisc-randconfig-m031-20221024
|   |-- security-apparmor-policy_unpack_test.c-policy_unpack_test_unpack_array_with_name()-error:uninitialized-symbol-array_size-.
|   `-- security-apparmor-policy_unpack_test.c-policy_unpack_test_unpack_array_with_null_name()-error:uninitialized-symbol-array_size-.
|-- powerpc-randconfig-s053-20221023
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-priv1-got-restricted-__le16-addressable-usertype-fc_len
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-int-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-short-usertype-tag-got-restricted-__le16-addressable-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_len-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-restricted-__le16-usertype-fc_tag-got-unsigned-short-usertype
|   |-- fs-ext4-fast_commit.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-int-tag-got-restricted-__le16-usertype-fc_tag
|   |-- fs-ext4-fast_commit.c:sparse:sparse:restricted-__le16-degrades-to-integer
|   |-- fs-ntfs3-index.c:sparse:sparse:restricted-__le32-degrades-to-integer
|   |-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s1-got-unsigned-short
|   `-- fs-ntfs3-namei.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-restricted-__le16-const-usertype-s2-got-unsigned-short
|-- riscv-randconfig-s051-20221026
|   |-- drivers-net-ethernet-microchip-vcap-vcap_api_kunit.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- drivers-net-ethernet-microchip-vcap-vcap_api_kunit.c:sparse:sparse:symbol-test_callbacks-was-not-declared.-Should-it-be-static
|   `-- drivers-net-ethernet-microchip-vcap-vcap_api_kunit.c:sparse:sparse:symbol-test_vctrl-was-not-declared.-Should-it-be-static
`-- x86_64-randconfig-m001
    |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequence()-warn:inconsistent-indenting
    |-- arch-x86-boot-compressed-..-..-..-..-lib-zstd-decompress-zstd_decompress_block.c-ZSTD_execSequenceEnd()-warn:inconsistent-indenting
clang_recent_errors
|-- arm-buildonly-randconfig-r002-20221026
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- arm-buildonly-randconfig-r006-20221024
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|-- arm64-randconfig-r026-20221023
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc_link_dp.c:warning:no-previous-prototype-for-function-wake_up_aux_channel
|-- arm64-randconfig-r026-20221025
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r014-20221024
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- hexagon-randconfig-r015-20221023
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- hexagon-randconfig-r045-20221023
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-buildonly-randconfig-r002-20221024
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   `-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|-- i386-randconfig-a001-20221024
|   |-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|   |-- mm-khugepaged.c:warning:variable-index-is-used-uninitialized-whenever-if-condition-is-true
|   `-- mm-khugepaged.c:warning:variable-nr-is-used-uninitialized-whenever-if-condition-is-true
|-- i386-randconfig-a006-20221024
|   |-- mm-khugepaged.c:warning:variable-index-is-used-uninitialized-whenever-if-condition-is-true
|   `-- mm-khugepaged.c:warning:variable-nr-is-used-uninitialized-whenever-if-condition-is-true
|-- mips-randconfig-r016-20221024
|   `-- fs-ntfs3-namei.c:warning:variable-uni1-is-used-uninitialized-whenever-if-condition-is-true
|-- mips-randconfig-r034-20221023
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt2701.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-hdmi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(uns
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8173.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   |-- drivers-phy-mediatek-phy-mtk-mipi-dsi-mt8183.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:
|   `-- drivers-phy-mediatek-phy-mtk-tphy.c:warning:result-of-comparison-of-constant-with-expression-of-type-typeof-(_Generic((mask_)-char:(unsigned-char)-unsigned-char:(unsigned-char)-signed-char:(unsigned-c
|-- riscv-randconfig-r001-20221026
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_pos:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_lookup_name:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_num_syms
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-kallsyms_on_each_symbol:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets

elapsed time: 724m

configs tested: 93
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
arm                                 defconfig
x86_64                              defconfig
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                               rhel-8.3
arc                  randconfig-r043-20221024
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
arm                              allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
arm64                            allyesconfig
x86_64                          rhel-8.3-func
ia64                             allmodconfig
x86_64                           rhel-8.3-kvm
arc                                 defconfig
powerpc                   motionpro_defconfig
s390                             allmodconfig
i386                             allyesconfig
riscv                randconfig-r042-20221024
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
s390                 randconfig-r044-20221024
s390                                defconfig
powerpc                           allnoconfig
sh                        sh7785lcr_defconfig
i386                 randconfig-a011-20221024
sh                         ecovec24_defconfig
m68k                        stmark2_defconfig
i386                 randconfig-a015-20221024
i386                 randconfig-a014-20221024
powerpc                          allmodconfig
ia64                          tiger_defconfig
s390                             allyesconfig
sh                               allmodconfig
i386                 randconfig-a013-20221024
mips                             allyesconfig
arc                         haps_hs_defconfig
i386                 randconfig-a012-20221024
sparc                            alldefconfig
i386                 randconfig-a016-20221024
csky                                defconfig
m68k                          hp300_defconfig
arm                      footbridge_defconfig
s390                       zfcpdump_defconfig
loongarch                           defconfig
mips                     loongson1b_defconfig
arm                         axm55xx_defconfig
m68k                          amiga_defconfig
arm                          gemini_defconfig
parisc                              defconfig
m68k                             allmodconfig
arc                              allyesconfig
sh                        apsh4ad0a_defconfig
alpha                            allyesconfig
i386                          randconfig-c001
m68k                             allyesconfig
arc                  randconfig-r043-20221023
x86_64               randconfig-a013-20221024
x86_64               randconfig-a012-20221024
riscv                            allmodconfig

clang tested configs:
i386                 randconfig-a004-20221024
i386                 randconfig-a001-20221024
hexagon              randconfig-r041-20221024
x86_64                        randconfig-a012
i386                 randconfig-a002-20221024
x86_64               randconfig-a001-20221024
hexagon              randconfig-r045-20221024
x86_64               randconfig-a003-20221024
i386                 randconfig-a005-20221024
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64               randconfig-a004-20221024
x86_64               randconfig-a002-20221024
i386                 randconfig-a003-20221024
x86_64               randconfig-a005-20221024
x86_64               randconfig-a006-20221024
i386                 randconfig-a006-20221024
arm                       spear13xx_defconfig
arm                      tct_hammer_defconfig
mips                          rm200_defconfig
riscv                          rv32_defconfig
arm                         lpc32xx_defconfig
powerpc                    socrates_defconfig
arm                          pxa168_defconfig
mips                      malta_kvm_defconfig
riscv                randconfig-r042-20221023
hexagon              randconfig-r041-20221023
hexagon              randconfig-r045-20221023
s390                 randconfig-r044-20221023

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
