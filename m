Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45C8BE3D8
	for <lists+amd-gfx@lfdr.de>; Tue,  7 May 2024 15:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399991124BA;
	Tue,  7 May 2024 13:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RW92NyjA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5877F1124BA
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 May 2024 13:26:40 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-1ed96772f92so21437695ad.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 May 2024 06:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715088400; x=1715693200; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XwZfnWQ8+Ky/3ZXSx5ExjI5FYyBxRd/urt+UrOl5Cp4=;
 b=RW92NyjA8fhaSwhpoDqc+OQcsnu/hQv3Chle8gt0PBmKKDm9Tz0oeNISBNQrkKR5Zp
 En8sKuR4BcIEgVbvj8aYr7QQYafR32R2xsYV34+lLAEt284FrWezQHq0Z9g8zKDmaHba
 K0qRvPQjNikHCMY1hk3OcsjIAD7I82FmyA73strlv5ak2qvfVkao1c11CfOpnByR3FTw
 4xqaUCSEl8Ne1F845sTInyZJoQT/f29mmA3DgeBBmzlywqWuisJQBYsvGPxnfNfHboKd
 8OPvZMYMiKYlNTMfaUxnphEiKoeFhuzFaHo20DkCKj2fW5BJH0HeddE+T6sG4x/2p4XY
 NYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715088400; x=1715693200;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XwZfnWQ8+Ky/3ZXSx5ExjI5FYyBxRd/urt+UrOl5Cp4=;
 b=MAO+ZyX+6DEbBa3FQtih+qEbCeCBEd8N3X1UGdJWLJtgB2Cwb7pigfRxAmSnUsVDxJ
 HshHIrTTs54zdFgrIJOC7jevKalFaNqwbi+5GobKB2KS9HEKOlvq9NCcrhyYsieISYkR
 vlsKXhrQSEJUziPCD+Hj/YiTtj06FdjMDRq09m8LOozZVHng2Hd/X3++tplGvYNEyTbn
 q8JsMYKMSKfZXvl2ulPMpOUwFS3bGzJqJzA0HygNA4ZtO+FJA/O5Y8pEECOS9vZ+DXh3
 uUJtcGcCHF5PLRETVOBOke7ay/vIgKgmGR0SuUvOOZYjdbDgj/k2LjQ0PL9NYUbGbm9a
 82Tg==
X-Gm-Message-State: AOJu0Yz6gl56LmPZKZkVOXXTb+ombtq5YhdP8Awikc5Tp+4NSuYVjkt9
 yn2OaSXeqEPw3eqj4SEdwbq6wxg2f+UFz9NBzjDoZYKydUiCUpAEiNeUMWK+u8pf/V3gS3UyAr8
 ppBORIp5Rq4cc9Tfv/ynoI75hkvodyg==
X-Google-Smtp-Source: AGHT+IEicMsxfUW+HKwtXlx1uxi8eGfGW7X4hJO/ArJzWy6innSRUFA6stxywNTP3r7mpUmj0JfMAHu8L4sdCqJyhas=
X-Received: by 2002:a17:90a:5910:b0:2a7:455d:82db with SMTP id
 k16-20020a17090a591000b002a7455d82dbmr11061988pji.36.1715088399418; Tue, 07
 May 2024 06:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240502214132.7765-1-alexander.deucher@amd.com>
In-Reply-To: <20240502214132.7765-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 May 2024 09:26:26 -0400
Message-ID: <CADnq5_PPDMVbLWWS-K23CkNjd7xF=6W+7tGtENq9y8=SYEARQA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: drop MES 10.1 support
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Ping?

