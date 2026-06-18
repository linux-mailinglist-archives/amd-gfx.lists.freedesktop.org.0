Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bkKHJyk4NGqjRwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 20:25:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C4C6A2232
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 20:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="LbDKx/TH";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEE110F39B;
	Thu, 18 Jun 2026 18:25:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0CB10F39B
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 18:25:42 +0000 (UTC)
Received: by mail-dl1-f52.google.com with SMTP id
 a92af1059eb24-13835f3db17so19574c88.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2026 11:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781807142; cv=none;
 d=google.com; s=arc-20240605;
 b=aqNjtgw0R3EWrrJzPmz1cW2I5/r+E9agrjPPIJOqZ4UN8iCa9ZoIGogTBC3io4k1RM
 KHHouj9K8gyAXbqmssSn4MFlVxNdHLe7LMqQVFjIeS3EZqXp+eJRav63tpTkbnIRPU8x
 BJKjpoiOBZmbIqI2VoSaxsBKD9gXV+KmZIHAosRFQz3X34+tz+pDcecAluS8rQu2aYAt
 9SzM1itQL9a3mW5mcdE1FhtLiCaHbwRdUkl6n01dCLGkkiL8inX1zEBFzJljmRClLGs8
 ELVYAGw720GiExsH6haZHtcLnP+f5eFqcaGWb0UrqaOVhtho0/xV8/HU0wW50x5kObVd
 +BCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=6J9QrZORCHrB5PsG2aPpAVaee5+SoESUNbpB8sxTRXk=;
 fh=pVXkSRI4iWxMX2nwzh6GHNF3uSMfA8RBUzqfkxIWt8U=;
 b=WMXIrGBfR8HEShgwmk7tZsnKGiUpfNzM38rxLfA/KHHcye4cth7rUek4TOS8/RBxKR
 12JqY2WUGsBtDxIt7Mb3OgMJeorNaYFgqcZnCf7MLQJSIgwAg7t2zYLcRZzYl0qp7bLW
 nKQt0gFQ/2yhzmbiAziRI3Z/j3Jyb4x8nAPnKZzBGiy4Lmhmr6IOvdf0DvlGsP2nOarD
 hmKi5ANqeu9YCXbmvGgl4THU+l0CtfKsJc3uZ7mh1lQcN7xW9GGdM6CowgGO2W78rrVM
 gmVil+3zZrMXLQNgLt4W3F91KDwdT6qR+KCzNeaEKyahNCK63Myh7vpObejsF8RluVE9
 dA1Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781807142; x=1782411942; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J9QrZORCHrB5PsG2aPpAVaee5+SoESUNbpB8sxTRXk=;
 b=LbDKx/THQaILSxR0GiCH79/3ry+JKFdP1WqjczH0W7wobNzFfl5qG9VT562gTfULrX
 AHtoLNXnpN3kWxvuDsUCfyTQQXcY+7CjahFKr/oxAm6oMLnOePyc4t1msVUpZodlHNot
 EsagBVEfVzYUW8TNqG7iOWHOC2buOi7X74kAEccrAcm1LfeIfL/NMUQOykdDlqucvWvV
 XNcsfWiJy9qQWwSvlXNaiMo4hfZCDd4ngJm2zA1ro/BhYrYZh85qakk7dWkv3ajKz1bw
 Ow0tO9BX9IHlVA259X7Z/9g3A7X7MGJyXYgPOzghYfj0ua8igEMsLTUtUMol1SfCkapS
 9r/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781807142; x=1782411942;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6J9QrZORCHrB5PsG2aPpAVaee5+SoESUNbpB8sxTRXk=;
 b=eTou0mddQLcAsJ7qUG/3TAOQa4yK3US7EdmjiFTsop2PFTbPmriFNhP+OxUWSmzEro
 paAWSPiGVFX1w/D+WTNVtu79kUG42aBKJ5Zer8/+JVuTaOiH0v18SJSMLCUzLAdrNunr
 pz1rFXocIq/GTiebx8/GcxymdtVFJQueBZCmq+x8kRfw7gemHa5fItLdd5R2F4OMvuFN
 ejoMgYCefdKMxFbHgUsGsEZf9M5j7g2PLp8cbkMNVE7bIRcyZXfy/YRlDQ2Go0AuubVg
 j9V5/4lhXvyhhGjSL7hcXP1No2w/N+cNPrMPleFNc2KMRC20qWE+P+4dlRLuyyxe4EHv
 icDg==
X-Gm-Message-State: AOJu0YzEtwDczBgGF/stRmxlsD7TWVtMB+65GSpy1qv1XlWyap33pv+x
 pwJT832eZ/l8yetQPwL8j29FeHwI3sdXcVYYB60CvGaq+rr0SSCyzKvEArhDSvwuVmM8gg8VcjT
 hodYthyydWg98zq4QhCeMd0ft0fmitg2RsA==
X-Gm-Gg: AfdE7cm+I88q5OVYz56KAWFWY4AznkL1iKqJySHldJEzsgIEAXKWOHFzsepWsL6sRqD
 TKZGmg0YgByDMmRld1HQdZtfjQhGJF+7J9/s8DblQyndsQ6F3f5UC/WcbOYoLa51I7/j1shyiTV
 ZJTzl8X/Ued9X21jz3u9Vi012g+0fcgYJtE5TH1KAFkjSvQzNIDQC2Mx1xd6VdidtXx054i5ORI
 nZByf3JXtjyQNdyWWdGGQbec+ODrqwcvKSed3aDckKPigCz/kVIvKZshURK6JVV7IOEECL7Hq/j
 S5yNlAX/liU1lexCD5z84dEZwH9BDQnLFedVDKoiN/45TUFt/OG23AUvbOU=
