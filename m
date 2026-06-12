Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I8EtMOK5K2oPDQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 09:48:50 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270786776AB
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 09:48:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=U+qaMuAo;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B7E10F310;
	Fri, 12 Jun 2026 07:48:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C274810F310
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 07:48:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b915ded5so5714005e9.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 00:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781250526; x=1781855326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jsSpYYN9fCJTIX2eacScZiY08CAYt7mz+jYWybXIw4o=;
 b=U+qaMuAoeCweDamAtAkTSKNNDsbs/6GhJbdarnnJwW0+YnNER60/wA0zdzm77IBDk0
 7qeOEE29MlNrsYksKaB+DeK4dpzz294AfkktNlMf7XUyn8e/B8yTYYoa19bS8ZaX470m
 gy3YdEZTsFiqz/dFEWLUM1tHOsaIxPh7CZz0b3dXHahIb1G49AlgHhiPOLx7VozDoveL
 M6beryvzg3ZaDGOIMnR6ux4YltTjTxVufUD2e+SZExQX5LvfZseQglAa+mevD5Lo6Efo
 9ebKESWETO9lumnRHoKtPTWjsN43Z7a8w4lNDiWbXI19cuy5vBXSx3843JYNGyrHAn5X
 G70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781250526; x=1781855326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jsSpYYN9fCJTIX2eacScZiY08CAYt7mz+jYWybXIw4o=;
 b=daDm3+HE70NFNKfoaS6i9Mre2iDiducF7FADiNaK3t2FEpwFFsLpnXe+r0Ap817Mfz
 qutKvv9VxNZjllP1tVqCr1kT46gWrl0tecZoCgcc1J5cnReo7kput/gv3ubS2Hl2xeRr
 k9UFlXdUkvBiz7LAZnr/NUA6/xSoqnDvDtscv/vdH4wkiV1W+qHDXdJy2250YqCne34G
 c8e0GlyIu8qTPQLQXr6bTeDz6aKFGwJ8eiO7gQblKnTTmUE7oqSMp5xYTxM4pcQV6c3C
 AeenAXYa3+ASAx2v9d5jBN+mpxeR6ijZxZwc6UoBpq4WGwhMmmfSE3kDiKHykPd8UTDe
 YfXA==
X-Gm-Message-State: AOJu0YzGSZLF/Oy56DIKGRNPQU2nhDiexUM2taqQ+cnIKceFXG77yuc/
 ZOvJdAL3BY6JpNqnGmK8jvFKt5nSz7UIs6ER+zNhc86PTEK+ZeidYbDr
X-Gm-Gg: Acq92OEANQoXFmqWdKHdahohAFWmG6ANoOc3kHrrRtJDMvH55ybJHbMTEGu2hzP9qA8
 K2LtRGsfxEbIoHFwjvnse9T9zSUCW2MKcgMKGmxi7LiZkBDZx2aWFebnWERoRgpk3eLfRspR9n3
 S8r4h+s+P18SH0x6sSc/gjcE3lyHZA1B3MdS+14K3AZQ49PIPRfo3je9vUNhzZyjmaHvWR7EOMS
 Cnib+W3fPVRwFAownywaDTHDRWO7tok9M3SgZQ+Zng1XOrje26sTwdwT5p/NsUylREvao7coKjZ
 nI71n3tFTY4QUUTaEFISjlHm4P4le1QnO4T/+hrwkVD8wntPZKQ0UjV6qUi3AGJAdMl0kpD3JgU
 fne1FtTRL5UfgJssVwCza2wkj+5t9mckvMA0mx4WNx7bmlEPwMHBy8P3XJlhuWid3PA66dOG/0Z
 UghqI6ICvuiQ+LUGPJso+adAiw/ub2EkQ1cYUE5Z1+2fDWXzES651snKji+lPAD5bUj7QOZZCLh
 F/hQfA80zCQYyVwYE/c38swNFWMpRD7TY4uOCPq