On Thu, May 2, 2024 at 6:07=E2=80=AFPM Alex Deucher <alexander.deucher@amd.=
com> wrote:
>
> It was an enablement vehicle for MES 11 and was never
> productized.  Remove it.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile           |    1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |   20 -
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.c        | 1189 -----------------
>  drivers/gpu/drm/amd/amdgpu/mes_v10_1.h        |   29 -
>  drivers/gpu/drm/amd/amdgpu/nv.c               |    1 -
>  5 files changed, 1240 deletions(-)
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
>  delete mode 100644 drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index de7b76327f5ba..6e1237a97a91e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -187,7 +187,6 @@ amdgpu-y +=3D \
>  # add MES block
>  amdgpu-y +=3D \
>         amdgpu_mes.o \
> -       mes_v10_1.o \
>         mes_v11_0.o \
>         mes_v12_0.o
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index ece462f8a324b..20887fd5a3342 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -94,7 +94,6 @@
>  #include "vcn_v4_0_5.h"
>  #include "jpeg_v4_0_5.h"
>  #include "amdgpu_vkms.h"
> -#include "mes_v10_1.h"
>  #include "mes_v11_0.h"
>  #include "mes_v12_0.h"
>  #include "smuio_v11_0.h"
> @@ -2213,25 +2212,6 @@ static int amdgpu_discovery_set_mm_ip_blocks(struc=
t amdgpu_device *adev)
>  static int amdgpu_discovery_set_mes_ip_blocks(struct amdgpu_device *adev=
)
>  {
>         switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 1, 10):
> -       case IP_VERSION(10, 1, 1):
> -       case IP_VERSION(10, 1, 2):
> -       case IP_VERSION(10, 1, 3):
> -       case IP_VERSION(10, 1, 4):
> -       case IP_VERSION(10, 3, 0):
> -       case IP_VERSION(10, 3, 1):
> -       case IP_VERSION(10, 3, 2):
> -       case IP_VERSION(10, 3, 3):
> -       case IP_VERSION(10, 3, 4):
> -       case IP_VERSION(10, 3, 5):
> -       case IP_VERSION(10, 3, 6):
> -               if (amdgpu_mes) {
> -                       amdgpu_device_ip_block_add(adev, &mes_v10_1_ip_bl=
ock);
> -                       adev->enable_mes =3D true;
> -                       if (amdgpu_mes_kiq)
> -                               adev->enable_mes_kiq =3D true;
> -               }
> -               break;
>         case IP_VERSION(11, 0, 0):
>         case IP_VERSION(11, 0, 1):
>         case IP_VERSION(11, 0, 2):
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd=
/amdgpu/mes_v10_1.c
> deleted file mode 100644
> index a626bf9049260..0000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
> +++ /dev/null
> @@ -1,1189 +0,0 @@
> -/*
> - * Copyright 2019 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#include <linux/firmware.h>
> -#include <linux/module.h>
> -#include "amdgpu.h"
> -#include "soc15_common.h"
> -#include "nv.h"
> -#include "gc/gc_10_1_0_offset.h"
> -#include "gc/gc_10_1_0_sh_mask.h"
> -#include "gc/gc_10_1_0_default.h"
> -#include "v10_structs.h"
> -#include "mes_api_def.h"
> -
> -#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid               0x2820
> -#define mmCP_MES_IC_OP_CNTL_Sienna_Cichlid_BASE_IDX      1
> -#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid             0x4ca1
> -#define mmRLC_CP_SCHEDULERS_Sienna_Cichlid_BASE_IDX    1
> -
> -MODULE_FIRMWARE("amdgpu/navi10_mes.bin");
> -MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes.bin");
> -MODULE_FIRMWARE("amdgpu/sienna_cichlid_mes1.bin");
> -
> -static int mes_v10_1_hw_fini(void *handle);
> -static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev);
> -
> -#define MES_EOP_SIZE   2048
> -
> -static void mes_v10_1_ring_set_wptr(struct amdgpu_ring *ring)
> -{
> -       struct amdgpu_device *adev =3D ring->adev;
> -
> -       if (ring->use_doorbell) {
> -               atomic64_set((atomic64_t *)ring->wptr_cpu_addr,
> -                            ring->wptr);
> -               WDOORBELL64(ring->doorbell_index, ring->wptr);
> -       } else {
> -               BUG();
> -       }
> -}
> -
> -static u64 mes_v10_1_ring_get_rptr(struct amdgpu_ring *ring)
> -{
> -       return *ring->rptr_cpu_addr;
> -}
> -
> -static u64 mes_v10_1_ring_get_wptr(struct amdgpu_ring *ring)
> -{
> -       u64 wptr;
> -
> -       if (ring->use_doorbell)
> -               wptr =3D atomic64_read((atomic64_t *)ring->wptr_cpu_addr)=
;
> -       else
> -               BUG();
> -       return wptr;
> -}
> -
> -static const struct amdgpu_ring_funcs mes_v10_1_ring_funcs =3D {
> -       .type =3D AMDGPU_RING_TYPE_MES,
> -       .align_mask =3D 1,
> -       .nop =3D 0,
> -       .support_64bit_ptrs =3D true,
> -       .get_rptr =3D mes_v10_1_ring_get_rptr,
> -       .get_wptr =3D mes_v10_1_ring_get_wptr,
> -       .set_wptr =3D mes_v10_1_ring_set_wptr,
> -       .insert_nop =3D amdgpu_ring_insert_nop,
> -};
> -
> -static int mes_v10_1_submit_pkt_and_poll_completion(struct amdgpu_mes *m=
es,
> -                                                   void *pkt, int size,
> -                                                   int api_status_off)
> -{
> -       int ndw =3D size / 4;
> -       signed long r;
> -       union MESAPI__ADD_QUEUE *x_pkt =3D pkt;
> -       struct MES_API_STATUS *api_status;
> -       struct amdgpu_device *adev =3D mes->adev;
> -       struct amdgpu_ring *ring =3D &mes->ring;
> -       unsigned long flags;
> -
> -       BUG_ON(size % 4 !=3D 0);
> -
> -       spin_lock_irqsave(&mes->ring_lock, flags);
> -       if (amdgpu_ring_alloc(ring, ndw)) {
> -               spin_unlock_irqrestore(&mes->ring_lock, flags);
> -               return -ENOMEM;
> -       }
> -
> -       api_status =3D (struct MES_API_STATUS *)((char *)pkt + api_status=
_off);
> -       api_status->api_completion_fence_addr =3D mes->ring.fence_drv.gpu=
_addr;
> -       api_status->api_completion_fence_value =3D ++mes->ring.fence_drv.=
sync_seq;
> -
> -       amdgpu_ring_write_multiple(ring, pkt, ndw);
> -       amdgpu_ring_commit(ring);
> -       spin_unlock_irqrestore(&mes->ring_lock, flags);
> -
> -       DRM_DEBUG("MES msg=3D%d was emitted\n", x_pkt->header.opcode);
> -
> -       r =3D amdgpu_fence_wait_polling(ring, ring->fence_drv.sync_seq,
> -                                     adev->usec_timeout);
> -       if (r < 1) {
> -               DRM_ERROR("MES failed to response msg=3D%d\n",
> -                         x_pkt->header.opcode);
> -
> -               while (halt_if_hws_hang)
> -                       schedule();
> -
> -               return -ETIMEDOUT;
> -       }
> -
> -       return 0;
> -}
> -
> -static int convert_to_mes_queue_type(int queue_type)
> -{
> -       if (queue_type =3D=3D AMDGPU_RING_TYPE_GFX)
> -               return MES_QUEUE_TYPE_GFX;
> -       else if (queue_type =3D=3D AMDGPU_RING_TYPE_COMPUTE)
> -               return MES_QUEUE_TYPE_COMPUTE;
> -       else if (queue_type =3D=3D AMDGPU_RING_TYPE_SDMA)
> -               return MES_QUEUE_TYPE_SDMA;
> -       else
> -               BUG();
> -       return -1;
> -}
> -
> -static int mes_v10_1_add_hw_queue(struct amdgpu_mes *mes,
> -                                 struct mes_add_queue_input *input)
> -{
> -       struct amdgpu_device *adev =3D mes->adev;
> -       union MESAPI__ADD_QUEUE mes_add_queue_pkt;
> -       struct amdgpu_vmhub *hub =3D &adev->vmhub[AMDGPU_GFXHUB(0)];
> -       uint32_t vm_cntx_cntl =3D hub->vm_cntx_cntl;
> -
> -       memset(&mes_add_queue_pkt, 0, sizeof(mes_add_queue_pkt));
> -
> -       mes_add_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
> -       mes_add_queue_pkt.header.opcode =3D MES_SCH_API_ADD_QUEUE;
> -       mes_add_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
> -
> -       mes_add_queue_pkt.process_id =3D input->process_id;
> -       mes_add_queue_pkt.page_table_base_addr =3D input->page_table_base=
_addr;
> -       mes_add_queue_pkt.process_va_start =3D input->process_va_start;
> -       mes_add_queue_pkt.process_va_end =3D input->process_va_end;
> -       mes_add_queue_pkt.process_quantum =3D input->process_quantum;
> -       mes_add_queue_pkt.process_context_addr =3D input->process_context=
_addr;
> -       mes_add_queue_pkt.gang_quantum =3D input->gang_quantum;
> -       mes_add_queue_pkt.gang_context_addr =3D input->gang_context_addr;
> -       mes_add_queue_pkt.inprocess_gang_priority =3D
> -               input->inprocess_gang_priority;
> -       mes_add_queue_pkt.gang_global_priority_level =3D
> -               input->gang_global_priority_level;
> -       mes_add_queue_pkt.doorbell_offset =3D input->doorbell_offset;
> -       mes_add_queue_pkt.mqd_addr =3D input->mqd_addr;
> -       mes_add_queue_pkt.wptr_addr =3D input->wptr_addr;
> -       mes_add_queue_pkt.queue_type =3D
> -               convert_to_mes_queue_type(input->queue_type);
> -       mes_add_queue_pkt.paging =3D input->paging;
> -       mes_add_queue_pkt.vm_context_cntl =3D vm_cntx_cntl;
> -       mes_add_queue_pkt.gws_base =3D input->gws_base;
> -       mes_add_queue_pkt.gws_size =3D input->gws_size;
> -       mes_add_queue_pkt.trap_handler_addr =3D input->tba_addr;
> -
> -       return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -                       &mes_add_queue_pkt, sizeof(mes_add_queue_pkt),
> -                       offsetof(union MESAPI__ADD_QUEUE, api_status));
> -}
> -
> -static int mes_v10_1_remove_hw_queue(struct amdgpu_mes *mes,
> -                                    struct mes_remove_queue_input *input=
)
> -{
> -       union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
> -
> -       memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
> -
> -       mes_remove_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
> -       mes_remove_queue_pkt.header.opcode =3D MES_SCH_API_REMOVE_QUEUE;
> -       mes_remove_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
> -
> -       mes_remove_queue_pkt.doorbell_offset =3D input->doorbell_offset;
> -       mes_remove_queue_pkt.gang_context_addr =3D input->gang_context_ad=
dr;
> -
> -       return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -                       &mes_remove_queue_pkt, sizeof(mes_remove_queue_pk=
t),
> -                       offsetof(union MESAPI__REMOVE_QUEUE, api_status))=
;
> -}
> -
> -static int mes_v10_1_unmap_legacy_queue(struct amdgpu_mes *mes,
> -                                struct mes_unmap_legacy_queue_input *inp=
ut)
> -{
> -       union MESAPI__REMOVE_QUEUE mes_remove_queue_pkt;
> -
> -       memset(&mes_remove_queue_pkt, 0, sizeof(mes_remove_queue_pkt));
> -
> -       mes_remove_queue_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
> -       mes_remove_queue_pkt.header.opcode =3D MES_SCH_API_REMOVE_QUEUE;
> -       mes_remove_queue_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
> -
> -       mes_remove_queue_pkt.doorbell_offset =3D input->doorbell_offset;
> -       mes_remove_queue_pkt.gang_context_addr =3D 0;
> -
> -       mes_remove_queue_pkt.pipe_id =3D input->pipe_id;
> -       mes_remove_queue_pkt.queue_id =3D input->queue_id;
> -
> -       if (input->action =3D=3D PREEMPT_QUEUES_NO_UNMAP) {
> -               mes_remove_queue_pkt.preempt_legacy_gfx_queue =3D 1;
> -               mes_remove_queue_pkt.tf_addr =3D input->trail_fence_addr;
> -               mes_remove_queue_pkt.tf_data =3D
> -                       lower_32_bits(input->trail_fence_data);
> -       } else {
> -               if (input->queue_type =3D=3D AMDGPU_RING_TYPE_GFX)
> -                       mes_remove_queue_pkt.unmap_legacy_gfx_queue =3D 1=
;
> -               else
> -                       mes_remove_queue_pkt.unmap_kiq_utility_queue =3D =
1;
> -       }
> -
> -       return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -                       &mes_remove_queue_pkt, sizeof(mes_remove_queue_pk=
t),
> -                       offsetof(union MESAPI__REMOVE_QUEUE, api_status))=
;
> -}
> -
> -static int mes_v10_1_suspend_gang(struct amdgpu_mes *mes,
> -                                 struct mes_suspend_gang_input *input)
> -{
> -       return 0;
> -}
> -
> -static int mes_v10_1_resume_gang(struct amdgpu_mes *mes,
> -                                struct mes_resume_gang_input *input)
> -{
> -       return 0;
> -}
> -
> -static int mes_v10_1_query_sched_status(struct amdgpu_mes *mes)
> -{
> -       union MESAPI__QUERY_MES_STATUS mes_status_pkt;
> -
> -       memset(&mes_status_pkt, 0, sizeof(mes_status_pkt));
> -
> -       mes_status_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
> -       mes_status_pkt.header.opcode =3D MES_SCH_API_QUERY_SCHEDULER_STAT=
US;
> -       mes_status_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
> -
> -       return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -                       &mes_status_pkt, sizeof(mes_status_pkt),
> -                       offsetof(union MESAPI__QUERY_MES_STATUS, api_stat=
us));
> -}
> -
> -static int mes_v10_1_set_hw_resources(struct amdgpu_mes *mes)
> -{
> -       int i;
> -       struct amdgpu_device *adev =3D mes->adev;
> -       union MESAPI_SET_HW_RESOURCES mes_set_hw_res_pkt;
> -
> -       memset(&mes_set_hw_res_pkt, 0, sizeof(mes_set_hw_res_pkt));
> -
> -       mes_set_hw_res_pkt.header.type =3D MES_API_TYPE_SCHEDULER;
> -       mes_set_hw_res_pkt.header.opcode =3D MES_SCH_API_SET_HW_RSRC;
> -       mes_set_hw_res_pkt.header.dwsize =3D API_FRAME_SIZE_IN_DWORDS;
> -
> -       mes_set_hw_res_pkt.vmid_mask_mmhub =3D mes->vmid_mask_mmhub;
> -       mes_set_hw_res_pkt.vmid_mask_gfxhub =3D mes->vmid_mask_gfxhub;
> -       mes_set_hw_res_pkt.gds_size =3D adev->gds.gds_size;
> -       mes_set_hw_res_pkt.paging_vmid =3D 0;
> -       mes_set_hw_res_pkt.g_sch_ctx_gpu_mc_ptr =3D mes->sch_ctx_gpu_addr=
;
> -       mes_set_hw_res_pkt.query_status_fence_gpu_mc_ptr =3D
> -               mes->query_status_fence_gpu_addr;
> -
> -       for (i =3D 0; i < MAX_COMPUTE_PIPES; i++)
> -               mes_set_hw_res_pkt.compute_hqd_mask[i] =3D
> -                       mes->compute_hqd_mask[i];
> -
> -       for (i =3D 0; i < MAX_GFX_PIPES; i++)
> -               mes_set_hw_res_pkt.gfx_hqd_mask[i] =3D mes->gfx_hqd_mask[=
i];
> -
> -       for (i =3D 0; i < MAX_SDMA_PIPES; i++)
> -               mes_set_hw_res_pkt.sdma_hqd_mask[i] =3D mes->sdma_hqd_mas=
k[i];
> -
> -       for (i =3D 0; i < AMD_PRIORITY_NUM_LEVELS; i++)
> -               mes_set_hw_res_pkt.aggregated_doorbells[i] =3D
> -                       mes->aggregated_doorbells[i];
> -
> -       for (i =3D 0; i < 5; i++) {
> -               mes_set_hw_res_pkt.gc_base[i] =3D adev->reg_offset[GC_HWI=
P][0][i];
> -               mes_set_hw_res_pkt.mmhub_base[i] =3D
> -                       adev->reg_offset[MMHUB_HWIP][0][i];
> -               mes_set_hw_res_pkt.osssys_base[i] =3D
> -                       adev->reg_offset[OSSSYS_HWIP][0][i];
> -       }
> -
> -       mes_set_hw_res_pkt.disable_reset =3D 1;
> -       mes_set_hw_res_pkt.disable_mes_log =3D 1;
> -       mes_set_hw_res_pkt.use_different_vmid_compute =3D 1;
> -
> -       return mes_v10_1_submit_pkt_and_poll_completion(mes,
> -                       &mes_set_hw_res_pkt, sizeof(mes_set_hw_res_pkt),
> -                       offsetof(union MESAPI_SET_HW_RESOURCES, api_statu=
s));
> -}
> -
> -static void mes_v10_1_init_aggregated_doorbell(struct amdgpu_mes *mes)
> -{
> -       struct amdgpu_device *adev =3D mes->adev;
> -       uint32_t data;
> -
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1);
> -       data &=3D ~(CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET_MASK |
> -                 CP_MES_DOORBELL_CONTROL1__DOORBELL_EN_MASK |
> -                 CP_MES_DOORBELL_CONTROL1__DOORBELL_HIT_MASK);
> -       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_LOW=
] <<
> -               CP_MES_DOORBELL_CONTROL1__DOORBELL_OFFSET__SHIFT;
> -       data |=3D 1 << CP_MES_DOORBELL_CONTROL1__DOORBELL_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL1, data);
> -
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2);
> -       data &=3D ~(CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET_MASK |
> -                 CP_MES_DOORBELL_CONTROL2__DOORBELL_EN_MASK |
> -                 CP_MES_DOORBELL_CONTROL2__DOORBELL_HIT_MASK);
> -       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_NOR=
MAL] <<
> -               CP_MES_DOORBELL_CONTROL2__DOORBELL_OFFSET__SHIFT;
> -       data |=3D 1 << CP_MES_DOORBELL_CONTROL2__DOORBELL_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL2, data);
> -
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3);
> -       data &=3D ~(CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET_MASK |
> -                 CP_MES_DOORBELL_CONTROL3__DOORBELL_EN_MASK |
> -                 CP_MES_DOORBELL_CONTROL3__DOORBELL_HIT_MASK);
> -       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_MED=
IUM] <<
> -               CP_MES_DOORBELL_CONTROL3__DOORBELL_OFFSET__SHIFT;
> -       data |=3D 1 << CP_MES_DOORBELL_CONTROL3__DOORBELL_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL3, data);
> -
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4);
> -       data &=3D ~(CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET_MASK |
> -                 CP_MES_DOORBELL_CONTROL4__DOORBELL_EN_MASK |
> -                 CP_MES_DOORBELL_CONTROL4__DOORBELL_HIT_MASK);
> -       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_HIG=
H] <<
> -               CP_MES_DOORBELL_CONTROL4__DOORBELL_OFFSET__SHIFT;
> -       data |=3D 1 << CP_MES_DOORBELL_CONTROL4__DOORBELL_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL4, data);
> -
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5);
> -       data &=3D ~(CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET_MASK |
> -                 CP_MES_DOORBELL_CONTROL5__DOORBELL_EN_MASK |
> -                 CP_MES_DOORBELL_CONTROL5__DOORBELL_HIT_MASK);
> -       data |=3D mes->aggregated_doorbells[AMDGPU_MES_PRIORITY_LEVEL_REA=
LTIME] <<
> -               CP_MES_DOORBELL_CONTROL5__DOORBELL_OFFSET__SHIFT;
> -       data |=3D 1 << CP_MES_DOORBELL_CONTROL5__DOORBELL_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_MES_DOORBELL_CONTROL5, data);
> -
> -       data =3D 1 << CP_HQD_GFX_CONTROL__DB_UPDATED_MSG_EN__SHIFT;
> -       WREG32_SOC15(GC, 0, mmCP_HQD_GFX_CONTROL, data);
> -}
> -
> -static const struct amdgpu_mes_funcs mes_v10_1_funcs =3D {
> -       .add_hw_queue =3D mes_v10_1_add_hw_queue,
> -       .remove_hw_queue =3D mes_v10_1_remove_hw_queue,
> -       .unmap_legacy_queue =3D mes_v10_1_unmap_legacy_queue,
> -       .suspend_gang =3D mes_v10_1_suspend_gang,
> -       .resume_gang =3D mes_v10_1_resume_gang,
> -};
> -
> -static int mes_v10_1_allocate_ucode_buffer(struct amdgpu_device *adev,
> -                                          enum admgpu_mes_pipe pipe)
> -{
> -       int r;
> -       const struct mes_firmware_header_v1_0 *mes_hdr;
> -       const __le32 *fw_data;
> -       unsigned fw_size;
> -
> -       mes_hdr =3D (const struct mes_firmware_header_v1_0 *)
> -               adev->mes.fw[pipe]->data;
> -
> -       fw_data =3D (const __le32 *)(adev->mes.fw[pipe]->data +
> -                  le32_to_cpu(mes_hdr->mes_ucode_offset_bytes));
> -       fw_size =3D le32_to_cpu(mes_hdr->mes_ucode_size_bytes);
> -
> -       r =3D amdgpu_bo_create_reserved(adev, fw_size,
> -                                     PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> -                                     &adev->mes.ucode_fw_obj[pipe],
> -                                     &adev->mes.ucode_fw_gpu_addr[pipe],
> -                                     (void **)&adev->mes.ucode_fw_ptr[pi=
pe]);
> -       if (r) {
> -               dev_err(adev->dev, "(%d) failed to create mes fw bo\n", r=
);
> -               return r;
> -       }
> -
> -       memcpy(adev->mes.ucode_fw_ptr[pipe], fw_data, fw_size);
> -
> -       amdgpu_bo_kunmap(adev->mes.ucode_fw_obj[pipe]);
> -       amdgpu_bo_unreserve(adev->mes.ucode_fw_obj[pipe]);
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_allocate_ucode_data_buffer(struct amdgpu_device *ad=
ev,
> -                                               enum admgpu_mes_pipe pipe=
)
> -{
> -       int r;
> -       const struct mes_firmware_header_v1_0 *mes_hdr;
> -       const __le32 *fw_data;
> -       unsigned fw_size;
> -
> -       mes_hdr =3D (const struct mes_firmware_header_v1_0 *)
> -               adev->mes.fw[pipe]->data;
> -
> -       fw_data =3D (const __le32 *)(adev->mes.fw[pipe]->data +
> -                  le32_to_cpu(mes_hdr->mes_ucode_data_offset_bytes));
> -       fw_size =3D le32_to_cpu(mes_hdr->mes_ucode_data_size_bytes);
> -
> -       r =3D amdgpu_bo_create_reserved(adev, fw_size,
> -                                     64 * 1024, AMDGPU_GEM_DOMAIN_GTT,
> -                                     &adev->mes.data_fw_obj[pipe],
> -                                     &adev->mes.data_fw_gpu_addr[pipe],
> -                                     (void **)&adev->mes.data_fw_ptr[pip=
e]);
> -       if (r) {
> -               dev_err(adev->dev, "(%d) failed to create mes data fw bo\=
n", r);
> -               return r;
> -       }
> -
> -       memcpy(adev->mes.data_fw_ptr[pipe], fw_data, fw_size);
> -
> -       amdgpu_bo_kunmap(adev->mes.data_fw_obj[pipe]);
> -       amdgpu_bo_unreserve(adev->mes.data_fw_obj[pipe]);
> -
> -       return 0;
> -}
> -
> -static void mes_v10_1_free_ucode_buffers(struct amdgpu_device *adev,
> -                                        enum admgpu_mes_pipe pipe)
> -{
> -       amdgpu_bo_free_kernel(&adev->mes.data_fw_obj[pipe],
> -                             &adev->mes.data_fw_gpu_addr[pipe],
> -                             (void **)&adev->mes.data_fw_ptr[pipe]);
> -
> -       amdgpu_bo_free_kernel(&adev->mes.ucode_fw_obj[pipe],
> -                             &adev->mes.ucode_fw_gpu_addr[pipe],
> -                             (void **)&adev->mes.ucode_fw_ptr[pipe]);
> -}
> -
> -static void mes_v10_1_enable(struct amdgpu_device *adev, bool enable)
> -{
> -       uint32_t pipe, data =3D 0;
> -
> -       if (enable) {
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET=
, 1);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL,
> -                            MES_PIPE1_RESET, adev->enable_mes_kiq ? 1 : =
0);
> -               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -
> -               mutex_lock(&adev->srbm_mutex);
> -               for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -                       if (!adev->enable_mes_kiq &&
> -                           pipe =3D=3D AMDGPU_MES_KIQ_PIPE)
> -                               continue;
> -
> -                       nv_grbm_select(adev, 3, pipe, 0, 0);
> -                       WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
> -                            (uint32_t)(adev->mes.uc_start_addr[pipe]) >>=
 2);
> -               }
> -               nv_grbm_select(adev, 0, 0, 0, 0);
> -               mutex_unlock(&adev->srbm_mutex);
> -
> -               /* clear BYPASS_UNCACHED to avoid hangs after interrupt. =
*/
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL);
> -               data =3D REG_SET_FIELD(data, CP_MES_DC_OP_CNTL,
> -                                    BYPASS_UNCACHED, 0);
> -               WREG32_SOC15(GC, 0, mmCP_MES_DC_OP_CNTL, data);
> -
> -               /* unhalt MES and activate pipe0 */
> -               data =3D REG_SET_FIELD(0, CP_MES_CNTL, MES_PIPE0_ACTIVE, =
1);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIV=
E,
> -                                    adev->enable_mes_kiq ? 1 : 0);
> -               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -               udelay(100);
> -       } else {
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_CNTL);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_ACTIV=
E, 0);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_ACTIV=
E, 0);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL,
> -                                    MES_INVALIDATE_ICACHE, 1);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE0_RESET=
, 1);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_PIPE1_RESET=
,
> -                                    adev->enable_mes_kiq ? 1 : 0);
> -               data =3D REG_SET_FIELD(data, CP_MES_CNTL, MES_HALT, 1);
> -               WREG32_SOC15(GC, 0, mmCP_MES_CNTL, data);
> -       }
> -}
> -
> -/* This function is for backdoor MES firmware */
> -static int mes_v10_1_load_microcode(struct amdgpu_device *adev,
> -                                   enum admgpu_mes_pipe pipe)
> -{
> -       int r;
> -       uint32_t data;
> -
> -       mes_v10_1_enable(adev, false);
> -
> -       if (!adev->mes.fw[pipe])
> -               return -EINVAL;
> -
> -       r =3D mes_v10_1_allocate_ucode_buffer(adev, pipe);
> -       if (r)
> -               return r;
> -
> -       r =3D mes_v10_1_allocate_ucode_data_buffer(adev, pipe);
> -       if (r) {
> -               mes_v10_1_free_ucode_buffers(adev, pipe);
> -               return r;
> -       }
> -
> -       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_CNTL, 0);
> -
> -       mutex_lock(&adev->srbm_mutex);
> -       /* me=3D3, pipe=3D0, queue=3D0 */
> -       nv_grbm_select(adev, 3, pipe, 0, 0);
> -
> -       /* set ucode start address */
> -       WREG32_SOC15(GC, 0, mmCP_MES_PRGRM_CNTR_START,
> -                    (uint32_t)(adev->mes.uc_start_addr[pipe]) >> 2);
> -
> -       /* set ucode fimrware address */
> -       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_LO,
> -                    lower_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
> -       WREG32_SOC15(GC, 0, mmCP_MES_IC_BASE_HI,
> -                    upper_32_bits(adev->mes.ucode_fw_gpu_addr[pipe]));
> -
> -       /* set ucode instruction cache boundary to 2M-1 */
> -       WREG32_SOC15(GC, 0, mmCP_MES_MIBOUND_LO, 0x1FFFFF);
> -
> -       /* set ucode data firmware address */
> -       WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_LO,
> -                    lower_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
> -       WREG32_SOC15(GC, 0, mmCP_MES_MDBASE_HI,
> -                    upper_32_bits(adev->mes.data_fw_gpu_addr[pipe]));
> -
> -       /* Set 0x3FFFF (256K-1) to CP_MES_MDBOUND_LO */
> -       WREG32_SOC15(GC, 0, mmCP_MES_MDBOUND_LO, 0x3FFFF);
> -
> -       /* invalidate ICACHE */
> -       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 3, 0):
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_C=
ichlid);
> -               break;
> -       default:
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
> -               break;
> -       }
> -       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 0);
> -       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, INVALIDATE_CACHE,=
 1);
