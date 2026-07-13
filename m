Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XEzCDMhRVWpmmwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:59:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBA74F2A3
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 22:59:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=NOE5GMUL;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20260327:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FA610E65B;
	Mon, 13 Jul 2026 20:59:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C6210E65B
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 20:59:48 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2cc7a269ca1so8165345ad.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783976388; cv=none;
 d=google.com; s=arc-20260327;
 b=OX+GeZ/68Dy2FVP9tSMHekMNp7syPatK9cHgNXikPsUzdidyUvaeZXWwvKLyfaaQiZ
 KG5RTsseJLY1f8KvSYQu2jYMBk0z7GJCJdx/DpMmpVjZB+7PuO0QGPe+QHvzfWU4f9k9
 gV1QuhRrKUDxCv40qadvm5aH3sAI2T/kZavoG/zgGeHV9RSet5NeEztnCb9RzZn0oPFd
 gVvIN38lMQDDnS04CylfThsffyQixlW573k3lsT/BNmwRLIziMrI1iIuQDKINq6ZvJTB
 93+PbfSQVJ8FkOVGmhBbGdDuiR7TuC2AwBVlJv3tuawktauYNCccYNVzCPs7If1bAFiF
 VdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uWZ6RnfH+sS7l94+90x2p/YrqRNuilzn5DDPDm/q3D4=;
 fh=gUJYOOnN1wdb5D7FcFaekT9/Mrf1IxL6fQF9/tKD4tk=;
 b=fpZYz1DV9OIyZkIDNASrr/mxD1Uj3Przp7iiD6X84B/HVKExR924F5o+9gnX/JPK58
 BWDXN+btEQCnErl1zA3o9JBHmO2VCpguZHEqFW5nQfLO8NSSVatktPmPM5SipbImqf+J
 8G5+Xj6S8IPWyj1/2frfSStIOlvGJgY67LiOYH6oKjwe2KwP0hZTSR6q17jGU7kQ8ZzM
 gRFYy1OXuwUvjQ7dyIY5vPWNpd3lpn/U9Os6/16dSY6R7+xqOe0ghflHItfeTQ6ti2gz
 NbTyzjsokrOWWDxIqfrAZHNb03eYjHO2Y8fn7OOjnhan/W3N4N9eZpjqXImen4oLRNxa
 nlhA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783976388; x=1784581188; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=uWZ6RnfH+sS7l94+90x2p/YrqRNuilzn5DDPDm/q3D4=;
 b=NOE5GMUL9wPYnYQ2BRkQCD/HMHcG2NW9eYvPSv6T5GV1d5KZfy3/3tD2WOMiS4gVPM
 IZJCM0nv0Zzrak53jRtc/HcpGbXe+HBmt/kTtMLsnigfvOaDBl36ehhCjI9zGHwAhJgo
 H6Q0HGV44nCizZZdCOc4jJmLEBR1X71+ygDg8cCoLbOElJnzzwYdZQ0FqAG2hvm82WOh
 cXeM9GSXnRjjJSBidNvql9SbKGuwdaFiagm2oPxAKado+F8jQIO3EtQr0vS++xvN+JbS
 lLX3JYUp1tq8MuBJ5lFn7zfDOW1cWRMXKSjXbt12kfbdo9F7oKjZ0xR0tal1QMqCceK3
 lb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783976388; x=1784581188;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=uWZ6RnfH+sS7l94+90x2p/YrqRNuilzn5DDPDm/q3D4=;
 b=X7bmdsHwSn+bi3cZvDx2wMK6Wf0+8nq8dx0m+E4fMkEX7HcdPFc37INQjC1e4MBZyV
 RhNejunhgOVajw1QO/MIVHn+ZFLmgfe/aOCNV6mj3ktYEljIzQwKe/WWW4OwFs3GteOO
 qQBGuf9X1Ulsa8Mngr5QPFCofKSdBbX82z1diYEBlI/qgdP+jFj9zNHuhOBEGsuijzLh
 G0B3G00NlCbplA4uD8h2K74jGPxBr4zM85e6oNDIX5ILJYdzyno7wsJxoFWyxLNjQJkh
 7ig6L+xjsM+sP4ZvUcN6Dz433d/Llzw86/XZOr01FTr3dWb7V7++hYTGrpFfqm903oGa
 OUPg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrnKLubRpYhTwaizT4zYGnceiFeQQwue3sMSOabHuZOyteqj/ViUuBfOQGWNg0xIbHA5p3ftwfS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ3DNc2RG9ySXOU336cq1gpUMwZgCO5ktH3YNvKSppsTgVxL2W
 S6/BpRTHkAhrhBOJl6VMYm8Uh5oHMCwowzJw0RKmUlckNVfDPIX+dqRNXveCf0M3SoDaOrPRN2B
 Za8RjUomTUtd8VfCACia0BCtrtI2quAY=
