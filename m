Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACCA4F9371
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Apr 2022 13:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDBA10EF30;
	Fri,  8 Apr 2022 11:02:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38FE10EF13
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Apr 2022 11:02:02 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id t7so10252877qta.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 Apr 2022 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n7o854Rnmk58ZfYTSwG0v17LZv7/rkIpXxGniDHYkTI=;
 b=EAGZKcsArouzuldx1DLhF86jADWGCnvqC66NJpT83AGdqxa63vzTFcZsW6B3HX5+HE
 G+dFbmi9z2KyQkkOWQ1ryXL0xOj+1YS8Bj5tc3xMV8yQE750Fpadh4wr0/jSwWBqL8/x
 gAi8KhkMm6WYi8lDfEG76HLMuKOU0rImUyBjBqqVcsJSEoy2AgxsuKNVex/rzzFDlG01
 fyaFnFWbBZYOzotzY6pdp1MmKBRxvVSLADsrOw94ocD3H8GGVwvW5sZL2q6JKsejIdt/
 6gZ07/E8RUvJsc/KtBjMquQRXBX3T/BLDpWQ+eXaubVqKSYgYzc3PbzIeNEoQF6R//LO
 FA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n7o854Rnmk58ZfYTSwG0v17LZv7/rkIpXxGniDHYkTI=;
 b=LqS4v5PsdT/qN/3safnWER2gJ+3wte2Za6ADcQ/BYU6b+QZqqCmyEgv9dlBxwKNP/Y
 IuISNcQP2QpEmEkHFj4ZoTYoo7UnQuGlCsKaVFp2JpSVPY4vhA6yaeZ4s/XhcQMzNxxz
 QaxPx8pPmkAflMeiY9/WE7QQoSgLioenH7xz+2Xe4m8Oq+uniBSccgMQXEnudSIvd2j8
 bdjSm2r8/TFVNkZvYOJa6qg7QBt6DbBfStekVTXZVrtVfCfOlc+AITXgWePXFUODildU
 p3D65eRLhqxFheXKJNHhmhbKEAC8cnzBspKO168BguPDOb6Giu7IFkrqdU19biZMI5L6
 28Cg==
X-Gm-Message-State: AOAM532WwMBHt19UKRrF/umnA3BuG4wSHWsbU5SicDCg2KpLBsr3HV5o
 th1pEobpLYzbd0dSPXR3FOVrq7G+Vr9hhD/K4vsVRBbcva7VyB60P6I=
X-Google-Smtp-Source: ABdhPJxx/olzXjtGBd+cu5p6cMnTrpUU6Oa26fVLa85UtU6Mrlw7zkpiYEqO6DFsJUEfMWEwM10Rn8zJW+tSITAqKis=
X-Received: by 2002:ac8:4e8a:0:b0:2e1:e828:cac3 with SMTP id
 10-20020ac84e8a000000b002e1e828cac3mr15158149qtp.616.1649415721608; Fri, 08
 Apr 2022 04:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsNVp=R5zC9B3PXWJ5nddtt3gkRzDsAsRKvhXq7exGjSAg@mail.gmail.com>
 <f3bc34e1-0eaf-84ef-486e-b7759e60b792@amd.com>
In-Reply-To: <f3bc34e1-0eaf-84ef-486e-b7759e60b792@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Fri, 8 Apr 2022 16:01:48 +0500
Message-ID: <CABXGCsOD+tDdFcM37NP_1nS9eLym7qC=jUQy3iqYkc1m2iQgxw@mail.gmail.com>
Subject: Re: [Bug][5.18-rc0] Between commits ed4643521e6a and 34af78c4e616,
 appears warning "WARNING: CPU: 31 PID: 51848 at
 drivers/dma-buf/dma-fence-array.c:191
 dma_fence_array_create+0x101/0x120" and some games stopped working.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Ken.Xue@amd.com, "Deucher, Alexander" <alexander.deucher@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, thomas.hellstrom@linux.intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi Christian

> those are two independent and already known problems.
>
> The warning triggered from the sync_file is already fixed in
> drm-misc-next-fixes, but so far I couldn't figure out why the games
> suddenly doesn't work any more.

I thought that these warnings are related to the stuck of the listed games.

> There is a bug report for that, but bisecting the changes didn't yielded
> anything valuable so far.
>
> So if you can come up with something that would be rather valuable.

I found how to fix my build problems. They are all related to gcc12.
And making again git bisect and found which commit lead to stuck the
games "Forza Horizon 5", "Forza Horizon 4", "Cyberpunk 2077".
At least it affected hardware Radeon 6900 XT, Radeon 6800M and Radeon VII.

