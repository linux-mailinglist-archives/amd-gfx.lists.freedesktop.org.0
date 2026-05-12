Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tUZiO0crA2o11QEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 15:29:43 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACBF5212F0
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 15:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6DE10EAEE;
	Tue, 12 May 2026 13:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h6GHjV5U";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C0610EAFE
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 13:29:40 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-132dd3cb2bcso122729c88.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 06:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778592580; cv=none;
 d=google.com; s=arc-20240605;
 b=W56Oj/JAHnsYGO+JV7kd+w2wAyRWuvv2KiUwTZlNqkRVfwONxoZZw/wpK+EBhTWHZf
 /AyO/xY7101XkVDSDlxxsuPplt1LYFMQxokaVs+P7ZnRiP41lmBb5bDMIx+dNbbzviD4
 td5tF4tUjAGMQWGKJKycA5k3Aq/omGN7KIsPFmiY+8fbR16dy2qDExKpK9KlOZ8PiYGm
 t2+lVbKfSyCIkj5+d/4WNkRX2F3Zsx8d/DKR3fC78s+I+J1HlKOL1iSib+jezf024vAL
 /rBFN/kP/B/a24lXgLZpvzV0YOW/TdJxP6ZEWO/BNMvhL91bMvUjeYfacpVWRFCVnHc5
 FiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=voxDG7Q5J5JNk8qURUdFQ4wnAutTiZp7iNUAQ8FUlfM=;
 fh=pVXkSRI4iWxMX2nwzh6GHNF3uSMfA8RBUzqfkxIWt8U=;
 b=O7TEIwR3vuBI2LriU8GRXiTWnAKC/hZx4hsjTYkXxpxMW4MA1i/A6DUGJKZYbP7AsQ
 JKbvJxILfBileh24d/8T/ezDGabGwqZCx1lBfYHfwqdRMu7ecNtm6PJpycU72h1P5Hum
 r5JcVvcmmSX2CfzjpiZykoVUoI98hz2lnpffL4NFAYkI67AHDlCEp+ruGC7z2J40DbLb
 Ve1mw6TStsyU7WauMG3ATNSw42WnUmY0PiCj81BEmtz+D6xrrZiHvdzKRsKpO0w3SU+B
 B1Rp/yke204cXYQIrc7rsfpuUybPy21PPCnq5yQ2WfhlPt3j4bu1ufIGhKXDKL6fFmdP
 7Ueg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778592580; x=1779197380; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=voxDG7Q5J5JNk8qURUdFQ4wnAutTiZp7iNUAQ8FUlfM=;
 b=h6GHjV5U73Qq3H6bBTbgqFnlxOjMKDZJu/DWuOuqrl2hqO8kdmXoKogW1yGGew+ok9
 IxBZdrRKS7NRrQZMrbk2+q+EaoIzn3hllRdDf0zgSB6K1WZvzrlLcg42ALwXzz9ZQ4BZ
 Ark8Hi1FGj9D2vEEMqyuDtm4sBSdCtbdgEFKYLTilg88K3Co8gYWUeOpZ1O5EtOZzUZZ
 8GAjC0qxatFBSnlaCaExyTpTCqA4adDgmmjv5s1sTmsD1tB0jte7H5iESwb+bGo6CTSN
 wRtJqwgw+nySsSoXYUuri1qjFSEXzO4h/u5VUjOTjali9IgsSoc3xHB35IhRIMjnECgm
 5zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778592580; x=1779197380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=voxDG7Q5J5JNk8qURUdFQ4wnAutTiZp7iNUAQ8FUlfM=;
 b=dtb5V8qIGU2htL6eDD7aocp4ZuLV/5uJYqxgCGYqMf/alwBAsSX6iel+LcBt6q7KNh
 6MsY+P95zqTN1ibVjm2DDhhqpyQokHKocgztPzUP/zHs3y4xAdVIS7NAEIC7JuzBk0VQ
 1jxJs6GMk4BVcza7xAPx9EvJanx0zt44sGIg5BEINekfU6V1Sdp5O73Buv6z/EJ1DgW6
 EQKdRl2NcSl5dFm9FeTLHRzBj7GVWk/XNcBBLMWJlWJ0T6jwL4XT8Iw0muuedooeKKpg
 ERfgkSsilEXy77Aqm8eMb3JvWr5JeM/dO4s76nfyvyidU4Q3hWI4+7s3FlGFU4VuEFCW
 wY7A==
X-Gm-Message-State: AOJu0YyN7a8vNyR65OKiKVHiqeIl6/mwDyzawWXddCfRFqxqOu56BkEs
 2EhBkinY8SGfnsrAcHdYV7P0HuDZ2O+JkyYhOagj7PjoFhQGWWf/ldMFARocZH9uhx2h8fd6qzW
 yyeu7afHIgX/O7gDIzFQ/Mv4WXH8tLlXaSQ==
X-Gm-Gg: Acq92OFHaKkDXGL/vSUBrq4bKfnZNexX2HpJ9D+B2eHu1IGExR65VLgjnqgyE5nolX2
 96czCr7inaRxTRjT82lQ3duzcNYOvKEld/o+PIVV8WxesbP84xsIpjFVU7VDzoBt89pH9KN42UV
 kU452Zs+TMGNIti5ZQdZba82ghWlkFgV+utsN4rgyvfJAlGaFmin9JQQZF64p7wHfILmP2VLS7p
 tTmztRo2+KATN1cixC+zQ2TkqYtXG9OOliRHaumevvVI6sjI84qWUROH1X0tXs8WT1yg4gwnnS/
 dg5/berlb7BM3DEq+jVhZinBWAFZYdaXP1CJ+TqXwkXJ+n8qpWhrOWjXOsX2V3lPca8GKw==
