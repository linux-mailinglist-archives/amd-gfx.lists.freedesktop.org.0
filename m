Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GYObDtYVMGreNAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 17:10:14 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F839687807
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jun 2026 17:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AkDdiArm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A7010E4DE;
	Mon, 15 Jun 2026 15:10:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CB110E4DE
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 15:10:11 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-963b85bcebcso110110241.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jun 2026 08:10:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781536210; cv=none;
 d=google.com; s=arc-20240605;
 b=Q6reW8ry08lEuWBEfGYN3K3T065CfOpHs6C37fV50n9vZNJOKnYVDHtfuW2+dVwA4A
 bS86DccXg2F5Wl4WPae/E0u8Ae3PPLS3DE3sTsOQPGq5wIX3yD6narLYQkPTkfj4eWe+
 8DDVy+YuCLl5v7XDFZ6bPIxQd7jF7PRORgER5lZidUT8Z5WwluSLpHlmpP1BfcCm8mxW
 XLoBURu3xOgEu4a+UEgDYxs7wWLwtT6Ly5aKVa+AcG2IN260Jro0fe7BQv5E89MQdViJ
 lgYCVglxV5OkOEaWTNUuaBJtaJONYa10JTRykpRReMD6eaYPA/gHhfozVsw649NnNm+V
 1hCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=13hVYdB7l/k+KcGd/9SBchGGp4mNuBG4mo9ptCsOsMw=;
 fh=pgztCJpP8RThuCx1hackwz2QHKf50BmOj3YUq5dn32Y=;
 b=cf6u3dJ/3tVJMl5mxpg/IcM2ZnPt9DamIs9FKcUz8FV96tv4dHOM7qN/6LtIASRrv4
 q/tp+krrUP9T92ITg/y4tHr2SlHx4J3u3Li4eLGFmFGQKDC26DDBzNFR64o59QWoSQj2
 ihHNswcCxnKBNzVjYB4PxFSB8A1MCp8Ip22bvt8a+YwkkjkN/33qZiENrH28p2YbwC35
 H/sZQUAb8377x7v6POshDA4jvH4JLA5M1z1X1ig7pLmOVpFG3e3veo+kPTufop4O1nfZ
 +WaEXzQNFJwrnM6+z9txtOl3F0pFlBhaSwWGEqWlDz9wBO6bHI9tD2CBvbCasYSPvmJK
 HKgw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781536210; x=1782141010; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=13hVYdB7l/k+KcGd/9SBchGGp4mNuBG4mo9ptCsOsMw=;
 b=AkDdiArmVgzY7ypu3tT5g16tBL8BNCPhhY7slGpSyk7bOZZEwskHYhnJBu3jPmPjMX
 AcUVs+eNNcS+xbVjV+45LsgghLvYGwFmlm7rPcE375JpKX5h2FoRJOmGL2BSBfG2GF8h
 kSfQ8jGNhFeqjLb7WzFPU7bPunZU4L5SPUIcMhBIiFYGYVrGC/p/jEgJFhMaZlGb4Rge
 /0ppAYWi8UvfnBRe5UAXJQEm7ML+m6nzx4dG/8xYytelF9X26OgEUcjIcqUJWNIn4rDe
 p5gFGWOG/oDL9rnjpilKOX0LO51PNFL03hUMsaixY6IUbAejeSVpU+9xRNPfg6WsG07J
 08Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781536210; x=1782141010;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=13hVYdB7l/k+KcGd/9SBchGGp4mNuBG4mo9ptCsOsMw=;
 b=jc9mfUUDInjOYqmKW4zjRRtRKiiM9TL2ETt1XcLmD5qBhhCrWy5OQrbFW844lQlzIb
 8pHcTQy8XnBi0gNXC9fgIOKxMQ5mb7RAWH2/JFmJY6gZdywI8AzyLfNzb9kSwxiLhFlm
 RqkuOdYUIXdWhuDivnzEEcmvCzLfO0CtbK0cadW/kH0cmiNOPJZh8cetoVWjcKLOoDMO
 JDy5FFV32LzfH5DF9JjagFU7F4vnIq+eQli80kZ+uF0BEUZEGPVzR1fVdc8yaitOBr+2
 EVvVLV8oK0L7nNzFeJcPbFWMTOQyqUN0hdJXMiw5F48WBW78oAmDP7q+8D247VF/Blma
 luiw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+TLm1EQKIy383hfzvGRKl3tUsbMDJIy79sGCKssiq/UwOtNfA9hH3A9PTsKNp+7BRodvbpikTs@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+gLIdzsWMeaONjzL1d5IvIjj16jvx/+feOMHf8wLtcPzvOs/O
 rnK9iTwdov19Mg2hE2xZS9T6b7nU5MsOd0gfHSnro8PaQYvof2LGXvCWGwu/pX/8vJUHOtHvEKN
 0+kcW4f260Cw1H8xna9oQagGi4kT++w8=