$ git bisect log
git bisect start
# good: [ed4643521e6af8ab8ed1e467630a85884d2696cf] Merge tag
'arm-dt-5.18' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good ed4643521e6af8ab8ed1e467630a85884d2696cf
# bad: [34af78c4e616c359ed428d79fe4758a35d2c5473] Merge tag
'iommu-updates-v5.18' of
git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu
git bisect bad 34af78c4e616c359ed428d79fe4758a35d2c5473
# good: [4a0cb83ba6e0cd73a50fa4f84736846bf0029f2b] netdevice: add
missing dm_private kdoc
git bisect good 4a0cb83ba6e0cd73a50fa4f84736846bf0029f2b
# skip: [2ab82efeeed885c0210a0029df93bb95a316e8c7] Merge tag
'drm-intel-gt-next-2022-03-03' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect skip 2ab82efeeed885c0210a0029df93bb95a316e8c7
# good: [00598b056aa6d46c7a6819efa850ec9d0d690d76] scsi: smartpqi:
Expose SAS address for SATA drives
git bisect good 00598b056aa6d46c7a6819efa850ec9d0d690d76
# good: [00598b056aa6d46c7a6819efa850ec9d0d690d76] scsi: smartpqi:
Expose SAS address for SATA drives
git bisect good 00598b056aa6d46c7a6819efa850ec9d0d690d76
# skip: [c674c5b9342e5cb0f3d9e9bcaf37dbe2087845e5] drm/i915/xehp: CCS
should use RCS setup functions
git bisect skip c674c5b9342e5cb0f3d9e9bcaf37dbe2087845e5
# good: [f0d4ce59f4d48622044933054a0e0cefa91ba15e] drm/i915: Disable
DRRS on IVB/HSW port !=3D A
git bisect good f0d4ce59f4d48622044933054a0e0cefa91ba15e
# skip: [6de7e4f02640fba2ffa6ac04e2be13785d614175] Merge tag
'drm-msm-next-2022-03-01' of https://gitlab.freedesktop.org/drm/msm
into drm-next
git bisect skip 6de7e4f02640fba2ffa6ac04e2be13785d614175
# bad: [868f4357ed0d1e2f96bbd67d4ac862aa6335effe] drm/amd/display: Add
DMUB support for DCN316
git bisect bad 868f4357ed0d1e2f96bbd67d4ac862aa6335effe
# good: [39da460fd4c0f8e7290dcc9cbfc9375de9d0eeca] drm/amd/display:
Fix DP LT sequence on EQ fail
git bisect good 39da460fd4c0f8e7290dcc9cbfc9375de9d0eeca
# good: [3f268ef06f8cf3c481dbd5843d564f5170c6df54] drm/ttm: add back a
reference to the bdev to the res manager
git bisect good 3f268ef06f8cf3c481dbd5843d564f5170c6df54
# bad: [123db17ddff007080d464e785689fb14f94cbc7a] Merge tag
'amd-drm-next-5.18-2022-02-11-1' of
https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect bad 123db17ddff007080d464e785689fb14f94cbc7a
# bad: [24992ab0b8b0d2521caa9c3dcbed0e2a56cbe3d0] drm/amdkfd: Fix
prototype warning for get_process_num_bos
git bisect bad 24992ab0b8b0d2521caa9c3dcbed0e2a56cbe3d0
# good: [1cbbc8d4f788af4c260ef3cae05902ef7b191197] drm/radeon/uvd: Fix
forgotten unmap buffer objects
git bisect good 1cbbc8d4f788af4c260ef3cae05902ef7b191197
# good: [69f915cc97c4bb82b34105a47abf613f7c87215d] drm/amdgpu: loose
check for umc poison mode
git bisect good 69f915cc97c4bb82b34105a47abf613f7c87215d
# good: [8bbd4d83a68beaf54ae01b2e2aa2024ff1dfc0ba] drm/amdgpu: Reset
OOB table error count info
git bisect good 8bbd4d83a68beaf54ae01b2e2aa2024ff1dfc0ba
# bad: [1915a433954262ac7466469d1a4684ac54218af4] drm/amdgpu: adjust
register address calculation
git bisect bad 1915a433954262ac7466469d1a4684ac54218af4
# bad: [461fa7b0ac565ef25c1da0ced31005dd437883a7] drm/amdgpu: remove ctx->l=
ock
git bisect bad 461fa7b0ac565ef25c1da0ced31005dd437883a7
# first bad commit: [461fa7b0ac565ef25c1da0ced31005dd437883a7]
drm/amdgpu: remove ctx->lock

461fa7b0ac565ef25c1da0ced31005dd437883a7 is the first bad commit
commit 461fa7b0ac565ef25c1da0ced31005dd437883a7
Author: Ken Xue <Ken.Xue@amd.com>
Date:   Fri Feb 11 16:18:46 2022 -0500

    drm/amdgpu: remove ctx->lock

    KMD reports a warning on holding a lock from drm_syncobj_find_fence,
    when running amdgpu_test case =E2=80=9Csyncobj timeline test=E2=80=9D.

    ctx->lock was designed to prevent concurrent "amdgpu_ctx_wait_prev_fenc=
e"
    calls and avoid dead reservation lock from GPU reset. since no reservat=
ion
    lock is held in latest GPU reset any more, ctx->lock can be simply remo=
ved
    and concurrent "amdgpu_ctx_wait_prev_fence" call also can be prevented =
by
    PD root bo reservation lock.

    call stacks:
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    //hold lock
    amdgpu_cs_ioctl->amdgpu_cs_parser_init->mutex_lock(&parser->ctx->lock);
    =E2=80=A6
    //report warning
    amdgpu_cs_dependencies->amdgpu_cs_process_syncobj_timeline_in_dep \
    ->amdgpu_syncobj_lookup_and_add_to_sync -> drm_syncobj_find_fence \
    -> lockdep_assert_none_held_once
    =E2=80=A6
    amdgpu_cs_ioctl->amdgpu_cs_parser_fini->mutex_unlock(&parser->ctx->lock=
);

    Signed-off-by: Ken Xue <Ken.Xue@amd.com>
    Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 16 +++++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  1 -
 3 files changed, 11 insertions(+), 8 deletions(-)

After reverting commits 57230f0ce6eda6d47a2029b7b3a39cc5bb63fe32,
461fa7b0ac565ef25c1da0ced31005dd437883a7 the games "Forza Horizon 5",
"Forza Horizon 4", "Cyberpunk 2077" start working again.
Removing commit 57230f0ce6eda6d47a2029b7b3a39cc5bb63fe32 isn't really
needed. I made it because I didn't want to resolve conflicts.


--=20
Best Regards,
Mike Gavrilov.
