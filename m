Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4C3690E30
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Feb 2023 17:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDB010E0EA;
	Thu,  9 Feb 2023 16:17:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB4010E0DF
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Feb 2023 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675959471; x=1707495471;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=a/E7KSmtv3G539B0tt8tIVjLISlpbH9X9w1Ki9UW8Zk=;
 b=di7yWCOgvPbsTmyXpdESVGzEY8C13Vv1hQonW5jqaqqIvAM5TJ7GNqVP
 58Q5LDvj/h9s1TesUpOPj36quXCN1TnlHIaEZv4MknYlOE/n3XvscHj9z
 lumS9FV/Z9GKh6bE1ekok9pRJnH9H8mfU51YuCpDU+dm5RpA5soPEuI5k
 UblFEBOUyofegmye1VT8LNIa1EN2a7d5AFMIG6rYOuCwI1qHqRn1IUWD5
 uzPZ7aDe97wyS8SndaKk090sME+40AEAfK0znT9hp1ODTAElpz9gxZNlO
 UcrRmbLCG8XEvVqdmILm6HAxJpLb/hJGJoHd7MM6M160L8UMKidIpFZYZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416370165"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="416370165"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 08:17:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="669628646"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; d="scan'208";a="669628646"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 08:17:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pQ9cK-0005AC-08;
 Thu, 09 Feb 2023 16:17:48 +0000
Date: Fri, 10 Feb 2023 00:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 20f513df926fac0594a3b65f79d856bd64251861
Message-ID: <63e51ca6.38vYfMSoflHo1I8c%lkp@intel.com>
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, Linux Memory Management List <linux-mm@kvack.org>,
 linux-serial@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 20f513df926fac0594a3b65f79d856bd64251861  Add linux-next specific files for 20230209

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310939.TAgCOEZb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302061911.C7xvHX9v-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302062224.ByzeTXh1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302092211.54EYDhYH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/sphinx/templates/kernel-toc.html: 1:36 Invalid token: #}
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
FAILED: load BTF from vmlinux: No data available
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6: warning: no previous prototype for 'hubbub31_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:948:6: warning: no previous prototype for 'hubbub32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:158:6: warning: no previous prototype for 'hubp32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1296:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:280:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1586:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
drivers/net/can/dev/bittiming.c:145:24: error: too many arguments to function 'can_calc_bittiming'
ftrace-ops.c:(.init.text+0x2c3): undefined reference to `__udivdi3'
libbpf: failed to find '.BTF' ELF section in vmlinux

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/tty/serial/8250/8250_dfl.c:63 dfl_uart_get_params() error: uninitialized symbol 'clk_freq'.
drivers/tty/serial/8250/8250_dfl.c:69 dfl_uart_get_params() error: uninitialized symbol 'fifo_len'.
drivers/tty/serial/8250/8250_dfl.c:90 dfl_uart_get_params() error: uninitialized symbol 'reg_layout'.
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
drivers/usb/gadget/function/uvc_configfs.c:537:2-8: preceding lock on line 528
drivers/usb/gadget/udc/renesas_usbf.c:2284:37: sparse:    left side has type unsigned short
drivers/usb/gadget/udc/renesas_usbf.c:2284:37: sparse:    right side has type restricted __le16
drivers/usb/gadget/udc/renesas_usbf.c:2284:37: sparse: sparse: invalid assignment: |=
drivers/usb/gadget/udc/renesas_usbf.c:2325:31: sparse: sparse: restricted __le16 degrades to integer
drivers/usb/host/xhci-plat.c:371 xhci_generic_plat_probe() error: we previously assumed 'sysdev' could be null (see line 361)
sound/firewire/amdtp-stream.c:1187 process_rx_packets() error: uninitialized symbol 'curr_cycle_time'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- alpha-randconfig-s043-20230209
|   `-- drivers-usb-gadget-composite.c:sparse:sparse:restricted-__le16-degrades-to-integer
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-randconfig-r046-20230209
|   `-- drivers-net-can-dev-bittiming.c:error:too-many-arguments-to-function-can_calc_bittiming
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- csky-randconfig-m041-20230209
|   |-- drivers-usb-host-xhci-plat.c-xhci_generic_plat_probe()-error:we-previously-assumed-sysdev-could-be-null-(see-line-)
|   `-- sound-firewire-amdtp-stream.c-process_rx_packets()-error:uninitialized-symbol-curr_cycle_time-.
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|   `-- ftrace-ops.c:(.init.text):undefined-reference-to-__udivdi3
|-- i386-randconfig-m021
|   `-- kernel-trace-trace_events_synth.c-trace_event_raw_event_synth()-warn:inconsistent-indenting
|-- ia64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- microblaze-randconfig-r013-20230209
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- nios2-randconfig-c031-20230209
clang_recent_errors
`-- s390-randconfig-r022-20230209
    `-- ERROR:devm_platform_ioremap_resource-drivers-dma-idma64.ko-undefined

elapsed time: 725m

configs tested: 75
configs skipped: 4

gcc tested configs:
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                            allnoconfig
arc                                 defconfig
alpha                               defconfig
i386                                defconfig
s390                             allmodconfig
s390                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
s390                             allyesconfig
x86_64                        randconfig-a004
i386                             allyesconfig
x86_64                        randconfig-a002
x86_64                              defconfig
arm                                 defconfig
arm                           u8500_defconfig
i386                          randconfig-a005
nios2                               defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
powerpc                          allmodconfig
x86_64                        randconfig-a013
x86_64                    rhel-8.3-kselftests
x86_64                               rhel-8.3
x86_64                           rhel-8.3-bpf
parisc                generic-64bit_defconfig
x86_64                        randconfig-a006
mips                             allyesconfig
riscv             nommu_k210_sdcard_defconfig
x86_64                           rhel-8.3-syz
powerpc                  storcenter_defconfig
sh                               allmodconfig
powerpc                      pcm030_defconfig
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
arc                  randconfig-r043-20230209
ia64                             allmodconfig
arm                  randconfig-r046-20230209
x86_64                        randconfig-a011
m68k                             allmodconfig
x86_64                        randconfig-a015
alpha                            allyesconfig
x86_64                           allyesconfig
m68k                             allyesconfig
arm                              allyesconfig
arc                              allyesconfig
arm64                            allyesconfig
i386                          randconfig-a014
sh                   sh7724_generic_defconfig
sh                        edosk7760_defconfig
sh                        sh7785lcr_defconfig
xtensa                          iss_defconfig
sh                          landisk_defconfig
sh                         microdev_defconfig
mips                         cobalt_defconfig
sh                          rsk7269_defconfig

clang tested configs:
x86_64                          rhel-8.3-rust
i386                          randconfig-a002
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a001
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a003
hexagon              randconfig-r041-20230209
hexagon              randconfig-r045-20230209
x86_64                        randconfig-a012
s390                 randconfig-r044-20230209
x86_64                        randconfig-a014
riscv                randconfig-r042-20230209
i386                          randconfig-a013
powerpc                   bluestone_defconfig
mips                      pic32mzda_defconfig
powerpc                      ppc64e_defconfig

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
