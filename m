Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A34BE50B14C
	for <lists+amd-gfx@lfdr.de>; Fri, 22 Apr 2022 09:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CE8112051;
	Fri, 22 Apr 2022 07:22:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CADE112067;
 Fri, 22 Apr 2022 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650612142; x=1682148142;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=54uPXnpOKTc1vOCOTw8Ebq5poxf4kBz8CQDiKhkuYyY=;
 b=l9H24cSlUjKJwhYsD1XshqLkqYhucf7FO/rN6DUWKvMUXfZ2nqpAbMNF
 z4z5d9UgAcBxaoOfJqJnaufU17vUiqzyZ4pqCxHaAYQbXuou5nA1UrqgY
 igQ/auoJZxGZHro55m3JLhl3ruZouj9BRCbWSVnj4UwQBfBVlA1ptc/XB
 HgfhXzVF1yY5BcJj0KjBChQKEJKyTHrb82kpn54XBOcaK6AqqWwS6J50y
 r8Qnce1E9+U7ygWagPBEOK/y91g1dtfHLc6MeUK+PXgTT7q1fjoLVwNmJ
 7da6dXRdcNmn+g9o70iBO5+yRELdCuS0y8QkVVGn3CQY1RPXy5DhWSciD A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246506547"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="246506547"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 00:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; d="scan'208";a="703435581"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2022 00:22:17 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nhncO-0009qg-Si;
 Fri, 22 Apr 2022 07:22:16 +0000
Date: Sat, 02 Apr 2022 00:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 e5071887cd2296a7704dbcd10c1cedf0f11cdbd5
Message-ID: <62472ade.gKOU2lZDqqbsbpHA%lkp@intel.com>
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-iio@vger.kernel.org,
 netdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: e5071887cd2296a7704dbcd10c1cedf0f11cdbd5  Add linux-next specific files for 20220401

Error/Warning reports:

https://lore.kernel.org/linux-media/202203171537.sVhYE362-lkp@intel.com
https://lore.kernel.org/linux-media/202203171840.ZXc3IgpZ-lkp@intel.com
https://lore.kernel.org/lkml/202204010033.oeIla4qb-lkp@intel.com
https://lore.kernel.org/llvm/202203241958.Uw9bWfMD-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

/kbuild/src/includecheck/kernel/sched/sched.h: linux/static_key.h is included more than once.
drivers/bus/mhi/host/main.c:792:13: warning: parameter 'event_quota' set but not used [-Wunused-but-set-parameter]
imx-mipi-csis.c:(.text+0x10fc): undefined reference to `v4l2_subdev_init'
imx-mipi-csis.c:(.text+0x13c8): undefined reference to `v4l_bound_align_image'
imx-mipi-csis.c:(.text+0x154c): undefined reference to `v4l2_subdev_call_wrappers'
imx-mipi-csis.c:(.text+0x1904): undefined reference to `v4l2_async_nf_unregister'
imx-mipi-csis.c:(.text+0x474): undefined reference to `v4l2_async_nf_init'
imx-mipi-csis.c:(.text+0x5f8): undefined reference to `v4l2_create_fwnode_links_to_pad'

Unverified Error/Warning (likely false positive, please contact us if interested):

