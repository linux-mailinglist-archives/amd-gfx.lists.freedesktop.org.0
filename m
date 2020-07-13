Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E4821E9A3
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 09:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 813A76E932;
	Tue, 14 Jul 2020 07:09:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88A16E839
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2020 23:48:42 +0000 (UTC)
IronPort-SDR: ZNHoQgwx194/VhIRHxj5aIMZvOUnnSvSpvTfdl1Ak9XztOy5xsrcZ56SPdhgS5OymXxjGdACn4
 v+2GILnF7Fsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="136226985"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="136226985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 16:48:41 -0700
IronPort-SDR: tXhh4TFbT2ZaYDOh4vGNPG0IJkokXqy25LmDMJhsc4slKTDe6jynd4n396J6jwzSnW4CpPMpqO
 pXe05PNJDfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="281570422"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga003.jf.intel.com with ESMTP; 13 Jul 2020 16:48:41 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>, "Joerg Roedel" <joro@8bytes.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "H Peter Anvin" <hpa@zytor.com>,
 "David Woodhouse" <dwmw2@infradead.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 "Felix Kuehling" <Felix.Kuehling@amd.com>,
 "Dave Hansen" <dave.hansen@intel.com>, "Tony Luck" <tony.luck@intel.com>,
 "Jean-Philippe Brucker" <jean-philippe@linaro.org>,
 "Christoph Hellwig" <hch@infradead.org>, "Ashok Raj" <ashok.raj@intel.com>,
 "Jacob Jun Pan" <jacob.jun.pan@intel.com>,
 "Dave Jiang" <dave.jiang@intel.com>, "Sohil Mehta" <sohil.mehta@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v6 00/12]  x86: tag application address space for devices
Date: Mon, 13 Jul 2020 16:47:55 -0700
Message-Id: <1594684087-61184-1-git-send-email-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.5.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:09:57 +0000
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
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 amd-gfx <amd-gfx@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi, Thomas, Joerg, and other maintainers,

This series only has one change in patch 1 on top of v5 (see change log).
Could you please consider to merge it upstream?

Thanks.

-Fenghua

=====

Typical hardware devices require a driver stack to translate application
buffers to hardware addresses, and a kernel-user transition to notify the
hardware of new work. What if both the translation and transition overhead
could be eliminated? This is what Shared Virtual Address (SVA) and ENQCMD
enabled hardware like Data Streaming Accelerator (DSA) aims to achieve.
Applications map portals in their local-address-space and directly submit
work to them using a new instruction.

This series enables ENQCMD and associated management of the new MSR
(MSR_IA32_PASID). This new MSR allows an application address space to be
associated with what the PCIe spec calls a Process Address Space ID (PASID).
This PASID tag is carried along with all requests between applications and
devices and allows devices to interact with the process address space.

SVA and ENQCMD enabled device drivers need this series. The phase 2 DSA
patches with SVA and ENQCMD support was released on the top of this series:
https://lore.kernel.org/patchwork/cover/1244060/

This series only provides simple and basic support for ENQCMD and the MSR:
1. Clean up type definitions (patch 1-2). These patches can be in a
   separate series.
   - Define "pasid" as "u32" consistently
   - Define "flags" as "unsigned int"
2. Explain different various technical terms used in the series (patch 3).
3. Enumerate support for ENQCMD in the processor (patch 4).
4. Handle FPU PASID state and the MSR during context switch (patches 5-6).
5. Define "pasid" in mm_struct (patch 7).
5. Clear PASID state for new mm and forked and cloned thread (patch 8-9).
6. Allocate and free PASID for a process (patch 10).
7. Fix up the PASID MSR in #GP handler when one thread in a process
   executes ENQCMD for the first time (patches 11-12).

This patch series and the DSA phase 2 series are in
https://github.com/intel/idxd-driver/tree/idxd-stage2

References:
1. Detailed information on the ENQCMD/ENQCMDS instructions and the
IA32_PASID MSR can be found in Intel Architecture Instruction Set
Extensions and Future Features Programming Reference:
https://software.intel.com/sites/default/files/managed/c5/15/architecture-instruction-set-extensions-programming-reference.pdf

2. Detailed information on DSA can be found in DSA specification:
https://software.intel.com/en-us/download/intel-data-streaming-accelerator-preliminary-architecture-specification

Chang log:
v6:
- Change return type to u32 for kfd_pasid_alloc() in patch 1 (Felix)

v5:
- Mark ENQCMD disabled when configured out and use cpu_feature_enabled()
  to simplify the feature checking code in patch 10 and 12 (PeterZ and
  Dave Hansen)
- Add Reviewed-by: Lu Baolu to patch 1, 2, 10, and 12.

