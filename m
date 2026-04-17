Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGGfKf0j5mlBsgEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Apr 2026 15:02:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B36942B274
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Apr 2026 15:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D1310E5B1;
	Mon, 20 Apr 2026 13:02:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=xry111.site header.i=@xry111.site header.b="a+JPNh5b";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Fri, 17 Apr 2026 20:28:37 UTC
Received: from xry111.site (xry111.site [89.208.246.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB010E123
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 Apr 2026 20:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
 s=default; t=1776457255;
 bh=NEVb80lknSaPDgEx0lt2EO7oDxF4rlstntWGFEKHqIc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=a+JPNh5bJEEGiPC0Hy8dgtqQHnuwpZ2jMVz869+xHtUHSR0A1yS0HT0Uc/xFDx74d
 9pFcOcGUnfncgfQv2tElqQmxDaCHU5RCW51M8Gewsk4xyVykZj7lUEZzzlr3zMuC2s
 o9ctQ9blyib9iglHcptZ64f1nR266PRkTX+6BRi0=
Received: from [127.0.0.1]
 (2607-8700-5500-e873-0000-0000-0000-1001.16clouds.com
 [IPv6:2607:8700:5500:e873::1001])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1)
 server-digest SHA384) (Client did not present a certificate)
 (Authenticated sender: xry111@xry111.site)
 by xry111.site (Postfix) with ESMTPSA id BCAC965992;
 Fri, 17 Apr 2026 16:20:53 -0400 (EDT)
Message-ID: <2876f47c528d54fb2b8f4fd9c33fed7933665ab5.camel@xry111.site>
Subject: Re: [PATCH] drm/amdgpu: Clear cached EDID pointer after
 drm_edid_free()
From: Xi Ruoyao <xry111@xry111.site>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Joshua Peisach
 <jpeisach@ubuntu.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Apr 2026 04:20:51 +0800
In-Reply-To: <20260411160539.2305517-1-srinivasan.shanmugam@amd.com>
References: <20260411160539.2305517-1-srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Apr 2026 13:02:49 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	DATE_IN_PAST(1.00)[64];
	DMARC_POLICY_ALLOW(-0.50)[xry111.site,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[xry111.site:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:jpeisach@ubuntu.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:error27@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[xry111@xry111.site,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[xry111.site:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,xry111.site:email,xry111.site:dkim,xry111.site:mid]
X-Rspamd-Queue-Id: 0B36942B274
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 2026-04-11 at 21:35 +0530, Srinivasan Shanmugam wrote:
> The driver stores EDID in amdgpu_connector->edid and uses it as a cache.
>=20
> amdgpu_connector_get_edid() checks this pointer. If it is not NULL, it
> assumes EDID is already present and does not read it again.
>=20
> In some detect paths, the driver frees the EDID using drm_edid_free(),
> but does not set the pointer to NULL. Because of this, the pointer still
> looks valid even though the memory is already freed.
>=20
> Later, when amdgpu_connector_get_edid() is called, it returns early and
> does not read a new EDID. This can lead to using a freed pointer.
>=20
> Fix this by setting amdgpu_connector->edid =3D NULL after drm_edid_free()=
.
>=20
> This makes sure the driver reads a fresh EDID and does not use invalid
> memory.
>=20
> Fixes: 289479173fb5 ("drm/amdgpu/amdgpu_connectors: remove amdgpu_connect=
or_free_edid")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Cc: Joshua Peisach <jpeisach@ubuntu.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

I can tell the UAF is not just a theoretical one.  On one of my dev
boxes (using an R7 240) the kernel Oops when the amdgpu driver is
loaded:

4=E6=9C=88 18 03:57:36 defiant kernel: Unable to handle kernel NULL pointer=
 dereference at virtual address 0000000000000009

/* snip */

4=E6=9C=88 18 03:57:38 defiant kernel: Call trace:
4=E6=9C=88 18 03:57:38 defiant kernel:  update_display_info.part.0+0x70/0x1=
384 (P)
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_edid_connector_update+0x74/0x42=
0
4=E6=9C=88 18 03:57:38 defiant kernel:  amdgpu_connector_vga_get_modes+0x24=
/0x74 [amdgpu]
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_helper_probe_single_connector_m=
odes+0x194/0x660
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_client_modeset_probe+0x178/0x16=
10
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_fb_helper_hotplug_event+0xac/0x=
e0
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_fbdev_client_hotplug+0x20/0xcc
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_client_hotplug+0x40/0x9c
4=E6=9C=88 18 03:57:38 defiant kernel:  drm_client_dev_hotplug+0x90/0xc0
4=E6=9C=88 18 03:57:38 defiant kernel:  output_poll_execute+0x23c/0x29c
4=E6=9C=88 18 03:57:38 defiant kernel:  process_one_work+0x140/0x268
4=E6=9C=88 18 03:57:38 defiant kernel:  worker_thread+0x17c/0x2f0
4=E6=9C=88 18 03:57:38 defiant kernel:  kthread+0x114/0x120
4=E6=9C=88 18 03:57:38 defiant kernel:  ret_from_fork+0x10/0x20
4=E6=9C=88 18 03:57:38 defiant kernel: Code: 52800002 f101fc3f 54000109 f94=
00700 (39402403)=20
4=E6=9C=88 18 03:57:38 defiant kernel: ---[ end trace 0000000000000000 ]---

Bisection pinpointed to 289479173fb5, and applying this patch has made
the Oops gone.  Thus:

Tested-by: Xi Ruoyao <xry111@xry111.site>

--=20
Xi Ruoyao <xry111@xry111.site>
