Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB3F674123
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Jan 2023 19:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586BB10E1E0;
	Thu, 19 Jan 2023 18:42:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B16E10E1CE
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Jan 2023 18:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674153729; x=1705689729;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=q4o9kflqG0iNYlQlt5XKi8GkpnkbCfsjhiiSbsGnuZ4=;
 b=nyk3uPrMCMikSzfWyOtJTra9QaemcWOsI3fZGfpT+xpgb2oJano6ltoA
 Frp5ekLh9AofR0WqX5uyCBHTUIK/fG8XjBEqIxkVDGOSQL7P56AJ0brWk
 9mi0uI9d5ArZdAoC3hXKNheIyvU+BVw0/JJtVstcerQ4ZUQahXyvkC3T+
 qk4TS0uKvp9Bnb48h05yHuhudYZmkUMxl+bZycDhgLakpHtToGbiU6YsZ
 SZ7xhG1aiXZ81sgQ58qYWU9mEFR/XqyajuhaJ2+pP8EM3FZ1u6gY6GsRJ
 BtiGzWLhSl2EPVRtZojj+FaKZxgYu6czR2FZVQbsvtyNrq7Imw57fzf8n g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326659680"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="326659680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 10:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="749029368"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="749029368"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Jan 2023 10:42:06 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pIZrR-0001jm-2c;
 Thu, 19 Jan 2023 18:42:05 +0000
Date: Fri, 20 Jan 2023 02:41:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 aa5c49149a823599764e6953229b028e4bf6e9cc
Message-ID: <63c98ef4.WF7KGM4apV4U5xFO%lkp@intel.com>
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
 linux-wireless@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: aa5c49149a823599764e6953229b028e4bf6e9cc  Add linux-next specific files for 20230119

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301191616.R33Dvxk4-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301192229.wL7iPJxS-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1125:76: error: storage size of 'hdmi_encoded_link_bw' isn't known
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:1129:101: error: 'struct <anonymous>' has no member named 'MAX_ENCODED_LINK_BW_SUPPORT'
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:231:17: error: function declaration isn't a prototype [-Werror=strict-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_capability.c:233:42: error: parameter 2 ('hdmi_encoded_link_bw') has incomplete type
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:1583:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:    left side has type restricted __le16
drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:5198:24: sparse:    right side has type restricted __le32
idma64.c:(.text+0x6a): undefined reference to `devm_platform_ioremap_resource'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-randconfig-r024-20230119
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arc-randconfig-r023-20230118
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- mips-randconfig-r036-20230118
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- openrisc-randconfig-s043-20230119
|   |-- drivers-net-wireless-realtek-rtl8xxxu-rtl8xxxu_core.c:sparse:left-side-has-type-restricted-__le16
|   |-- drivers-net-wireless-realtek-rtl8xxxu-rtl8xxxu_core.c:sparse:right-side-has-type-restricted-__le32
|   `-- drivers-net-wireless-realtek-rtl8xxxu-rtl8xxxu_core.c:sparse:sparse:invalid-assignment:
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:function-declaration-isn-t-a-prototype
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:parameter-(-hdmi_encoded_link_bw-)-has-incomplete-type
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:storage-size-of-hdmi_encoded_link_bw-isn-t-known
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_capability.c:error:struct-anonymous-has-no-member-named-MAX_ENCODED_LINK_BW_SUPPORT
`-- x86_64-allyesconfig
    `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
clang_recent_errors
`-- s390-randconfig-r044-20230119
    `-- idma64.c:(.text):undefined-reference-to-devm_platform_ioremap_resource

elapsed time: 721m

configs tested: 53
configs skipped: 2

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
x86_64                           rhel-8.3-bpf
x86_64                         rhel-8.3-kunit
i386                                defconfig
x86_64                            allnoconfig
s390                                defconfig
x86_64                           rhel-8.3-syz
s390                             allmodconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
arc                              allyesconfig
arc                  randconfig-r043-20230118
alpha                            allyesconfig
s390                             allyesconfig
x86_64                        randconfig-a004
riscv                randconfig-r042-20230118
m68k                             allyesconfig
x86_64                        randconfig-a002
s390                 randconfig-r044-20230118
x86_64                        randconfig-a006
um                             i386_defconfig
x86_64                    rhel-8.3-kselftests
powerpc                          allmodconfig
i386                          randconfig-a012
x86_64                              defconfig
mips                             allyesconfig
um                           x86_64_defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
powerpc                           allnoconfig
i386                          randconfig-a014
ia64                             allmodconfig
arm                                 defconfig
i386                          randconfig-a001
i386                          randconfig-a003
arm                              allyesconfig
i386                             allyesconfig
x86_64                        randconfig-a015
arm64                            allyesconfig
x86_64                           allyesconfig
sh                               allmodconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230118
arm                  randconfig-r046-20230118
hexagon              randconfig-r045-20230118
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a011
x86_64                        randconfig-a005
i386                          randconfig-a013
i386                          randconfig-a002
i386                          randconfig-a004

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