v4:
- Define PASID as "u32" instead of "unsigned int" in patch 1, 7, 10, 12.
  (Christoph)
- Drop v3 patch 2 which changes PASID type in ocxl because it's not related
  to x86 and was rejected by ocxl maintainer Frederic Barrat
- A split patch which changes PASID type to u32 in crypto/hisilicon/qm.c
  was released separately to linux-crypto mailing list because it's not
  related to x86 and is a standalone patch:

v3:
- Change names of bind_mm() and unbind_mm() to match to new APIs in
  patch 4 (Baolu)
- Change CONFIG_PCI_PASID to CONFIG_IOMMU_SUPPORT because non-PCI device
  can have PASID in ARM in patch 8 (Jean)
- Add a few sanity checks in __free_pasid() and alloc_pasid() in
  patch 11 (Baolu)
- Add patch 12 to define a new flag "has_valid_pasid" for a task and
  use the flag to identify if the task has a valid PASID MSR (PeterZ)
- Add fpu__pasid_write() to update the MSR in fixup() in patch 13
- Check if mm->pasid can be found in fixup() in patch 13

v2:
- Add patches 1-3 to define "pasid" and "flags" as "unsigned int"
  consistently (Thomas)
  (these 3 patches could be in a separate patch set)
- Add patch 8 to move "pasid" to generic mm_struct (Christoph).
  Jean-Philippe Brucker released a virtually same patch. Upstream only
  needs one of the two.
- Add patch 9 to initialize PASID in a new mm.
- Plus other changes described in each patch (Thomas)

Ashok Raj (1):
  docs: x86: Add documentation for SVA (Shared Virtual Addressing)

Fenghua Yu (9):
  iommu: Change type of pasid to u32
  iommu/vt-d: Change flags type to unsigned int in binding mm
  x86/cpufeatures: Enumerate ENQCMD and ENQCMDS instructions
  x86/msr-index: Define IA32_PASID MSR
  mm: Define pasid in mm
  fork: Clear PASID for new mm
  x86/process: Clear PASID state for a newly forked/cloned thread
  x86/mmu: Allocate/free PASID
  x86/traps: Fix up invalid PASID

Peter Zijlstra (1):
  sched: Define and initialize a flag to identify valid PASID in the
    task

Yu-cheng Yu (1):
  x86/fpu/xstate: Add supervisor PASID state for ENQCMD feature

 Documentation/x86/index.rst                   |   1 +
 Documentation/x86/sva.rst                     | 287 ++++++++++++++++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/disabled-features.h      |   9 +-
 arch/x86/include/asm/fpu/types.h              |  10 +
 arch/x86/include/asm/fpu/xstate.h             |   2 +-
 arch/x86/include/asm/iommu.h                  |   3 +
 arch/x86/include/asm/mmu_context.h            |  11 +
 arch/x86/include/asm/msr-index.h              |   3 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/fpu/xstate.c                  |   4 +
 arch/x86/kernel/process.c                     |  18 ++
 arch/x86/kernel/traps.c                       |  12 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +-
 .../drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c    |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v7.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v8.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h |   2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c       |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h       |   4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   8 +-
 .../gpu/drm/amd/amdkfd/cik_event_interrupt.c  |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgdev.c       |   2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_dbgmgr.h       |   2 +-
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |   7 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.c       |   8 +-
 drivers/gpu/drm/amd/amdkfd/kfd_events.h       |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_iommu.c        |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_pasid.c        |   4 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  20 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |   2 +-
 .../gpu/drm/amd/include/kgd_kfd_interface.h   |   2 +-
 drivers/iommu/amd/amd_iommu.h                 |  10 +-
 drivers/iommu/amd/iommu.c                     |  31 +-
 drivers/iommu/amd/iommu_v2.c                  |  20 +-
 drivers/iommu/intel/dmar.c                    |   7 +-
 drivers/iommu/intel/intel-pasid.h             |  24 +-
 drivers/iommu/intel/iommu.c                   |   4 +-
 drivers/iommu/intel/pasid.c                   |  31 +-
 drivers/iommu/intel/svm.c                     | 225 ++++++++++++--
 drivers/iommu/iommu.c                         |   2 +-
 drivers/misc/uacce/uacce.c                    |   2 +-
 include/linux/amd-iommu.h                     |   8 +-
 include/linux/intel-iommu.h                   |  14 +-
 include/linux/intel-svm.h                     |   2 +-
 include/linux/iommu.h                         |  10 +-
 include/linux/mm_types.h                      |   6 +
 include/linux/sched.h                         |   3 +
 include/linux/uacce.h                         |   2 +-
 kernel/fork.c                                 |  12 +
 54 files changed, 721 insertions(+), 159 deletions(-)
 create mode 100644 Documentation/x86/sva.rst

-- 
2.19.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
