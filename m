Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDA6D0ACD
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Mar 2023 18:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F95F10E002;
	Thu, 30 Mar 2023 16:14:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C38010E002
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680192844; x=1711728844;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=7ElYsMNT+HJxJYO4GGzC6zAdpQ1oT6NK5jOdZEm5or4=;
 b=DoAdQC/vEowyn/pKBiO0RjznT7+flVpI0vlk/WvLAsHp+vjoVrV+rd3I
 t2A6Ctsqq9wd+Rtu2cnXQX+6stJiaTB9qf818u7SBwjiMrIx/Qrhx/7FW
 pu2yhNgZzrxEs0xawzivIp4ID1F3njDjJZ4y7yK8XqrxqTjOouPxE53Ti
 d06p7uHC86xBksltrWp+Jz68+7UxeU6gO3UnQNCPiVm8JuukgjGATWXXC
 Ug9Yle6LTbwT0WRzFZ6DnCdEU5oJF+WwIhonJC+nC1hi0W/krpjbB7p++
 5Xav1k4aNbI5hsp77k3d6zILlyAKlvQA0hpWs7eBnmn7R0e15K8s3s9K1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427491642"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="427491642"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 09:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795715444"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="795715444"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 30 Mar 2023 09:14:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1phuuV-000KzO-3D;
 Thu, 30 Mar 2023 16:13:59 +0000
Date: Fri, 31 Mar 2023 00:13:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 a6d9e3034536ba4b68ac34490c02267e6eec9c05
Message-ID: <6425b53f.mjvjApBCFlusUbza%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, linux-watchdog@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-gpio@vger.kernel.org,
 bpf@vger.kernel.org, io-uring@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: a6d9e3034536ba4b68ac34490c02267e6eec9c05  Add linux-next specific files for 20230330

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202303161521.jbGbaFjJ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202303301712.i4ddVa9j-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:351:13: warning: variable 'bw_needed' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_validation.c:352:25: warning: variable 'link' set but not used [-Wunused-but-set-variable]
drivers/net/wireless/legacy/ray_cs.c:628:17: warning: 'strncpy' specified bound 32 equals destination size [-Wstringop-truncation]
kernel/bpf/verifier.c:18485: undefined reference to `find_kallsyms_symbol_value'
sound/pci/ymfpci/ymfpci_main.c:2259:9: error: implicit declaration of function 'snd_ac97_suspend'; did you mean 'snd_ac97_reset'? [-Werror=implicit-function-declaration]
sound/pci/ymfpci/ymfpci_main.c:2288:9: error: implicit declaration of function 'snd_ac97_resume'; did you mean 'snd_ac97_reset'? [-Werror=implicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/acpi/property.c:985 acpi_data_prop_read_single() error: potentially dereferencing uninitialized 'obj'.
drivers/pinctrl/pinctrl-mlxbf3.c:162:20: sparse: sparse: symbol 'mlxbf3_pmx_funcs' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:442:22: sparse: sparse: symbol 'imx_wdt' was not declared. Should it be static?
drivers/watchdog/imx2_wdt.c:446:22: sparse: sparse: symbol 'imx_wdt_legacy' was not declared. Should it be static?
io_uring/io_uring.c:432 io_prep_async_work() error: we previously assumed 'req->file' could be null (see line 425)
io_uring/kbuf.c:221 __io_remove_buffers() warn: variable dereferenced before check 'bl->buf_ring' (see line 219)
net/mac80211/mesh_pathtbl.c:616:24: warning: Value stored to 'cache' during its initialization is never read [clang-analyzer-deadcode.DeadStores]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-randconfig-r024-20230329
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- arm-randconfig-s031-20230329
|   `-- drivers-pinctrl-pinctrl-mlxbf3.c:sparse:sparse:symbol-mlxbf3_pmx_funcs-was-not-declared.-Should-it-be-static
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|   `-- drivers-net-wireless-legacy-ray_cs.c:warning:strncpy-specified-bound-equals-destination-size
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- loongarch-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- microblaze-buildonly-randconfig-r001-20230329
|   |-- sound-pci-ymfpci-ymfpci_main.c:error:implicit-declaration-of-function-snd_ac97_resume
|   `-- sound-pci-ymfpci-ymfpci_main.c:error:implicit-declaration-of-function-snd_ac97_suspend
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-bw_needed-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_validation.c:warning:variable-link-set-but-not-used
|-- mips-randconfig-s032-20230329
|   |-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt-was-not-declared.-Should-it-be-static
|   `-- drivers-watchdog-imx2_wdt.c:sparse:sparse:symbol-imx_wdt_legacy-was-not-declared.-Should-it-be-static
|-- nios2-buildonly-randconfig-r005-20230329
clang_recent_errors
`-- riscv-randconfig-c006-20230326
    `-- net-mac80211-mesh_pathtbl.c:warning:Value-stored-to-cache-during-its-initialization-is-never-read-clang-analyzer-deadcode.DeadStores

elapsed time: 722m

configs tested: 104
configs skipped: 7

tested configs:
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allyesconfig   gcc  
arc          buildonly-randconfig-r002-20230329   gcc  
arc                                 defconfig   gcc  
arc                  randconfig-r013-20230329   gcc  
arc                  randconfig-r043-20230329   gcc  
arm                              allmodconfig   gcc  
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   gcc  
arm                                 defconfig   gcc  
arm                         lpc18xx_defconfig   gcc  
arm                  randconfig-r003-20230329   clang
arm                  randconfig-r024-20230329   gcc  
arm                  randconfig-r046-20230329   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                                defconfig   gcc  
csky                 randconfig-r026-20230329   gcc  
hexagon              randconfig-r033-20230329   clang
hexagon              randconfig-r041-20230329   clang
hexagon              randconfig-r045-20230329   clang
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
ia64                 randconfig-r005-20230329   gcc  
ia64                 randconfig-r016-20230329   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch    buildonly-randconfig-r003-20230329   gcc  
loongarch                           defconfig   gcc  
loongarch            randconfig-r006-20230329   gcc  
loongarch            randconfig-r011-20230329   gcc  
m68k                             allmodconfig   gcc  
m68k                                defconfig   gcc  
m68k                 randconfig-r004-20230329   gcc  
microblaze   buildonly-randconfig-r004-20230329   gcc  
mips                             allmodconfig   gcc  
mips                             allyesconfig   gcc  
mips                 randconfig-r012-20230329   gcc  
nios2                               defconfig   gcc  
nios2                randconfig-r015-20230329   gcc  
openrisc             randconfig-r032-20230329   gcc  
parisc       buildonly-randconfig-r005-20230329   gcc  
parisc                              defconfig   gcc  
parisc               randconfig-r021-20230329   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                       holly_defconfig   gcc  
powerpc              randconfig-r031-20230329   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                               defconfig   gcc  
riscv                randconfig-r022-20230329   clang
riscv                randconfig-r036-20230329   gcc  
riscv                randconfig-r042-20230329   clang
riscv                          rv32_defconfig   gcc  
s390                             alldefconfig   clang
s390                             allmodconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                 randconfig-r014-20230329   clang
s390                 randconfig-r023-20230329   clang
s390                 randconfig-r034-20230329   gcc  
s390                 randconfig-r044-20230329   clang
sh                               allmodconfig   gcc  
sh                         microdev_defconfig   gcc  
sparc        buildonly-randconfig-r006-20230329   gcc  
sparc                               defconfig   gcc  
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
xtensa               randconfig-r025-20230329   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
