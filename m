Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oZ+IClrrK2oWHwQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 13:19:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C2678EF2
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jun 2026 13:19:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VqNiKrM6;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3720A10E9EC;
	Fri, 12 Jun 2026 11:19:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3124210E9E4
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 11:19:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-490a76757e5so6305485e9.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jun 2026 04:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781263189; x=1781867989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DUBYQs8y+YpTvWT+IOlg3duvADyeg0T0qwE87/OIr7Y=;
 b=VqNiKrM6miowuuyF1wk0WlkEV0zZrHDWmUo3un4KWDUj/a54moOCkSabFHFZyyn56t
 trgw8sy15x1y26Glw2HTTlFu0S0vcBkqBl7o1OSVBqILiGjIcuIMzz2I89B9btNHqLM9
 g6aCeXEchzT5ZgUfxdTo6s1cNigrm26IUEg0BF8Zje4Q6M4LvUb/H1p7Yjdo8FJSjhBO
 wfe22fHyBwbqLkioKXjolMAamHKrEyFd4qVcvrePxjUPDjxSDFPwg8D6vtd7BndaU+0u
 Htt5TkMWZDRIQ1Qo2oO7by8UdvgvkVNfdTFbecBLJPBXV/zNRf24CBJJfBV9IQ9S4T2Q
 DlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781263189; x=1781867989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DUBYQs8y+YpTvWT+IOlg3duvADyeg0T0qwE87/OIr7Y=;
 b=L+rEMd2wDOnJHH74ujsoULxk158vMzsn3Ca+zJgtDDYr0TwprwGDRhY94KFs/NPF5b
 +mlFnhUUDXRs13nTpy9vygisljYWr9QY+dWhq/x9ZfA2o2rJTpV2qanl4TdpUiXiBn1e
 KPb3IjSwrL9g0JQ3/O1IMjLHXbtWjcOSwc/UooUZbLqAp2DoBXZF6s1RW1gKtW/rCS3a
 VU4LNydeH5N6paIyAeW7A/qVRj2i60ZliPs3GLj4z9wCyJWsi7c1zeOyXw6w6hZdx3Zs
 wH2dpyKn7Qvxh0gPrgsX29UM3weRbSrPGNfhK7y37BY354TBINlSdF+SPQ6Zg4eacOJH
 4/tA==
X-Gm-Message-State: AOJu0Yw3F5SIc4dpn0Ro3ZKEQCCS8NIM3LS0u8BAMqghD3HRZtm/uIao
 3kW503L/3Nq8UzA7jzlaFEReqmFv4jz/PVhl3JM+JkhgLIBimVZV1pOR
X-Gm-Gg: Acq92OFtTIXJOfM3jZUGoTlEHo5eLl3q1KwIGbJyN+DgISrZ7P59Ou1PX8uK/5nc+iO
 QJwEmg036TOk7uDeJ0IWGbAKmh7BjBXWh+bgwm0MaLvAMVel7ZcIBJdrepi0PC1o6jIhnn/txOC
 MHD7Ba7ht/4JgRLnyabRzYOBGLJrwdZHYKtzWjNLg3GXUNX6fWZIZcx6rodC7DlLwA8XzqTn7+c
 a+8vw8t8gn8PQgG2cWX3YO5QoosRnPT5Q62kx8Pohr5q+jT0d/YEfcw/oxXe+qS1T3mDYa1J2uN
 XAbz9DeMEIyT/l7cUY/byWn5xXFBDSSfBqZTVVQRWy4gum1Shin7ZuD7alY9fDp53bho+qt1dNJ
 /+igJsWqfsRmhMj0YjfIlbt/v8s1GtUui8yV7XchmmEf+x5xETZqirb6DRcU6BKyV0lLrQTOOnE
 WTJUMAxauov4WqT8YS/uAGevCnzpFj3bY6bo/t/0knM+xF0jzpeDOMMxYZ504p+d7AXS9YoA==
X-Received: by 2002:a05:600c:3b26:b0:491:89c2:bf3e with SMTP id
 5b1f17b1804b1-49189c2bf42mr18239335e9.30.1781263188520; 
 Fri, 12 Jun 2026 04:19:48 -0700 (PDT)
Received: from timur-hyperion.localnet (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f23fsm4935506f8f.9.2026.06.12.04.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:19:47 -0700 (PDT)
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
Date: Fri, 12 Jun 2026 13:19:45 +0200
Message-ID: <5074099.OV4Wx5bFTl@timur-hyperion>
In-Reply-To: <BL1PR12MB584907E9C1F69772EA27AE91E7182@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20260611055715.1142135-1-Jiqian.Chen@amd.com>
 <2014755.b9uPGUboIS@timur-max>
 <BL1PR12MB584907E9C1F69772EA27AE91E7182@BL1PR12MB5849.namprd12.prod.outlook.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,timur-hyperion:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A39C2678EF2

Hi,

> > Yes, I think the checks may not be needed or need to be adjusted.
> 
> I am not sure if removing the checks can cause new issues in other APUs or
> dGPUs that don't have this issue. Per our tests, GPUs that use Mode1 don't
> have this issue.
> Is disabling HQD harmless even for GPUs that are not experiencing this
> issue?

It's OK if your patch only addresses the issue on the APU.
We can always revisit it later if/when someone needs this for other GPUs.

I suspect that if anyone were interested in using IP block soft reset on a 
Vega dGPU, then probably they'd find the exact same issue.

Best regards,
Timur


