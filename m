Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKnhMwxG4WlErAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C744149F9
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852E710E245;
	Thu, 16 Apr 2026 20:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o07TRAYl";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0D910E234
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 20:26:49 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48374014a77so109849065e9.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 13:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776371208; x=1776976008; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6knvGQRm/0zRhF7YLvdtWV1lOK68DsBmKySJ5dd92TE=;
 b=o07TRAYlBRULW7gYotPwhZOPyjOGAWGTRHkZKtC+Lhm9rvul7jTPCWTcDjS4ITOFY4
 3sJ+RaFxMAew+cDSTCVeMhga0w7FzDBCVbWOtEneLtKzTzrwDGNV//RXiDBxdgBOTQU/
 uP3ndIqr4fD1PhFr+ff4UKGFYx/MOwwn9DGyazi0iyP0bZMx1ovVI9ImB1A2bLTwRQEL
 5zInOCCH1PdmseMi5wcVHDdPiaCi/d+6/0TLPuv5RMl5DuIgVJs3qIni1HprJs5inuB6
 NQRtVLIgXAJjXOWqz8OizlVXRrG7JVncDGabXBLCnUHK2qBMvTRTaZ/ny2NPfoqzTnyi
 WuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776371208; x=1776976008;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6knvGQRm/0zRhF7YLvdtWV1lOK68DsBmKySJ5dd92TE=;
 b=h/374JfkkXocsD6JbReV80XGChVBBvZtCT0f5eET/FTpHQaVdEIsCuDN6Rd1G3EOiz
 6xQ+V/w9TrO1lOvnqwYNWa40QyFG2G5/lMcSqzda3xET8C410oiyTscYKfqrq5ILVZGv
 2K6qAo1VHKyWbeu8SVs1VF3Thdpxkp8hWA9NKyLHwqoPtMOnDlZH6UqGOwkPWOrYjoyB
 CAoaINk5/N9dc11BurwJ6yQaX7OxrEUdrwjXcU9nJumQrlhPPCxvKOlXy5BBWlN3copz
 mqJFQxlEg913u9SBoJXNIX/hAaHSIZ2zjaZsKHV6riKgi3KkofdlmBbHOcQvgwtsQ50s
 bTng==
X-Gm-Message-State: AOJu0YwGOSAPlBk+Uoq9vIds2CCzIBkTC4bcILOE2P9tBmlsl6WQdDdM
 WFCNAXB7PRYvg0yYEaQ6Z+EWUlECKvXz9dPwQK8l+/0G4o0oIhw4jEvvkB4lOw==
X-Gm-Gg: AeBDieva3dwYtr1c8igXwbkTcUDci5akrnnYLjkN3oVm9a8gbo8mmOrG3Aac2iNHrSz
 w6unu2R2y4T3aIeAbQ4CERY3RocqIwbOZyUpx3Jp6gtRVU+jp058RB37BHFgtxpngHg9+XJfhHa
 AUFEq79oLimYcwZRtgRrvrApIlEk+8i5OI0yEfxrK9V0LnRwIj3aoEuYwZm2Grwm+6fSAhp2lD2
 eH5Sdadz2N1DNekgwxlo9Rhl+9Duv48YcY0SV/I2erhZ62+NkmtdRm1zR2kXDQXF+HjXmnVwKHd
 bmtZXjSoafztpZkTl9SGYNgNcrgfGho7hePI0ujyKcFPNQXzYDY1dnrv/OymuuaHXUvRTg1RQh6
 vtkA64dmWMZQCWKNlLhDK9MpdS3/FuVhLNn6maJQLPDtO0mGhfU67PaHvi3+LShN7WCDSqQI6cl
 tDj6+y4xgaI0QvV/YEO0Z7PUDouLgnffZpD9LCLJ/1chN584rgfA+8vv0q3kgDy4a+KEWV3mAtS
 rtWHw==
X-Received: by 2002:a05:600c:848c:b0:487:300:d9ca with SMTP id
 5b1f17b1804b1-488fb7909fdmr1029555e9.31.1776371208055; 
 Thu, 16 Apr 2026 13:26:48 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1B98A2.dsl.pool.telekom.hu.
 [94.27.152.162]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f581b9fbsm76941355e9.5.2026.04.16.13.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 13:26:47 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 2/7] drm/amdgpu/vce: Align VCPU BO to a power of two address
Date: Thu, 16 Apr 2026 22:26:38 +0200
Message-ID: <20260416202643.25350-3-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416202643.25350-1-timur.kristof@gmail.com>
References: <20260416202643.25350-1-timur.kristof@gmail.com>
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A1C744149F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is done to prevent the VCPU BO from crossing
a 256 MiB boundary.

Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index efdebd9c0a1f3..ac25355539cb2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -218,7 +218,8 @@ int amdgpu_vce_sw_init(struct amdgpu_device *adev, unsigned long size)
 	if (!adev->vce.fw)
 		return -ENOENT;
 
-	r = amdgpu_bo_create_kernel(adev, size, PAGE_SIZE,
+	r = amdgpu_bo_create_kernel(adev, size,
+				    roundup_pow_of_two(ALIGN(size, PAGE_SIZE)),
 				    AMDGPU_GEM_DOMAIN_VRAM |
 				    AMDGPU_GEM_DOMAIN_GTT,
 				    &adev->vce.vcpu_bo,
-- 
2.53.0