X-Gm-Gg: AfdE7cmZvUqZyOtOx82Rqhr0LahcSfIwA2aQnqfHoLqNi99WPRjepTQaqlvedg3MntC
 enaEbffy0YYUSVPNYjtQ1P35+iOd5a/m+4RFT/X0ySHX34SrMcyCCEqLlwrRjNB1C/ee09TPWVU
 /sZvXbEsiOQ++qccOALkzST7quJCX7UirMtVkGH5r+vWpMgFBk39buPDTD71s28in89mcvG0CZC
 vIMO33W44pkFC0BXaHdZSgWlhdKI8J37mAeW+A1b2kCt1gszDMvDnzQdSaNoE8F2dTBwXN0pE4D
 uA1M4jeNemFCJBiit/ZifICARZXwaD00CZfr86SwAiIPsPLNTnsG5esDYjo=
X-Received: by 2002:a17:903:24e:b0:2c4:397:dd7a with SMTP id
 d9443c01a7336-2ce9f1599f9mr77883275ad.4.1783976388343; Mon, 13 Jul 2026
 13:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260713164321.3350036-1-srinivasan.shanmugam@amd.com>
 <20260713164321.3350036-4-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260713164321.3350036-4-srinivasan.shanmugam@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Jul 2026 16:59:37 -0400
X-Gm-Features: AVVi8Cfrvy04xFjlMpclP7mHXD6E4Rn0z1T9RNGPc19vDJkjUHKazebXqtU_Nkk
Message-ID: <CADnq5_MBhZ-MiYjDtjLp1TD244Oz0kf72NvvK2+k9cUJkgajqw@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] drm/amdgpu: Register WAIT_EVENT ioctl
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
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
	ARC_ALLOW(-1.00)[google.com:s=arc-20260327:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,amd.com:email,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73CBA74F2A3

On Mon, Jul 13, 2026 at 12:44=E2=80=AFPM Srinivasan Shanmugam
<srinivasan.shanmugam@amd.com> wrote:
>
> Register the WAIT_EVENT ioctl so render-node clients can wait for AMDGPU
> event records and receive event metadata through the per-file WAIT_EVENT
> manager.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

This could be squashed into patch 2.

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index e90cf67c1cd8..b738a1bdf9d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -3097,6 +3097,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D=
 {
>         DRM_IOCTL_DEF_DRV(AMDGPU_GEM_LIST_HANDLES, amdgpu_gem_list_handle=
s_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_PROC_OPTIONS, amdgpu_proc_options_ioctl,=
 DRM_AUTH|DRM_RENDER_ALLOW),
>         DRM_IOCTL_DEF_DRV(AMDGPU_EVENTFD, amdgpu_eventfd_ioctl, DRM_RENDE=
R_ALLOW),
> +       DRM_IOCTL_DEF_DRV(AMDGPU_WAIT_EVENT, amdgpu_wait_event_drm_ioctl,=
 DRM_RENDER_ALLOW),
>  };
>
>  static const struct drm_driver amdgpu_kms_driver =3D {
> --
> 2.34.1
>