> -       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 3, 0):
> -               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, d=
ata);
> -               break;
> -       default:
> -               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
> -               break;
> -       }
> -
> -       /* prime the ICACHE. */
> -       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 3, 0):
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_C=
ichlid);
> -               break;
> -       default:
> -               data =3D RREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL);
> -               break;
> -       }
> -       data =3D REG_SET_FIELD(data, CP_MES_IC_OP_CNTL, PRIME_ICACHE, 1);
> -       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 3, 0):
> -               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL_Sienna_Cichlid, d=
ata);
> -               break;
> -       default:
> -               WREG32_SOC15(GC, 0, mmCP_MES_IC_OP_CNTL, data);
> -               break;
> -       }
> -
> -       nv_grbm_select(adev, 0, 0, 0, 0);
> -       mutex_unlock(&adev->srbm_mutex);
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_allocate_eop_buf(struct amdgpu_device *adev,
> -                                     enum admgpu_mes_pipe pipe)
> -{
> -       int r;
> -       u32 *eop;
> -
> -       r =3D amdgpu_bo_create_reserved(adev, MES_EOP_SIZE, PAGE_SIZE,
> -                             AMDGPU_GEM_DOMAIN_GTT,
> -                             &adev->mes.eop_gpu_obj[pipe],
> -                             &adev->mes.eop_gpu_addr[pipe],
> -                             (void **)&eop);
> -       if (r) {
> -               dev_warn(adev->dev, "(%d) create EOP bo failed\n", r);
> -               return r;
> -       }
> -
> -       memset(eop, 0, adev->mes.eop_gpu_obj[pipe]->tbo.base.size);
> -
> -       amdgpu_bo_kunmap(adev->mes.eop_gpu_obj[pipe]);
> -       amdgpu_bo_unreserve(adev->mes.eop_gpu_obj[pipe]);
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_mqd_init(struct amdgpu_ring *ring)
> -{
> -       struct v10_compute_mqd *mqd =3D ring->mqd_ptr;
> -       uint64_t hqd_gpu_addr, wb_gpu_addr, eop_base_addr;
> -       uint32_t tmp;
> -
> -       memset(mqd, 0, sizeof(*mqd));
> -
> -       mqd->header =3D 0xC0310800;
> -       mqd->compute_pipelinestat_enable =3D 0x00000001;
> -       mqd->compute_static_thread_mgmt_se0 =3D 0xffffffff;
> -       mqd->compute_static_thread_mgmt_se1 =3D 0xffffffff;
> -       mqd->compute_static_thread_mgmt_se2 =3D 0xffffffff;
> -       mqd->compute_static_thread_mgmt_se3 =3D 0xffffffff;
> -       mqd->compute_misc_reserved =3D 0x00000003;
> -
> -       eop_base_addr =3D ring->eop_gpu_addr >> 8;
> -
> -       /* set the EOP size, register value is 2^(EOP_SIZE+1) dwords */
> -       tmp =3D mmCP_HQD_EOP_CONTROL_DEFAULT;
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_EOP_CONTROL, EOP_SIZE,
> -                       (order_base_2(MES_EOP_SIZE / 4) - 1));
> -
> -       mqd->cp_hqd_eop_base_addr_lo =3D lower_32_bits(eop_base_addr);
> -       mqd->cp_hqd_eop_base_addr_hi =3D upper_32_bits(eop_base_addr);
> -       mqd->cp_hqd_eop_control =3D tmp;
> -
> -       /* disable the queue if it's active */
> -       ring->wptr =3D 0;
> -       mqd->cp_hqd_pq_rptr =3D 0;
> -       mqd->cp_hqd_pq_wptr_lo =3D 0;
> -       mqd->cp_hqd_pq_wptr_hi =3D 0;
> -
> -       /* set the pointer to the MQD */
> -       mqd->cp_mqd_base_addr_lo =3D ring->mqd_gpu_addr & 0xfffffffc;
> -       mqd->cp_mqd_base_addr_hi =3D upper_32_bits(ring->mqd_gpu_addr);
> -
> -       /* set MQD vmid to 0 */
> -       tmp =3D mmCP_MQD_CONTROL_DEFAULT;
> -       tmp =3D REG_SET_FIELD(tmp, CP_MQD_CONTROL, VMID, 0);
> -       mqd->cp_mqd_control =3D tmp;
> -
> -       /* set the pointer to the HQD, this is similar CP_RB0_BASE/_HI */
> -       hqd_gpu_addr =3D ring->gpu_addr >> 8;
> -       mqd->cp_hqd_pq_base_lo =3D lower_32_bits(hqd_gpu_addr);
> -       mqd->cp_hqd_pq_base_hi =3D upper_32_bits(hqd_gpu_addr);
> -
> -       /* set the wb address whether it's enabled or not */
> -       wb_gpu_addr =3D ring->rptr_gpu_addr;
> -       mqd->cp_hqd_pq_rptr_report_addr_lo =3D wb_gpu_addr & 0xfffffffc;
> -       mqd->cp_hqd_pq_rptr_report_addr_hi =3D
> -               upper_32_bits(wb_gpu_addr) & 0xffff;
> -
> -       /* only used if CP_PQ_WPTR_POLL_CNTL.CP_PQ_WPTR_POLL_CNTL__EN_MAS=
K=3D1 */
> -       wb_gpu_addr =3D ring->wptr_gpu_addr;
> -       mqd->cp_hqd_pq_wptr_poll_addr_lo =3D wb_gpu_addr & 0xfffffff8;
> -       mqd->cp_hqd_pq_wptr_poll_addr_hi =3D upper_32_bits(wb_gpu_addr) &=
 0xffff;
> -
> -       /* set up the HQD, this is similar to CP_RB0_CNTL */
> -       tmp =3D mmCP_HQD_PQ_CONTROL_DEFAULT;
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, QUEUE_SIZE,
> -                           (order_base_2(ring->ring_size / 4) - 1));
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, RPTR_BLOCK_SIZE,
> -                           ((order_base_2(AMDGPU_GPU_PAGE_SIZE / 4) - 1)=
 << 8));