arch/s390/include/asm/spinlock.h:81:3: error: unexpected token in '.rept' directive
arch/s390/include/asm/spinlock.h:81:3: error: unknown directive
arch/s390/include/asm/spinlock.h:81:3: error: unmatched '.endr' directive
arch/s390/lib/spinlock.c:78:3: error: unexpected token in '.rept' directive
arch/s390/lib/spinlock.c:78:3: error: unknown directive
arch/s390/lib/spinlock.c:78:3: error: unmatched '.endr' directive
drivers/clk/imx/clk-pll14xx.c:166:2: warning: Value stored to 'pll_div_ctl1' is never read [clang-analyzer-deadcode.DeadStores]
drivers/counter/104-quad-8.c:150:9: sparse:    unsigned char
drivers/counter/104-quad-8.c:150:9: sparse:    void
drivers/counter/104-quad-8.c:150:9: sparse: sparse: incompatible types in conditional expression (different base types):
drivers/dma-buf/st-dma-fence-unwrap.c:125:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
drivers/firmware/turris-mox-rwtm.c:146:1: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubp.c:57:6: warning: no previous prototype for 'hubp31_program_extended_blank' [-Wmissing-prototypes]
drivers/gpu/drm/msm/hdmi/hdmi.c:565:8: warning: Call to function 'sscanf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/gpu/drm/selftests/test-drm_buddy.c:523:7: warning: Value stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
drivers/hid/hid-core.c:1665:30: warning: Although the value stored to 'field' is used in the enclosing expression, the value is never actually read from 'field' [clang-analyzer-deadcode.DeadStores]
drivers/hwmon/nsa320-hwmon.c:114:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/hwmon/scpi-hwmon.c:121:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/hwmon/vt8231.c:634:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/leds/trigger/ledtrig-tty.c:33:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/media/platform/st/stm32/dma2d/dma2d-hw.c:109:1: internal compiler error: in extract_insn, at recog.c:2770
drivers/memory/brcmstb_dpfe.c:707:10: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/message/fusion/mptbase.c:6820:6: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/net/vxlan/vxlan_core.c:440:34: sparse: sparse: incorrect type in argument 2 (different base types)
drivers/pci/vgaarb.c:213:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
drivers/phy/broadcom/phy-brcm-usb.c:233:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:589:29: warning: array subscript 'struct ndis_802_11_wep[0]' is partly outside array bounds of 'unsigned char[25]' [-Warray-bounds]
drivers/usb/gadget/configfs.c:237:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/usb/gadget/udc/core.c:1664:9: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/usb/typec/altmodes/displayport.c:396:8: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/usb/typec/rt1719.c:604:18: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
drivers/video/fbdev/matrox/matroxfb_base.c:1094:5: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
drivers/vme/bridges/vme_tsi148.c:754:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
kernel/sched/core.c:5268:20: warning: no previous prototype for function 'task_sched_runtime' [-Wmissing-prototypes]
kernel/sched/core.c:8979:6: warning: no previous prototype for 'idle_task_exit' [-Wmissing-prototypes]
kernel/sched/core.c:8979:6: warning: no previous prototype for function 'idle_task_exit' [-Wmissing-prototypes]
kernel/sched/core.c:9214:5: warning: no previous prototype for 'sched_cpu_activate' [-Wmissing-prototypes]
kernel/sched/core.c:9214:5: warning: no previous prototype for function 'sched_cpu_activate' [-Wmissing-prototypes]
kernel/sched/core.c:9259:5: warning: no previous prototype for 'sched_cpu_deactivate' [-Wmissing-prototypes]
kernel/sched/core.c:9259:5: warning: no previous prototype for function 'sched_cpu_deactivate' [-Wmissing-prototypes]
kernel/sched/core.c:9334:5: warning: no previous prototype for 'sched_cpu_starting' [-Wmissing-prototypes]
kernel/sched/core.c:9334:5: warning: no previous prototype for function 'sched_cpu_starting' [-Wmissing-prototypes]
kernel/sched/core.c:9355:5: warning: no previous prototype for 'sched_cpu_wait_empty' [-Wmissing-prototypes]
kernel/sched/core.c:9355:5: warning: no previous prototype for function 'sched_cpu_wait_empty' [-Wmissing-prototypes]
kernel/sched/core.c:9397:5: warning: no previous prototype for 'sched_cpu_dying' [-Wmissing-prototypes]
kernel/sched/core.c:9397:5: warning: no previous prototype for function 'sched_cpu_dying' [-Wmissing-prototypes]
kernel/sched/core.c:9420:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
kernel/sched/core.c:9453:13: warning: no previous prototype for function 'sched_init_smp' [-Wmissing-prototypes]
kernel/sched/core.c:9481:13: warning: no previous prototype for function 'sched_init' [-Wmissing-prototypes]
kernel/sched/fair.c:10665:6: warning: no previous prototype for 'nohz_balance_enter_idle' [-Wmissing-prototypes]
kernel/sched/fair.c:10665:6: warning: no previous prototype for function 'nohz_balance_enter_idle' [-Wmissing-prototypes]
kernel/sched/loadavg.c:245:6: warning: no previous prototype for 'calc_load_nohz_start' [-Wmissing-prototypes]
kernel/sched/loadavg.c:245:6: warning: no previous prototype for function 'calc_load_nohz_start' [-Wmissing-prototypes]
kernel/sched/loadavg.c:258:6: warning: no previous prototype for 'calc_load_nohz_remote' [-Wmissing-prototypes]
kernel/sched/loadavg.c:258:6: warning: no previous prototype for function 'calc_load_nohz_remote' [-Wmissing-prototypes]
kernel/sched/loadavg.c:263:6: warning: no previous prototype for 'calc_load_nohz_stop' [-Wmissing-prototypes]
kernel/sched/loadavg.c:263:6: warning: no previous prototype for function 'calc_load_nohz_stop' [-Wmissing-prototypes]
lib/vsprintf.c:2781:5: warning: Null pointer passed as 1st argument to memory copy function [clang-analyzer-unix.cstring.NullArg]
lib/vsprintf.c:2801:12: warning: Dereference of null pointer (loaded from variable 'str') [clang-analyzer-core.NullDereference]
sound/spi/at73c213.c:992:2: warning: Call to function 'sprintf' is insecure as it does not provide bounding of the memory buffer or security checks introduced in the C11 standard. Replace with analogous functions that support length arguments or provides boundary checks such as 'sprintf_s' in case of C11 [clang-analyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- alpha-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arc-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arc-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arc-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arc-randconfig-r001-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- arc-randconfig-r034-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arc-randconfig-r036-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- arc-randconfig-r043-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm-mps2_defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm64-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm64-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm64-defconfig
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- arm64-randconfig-r035-20220331
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l2_async_nf_init
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l2_async_nf_unregister
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l2_create_fwnode_links_to_pad
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l2_subdev_call_wrappers
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l2_subdev_init
|   |-- imx-mipi-csis.c:(.text):undefined-reference-to-v4l_bound_align_image
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- csky-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- csky-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- csky-buildonly-randconfig-r002-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- csky-defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- csky-randconfig-r035-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- h8300-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-media-platform-st-stm32-dma2d-dma2d-hw.c:internal-compiler-error:in-extract_insn-at-recog.c
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- h8300-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-media-platform-st-stm32-dma2d-dma2d-hw.c:internal-compiler-error:in-extract_insn-at-recog.c
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- h8300-randconfig-r026-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- h8300-randconfig-r032-20220331
|   `-- drivers-staging-rtl8723bs-os_dep-ioctl_linux.c:warning:array-subscript-struct-ndis_802_11_wep-is-partly-outside-array-bounds-of-unsigned-char
|-- i386-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-debian-10.3
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-debian-10.3-kselftests
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-randconfig-a003
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- i386-randconfig-a005
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- i386-randconfig-a012
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-randconfig-a014
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- i386-randconfig-a016
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- i386-randconfig-c001
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-randconfig-m021
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- i386-randconfig-s001
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- i386-randconfig-s002
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|   `-- mm-secretmem.c:sparse:sparse:symbol-secretmem_iops-was-not-declared.-Should-it-be-static
|-- ia64-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- ia64-allyesconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- ia64-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- ia64-randconfig-p001-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- ia64-randconfig-r014-20220401
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- ia64-randconfig-s031-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- m68k-allmodconfig
|   |-- drivers-counter-quad-.c:sparse:sparse:incompatible-types-in-conditional-expression-(different-base-types):
|   |-- drivers-counter-quad-.c:sparse:unsigned-char
|   |-- drivers-counter-quad-.c:sparse:void
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   `-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|-- m68k-allyesconfig
|   |-- drivers-counter-quad-.c:sparse:sparse:incompatible-types-in-conditional-expression-(different-base-types):
|   |-- drivers-counter-quad-.c:sparse:unsigned-char
|   |-- drivers-counter-quad-.c:sparse:void
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   `-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|-- microblaze-randconfig-r011-20220401
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- microblaze-randconfig-r036-20220331
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- mips-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- mips-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- mips-xway_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- nios2-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- nios2-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- nios2-defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- parisc-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- parisc-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- parisc-randconfig-r002-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- parisc64-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- powerpc-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- powerpc-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- powerpc-holly_defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- powerpc-randconfig-r003-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- powerpc64-randconfig-r034-20220331
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubp.c:warning:no-previous-prototype-for-hubp31_program_extended_blank
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- powerpc64-randconfig-s032-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- riscv-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- riscv-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- riscv-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- riscv-nommu_k210_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- riscv-nommu_virt_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|-- riscv-rv32_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- s390-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- s390-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- s390-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- s390-randconfig-r031-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- sh-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- sh-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- sparc-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-const-volatile-noderef-__iomem-addr-got-void
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-icr_base-got-void-noderef-__iomem
|   |-- drivers-irqchip-irq-renesas-h8s.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-static-toplevel-ipr_base-got-void-noderef-__iomem
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- sparc-randconfig-m031-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- sparc64-randconfig-c023-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|-- sparc64-randconfig-r023-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- um-allmodconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- um-i386_defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- um-x86_64_defconfig
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-allnoconfig
|   `-- kernel-sched-sched.h:linux-static_key.h-is-included-more-than-once.
|-- x86_64-allyesconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-kexec
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-a002
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-a004
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-a006
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-a011
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-a015
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-c002
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-c022
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-s021
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-randconfig-s022
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|   `-- mm-secretmem.c:sparse:sparse:symbol-secretmem_iops-was-not-declared.-Should-it-be-static
|-- x86_64-rhel-8.3
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-rhel-8.3-func
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-rhel-8.3-kselftests
|   |-- drivers-net-vxlan-vxlan_core.c:sparse:sparse:incorrect-type-in-argument-(different-base-types)-expected-unsigned-int-usertype-b-got-restricted-__be32-usertype-vni
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- x86_64-rhel-8.3-kunit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-sched_cpu_wait_empty
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- xtensa-allmodconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
|-- xtensa-allyesconfig
|   |-- drivers-dma-buf-st-dma-fence-unwrap.c:warning:variable-err-set-but-not-used
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop
`-- xtensa-buildonly-randconfig-r003-20220331
    |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_remote
    |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_start
    `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-calc_load_nohz_stop

clang_recent_errors
|-- arm-colibri_pxa300_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- arm-mainstone_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- arm-pxa168_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- arm-randconfig-c002-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- drivers-gpu-drm-msm-hdmi-hdmi.c:warning:Call-to-function-sscanf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogo
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   |-- drivers-hwmon-nsa320-hwmon.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous
|   |-- drivers-hwmon-scpi-hwmon.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous-f
|   |-- drivers-hwmon-vt8231.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous-funct
|   |-- drivers-leds-trigger-ledtrig-tty.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-ana
|   |-- drivers-memory-brcmstb_dpfe.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogou
|   |-- drivers-message-fusion-mptbase.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analo
|   |-- drivers-phy-broadcom-phy-brcm-usb.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-an
|   |-- drivers-video-fbdev-matrox-matroxfb_base.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-
|   |-- drivers-vme-bridges-vme_tsi148.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analo
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- arm-spitz_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- arm64-randconfig-r015-20220401
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- arm64-randconfig-r025-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- hexagon-allnoconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- hexagon-randconfig-r012-20220401
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- hexagon-randconfig-r021-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- hexagon-randconfig-r031-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- hexagon-randconfig-r041-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- hexagon-randconfig-r045-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- i386-allnoconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- i386-randconfig-a002
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- i386-randconfig-a004
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- i386-randconfig-a006
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- i386-randconfig-a011
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- i386-randconfig-a013
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- i386-randconfig-a015
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- i386-randconfig-c001
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|   |-- lib-vsprintf.c:warning:Dereference-of-null-pointer-(loaded-from-variable-str-)-clang-analyzer-core.NullDereference
|   `-- lib-vsprintf.c:warning:Null-pointer-passed-as-1st-argument-to-memory-copy-function-clang-analyzer-unix.cstring.NullArg
|-- mips-bcm63xx_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- mips-buildonly-randconfig-r001-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- mips-omega2p_defconfig
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- mips-randconfig-c004-20220331
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-ana
|   |-- drivers-gpu-drm-selftests-test-drm_buddy.c:warning:Value-stored-to-err-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
|   |-- drivers-usb-gadget-configfs.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogou
|   |-- drivers-usb-gadget-udc-core.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogou
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|   `-- sound-spi-at73c213.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-analogous-functio
|-- mips-randconfig-r032-20220331
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- riscv-randconfig-c006-20220331
|   |-- drivers-clk-imx-clk-pll14xx.c:warning:Value-stored-to-pll_div_ctl1-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-firmware-turris-mox-rwtm.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-ana
|   |-- drivers-gpu-drm-selftests-test-drm_buddy.c:warning:Value-stored-to-err-is-never-read-clang-analyzer-deadcode.DeadStores
|   |-- drivers-phy-broadcom-phy-brcm-usb.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-with-an
|   |-- drivers-usb-typec-altmodes-displayport.c:warning:Call-to-function-sprintf-is-insecure-as-it-does-not-provide-bounding-of-the-memory-buffer-or-security-checks-introduced-in-the-C11-standard.-Replace-wi
|   |-- drivers-usb-typec-rt1719.c:warning:Assigned-value-is-garbage-or-undefined-clang-analyzer-core.uninitialized.Assign
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- riscv-randconfig-r042-20220331
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- s390-buildonly-randconfig-r005-20220331
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- s390-randconfig-c005-20220331
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- s390-randconfig-r044-20220331
|   |-- arch-s390-include-asm-spinlock.h:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unknown-directive
|   |-- arch-s390-include-asm-spinlock.h:error:unmatched-.endr-directive
|   |-- arch-s390-lib-spinlock.c:error:unexpected-token-in-.rept-directive
|   |-- arch-s390-lib-spinlock.c:error:unknown-directive
|   |-- arch-s390-lib-spinlock.c:error:unmatched-.endr-directive
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- x86_64-randconfig-a001
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- x86_64-randconfig-a003
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|-- x86_64-randconfig-a005
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- x86_64-randconfig-a012
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- x86_64-randconfig-a014
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
|   |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
|   |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
|   `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop
|-- x86_64-randconfig-a016
|   |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
|   |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
|   `-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
`-- x86_64-randconfig-c007
    |-- drivers-bus-mhi-host-main.c:warning:parameter-event_quota-set-but-not-used
    |-- drivers-hid-hid-core.c:warning:Although-the-value-stored-to-field-is-used-in-the-enclosing-expression-the-value-is-never-actually-read-from-field-clang-analyzer-deadcode.DeadStores
    |-- drivers-pci-vgaarb.c:warning:Value-stored-to-dev-during-its-initialization-is-never-read-clang-analyzer-deadcode.DeadStores
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-idle_task_exit
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_activate
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_deactivate
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_dying
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_starting
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_cpu_wait_empty
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-sched_init_smp
    |-- kernel-sched-core.c:warning:no-previous-prototype-for-function-task_sched_runtime
    |-- kernel-sched-fair.c:warning:no-previous-prototype-for-function-nohz_balance_enter_idle
    |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_remote
    |-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_start
    `-- kernel-sched-loadavg.c:warning:no-previous-prototype-for-function-calc_load_nohz_stop

elapsed time: 736m

configs tested: 115
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
m68k                             allyesconfig
powerpc                          allmodconfig
powerpc                          allyesconfig
m68k                             allmodconfig
s390                             allmodconfig
s390                             allyesconfig
parisc                           allyesconfig
sh                               allmodconfig
h8300                            allyesconfig
xtensa                           allyesconfig
arc                              allyesconfig
alpha                            allyesconfig
i386                          randconfig-c001
mips                           xway_defconfig
sh                          lboxre2_defconfig
arm                           h5000_defconfig
powerpc                       holly_defconfig
sh                           sh2007_defconfig
mips                            ar7_defconfig
sparc                            alldefconfig
sh                         ap325rxa_defconfig
powerpc                      ppc40x_defconfig
sh                          urquell_defconfig
mips                     loongson1b_defconfig
m68k                             alldefconfig
sh                          landisk_defconfig
arm                            mps2_defconfig
mips                         mpc30x_defconfig
openrisc                  or1klitex_defconfig
x86_64                        randconfig-c001
arm                  randconfig-c002-20220331
ia64                                defconfig
ia64                             allyesconfig
ia64                             allmodconfig
m68k                                defconfig
alpha                               defconfig
csky                                defconfig
nios2                            allyesconfig
arc                                 defconfig
parisc                              defconfig
parisc64                            defconfig
s390                                defconfig
nios2                               defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
i386                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
x86_64                        randconfig-a004
x86_64                        randconfig-a002
x86_64                        randconfig-a006
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
i386                          randconfig-a014
i386                          randconfig-a012
i386                          randconfig-a016
arc                  randconfig-r043-20220331
riscv                            allmodconfig
riscv                    nommu_k210_defconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allyesconfig
riscv                               defconfig
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                                  kexec
x86_64                          rhel-8.3-func
x86_64                               rhel-8.3
x86_64                         rhel-8.3-kunit

clang tested configs:
powerpc              randconfig-c003-20220331
x86_64                        randconfig-c007
s390                 randconfig-c005-20220331
arm                  randconfig-c002-20220331
riscv                randconfig-c006-20220331
mips                 randconfig-c004-20220331
i386                          randconfig-c001
mips                        bcm63xx_defconfig
arm                       mainstone_defconfig
arm                           spitz_defconfig
powerpc                      ppc44x_defconfig
mips                        omega2p_defconfig
powerpc                   lite5200b_defconfig
arm                          pxa168_defconfig
arm                  colibri_pxa300_defconfig
x86_64                        randconfig-a005
x86_64                        randconfig-a001
x86_64                        randconfig-a003
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016
i386                          randconfig-a013
i386                          randconfig-a011
i386                          randconfig-a015
hexagon              randconfig-r045-20220331
hexagon              randconfig-r041-20220331
riscv                randconfig-r042-20220331
s390                 randconfig-r044-20220331

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
