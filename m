Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B366F2FB6CA
	for <lists+amd-gfx@lfdr.de>; Tue, 19 Jan 2021 15:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7613F6E3D2;
	Tue, 19 Jan 2021 14:16:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3F86E827
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 14:16:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id o10so1670740wmc.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 Jan 2021 06:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nFt+YpFVsbMYP8EV/m0Vt/3QX8JhlLGdGkPHttBpPdU=;
 b=IpHX5vNj31fIGlRfpqJBn+ss8IFqmlrjnlBqouM6PKqcdkXBOxi1MkC3skOv5CmnL5
 ZCJv1p3RZxy5pVtTlxlWGaFLBJ+3KXpOfzfkxKQwH0R4dEgW3lGs4d6CW9rumrSazspe
 YN74N0kKRnq8r9VC1dRAzJbXHmQExC0Q3miVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nFt+YpFVsbMYP8EV/m0Vt/3QX8JhlLGdGkPHttBpPdU=;
 b=kfRBqaQVXUyokQJ6iwBPwQiRmZ2B5gnmza6T548aUETuxgrtcy/vHqSPUso1B85V+h
 DpDaXkARSxu0s9j+IWsQmo3baa9VP+FWaDhEhjvOYGU8gegtYAVVVO5N0CX2taSGGsYE
 dmbS1hskmnsG3E2N2e2ySrj/n1DgDkdEYNnOGc71Kb0tgMXia0zKn1pqiOtKMSSZvfxs
 t8VNYH/ttzFDP617XI/pTSpwtD2cKYsesVTzsrms3fizFtjoIobuiAUDwXFMaeizqoFJ
 Zu4gfFkfBA31PR6X6oVUOmiRVR3Rmr3C+ZnGSCD5VAqGL8P7//Zu0fwqoqj201xVQoqF
 0aQg==
X-Gm-Message-State: AOAM530PAhvxDtEdOB+Jsd1Lpttz1b1WB45vPgI67hHDh2W2KlanWIa/
 WctrmB68I1m7u/xbEe0beJfDnQ==
X-Google-Smtp-Source: ABdhPJwVtNScv/jsZYA/ZP7uPNCplDzK4xVFfxK+pOpNHk8+bos5V6RzwEX/7lKNTwyqRm1rPvr/xQ==
X-Received: by 2002:a7b:cc83:: with SMTP id p3mr2463988wma.10.1611065800353;
 Tue, 19 Jan 2021 06:16:40 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n10sm34962822wrx.21.2021.01.19.06.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 06:16:39 -0800 (PST)
Date: Tue, 19 Jan 2021 15:16:37 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
Message-ID: <YAbpxbTifiupYJML@phenom.ffwll.local>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: robh@kernel.org, gregkh@linuxfoundation.org,
 ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 eric@anholt.net, ppaalanen@gmail.com, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com,
 Harry.Wentland@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
> Until now extracting a card either by physical extraction (e.g. eGPU with 
> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove) 
> would cause random crashes in user apps. The random crashes in apps were 
> mostly due to the app having mapped a device backed BO into its address 
> space was still trying to access the BO while the backing device was gone.
> To answer this first problem Christian suggested to fix the handling of mapped 
> memory in the clients when the device goes away by forcibly unmap all buffers the 
> user processes has by clearing their respective VMAs mapping the device BOs. 
> Then when the VMAs try to fill in the page tables again we check in the fault 
> handlerif the device is removed and if so, return an error. This will generate a 
> SIGBUS to the application which can then cleanly terminate.This indeed was done 
> but this in turn created a problem of kernel OOPs were the OOPSes were due to the 
> fact that while the app was terminating because of the SIGBUSit would trigger use 
> after free in the driver by calling to accesses device structures that were already 
> released from the pci remove sequence.This was handled by introducing a 'flush' 
> sequence during device removal were we wait for drm file reference to drop to 0 
> meaning all user clients directly using this device terminated.
> 
> v2:
> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document 
> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and 
> waiting for all user clients having CPU mapping of device BOs to die was dropped. 
> Instead as per the document suggestion the device structures are kept alive until 
> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs 
> belonging to the device directly or by dma-buf import are rerouted to per user 
> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2] 
> since i am trying to get the minimal set of requirements that still give useful solution 
> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my 
> test case is removing a secondary device, which is render only and is not involved 
> in KMS.
> 
> v3:
> More updates following comments from v2 such as removing loop to find DRM file when rerouting 
> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving 
> prevention of GPU recovery post device unplug from amdgpu to scheduler layer. 
> On top of that added unplug support for the IOMMU enabled system.
> 
> v4:
> Drop last sysfs hack and use sysfs default attribute.
> Guard against write accesses after device removal to avoid modifying released memory.
> Update dummy pages handling to on demand allocation and release through drm managed framework.
> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention 
> of GPU recovery post device unplug
> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
> 
> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears 
> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working 
> with the primary card or soft reset the device without hangs or oopses
> 
> TODOs for followup work:
> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
> 
> [1] - Discussions during v3 of the patchset https://www.spinics.net/lists/amd-gfx/msg55576.html
> [2] - drm/doc: device hot-unplug for userspace https://www.spinics.net/lists/dri-devel/msg259755.html
> [3] - Related gitlab ticket https://gitlab.freedesktop.org/drm/amd/-/issues/1081

btw have you tried this out with some of the igts we have? core_hotunplug
is the one I'm thinking of. Might be worth to extend this for amdgpu
specific stuff (like run some batches on it while hotunplugging).

Since there's so many corner cases we need to test here (shared dma-buf,
shared dma_fence) I think it would make sense to have a shared testcase
across drivers. Only specific thing would be some hooks to keep the gpu
busy in some fashion while we yank the driver. But just to get it started
you can throw in entirely amdgpu specific subtests and just share some of
the test code.
-Daniel

> 
> Andrey Grodzovsky (13):
>   drm/ttm: Remap all page faults to per process dummy page.
>   drm: Unamp the entire device address space on device unplug
>   drm/ttm: Expose ttm_tt_unpopulate for driver use
>   drm/sched: Cancel and flush all oustatdning jobs before finish.
>   drm/amdgpu: Split amdgpu_device_fini into early and late
>   drm/amdgpu: Add early fini callback
>   drm/amdgpu: Register IOMMU topology notifier per device.
>   drm/amdgpu: Fix a bunch of sdma code crash post device unplug
>   drm/amdgpu: Remap all page faults to per process dummy page.
>   dmr/amdgpu: Move some sysfs attrs creation to default_attr
>   drm/amdgpu: Guard against write accesses after device removal
>   drm/sched: Make timeout timer rearm conditional.
>   drm/amdgpu: Prevent any job recoveries after device is unplugged.
> 
> Luben Tuikov (1):
>   drm/scheduler: Job timeout handler returns status
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
>  drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
>  drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
>  drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
>  drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
>  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
>  drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
>  drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
>  drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
>  drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
>  drivers/gpu/drm/drm_drv.c                         |   3 +
>  drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
>  drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
>  drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
>  drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
>  drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
>  include/drm/gpu_scheduler.h                       |  17 ++-
>  include/drm/ttm/ttm_bo_api.h                      |   2 +
>  45 files changed, 583 insertions(+), 198 deletions(-)
> 
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