X-Received: by 2002:a5d:5f82:0:b0:45e:ed7f:1d9 with SMTP id
 ffacd0b85a97d-4606dba7bf9mr2237500f8f.17.1781250526209; 
 Fri, 12 Jun 2026 00:48:46 -0700 (PDT)
Received: from timur-max.localnet
 (20014C4E24EDFA00ACE56DB4A62D1E35.dsl.pool.telekom.hu.
 [2001:4c4e:24ed:fa00:ace5:6db4:a62d:1e35])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f23fsm3236866f8f.9.2026.06.12.00.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 00:48:45 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, "Huang, Ray" <Ray.Huang@amd.com>, 
 "Huang, Trigger" <Trigger.Huang@amd.com>
Subject: Re: [PATCH v2 1/1] drm/amdgpu/gfx9: Fix Ring and IB test fail after
 mode2
Date: Fri, 12 Jun 2026 09:48:45 +0200
Message-ID: <2014755.b9uPGUboIS@timur-max>
In-Reply-To: <BL1PR12MB5849F914400E06407D2C9451E7182@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20260611055715.1142135-1-Jiqian.Chen@amd.com>
 <3694190.dWV9SEqChM@timur-hyperion>
 <BL1PR12MB5849F914400E06407D2C9451E7182@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:Jiqian.Chen@amd.com,m:samuel.pitoiset@gmail.com,m:tvrtko.ursulin@igalia.com,m:Ray.Huang@amd.com,m:Trigger.Huang@amd.com,m:samuelpitoiset@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,igalia.com,amd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 270786776AB

Hi Jiqian,

> > Indeed I've seen similar issues on other GPUs, as I've been looking into 
> > improving GPU recovery.
> > 
> > Instead of forcing the HQD_ACTIVE to zero, I suggest to deactivate the HQD
> >  before reset. We should introduce a gfx_v9_0_deactivate_hqd() function
> > similar to what gfx_v8_0_deactivate_hqd() is doing, and call that from
> > somewhere in gfx_v9_0_hw_fini() when disabling the compute queues.
> 
> Make sense, that look like a more suitable place, I will try to move my
> sequences into gfx_v9_0_hw_fini() in next version.
 
Sounds good.

> > In fact, it looks like it already deactivates HQD, but only for the KIQ
> > and  only when it isn't in reset or suspend. That looks wrong to me and
> > I think it should do that for all compute queues (in addition to the KIQ)
> > either unconditionally or before a mode2 reset.
> 
> So, you think the if condition checks are not needed?
> 	if ((adev->flags & AMD_IS_APU) && amdgpu_in_reset(adev) &&
> 			amdgpu_asic_reset_method(adev) == 
AMD_RESET_METHOD_MODE2)
> Since I only reproduced and verified when mode2 on APU, I think keeping this
> check would be better.

Yes, I think the checks may not be needed or need to be adjusted.
Additionally, the same sequence needs to be repeated for every compute ring.

> > I don't have a Renoir APU yet but if you need help, I can try to see if I
> > can  reproduce something like this on a Vega 10 dGPU.
> 
> It seems Vega 10 dGPU uses Moed1 or BACO reset. I am not sure if it has the
> same issue. When you "see similar issues on other GPUs", are they all APUs?
> What's the gfx version? And what reset method they use. If they are not, I
> may find a same hardware as your to verify my changes. I tried other APU
> with gfx10, there is no this issue.

You are correct that dGPUs don't use mode2 reset. I saw a similar issue while 
working on a patch series to improve GFX IP block soft reset on GFX8. I am 
testing that on a Carrizo APU as well as Fiji and Polaris 10 dGPUs.

The problem I saw is very similar to yours: compute rings fail to resume after 
the reset and are "stuck". I managed to solve that by making sure the HQD is 
deactivated before the reset and ensuring that the MQD is cleaned up after the 
reset.

Best regards,
Timur