X-Received: by 2002:a05:7022:4391:b0:12d:f8a2:5a12 with SMTP id
 a92af1059eb24-13203ea67d1mr6783246c88.6.1778592579988; Tue, 12 May 2026
 06:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260512084827.1630497-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260512084827.1630497-1-Jesse.Zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 May 2026 09:29:28 -0400
X-Gm-Features: AVHnY4KlSPxlAaqlyBxcjZlTrbBRUHRdK12UmI6hj8S4vjJ7Iqy3kW4NJDX0sg8
Message-ID: <CADnq5_Prs1Ywx5e-7pgoAiRXCru3LLaNfixMbLd=Qzv4bPyeWQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] drm/amdgpu: add pre/post helpers for MEC pipe reset
To: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, 
 Christian Koenig <christian.koenig@amd.com>
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
X-Rspamd-Queue-Id: 7ACBF5212F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Jesse.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 4:59=E2=80=AFAM Jesse Zhang <Jesse.Zhang@amd.com> w=
rote:
>
> Introduce helpers to prepare for and recover from a MEC pipe
> reset.  The pre=E2=80=91reset handler stops the KFD scheduler if the KFD =
is
> initialised, preventing new submissions while the pipe is being
> reset.  The post=E2=80=91reset handler iterates over all compute rings
> sharing the same MEC pipe (on the affected XCC) and marks any
> non=E2=80=91guilty ring=E2=80=99s scheduler as faulted via drm_sched_faul=
t().
>
> v2: drop the stop drm scheduer, have a worker thread which schedules a ca=
ll to
> drm_sched_fault() for all of the affected queues (Alex)
>
> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 45 +++++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h |  5 +++
>  2 files changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.c
> index 515cc4a2aeb4..a9fd639e4cd6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -69,6 +69,51 @@ void amdgpu_queue_mask_bit_to_mec_queue(struct amdgpu_=
device *adev, int bit,
>
>  }
>
> +static bool amdgpu_gfx_ring_on_mec_pipe(struct amdgpu_ring *ring, u32 me=
, u32 pipe)
> +{
> +       if (!ring || !ring->funcs || ring->funcs->type !=3D AMDGPU_RING_T=
YPE_COMPUTE)
> +               return false;
> +
> +       return ring->me =3D=3D me && ring->pipe =3D=3D pipe;
> +}
> +
> +static unsigned int amdgpu_gfx_mec_pipe_compute_ring_base(struct amdgpu_=
device *adev,
> +                                                        u32 xcc_id)
> +{
> +       int num_xcc =3D adev->gfx.xcc_mask ? NUM_XCC(adev->gfx.xcc_mask) =
: 1;
> +
> +       if (num_xcc <=3D 1)
> +               return 0;
> +       return xcc_id * adev->gfx.num_compute_rings;
> +}
> +
> +void amdgpu_gfx_mec_pre_pipe_reset(struct amdgpu_device *adev,
> +                                      struct amdgpu_ring *guilty)
> +{
> +       if (adev->kfd.init_complete)
> +               amdgpu_amdkfd_stop_sched(adev, guilty->xcc_id);
> +}
> +
> +void amdgpu_gfx_mec_post_pipe_reset(struct amdgpu_device *adev, struct a=
mdgpu_ring *guilty)
> +{
> +       struct amdgpu_ring *ring;
> +       unsigned int j, base;
> +
> +       base =3D amdgpu_gfx_mec_pipe_compute_ring_base(adev, guilty->xcc_=
id);
> +       for (j =3D 0; j < adev->gfx.num_compute_rings; j++) {
> +               ring =3D &adev->gfx.compute_ring[base + j];
> +               if (!amdgpu_gfx_ring_on_mec_pipe(ring, guilty->me, guilty=
->pipe))
> +                       continue;
> +
> +               if (ring !=3D guilty)
> +                       drm_sched_fault(&ring->sched);

You can't call this from the reset handler since you are already in
the work queue that this modifies.

Alex

> +       }
> +
> +       if (adev->kfd.init_complete)
> +               amdgpu_amdkfd_start_sched(adev, guilty->xcc_id);
> +}
> +
>  bool amdgpu_gfx_is_mec_queue_enabled(struct amdgpu_device *adev,
>                                      int xcc_id, int mec, int pipe, int q=
ueue)
>  {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.h
> index 77050f9884f2..1deb82836f02 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -603,6 +603,11 @@ int amdgpu_gfx_mec_queue_to_bit(struct amdgpu_device=
 *adev, int mec,
>                                 int pipe, int queue);
>  void amdgpu_queue_mask_bit_to_mec_queue(struct amdgpu_device *adev, int =
bit,
>                                  int *mec, int *pipe, int *queue);
> +
> +void amdgpu_gfx_mec_pre_pipe_reset(struct amdgpu_device *adev,
> +                                       struct amdgpu_ring *guilty);
> +void amdgpu_gfx_mec_post_pipe_reset(struct amdgpu_device *adev,
> +                                       struct amdgpu_ring *guilty);
>  bool amdgpu_gfx_is_mec_queue_enabled(struct amdgpu_device *adev, int xcc=
_id,
>                                      int mec, int pipe, int queue);
>  bool amdgpu_gfx_is_high_priority_compute_queue(struct amdgpu_device *ade=
v,
> --
> 2.49.0
>
