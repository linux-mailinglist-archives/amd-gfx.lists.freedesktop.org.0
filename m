Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7+6uNIbSU2o1fQMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:44:38 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269B474583D
	for <lists+amd-gfx@lfdr.de>; Sun, 12 Jul 2026 19:44:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MqbbY26x;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C210E2F5;
	Sun, 12 Jul 2026 17:44:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633310E2F5
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 17:44:35 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493f75f7172so13235645e9.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 12 Jul 2026 10:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783878274; x=1784483074; darn=lists.freedesktop.org;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Ts2/Ui2RA7r5jQzEKYw0O8Cs+J08h0WmcXc6RVOw9DI=;
 b=MqbbY26xLBTJmNBlOCaLcuPeULwKKO3ilq6TReewyiZpe6WaHmtTj2mTqZpTeRRy9W
 moMRVtwkPFr6fScljOQU1YgEu433oGoXYuNG9Uf2P0Yx5GNTu1V2zg6qbe9G6qsnv+Cw
 hpomKsyQMoijAsTrKqUp+yK41UAxkD3nOeLErJ2IdsjLfagJ3wyscpZXzVhEuNWHG4tt
 mc9IpMalGcHytvZAEFCdoArgcxXUXbu4pnG2Y3xm5zLSRlTz4Mi7DqYyuTmtsIdQpDnP
 Ex43fIkawyO37xh/ugghx3bVOLNfTALbQ9YhXUHvEI9hHuHfIPkISCwMYkCgZp3/5qC/
 rsSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783878274; x=1784483074;
 h=content-type:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ts2/Ui2RA7r5jQzEKYw0O8Cs+J08h0WmcXc6RVOw9DI=;
 b=DX3D11wRTeQiB2+SQe/cPkIgyeLzXdGaXolZhD1tvCCA0kFjc90X+To2t2ErXL/GaG
 xWoPEVpIY5Z3cy9zRN4SLwDHprW2brkPx/K4pXFVqOfEjtYu5aPZQhmwHKrUj+VT/+Ze
 nutZcUQ64UbuWLCYpqi7MQd7X7P5r8YX0LppjOsbHarNxcs0jnB8XZMm0En0zyYwyzn6
 r3ebGKXgsldSXwTr9xHuPpG4mNUHj4dow5Chy+oEuXYo8mGg+BwtInwoK3yhwODSMeTb
 yO6oVQtIR/viaJKP6y3dN4xPzo5q0f1J1xDwbqxZW0TBg22385uNgZKE5xn5rC/PBuYy
 sUOA==
X-Gm-Message-State: AOJu0YyMhKjOm1A5mnzvBGO6OFf/rqnMd0O+gUv1LMBA6XF7or3uvzzf
 G0zAAbvh4hQD4CZNkG7RLbwsDzz81LsjsnwvyvWPNkXyODFM+shrFwrm
X-Gm-Gg: AfdE7cm0weVz6d9nrfL5DFrQemfaOwxlmKZOswV84Sk9YM9y2RWRXe2dEVBlvBMH/aJ
 syMVpQg6Bo3D8SyfdnnsT8CKM8IbnThNUZAiqBrir+HpjxsZzGDpuCJ6eOeV6Z2b7KlNOdRZVEE
 U3InbB4kgJgolDIvM5ey9Zp0jKA7LAkUnDDVjqDnPkkYyvN5xL1AXjzsVVDs7MpdCTWUH4tM/CK
 IWnvz5sxwhZ+Ng6TpHfpHxjBbXpt46p1kMVmSf9vZ7IBZBsBB+JNi9aE2H2fTAMKd2qJfOQjQhe
 eB3L+h9pJNmQJDdgt4yq7JAMUy1c6KR80g78zRwKP+/Nq6iXC54GqZeqsDWiLaEW5yW8Wdx+T3/
 2Ak+6HQE7EK/3y/GdXTh7Dm8jbEZRSrNBlMl3tVlpQEjaaCorWi+QqH2U7x6Cd+HmBx+NHQCNwx
 z5wCc2bDck+RT3TBlO0dI5dd6oILXu3H//CiBDwRxAdaiEO9duAp/1/sTa59AkRK3OmVeNM7rhX
 YL4wH8R6yzEIA1V
X-Received: by 2002:a05:600c:190c:b0:493:b91c:6bf with SMTP id
 5b1f17b1804b1-493f8818dedmr62779825e9.18.1783878273785; 
 Sun, 12 Jul 2026 10:44:33 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24E4950000951480CE1AD54B.dsl.pool.telekom.hu.
 [2001:4c4e:24e4:9500:95:1480:ce1a:d54b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb670a41sm288828895e9.0.2026.07.12.10.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2026 10:44:33 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 Lionso Alejandro Pacheco Vacacela <lionso@murena.io>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Fix preferred link rate for NUTMEG
Date: Sun, 12 Jul 2026 19:44:31 +0200
Message-ID: <2230825.9o76ZdvQCi@timur-max>
In-Reply-To: <178379850751.8410.12007342378134020217@murena.io>
References: <20260529090909.13206-1-timur.kristof@gmail.com>
 <178379850751.8410.12007342378134020217@murena.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:lionso@murena.io,m:regressions@lists.linux.dev,m:Jerry.Zuo@amd.com,m:Chuanyu.Tseng@amd.com,m:wenjing.liu@amd.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,murena.io:email,timur-max:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 269B474583D

On 2026. j=C3=BAlius 11., szombat 21:35:07 k=C3=B6z=C3=A9p-eur=C3=B3pai ny=
=C3=A1ri id=C5=91 Lionso Alejandro=20
Pacheco Vacacela wrote:
> Hi,
>=20
> I independently hit this regression on a desktop Kaveri system and can
> confirm this patch fixes it:
>=20
>   - AMD A10-7850K (Kaveri, DCE 8.1), MSI A68HM-E33, VGA monitor on the
>     onboard output (NUTMEG DP-to-VGA bridge)
>   - Debian kernel 7.1.3 (amdgpu.cik_support=3D1): VGA monitor receives no
>     signal from KMS takeover on; dmesg shows
>     "[drm] enabling link 2 failed: 15" (DC_FAIL_DP_LINK_TRAINING).
>   - Applying just this patch (1/2) on top of v7.1.3 restores VGA output
>     with DC enabled: the link trains, the CRTC comes up at 1360x768@60,
>     and the fix survived three consecutive reboots.
>=20
> Tested-by: Lionso Alejandro Pacheco Vacacela <lionso@murena.io>

Thank you for the testing!
I would appreciate if you could verify that the second patch also works wel=
l.

>=20
> Two notes:
>=20
> 1. The Fixes: tag references b74322eea36b, but that hash does not exist
>    in mainline =E2=80=94 it looks like an amd-staging-internal id. In Lin=
us'
>    tree the offending commit is:
>=20
>      a62346043a89 ("drm/amd/display: Fix coding style issue")
>=20
>    It would be good to correct this before the patch is pushed so the
>    stable tooling can resolve the dependency.

As far as I remember the regression hasn't made it upstream yet when I made=
=20
the fix, so the hash didn't exist in Linus's tree yet.

>=20
> 2. Since the offending commit shipped in v7.1, could this be annotated
>    Cc: stable@vger.kernel.org # 7.1.x (or nominated for 7.1.y once it
>    lands in mainline)? Every Kaveri/Kabini/Mullins system with a VGA
>    monitor loses display output on release kernels.

Agreed. Alex can you please backport this to 7.1?

Thanks & best regards,
Timur





