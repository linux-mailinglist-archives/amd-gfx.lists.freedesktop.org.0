Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Oo+GiNS9GmKAgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 01 May 2026 09:11:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D125A4AACD7
	for <lists+amd-gfx@lfdr.de>; Fri, 01 May 2026 09:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00ADD10E186;
	Fri,  1 May 2026 07:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="QRJYvsJ/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4A510F2FF
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2026 10:45:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4891d7164ddso4342745e9.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Apr 2026 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777545934; x=1778150734;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c7/qTgiSduryCJLbI+Aigbf7KhKUJKWDOpYZhzDaMIs=;
 b=QRJYvsJ/piFCD+Jst0xwXjvHVFBMEyM8Sj/EYDJNoe6WQr3A9Gusg96aWuJKF038o3
 L+zv3voSDmimSoOcWr1MCrJKx2EVn0x7GAsptFYx+ZD9yO7/JDcTaUQWu2IWTjuCSGGr
 qOOkH4bzMmIJOfY5ij2Zl49+yKiwfwVuk2FbBKNuk8i9/YmGNhCyqesYKcizsVbOiRNt
 8uyRczD4clLoH8doZNpp7QUxQ0A2MiNU5H+c5AvLmNzxLyL9GJr1W1Ec9xdkoYyhQCkD
 EGQqSxdgo/Y20tYCpFzSyG26iec6Yo7hTlObNdHV3dmm9GNRdoxqJ+hmMbykSxQfVbGi
 4TuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777545934; x=1778150734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c7/qTgiSduryCJLbI+Aigbf7KhKUJKWDOpYZhzDaMIs=;
 b=b1yNN0hu7lsrGPbiTZy2ekv6P9ODwAhZqLC6WK/2KcIQxyWdiUAgx1BWaANRUTgrTj
 dbVyjW5CRjQMP24fXLqhkHf627FzGZ/tpdkMFAbEiBCELCJAx2yVV/gxewD3nNIGnqiq
 wt0L5oTHSjXJlF26rXv2Hv1/3ClmC0iL0Mn3VAvFGoo0cE94yZdm4VK0/F2f17r7lTwL
 hYWbXIeBFHG9RnkzG0Eupcuc4ZxzJR2XVIZmOmy/VcJeijqUAhriej3XJcrTQ2KCHLMO
 lVn9M9B0COZD/6LzjD/S1+dOXexbdZil1g4W2KkacsV/HUfScfE8nQj8URPXz3nWoecu
 7KxA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YZla6bE6mL9dkZcrR7yZN+XCpSK0dpU9aTgcdfdcVybD9vWKpUwdNJHZHrJtI8+oTcs+/aKsy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6nBJXbTpqJYGujkNHEsJUy9mWYlV+g7lob8oWsKtSQS4v0r+Q
 WnOIx7XonyoVOA6LDKZzFUFB3qXKUbOPkml5uY0xKqSBzJKBc+j/NmBiHDeX9UItCTo=
X-Gm-Gg: AeBDieuLwF0+pbSRPnaXXkOfrpp8UC6waTX8eRx4zG/+5rvxOmY8i4JqjbSJDRWVloi
 F0dPHl5UsnzZdIl8Yr+1/iAKbPbF8QpiRdLIh8UcTTbky19k3M+CKrnMvUNY6/P5egdEpRh/VbG
 M9tU6G2SQ0GptgLbIh/79q2kQ+ojOWPorRwWlrR3QhLeHkwEEsRKJ2EouKFEWrpQPaiuGe7/I/F
 Knv/oU6CGP0Std1Y2WR9jzAv/jnIS+P8a8ads56ta50OxmPoYE0HniVwDtR0EnXQEIjCStEnjAZ
 yFaaLaEJLfjiPX9gNxi8gmrwmPzhAzRdLk2040vPLTTYNzEx1hRKzF24mQLJhVg+QyZvJzC4FkL
 1p19k1vVLi8niROzSc27XvnpXPYbt9f5+ck6EidkEBjYShYu7APa7YSF2aDmk02GsMiuNJ8UyLs
 +xKZZqHuUAvYIln5mFZvQdJ3szNGovT0souRut1w+nvVjaw3YhnfeDWa8pEEPOek7XwlMvWLyN4
 5QRN387MJ773ug4H17eS5tykg==
X-Received: by 2002:a05:600c:3b28:b0:489:1ba8:5bf0 with SMTP id
 5b1f17b1804b1-48a8445e761mr39999115e9.21.1777545934335; 
 Thu, 30 Apr 2026 03:45:34 -0700 (PDT)
Received: from localhost
 (p200300f65f114e08c77bcc4a3b99186a.dip0.t-ipconnect.de.
 [2003:f6:5f11:4e08:c77b:cc4a:3b99:186a])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-447b4216675sm12376652f8f.11.2026.04.30.03.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 03:45:33 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?=
 <u.kleine-koenig@baylibre.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 1/3] drm/amdgpu: Drop unused include of <drm/drm_pciids.h>
Date: Thu, 30 Apr 2026 12:45:13 +0200
Message-ID: <3205129f75aba48bd1ad8fc810cf6a18e718206d.1777545446.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777545446.git.u.kleine-koenig@baylibre.com>
References: <cover.1777545446.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=bY5scivWCC2QTs0wJVID2C581qyzm5bKb6i6lvmbw90=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp8zK7aEIcNN3AwWoJDGoS/agY68a2msbkJcPsh
 3oyjs8vrbyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafMyuwAKCRCPgPtYfRL+
 TuyACACMhgpzfuGCItxt3QzhJzcdiZa65P64fB73yU0gyKraR+ZUZTsU2XoWs2O+O8tb+BEMMSM
 Pl51SqkvZplWq7c7HyNG0je4bN+VqaAFV1rTjhdxFJnpCiSM8RvViXhIWit9jldSEzi/mYhUtCd
 TRsCjDJ4ua4b0Yl/kG7E04KRkrtHzrakRxM87fBlVNWDN+nji052wLc3/2d7LP4LlUy/DepfpOl
 lztFEOZMxCrXecNq6uiJAN/SbOBYfplLEBUY7enDJsbSLJ9KzejtCTEsMHfGkj6uMR8xrcYkGda
 uWgBPuRhScstYs6wj+HzLpxg6mVY2MsI7HnQp77taovicElv
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 01 May 2026 07:11:26 +0000
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
X-Rspamd-Queue-Id: D125A4AACD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:msp@baylibre.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org,baylibre.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,baylibre-com.20251104.gappssmtp.com:dkim]

The <drm/drm_pciids.h> header only defines radeon_PCI_IDS which isn't
used in the amdgpu driver. So drop the useless include statement.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 8b71834a73df..1239fb32311f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -28,7 +28,6 @@
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
-#include <drm/drm_pciids.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
-- 
2.47.3