> -#ifdef __BIG_ENDIAN
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, ENDIAN_SWAP, 1);
> -#endif
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, UNORD_DISPATCH, 1);
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, TUNNEL_DISPATCH, 0)=
;
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, PRIV_STATE, 1);
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, KMD_QUEUE, 1);
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_CONTROL, NO_UPDATE_RPTR, 1);
> -       mqd->cp_hqd_pq_control =3D tmp;
> -
> -       /* enable doorbell? */
> -       tmp =3D 0;
> -       if (ring->use_doorbell) {
> -               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -                                   DOORBELL_OFFSET, ring->doorbell_index=
);
> -               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -                                   DOORBELL_EN, 1);
> -               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -                                   DOORBELL_SOURCE, 0);
> -               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -                                   DOORBELL_HIT, 0);
> -       }
> -       else
> -               tmp =3D REG_SET_FIELD(tmp, CP_HQD_PQ_DOORBELL_CONTROL,
> -                                   DOORBELL_EN, 0);
> -       mqd->cp_hqd_pq_doorbell_control =3D tmp;
> -
> -       mqd->cp_hqd_vmid =3D 0;
> -       /* activate the queue */
> -       mqd->cp_hqd_active =3D 1;
> -       mqd->cp_hqd_persistent_state =3D mmCP_HQD_PERSISTENT_STATE_DEFAUL=
T;
> -       mqd->cp_hqd_ib_control =3D mmCP_HQD_IB_CONTROL_DEFAULT;
> -       mqd->cp_hqd_iq_timer =3D mmCP_HQD_IQ_TIMER_DEFAULT;
> -       mqd->cp_hqd_quantum =3D mmCP_HQD_QUANTUM_DEFAULT;
> -
> -       tmp =3D mmCP_HQD_GFX_CONTROL_DEFAULT;
> -       tmp =3D REG_SET_FIELD(tmp, CP_HQD_GFX_CONTROL, DB_UPDATED_MSG_EN,=
 1);
