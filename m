Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOGINUcbBWpuSgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 14 May 2026 02:45:59 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05553C6E8
	for <lists+amd-gfx@lfdr.de>; Thu, 14 May 2026 02:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4D510F0E3;
	Thu, 14 May 2026 00:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UVpAhvtC";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279DE10E35A;
 Thu, 14 May 2026 00:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778719554; x=1810255554;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=155Am94qWe/f3pp9RvZy6Owf9p1+ieYSxje12j4/trI=;
 b=UVpAhvtCJcDLFPnYJkBZbA714yfHEOMDTQ0+UKgxEeKoB2vUny4+WWEp
 iYz3ciSsrTiPriUPqXTOrp2MsGDW8XL0ajFSbH5bJD6jYUM9IhahjNihC
 WQG2RXtmfBXiRmDE5XhCuz50aW+eIFz7CH8F2IqbJQ7xwO1VBwvUeIjq/
 VEkroWhLS9WnhxEpmueJesQy2qwGJxP2udCmKb3fxRBlmR2QhF3OaQBBg
 htAoEh4Q3GhKLK7UVuB1ZS1d4sbhxONvn74lYgJK3do6IuVxT1baWHlRs
 xm6R28Z2DlBwITpd9r9hEOSR2EITzyLwEhcpmQy5q8MZFGAIDHWPx1myR g==;
X-CSE-ConnectionGUID: 5JXM0gweSzmlqBuqboV0Fw==
X-CSE-MsgGUID: oWau6bNdRHuI6C9ipkMXBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="82222877"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="82222877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 17:45:54 -0700
X-CSE-ConnectionGUID: G/z3JY/6QK69mHz1Z2vkxQ==
X-CSE-MsgGUID: Ja+PiS1rSnicC0N+EQfSmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="235578919"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
 by fmviesa008.fm.intel.com with ESMTP; 13 May 2026 17:45:50 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1wNKCy-000000005RD-27ZJ;
 Thu, 14 May 2026 00:45:48 +0000
Date: Thu, 14 May 2026 08:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 timur.kristof@gmail.com, pratap.nirujogi@amd.com,
 vitaly.prosyak@amd.com, harry.wentland@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/amdgpu: Remove UML build exclusion from Kconfig
Message-ID: <202605140801.Fqury68H-lkp@intel.com>
References: <20260505162018.1755740-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505162018.1755740-1-alex.hung@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 8B05553C6E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,intel.com:email,intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

Hi Alex,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-amdgpu-Remove-UML-build-exclusion-from-Kconfig/20260513-150500
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260505162018.1755740-1-alex.hung%40amd.com
patch subject: [PATCH] drm/amdgpu: Remove UML build exclusion from Kconfig
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260514/202605140801.Fqury68H-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140801.Fqury68H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605140801.Fqury68H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:26:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:9: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2353:41: error: member reference base type 'int' is not a structure or union
    2353 |         return cpu_data(first_cpu_of_numa_node).topo.apicid;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:24:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:27: error: call to undeclared function 'cpu_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                  ^
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:26: error: cannot take the address of an rvalue of type 'int'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                                 ^~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:7: error: incomplete definition of type 'struct cpuinfo_x86'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |             ~^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1830:9: note: forward declaration of 'struct cpuinfo_x86'
    1830 |         struct cpuinfo_x86 *c = &cpu_data(0);
         |                ^
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_crat.c:1833:23: error: use of undeclared identifier 'X86_VENDOR_AMD'
    1833 |         if (c->x86_vendor == X86_VENDOR_AMD)
         |                              ^
   1 warning and 4 errors generated.


vim +/cpu_data +2353 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c

851a645efd0fee Felix Kuehling  2017-11-27  2342  
520b8fb755ccfb Felix Kuehling  2017-12-08  2343  static int kfd_cpumask_to_apic_id(const struct cpumask *cpumask)
520b8fb755ccfb Felix Kuehling  2017-12-08  2344  {
520b8fb755ccfb Felix Kuehling  2017-12-08  2345  	int first_cpu_of_numa_node;
520b8fb755ccfb Felix Kuehling  2017-12-08  2346  
520b8fb755ccfb Felix Kuehling  2017-12-08  2347  	if (!cpumask || cpumask == cpu_none_mask)
520b8fb755ccfb Felix Kuehling  2017-12-08  2348  		return -1;
520b8fb755ccfb Felix Kuehling  2017-12-08  2349  	first_cpu_of_numa_node = cpumask_first(cpumask);
520b8fb755ccfb Felix Kuehling  2017-12-08  2350  	if (first_cpu_of_numa_node >= nr_cpu_ids)
520b8fb755ccfb Felix Kuehling  2017-12-08  2351  		return -1;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2352  #ifdef CONFIG_X86_64
b9655e702dc5d8 Thomas Gleixner 2023-08-14 @2353  	return cpu_data(first_cpu_of_numa_node).topo.apicid;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2354  #else
df1dd4f4a7271e Felix Kuehling  2019-01-02  2355  	return first_cpu_of_numa_node;
df1dd4f4a7271e Felix Kuehling  2019-01-02  2356  #endif
520b8fb755ccfb Felix Kuehling  2017-12-08  2357  }
520b8fb755ccfb Felix Kuehling  2017-12-08  2358  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
