Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RXkWHtD0UGoq9AIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:34:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB7473B4A7
	for <lists+amd-gfx@lfdr.de>; Fri, 10 Jul 2026 15:34:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KZfLiAyc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F5F10F8E2;
	Fri, 10 Jul 2026 13:34:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FEC10F8E2
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 13:34:04 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ca158f02ccso2380675ad.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jul 2026 06:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783690444; cv=none;
 d=google.com; s=arc-20260327;
 b=GZgTOlzo8Wq+bSTgxTBNoXHXDzB6CQ0ZD3WbnzBoELZmgf1ZJ53BT5ySdB5EDT/d/7
 4OjLpNIjJTXaPdSct/nAV/PC9z7PJfV+vcuU4lVkMHKu4LyVu+5SYXQfq0eySiTw24da
 yvrKSinJr9ocne9GewtyUP/QTcRhi8sF0BX9KdjqUR/MWNjpNGqkQzOv9SP0sxrdRUpw
 qwnyPiPZlMKMAuNsTrwZzFkNrr72LcQiHjoBx9j/6fmsADJ0hCsTCHdrkqIfcuFr9EA4
 WiRS9GZKfWHL50XWrBFqYJx7BHmkOQzzavVmNrmfy8vrAi1/qRiemAMUJgDXRtwO4Ywt
 T2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Jf9WDkMAlW1uiTPRoDFydqvr3xxuohSQSPO/b8Vz4dY=;
 fh=CAQvLrMO+G215KzMdEOSEliozUfcQ8VWfLOp36ir1Pk=;
 b=GYIvhsjcnQq4z2SQcZ1vIQ0ONuZJGbpC5Tp23Ksr55l15aPMECzKrxhkdXZbHJE1cB
 WRPCjCwtofIOk/h0OT/2ZgYo2Rc+9jSC5uulauWcjyf0HVZRHvZd+kVs09W4No43HiqJ
 7tGVr6cmMn6sEV9WPXO6Es+PJwvpMb09+yngAvuVCvi+FF4A4lilXCJmOuTRIqN0giRM
 10Mfdm0CrJ9GZUB8ESXe+0rfbvfJtB/S5sNK288dZ+oEMjpF/tkq7oR8hJgjmUp+pZiX
 KseXM13VSDfq/oYTYKZEJVQuZ8d5tAIdXZesaUYOV29X1op11I5EQpduHIkNDFet6AjK
 Qq0A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783690444; x=1784295244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Jf9WDkMAlW1uiTPRoDFydqvr3xxuohSQSPO/b8Vz4dY=;
 b=KZfLiAyclqn5P/C09/tVFCm/CS9rywJDSlmHgo6aM0ZgVREJBhM2LQjay7SZG9hztO
 +I7QhhxIfdRWM0Ick4wO//xG6d5CdguEW437KKBo2CGV+Lu7nbtt1QTYFcDveZgBPBJg
 GnkJER54f+OU58uRQe+Ryc/U8GTr5uFAUIHyF7wwwAYGkpqOEf37jORJU901ZXgEUUK9
 qe5DdPFAaMTWgDefQ/ykHs1e6FYPYbNIf3iSrUPos7ADxS6FqzZytSKu+BBUwjt4+ViN
 aidY0j0FBePiuUfV2swZGzBgNjnntssn7Q/6ySpE5LixoJN+RQVIPYWOOe5CZOIij47R
 BSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783690444; x=1784295244;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Jf9WDkMAlW1uiTPRoDFydqvr3xxuohSQSPO/b8Vz4dY=;
 b=As6TB4E1E082my5TfSokzz9B8IiYjbL2OFhOK94N6XsjlPgwUbMThEBAJxpG1kCTj2
 PPdnVqXGPwRURawmApRlT+NzSmUWpvFvbKkPWG0tgkv0rF7o8hdwX16m/OmOkGfjrrJ2
 NdPzo8kKhd/A1M+LUmJjAauVfOxHYY5S7WVKqMGXMP7mn2O3rTXDJ4OOZNKmdxMdJJ1I
 ERgW9hj95Ou/HPxdXa8VBYlmv1ab1Q+aU6vsLvTMU6rPpKygOsKY/kjBSgaHuPxah+B8
 HFhf8Tn/Hsl3SyP6tBEPeOIWkRYlhvsm6uakoPcvY0TuRmAemvEMIBxMJaYmKD8O3ViF
 E56g==