X-Gm-Gg: Acq92OEegzXdpQyjCND4Assgvz4rUWayQThrbUsINsQnTzwEbY2eiDBptcwkeaUaGYZ
 u9bmjvXMsFyfXPn70t/RunV5a/L/VlN3JO5iFIKzm5NknGJY7FbifZ//ZfM1Pznbs2i0Dp2lBhP
 844RaepLQP7NH7kRXai4tWwfGOvocC7wbJfOqq7hDUlZjLj6xPWuvMgkp3r6upHPBhfj8vtu9Y7
 VEDHDcetrs5siGdZuw//5P15uq8cm4KN7KWEKL49Uvsg1isgKMNImOTpixLGq2PWi97bzG1w4m4
 h9NRegdfgsTAr8UFStHv4tIi6fjb3J+cJ31w7vz4zFnk+Jjl0tfKgwvQ5rG6A6CEaV6mWA==
X-Received: by 2002:a05:6102:3e8e:b0:65b:c17:7052 with SMTP id
 ada2fe7eead31-71e88901b2fmr2314582137.0.1781536209683; Mon, 15 Jun 2026
 08:10:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260608-amdgpu-mutex-fix-2-v1-1-1d850180ed19@igalia.com>
 <2660d09d-b549-447e-a28c-ca8550c3b288@igalia.com>
In-Reply-To: <2660d09d-b549-447e-a28c-ca8550c3b288@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Jun 2026 11:09:56 -0400
X-Gm-Features: AVVi8CdwS2MMG0H1zzBQynG0YAIyC1zlvEr24KuG7IBFRX6FoZNz8vEgGeCWHFc
Message-ID: <CADnq5_OkcK6dPLXnBqWr10Dat8oRLp6CLdin6dHcUGUNwoaTtQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: initialize irq.lock spinlock earlier
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com
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
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tvrtko.ursulin@igalia.com,m:cascardo@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:harry.wentland@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexdeucher@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F839687807

Applied.  Thanks!

On Tue, Jun 9, 2026 at 4:07=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
>
> On 08/06/2026 20:22, Thadeu Lima de Souza Cascardo wrote:
> > If there is an early failure during amdgpu probe, like missing firmware=
, it
> > will end up calling amdgpu_irq_disable_all, which takes irq.lock spinlo=
ck
> > without it being initialized.
> >
> > Initializing irq.lock earlier at amdgpu_device_init fixes the issue.
> >
> > [   79.334079] INFO: trying to register non-static key.
> > [   79.334081] The code is fine but needs lockdep annotation, or maybe
> > [   79.334083] you didn't initialize this object before use?
> > [   79.334084] turning off the locking correctness validator.
> > [   79.334088] CPU: 2 UID: 0 PID: 1819 Comm: bash Not tainted 7.1.0-rc5=
-gfd06300b2348 #96 PREEMPT  8e8f461221633dae3c832d6689eaf0546c0ed4cd
> > [   79.334092] Hardware name: Valve Jupiter/Jupiter, BIOS F7A0133 08/05=
/2024
> > [   79.334094] Call Trace:
> > [   79.334095]  <TASK>
> > [   79.334097]  dump_stack_lvl+0x5d/0x80
> > [   79.334103]  register_lock_class+0x7af/0x7c0
> > [   79.334109]  __lock_acquire+0x416/0x2610
> > [   79.334114]  lock_acquire+0xcf/0x310
> > [   79.334117]  ? amdgpu_irq_disable_all+0x3b/0xf0 [amdgpu c88bab43d391=
d519ad0d5c8e5a099b4aceefa180]
> > [   79.334503]  ? _raw_spin_lock_irqsave+0x53/0x60
> > [   79.334508]  _raw_spin_lock_irqsave+0x3f/0x60
> > [   79.334510]  ? amdgpu_irq_disable_all+0x3b/0xf0 [amdgpu c88bab43d391=
d519ad0d5c8e5a099b4aceefa180]
> > [   79.334881]  amdgpu_irq_disable_all+0x3b/0xf0 [amdgpu c88bab43d391d5=
19ad0d5c8e5a099b4aceefa180]
> > [   79.335240]  amdgpu_device_fini_hw+0x90/0x32c [amdgpu c88bab43d391d5=
19ad0d5c8e5a099b4aceefa180]
> > [   79.335704]  amdgpu_driver_load_kms.cold+0x22/0x44 [amdgpu c88bab43d=
391d519ad0d5c8e5a099b4aceefa180]
> > [   79.336159]  amdgpu_pci_probe+0x204/0x440 [amdgpu c88bab43d391d519ad=
0d5c8e5a099b4aceefa180]
> > [   79.336494]  local_pci_probe+0x3c/0x80
> > [   79.336500]  pci_call_probe+0x55/0x2e0
> > [   79.336505]  ? _raw_spin_unlock+0x2d/0x50
> > [   79.336508]  ? pci_match_device+0x157/0x180
> > [   79.336512]  pci_device_probe+0x9b/0x170
> > [   79.336516]  really_probe+0xd5/0x370
> > [   79.336521]  __driver_probe_device+0x84/0x150
> > [   79.336525]  device_driver_attach+0x47/0xb0
> > [   79.336528]  bind_store+0x73/0xc0
> > [   79.336531]  kernfs_fop_write_iter+0x176/0x250
> > [   79.336536]  vfs_write+0x24d/0x560
> > [   79.336542]  ksys_write+0x71/0xe0
> > [   79.336546]  do_syscall_64+0x122/0x710
> > [   79.336550]  ? do_syscall_64+0xd1/0x710
> > [   79.336553]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
> > [   79.336557] RIP: 0033:0x7f92fd675006
> > [   79.336561] Code: 5d e8 41 8b 93 08 03 00 00 59 5e 48 83 f8 fc 75 19=
 83 e2 39 83 fa 08 75 11 e8 26 ff ff ff 66 0f 1f 44 00 00 48 8b 45 10 0f 05=
 <48> 8b 5d f8 c9 c3 0f 1f 40 00 f3 0f 1e fa 55 48 89 e5 48 83 ec 08