> -       /* offset: 184 - this is used for CP_HQD_GFX_CONTROL */
> -       mqd->cp_hqd_suspend_cntl_stack_offset =3D tmp;
> -
> -       amdgpu_device_flush_hdp(ring->adev, NULL);
> -       return 0;
> -}
> -
> -#if 0
> -static void mes_v10_1_queue_init_register(struct amdgpu_ring *ring)
> -{
> -       struct v10_compute_mqd *mqd =3D ring->mqd_ptr;
> -       struct amdgpu_device *adev =3D ring->adev;
> -       uint32_t data =3D 0;
> -
> -       mutex_lock(&adev->srbm_mutex);
> -       nv_grbm_select(adev, 3, ring->pipe, 0, 0);
> -
> -       /* set CP_HQD_VMID.VMID =3D 0. */
> -       data =3D RREG32_SOC15(GC, 0, mmCP_HQD_VMID);
> -       data =3D REG_SET_FIELD(data, CP_HQD_VMID, VMID, 0);
> -       WREG32_SOC15(GC, 0, mmCP_HQD_VMID, data);
> -
> -       /* set CP_HQD_PQ_DOORBELL_CONTROL.DOORBELL_EN=3D0 */
> -       data =3D RREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL);
> -       data =3D REG_SET_FIELD(data, CP_HQD_PQ_DOORBELL_CONTROL,
> -                            DOORBELL_EN, 0);
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL, data);
> -
> -       /* set CP_MQD_BASE_ADDR/HI with the MQD base address */
> -       WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR, mqd->cp_mqd_base_addr_lo)=
;
> -       WREG32_SOC15(GC, 0, mmCP_MQD_BASE_ADDR_HI, mqd->cp_mqd_base_addr_=
hi);
> -
> -       /* set CP_MQD_CONTROL.VMID=3D0 */
> -       data =3D RREG32_SOC15(GC, 0, mmCP_MQD_CONTROL);
> -       data =3D REG_SET_FIELD(data, CP_MQD_CONTROL, VMID, 0);
> -       WREG32_SOC15(GC, 0, mmCP_MQD_CONTROL, 0);
> -
> -       /* set CP_HQD_PQ_BASE/HI with the ring buffer base address */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE, mqd->cp_hqd_pq_base_lo);
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_BASE_HI, mqd->cp_hqd_pq_base_hi);
> -
> -       /* set CP_HQD_PQ_RPTR_REPORT_ADDR/HI */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR,
> -                    mqd->cp_hqd_pq_rptr_report_addr_lo);
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_RPTR_REPORT_ADDR_HI,
> -                    mqd->cp_hqd_pq_rptr_report_addr_hi);
> -
> -       /* set CP_HQD_PQ_CONTROL */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_CONTROL, mqd->cp_hqd_pq_control);
> -
> -       /* set CP_HQD_PQ_WPTR_POLL_ADDR/HI */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR,
> -                    mqd->cp_hqd_pq_wptr_poll_addr_lo);
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_WPTR_POLL_ADDR_HI,
> -                    mqd->cp_hqd_pq_wptr_poll_addr_hi);
> -
> -       /* set CP_HQD_PQ_DOORBELL_CONTROL */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PQ_DOORBELL_CONTROL,
> -                    mqd->cp_hqd_pq_doorbell_control);
> -
> -       /* set CP_HQD_PERSISTENT_STATE.PRELOAD_SIZE=3D0x53 */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_PERSISTENT_STATE, mqd->cp_hqd_persis=
tent_state);
> -
> -       /* set CP_HQD_ACTIVE.ACTIVE=3D1 */
> -       WREG32_SOC15(GC, 0, mmCP_HQD_ACTIVE, mqd->cp_hqd_active);
> -
> -       nv_grbm_select(adev, 0, 0, 0, 0);
> -       mutex_unlock(&adev->srbm_mutex);
> -}
> -#endif
> -
> -static int mes_v10_1_kiq_enable_queue(struct amdgpu_device *adev)
> -{
> -       struct amdgpu_kiq *kiq =3D &adev->gfx.kiq[0];
> -       struct amdgpu_ring *kiq_ring =3D &adev->gfx.kiq[0].ring;
> -       int r;
> -
> -       if (!kiq->pmf || !kiq->pmf->kiq_map_queues)
> -               return -EINVAL;
> -
> -       r =3D amdgpu_ring_alloc(kiq_ring, kiq->pmf->map_queues_size);
> -       if (r) {
> -               DRM_ERROR("Failed to lock KIQ (%d).\n", r);
> -               return r;
> -       }
> -
> -       kiq->pmf->kiq_map_queues(kiq_ring, &adev->mes.ring);
> -
> -       return amdgpu_ring_test_helper(kiq_ring);
> -}
> -
> -static int mes_v10_1_queue_init(struct amdgpu_device *adev)
> -{
> -       int r;
> -
> -       r =3D mes_v10_1_mqd_init(&adev->mes.ring);
> -       if (r)
> -               return r;
> -
> -       r =3D mes_v10_1_kiq_enable_queue(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_ring_init(struct amdgpu_device *adev)
> -{
> -       struct amdgpu_ring *ring;
> -
> -       ring =3D &adev->mes.ring;
> -
> -       ring->funcs =3D &mes_v10_1_ring_funcs;
> -
> -       ring->me =3D 3;
> -       ring->pipe =3D 0;
> -       ring->queue =3D 0;
> -
> -       ring->ring_obj =3D NULL;
> -       ring->use_doorbell =3D true;
> -       ring->doorbell_index =3D adev->doorbell_index.mes_ring0 << 1;
> -       ring->eop_gpu_addr =3D adev->mes.eop_gpu_addr[AMDGPU_MES_SCHED_PI=
PE];
> -       ring->no_scheduler =3D true;
> -       sprintf(ring->name, "mes_%d.%d.%d", ring->me, ring->pipe, ring->q=
ueue);
> -
> -       return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
> -                               AMDGPU_RING_PRIO_DEFAULT, NULL);
> -}
> -
> -static int mes_v10_1_kiq_ring_init(struct amdgpu_device *adev)
> -{
> -       struct amdgpu_ring *ring;
> -
> -       spin_lock_init(&adev->gfx.kiq[0].ring_lock);
> -
> -       ring =3D &adev->gfx.kiq[0].ring;
> -
> -       ring->me =3D 3;
> -       ring->pipe =3D 1;
> -       ring->queue =3D 0;
> -
> -       ring->adev =3D NULL;
> -       ring->ring_obj =3D NULL;
> -       ring->use_doorbell =3D true;
> -       ring->doorbell_index =3D adev->doorbell_index.mes_ring1 << 1;
> -       ring->eop_gpu_addr =3D adev->mes.eop_gpu_addr[AMDGPU_MES_KIQ_PIPE=
];
> -       ring->no_scheduler =3D true;
> -       sprintf(ring->name, "mes_kiq_%d.%d.%d",
> -               ring->me, ring->pipe, ring->queue);
> -
> -       return amdgpu_ring_init(adev, ring, 1024, NULL, 0,
> -                               AMDGPU_RING_PRIO_DEFAULT, NULL);
> -}
> -
> -static int mes_v10_1_mqd_sw_init(struct amdgpu_device *adev,
> -                                enum admgpu_mes_pipe pipe)
> -{
> -       int r, mqd_size =3D sizeof(struct v10_compute_mqd);
> -       struct amdgpu_ring *ring;
> -
> -       if (pipe =3D=3D AMDGPU_MES_KIQ_PIPE)
> -               ring =3D &adev->gfx.kiq[0].ring;
> -       else if (pipe =3D=3D AMDGPU_MES_SCHED_PIPE)
> -               ring =3D &adev->mes.ring;
> -       else
> -               BUG();
> -
> -       if (ring->mqd_obj)
> -               return 0;
> -
> -       r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
> -                                   AMDGPU_GEM_DOMAIN_VRAM |
> -                                   AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj=
,
> -                                   &ring->mqd_gpu_addr, &ring->mqd_ptr);
> -       if (r) {
> -               dev_warn(adev->dev, "failed to create ring mqd bo (%d)", =
r);
> -               return r;
> -       }
> -       memset(ring->mqd_ptr, 0, mqd_size);
> -
> -       /* prepare MQD backup */
> -       adev->mes.mqd_backup[pipe] =3D kmalloc(mqd_size, GFP_KERNEL);
> -       if (!adev->mes.mqd_backup[pipe]) {
> -               dev_warn(adev->dev,
> -                        "no memory to create MQD backup for ring %s\n",
> -                        ring->name);
> -               return -ENOMEM;
> -       }
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_sw_init(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int pipe, r;
> -
> -       adev->mes.funcs =3D &mes_v10_1_funcs;
> -       adev->mes.kiq_hw_init =3D &mes_v10_1_kiq_hw_init;
> -
> -       r =3D amdgpu_mes_init(adev);
> -       if (r)
> -               return r;
> -
> -       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -               if (!adev->enable_mes_kiq && pipe =3D=3D AMDGPU_MES_KIQ_P=
IPE)
> -                       continue;
> -
> -               r =3D mes_v10_1_allocate_eop_buf(adev, pipe);
> -               if (r)
> -                       return r;
> -
> -               r =3D mes_v10_1_mqd_sw_init(adev, pipe);
> -               if (r)
> -                       return r;
> -       }
> -
> -       if (adev->enable_mes_kiq) {
> -               r =3D mes_v10_1_kiq_ring_init(adev);
> -               if (r)
> -                       return r;
> -       }
> -
> -       r =3D mes_v10_1_ring_init(adev);
> -       if (r)
> -               return r;
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_sw_fini(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int pipe;
> -
> -       amdgpu_device_wb_free(adev, adev->mes.sch_ctx_offs);
> -       amdgpu_device_wb_free(adev, adev->mes.query_status_fence_offs);
> -
> -       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -               kfree(adev->mes.mqd_backup[pipe]);
> -
> -               amdgpu_bo_free_kernel(&adev->mes.eop_gpu_obj[pipe],
> -                                     &adev->mes.eop_gpu_addr[pipe],
> -                                     NULL);
> -               amdgpu_ucode_release(&adev->mes.fw[pipe]);
> -       }
> -
> -       amdgpu_bo_free_kernel(&adev->gfx.kiq[0].ring.mqd_obj,
> -                             &adev->gfx.kiq[0].ring.mqd_gpu_addr,
> -                             &adev->gfx.kiq[0].ring.mqd_ptr);
> -
> -       amdgpu_bo_free_kernel(&adev->mes.ring.mqd_obj,
> -                             &adev->mes.ring.mqd_gpu_addr,
> -                             &adev->mes.ring.mqd_ptr);
> -
> -       amdgpu_ring_fini(&adev->gfx.kiq[0].ring);
> -       amdgpu_ring_fini(&adev->mes.ring);
> -
> -       amdgpu_mes_fini(adev);
> -       return 0;
> -}
> -
> -static void mes_v10_1_kiq_setting(struct amdgpu_ring *ring)
> -{
> -       uint32_t tmp;
> -       struct amdgpu_device *adev =3D ring->adev;
> -
> -       /* tell RLC which is KIQ queue */
> -       switch (amdgpu_ip_version(adev, GC_HWIP, 0)) {
> -       case IP_VERSION(10, 3, 0):
> -       case IP_VERSION(10, 3, 2):
> -       case IP_VERSION(10, 3, 1):
> -       case IP_VERSION(10, 3, 4):
> -               tmp =3D RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Ci=
chlid);
> -               tmp &=3D 0xffffff00;
> -               tmp |=3D (ring->me << 5) | (ring->pipe << 3) | (ring->que=
ue);
> -               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, t=
mp);
> -               tmp |=3D 0x80;
> -               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS_Sienna_Cichlid, t=
mp);
> -               break;
> -       default:
> -               tmp =3D RREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS);
> -               tmp &=3D 0xffffff00;
> -               tmp |=3D (ring->me << 5) | (ring->pipe << 3) | (ring->que=
ue);
> -               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
> -               tmp |=3D 0x80;
> -               WREG32_SOC15(GC, 0, mmRLC_CP_SCHEDULERS, tmp);
> -               break;
> -       }
> -}
> -
> -static int mes_v10_1_kiq_hw_init(struct amdgpu_device *adev)
> -{
> -       int r =3D 0;
> -
> -       if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT) {
> -               r =3D mes_v10_1_load_microcode(adev, AMDGPU_MES_KIQ_PIPE)=
;
> -               if (r) {
> -                       DRM_ERROR("failed to load MES kiq fw, r=3D%d\n", =
r);
> -                       return r;
> -               }
> -
> -               r =3D mes_v10_1_load_microcode(adev, AMDGPU_MES_SCHED_PIP=
E);
> -               if (r) {
> -                       DRM_ERROR("failed to load MES fw, r=3D%d\n", r);
> -                       return r;
> -               }
> -       }
> -
> -       mes_v10_1_enable(adev, true);
> -
> -       mes_v10_1_kiq_setting(&adev->gfx.kiq[0].ring);
> -
> -       r =3D mes_v10_1_queue_init(adev);
> -       if (r)
> -               goto failure;
> -
> -       return r;
> -
> -failure:
> -       mes_v10_1_hw_fini(adev);
> -       return r;
> -}
> -
> -static int mes_v10_1_hw_init(void *handle)
> -{
> -       int r;
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       if (!adev->enable_mes_kiq) {
> -               if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT=
) {
> -                       r =3D mes_v10_1_load_microcode(adev,
> -                                            AMDGPU_MES_SCHED_PIPE);
> -                       if (r) {
> -                               DRM_ERROR("failed to MES fw, r=3D%d\n", r=
);
> -                               return r;
> -                       }
> -               }
> -
> -               mes_v10_1_enable(adev, true);
> -       }
> -
> -       r =3D mes_v10_1_queue_init(adev);
> -       if (r)
> -               goto failure;
> -
> -       r =3D mes_v10_1_set_hw_resources(&adev->mes);
> -       if (r)
> -               goto failure;
> -
> -       mes_v10_1_init_aggregated_doorbell(&adev->mes);
> -
> -       r =3D mes_v10_1_query_sched_status(&adev->mes);
> -       if (r) {
> -               DRM_ERROR("MES is busy\n");
> -               goto failure;
> -       }
> -
> -       /*
> -        * Disable KIQ ring usage from the driver once MES is enabled.
> -        * MES uses KIQ ring exclusively so driver cannot access KIQ ring
> -        * with MES enabled.
> -        */
> -       adev->gfx.kiq[0].ring.sched.ready =3D false;
> -       adev->mes.ring.sched.ready =3D true;
> -
> -       return 0;
> -
> -failure:
> -       mes_v10_1_hw_fini(adev);
> -       return r;
> -}
> -
> -static int mes_v10_1_hw_fini(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       adev->mes.ring.sched.ready =3D false;
> -
> -       mes_v10_1_enable(adev, false);
> -
> -       if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_DIRECT) {
> -               mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_KIQ_PIPE);
> -               mes_v10_1_free_ucode_buffers(adev, AMDGPU_MES_SCHED_PIPE)=
;
> -       }
> -
> -       return 0;
> -}
> -
> -static int mes_v10_1_suspend(void *handle)
> -{
> -       int r;
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       r =3D amdgpu_mes_suspend(adev);
> -       if (r)
> -               return r;
> -
> -       return mes_v10_1_hw_fini(adev);
> -}
> -
> -static int mes_v10_1_resume(void *handle)
> -{
> -       int r;
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       r =3D mes_v10_1_hw_init(adev);
> -       if (r)
> -               return r;
> -
> -       return amdgpu_mes_resume(adev);
> -}
> -
> -static int mes_v10_0_early_init(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -       int pipe, r;
> -
> -       for (pipe =3D 0; pipe < AMDGPU_MAX_MES_PIPES; pipe++) {
> -               if (!adev->enable_mes_kiq && pipe =3D=3D AMDGPU_MES_KIQ_P=
IPE)
> -                       continue;
> -               r =3D amdgpu_mes_init_microcode(adev, pipe);
> -               if (r)
> -                       return r;
> -       }
> -
> -       return 0;
> -}
> -
> -static int mes_v10_0_late_init(void *handle)
> -{
> -       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> -
> -       if (!amdgpu_in_reset(adev))
> -               amdgpu_mes_self_test(adev);
> -
> -       return 0;
> -}
> -
> -static const struct amd_ip_funcs mes_v10_1_ip_funcs =3D {
> -       .name =3D "mes_v10_1",
> -       .early_init =3D mes_v10_0_early_init,
> -       .late_init =3D mes_v10_0_late_init,
> -       .sw_init =3D mes_v10_1_sw_init,
> -       .sw_fini =3D mes_v10_1_sw_fini,
> -       .hw_init =3D mes_v10_1_hw_init,
> -       .hw_fini =3D mes_v10_1_hw_fini,
> -       .suspend =3D mes_v10_1_suspend,
> -       .resume =3D mes_v10_1_resume,
> -       .dump_ip_state =3D NULL,
> -       .print_ip_state =3D NULL,
> -};
> -
> -const struct amdgpu_ip_block_version mes_v10_1_ip_block =3D {
> -       .type =3D AMD_IP_BLOCK_TYPE_MES,
> -       .major =3D 10,
> -       .minor =3D 1,
> -       .rev =3D 0,
> -       .funcs =3D &mes_v10_1_ip_funcs,
> -};
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h b/drivers/gpu/drm/amd=
/amdgpu/mes_v10_1.h
> deleted file mode 100644
> index 9afd6ddb01e9c..0000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.h
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -/*
> - * Copyright 2019 Advanced Micro Devices, Inc.
> - *
> - * Permission is hereby granted, free of charge, to any person obtaining=
 a
> - * copy of this software and associated documentation files (the "Softwa=
re"),
> - * to deal in the Software without restriction, including without limita=
tion
> - * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> - * and/or sell copies of the Software, and to permit persons to whom the
> - * Software is furnished to do so, subject to the following conditions:
> - *
> - * The above copyright notice and this permission notice shall be includ=
ed in
> - * all copies or substantial portions of the Software.
> - *
> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> - * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> - * OTHER DEALINGS IN THE SOFTWARE.
> - *
> - */
> -
> -#ifndef __MES_V10_1_H__
> -#define __MES_V10_1_H__
> -
> -extern const struct amdgpu_ip_block_version mes_v10_1_ip_block;
> -
> -#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index 12e54047bf795..3a282c90f7c9b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -59,7 +59,6 @@
>  #include "vcn_v3_0.h"
>  #include "jpeg_v3_0.h"
>  #include "amdgpu_vkms.h"
> -#include "mes_v10_1.h"
>  #include "mxgpu_nv.h"
>  #include "smuio_v11_0.h"
>  #include "smuio_v11_0_6.h"
> --
> 2.44.0
>
