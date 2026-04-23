Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAaqOely6WmkZwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 03:16:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC6844C10A
	for <lists+amd-gfx@lfdr.de>; Thu, 23 Apr 2026 03:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D704510EAC5;
	Thu, 23 Apr 2026 01:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jnh8lwZv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E137210E2E0
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Apr 2026 01:16:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso67438665e9.2
 for <amd-gfx@lists.freedesktop.org>; Wed, 22 Apr 2026 18:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776906979; x=1777511779; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CyTyWwEpwm0tCDVSG31Z4vXFg5XH1HDAYXwVEAbHUQI=;
 b=Jnh8lwZvgXCTYO8TDwoaY75up1n0bFhSC9S9tgxux+vSFVMP8GfzHxU2AoUcllHz0s
 ReJ04KThXoGzBcO+pPIoxlAZkUZ2YImru0WPowNIZAemdrVeKjHgqkcTSdNExu4ypqBW
 UDvSjSfgbcsxyyt30ovSu28KcfY6gl0OzqO9N4EKQqH/jERGh9GIkV28ZIGd9is24IS8
 WhfvQHiVQ98dY/kO2YrfuAzGA0UnZq3r+ICw8s7Y6oUaOdIuoeMk0SISLW/5TLNzOVTx
 EYMwEtAiPh2AbKO/1xgHJ83okXK5V8BaBtS3WMcbLD4uN14l2OrOwJ/8q9j6IXzCKwX6
 1N5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776906979; x=1777511779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CyTyWwEpwm0tCDVSG31Z4vXFg5XH1HDAYXwVEAbHUQI=;
 b=Xtq9LOHXa0ssnm+JU/mIkoWsegxMQioO0v9QzyjiBKhSh1d7yKbwLX7ycWIYxliZQi
 BCQXrQ1WjAKzy6EWkRzQ/rrzvO02C8jM8fL4Ku+nTD1lkxJfaiBgEYIywOobI8tVowm9
 /B8b7TwBImleU2YFg+Pl3HAD6Gbal2wAPQkfGOBTLlm6oMz09gULLBE4iHBp6NA/6XT/
 hRINGOwUCbJEyINpiOoJvHaDrdc2vZ7cNmSu/+IiQSp6eGDGWYgkZaJb0e8R3kwXU1WL
 9lfMBjmahXYcwqQpgvEkzlAlneBzgTYHqhkOP5UrJPrlhwiEGjAOOi2lu3f9lE1cdvV+
 ay4g==
X-Gm-Message-State: AOJu0YykrtwcwvW0DxK9JpN2NpjZJi7f1N4Kgqm0GMfUkCh+GFZQphwP
 r869eZ4XMHkbSF+htF1+zQ2YOMaBXFl+48qukeyVXsFnULQRTISlqXaJN3KlOw==
X-Gm-Gg: AeBDietx/6FJ2qwKtefdyXwKOzro+AkBBGtcsF+Ldc8RWruDmd1K6tR9sYalPom722v
 R2V03hriXE37B0WKOuFOoR7lFaYqlddHyheBQ1ecSwBGH+UM34pgeZa2JL43s+4LoDkluDAuBg0
 RT482er+oBf2gtzkqwqTto4dmSQYyrVSGwizX5DbS0dScu//LJ/GUaHzOnvqpR8r81f7R8GIKKi
 Lve5b9URFu28iQrH8ABfeiMSd5uUtUwFOlaR+Xv8uSll3KNyUtUFRKF/GQIWuDS86r5Pis/3+kC
 uUV1NQMZwnKU8ECtDzwAKSigbo7LM24rdhiGtjWn4a+Dd9t8bAnIxqmUoO7yz38d7HMfiCYbh6R
 +++wqCSrozTHjpylLtkcff7t0yX6Osxuk+u6oN9vZrC2AAUrjiJ0hvdm470BMairsovlP2hpDrh
 cq2heHvfCCxaZO9zPhbBZoWWF7CGsUq4xjavVJ4F2kLNfxM/SNOBYdYKRnBv10jjGsutE/jSj65
 Os/nA==
X-Received: by 2002:a05:600c:5294:b0:486:fa35:aef2 with SMTP id
 5b1f17b1804b1-488fb73d53bmr328719985e9.4.1776906979337; 
 Wed, 22 Apr 2026 18:16:19 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1B98A2.dsl.pool.telekom.hu.
 [94.27.152.162]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a4b329542sm370664435e9.3.2026.04.22.18.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 18:16:18 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, John Olender <john.olender@gmail.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 03/11] drm/amdgpu/vce1: Remove superfluous address check
Date: Thu, 23 Apr 2026 03:16:06 +0200
Message-ID: <20260423011614.309180-4-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423011614.309180-1-timur.kristof@gmail.com>
References: <20260423011614.309180-1-timur.kristof@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 5DC6844C10A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The same thing is already checked a few lines above.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
index edabec442cb63..884f24be36859 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
@@ -557,8 +557,6 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_node.start,
 				   num_pages, flags, adev->gart.ptr);
 	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_start_offs;
-	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
-		return -EINVAL;
 
 	return 0;
 }
-- 
2.53.0