X-Received: by 2002:a05:7022:610:b0:137:fdce:fec2 with SMTP id
 a92af1059eb24-139a218a54cmr264459c88.4.1781807141592; Thu, 18 Jun 2026
 11:25:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260618044405.1724370-1-Jesse.Zhang@amd.com>
In-Reply-To: <20260618044405.1724370-1-Jesse.Zhang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jun 2026 14:25:29 -0400
X-Gm-Features: AVVi8CdtcXhFNIZq3ZC8gFvPlsBdptwS5HWtD5Mict2bvvtWwrsXcAuZDwqVroU
Message-ID: <CADnq5_MN-TjGxjKWZKuqK-p_wxajs1wCJukzrkOg50yCHCt1iA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] drm/amdgpu/userq: add reset helper and identify
 guilty user queue
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Jesse.Zhang@amd.com,m:Alexander.Deucher@amd.com,m:christian.koenig@amd.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1C4C6A2232

On Thu, Jun 18, 2026 at 12:54=E2=80=AFAM Jesse Zhang <Jesse.Zhang@amd.com> =
wrote:
>
> If we get an interrupt for a bad user queue (bad opcode, etc.), add
> a helper to handle the reset for user queues.
>
> v2: squash in fixes
> v3:
>  - schedule the reset via amdgpu_userq_start_hang_detect_work() instead
>    of open-coding mod_delayed_work()
>  - drop the per-queue guilty flag; always reset the queue the hang
>    detect work belongs to, matching the non-compute reset path
>
> Co-developed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h | 11 +++++++++++
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index d434dd77e421..032989249940 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -141,7 +141,8 @@ static void amdgpu_userq_hang_detect_work(struct work=
_struct *work)
>                 int r;
>
>                 if (queue->queue_type =3D=3D AMDGPU_HW_IP_COMPUTE)
> -                       r =3D amdgpu_gfx_reset_mes_compute(adev, NULL, NU=
LL, NULL, NULL, NULL);
> +                       r =3D amdgpu_gfx_reset_mes_compute(adev, NULL, NU=
LL,
> +                                                        queue, NULL, NUL=
L);
>                 else
>                         r =3D userq_funcs->reset(queue);
>                 if (r)
> @@ -671,6 +672,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_=
amdgpu_userq *args)
>         }
>
>         queue->doorbell_index =3D index;
> +       queue->doorbell_offset =3D (u32)args->in.doorbell_offset;
>         r =3D uq_funcs->mqd_create(queue, &args->in);
>         if (r) {
>                 drm_file_err(uq_mgr->file, "Failed to create Queue\n");
> @@ -1112,6 +1114,24 @@ static void amdgpu_userq_restore_worker(struct wor=
k_struct *work)
>         dma_fence_put(ev_fence);
>  }
>
> +void amdgpu_userq_process_reset_irq(struct amdgpu_device *adev,
> +                                   u32 pasid, u32 doorbell_offset)
> +{
> +       struct xarray *xa =3D &adev->userq_doorbell_xa;
> +       struct amdgpu_usermode_queue *queue;
> +       unsigned long flags, idx;
> +
> +       xa_lock_irqsave(xa, flags);
> +       xa_for_each(xa, idx, queue) {
> +               if (queue->vm && queue->vm->pasid =3D=3D pasid &&
> +                   queue->doorbell_offset =3D=3D doorbell_offset) {
> +                       amdgpu_userq_start_hang_detect_work(queue);
> +                       break;
> +               }
> +       }
> +       xa_unlock_irqrestore(xa, flags);
> +}
> +
>  static int
>  amdgpu_userq_evict_all(struct amdgpu_userq_mgr *uq_mgr)
>  {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.h
> index 7a5f8ed794b8..61e5f8a06eb2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.h
> @@ -53,6 +53,7 @@ struct amdgpu_usermode_queue {
>         enum amdgpu_userq_state state;
>         uint64_t                doorbell_handle;
>         uint64_t                doorbell_index;
> +       u32                     doorbell_offset;
>         uint64_t                flags;
>         struct amdgpu_mqd_prop  *userq_prop;
>         struct amdgpu_userq_mgr *userq_mgr;
> @@ -178,6 +179,16 @@ int amdgpu_userq_post_reset(struct amdgpu_device *ad=
ev, bool vram_lost);
>  void amdgpu_userq_start_hang_detect_work(struct amdgpu_usermode_queue *q=
ueue);
>  void amdgpu_userq_process_fence_irq(struct amdgpu_device *adev, u32 door=
bell);
>
> +/*
> + * CP packs the per-process doorbell_id of the queue in
> + * CTXID0[9:0] on priv-fault (same encoding KFD uses via
> + * KFD_CTXID0_DOORBELL_ID_MASK)
> + */
> +#define AMDGPU_CTXID0_DOORBELL_ID_MASK 0x3ff
> +
> +void amdgpu_userq_process_reset_irq(struct amdgpu_device *adev,
> +                                   u32 pasid, u32 doorbell_offset);
> +
>  int amdgpu_userq_input_va_validate(struct amdgpu_device *adev,
>                                    struct amdgpu_usermode_queue *queue,
>                                    u64 addr, u64 expected_size, u64 *va_o=
ut);
> --
> 2.49.0
>