X-Gm-Message-State: AOJu0Ywv/Qcv6+Bo+W2V6H5Vw6kGz1m5Kc7QQtKOjUuKW+SIMUagqsLc
 N3NEGSMG1ZU0qXL9xeNAs/MVz9CrRDy7kEdHGbFaBc9rIQwZpbHiSJKOBtYR/1LEQ5aNvRj9nAZ
 af0ztb3p9Yv0DYr3YCNWkgqqUFHQiQiM=
X-Gm-Gg: AfdE7ckeZ9abNREvYlFxAtNFJgNG2nm6yLg6STi+5fOFAy92wrlxQlxza/5BXoKrlhM
 XJQwt7OP/5D2ntdK4Nxv24WVk3eMCUdorp1zomueKfDZ/nS0Rw6ZqovF9odV6gjJUjY85u9ITwv
 r7iZxKkJJ8BGlmnYe7MuV6nD6uAML2aimfzBluiM21Qbh40EJvfUQeU+oBbrMuTh0U0UJr/VGMM
 AW+Ft+Tm9BlAALmmZnL+VpSeNY7OohnRQEDyTCRVUtgbCmuUP9qBlSClkX0De8ejSFe66wZbrPr
 UXiCjK60xf0tqfnTcVd9TXr4yBp+e0NiBRPd5ZFgYbBc2K74KAjRLRHBYDM=
X-Received: by 2002:a17:902:eccf:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2ccfe05e629mr71465735ad.0.1783690443695; Fri, 10 Jul 2026
 06:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260710073648.41408-1-timur.kristof@gmail.com>
In-Reply-To: <20260710073648.41408-1-timur.kristof@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2026 09:33:51 -0400
X-Gm-Features: AVVi8CfdgHGfASG6k1Yd_9OOtNvARYW0TmzmmEF0MbZ3XJLutudpc0_NN8hqemw
Message-ID: <CADnq5_MBR2QLU_w8PNU2ktSKpDPwgomGKC0JH0C6ASLs9ooTsg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix IP block NULL check during soft reset
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com, 
 Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>, 
 Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:timur.kristof@gmail.com,m:Alexander.Deucher@amd.com,m:natalie.vock@gmx.de,m:mario.limonciello@amd.com,m:error27@gmail.com,m:lkp@intel.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,intel.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5BB7473B4A7

Applied.  Thanks!

Alex

On Fri, Jul 10, 2026 at 3:44=E2=80=AFAM Timur Krist=C3=B3f <timur.kristof@g=
mail.com> wrote:
>
> We can't print the IP block name when the IP block is NULL.
>
> Note that it should never be NULL, the only way that
> can happen is when amdgpu_ip_from_ring() is missing the
> given ring type. The check is just there to be sure.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/r/202607031711.yLwFhGfp-lkp@intel.com/
> Signed-off-by: Timur Krist=C3=B3f <timur.kristof@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_ip.c
> index 33a04113ed74..922f4b15619d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c
> @@ -489,7 +489,13 @@ int amdgpu_device_ip_soft_reset(struct amdgpu_ring *=
guilty_ring,
>         ip_type =3D amdgpu_ip_from_ring(guilty_ring->funcs->type);
>         ip_block =3D amdgpu_device_ip_get_ip_block(adev, ip_type);
>
> -       if (!ip_block || !ip_block->version->funcs->soft_reset) {
> +       if (unlikely(!ip_block)) {
> +               dev_warn(adev->dev, "IP block not found for ring %s\n",
> +                        guilty_ring->name);
> +               return -EOPNOTSUPP;
> +       }
> +
> +       if (!ip_block->version->funcs->soft_reset) {
>                 dev_warn(adev->dev, "IP block soft reset not supported on=
 %s\n",
>                          ip_block->version->funcs->name);
>                 return -EOPNOTSUPP;
> --
> 2.54.0
>