> > [   79.336562] RSP: 002b:00007ffe4fa867a0 EFLAGS: 00000202 ORIG_RAX: 00=
00000000000001
> > [   79.336565] RAX: ffffffffffffffda RBX: 000000000000000d RCX: 00007f9=
2fd675006
> > [   79.336567] RDX: 000000000000000d RSI: 000055b2dfce59b0 RDI: 0000000=
000000001
> > [   79.336568] RBP: 00007ffe4fa867c0 R08: 0000000000000000 R09: 0000000=
000000000
> > [   79.336569] R10: 0000000000000000 R11: 0000000000000202 R12: 0000000=
00000000d
> > [   79.336570] R13: 000055b2dfce59b0 R14: 00007f92fd7ca5c0 R15: 000055b=
2dfdbaf70
> > [   79.336574]  </TASK>
> >
> > Fixes: 9950cda2a018 ("drm/amdgpu: drop the drm irq pre/post/un install =
callbacks")
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 2 --
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 21a3fb574d53..e5a9f6325c4a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -3749,6 +3749,8 @@ int amdgpu_device_init(struct amdgpu_device *adev=
,
> >       mutex_init(&adev->gfx.workload_profile_mutex);
> >       mutex_init(&adev->vcn.workload_profile_mutex);
> >
> > +     spin_lock_init(&adev->irq.lock);
>
> The fix and the Fixes: target look correct to me:
>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> The init paths are a bit of a mess though. The driver could use a
> systematic cleanup in this area path. Maybe consistent
> init/init_hw/init_early for purely software state, or something. It
> would be a gargantuan task probably. Some years ago we strived for a
> clean design along these lines in i915 and I think without a solid
> continuos integration with fault injection it possibly shouldn't be even
> attempted.
>
> Regards,
>
> Tvrtko
>
> > +
> >       amdgpu_device_init_apu_flags(adev);
> >
> >       r =3D amdgpu_device_check_arguments(adev);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_irq.c
> > index 254a4e983f40..40b8506ac66f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> > @@ -309,8 +309,6 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
> >       unsigned int irq, flags;
> >       int r;
> >
> > -     spin_lock_init(&adev->irq.lock);
> > -
> >       /* Enable MSI if not disabled by module parameter */
> >       adev->irq.msi_enabled =3D false;
> >
> >
> > ---
> > base-commit: 60dc0946bbad3eef8bc66a5a8b09b98dbc6e09c0
> > change-id: 20260608-amdgpu-mutex-fix-2-381a3bed81f0
> >
> > Best regards,
> > --
> > Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >
>
