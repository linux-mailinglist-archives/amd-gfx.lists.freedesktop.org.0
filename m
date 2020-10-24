Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADCB298824
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Oct 2020 09:19:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0696E87F;
	Mon, 26 Oct 2020 08:19:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342E46E150
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Oct 2020 00:47:30 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d6so129002ejb.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Oct 2020 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nGBhSaBuMaImbsbpDD696OYT/ES8t/q7g+4eLy+bu8=;
 b=gOZhoV+6gGSXqS8XfN8jVsjRRRjofmjn+hpYzAmNvCrWy9I5g0qMUVR5e5R9NweGJ0
 ABDDLfGOiOVsu/LmVAo2oaVNbi03304MCep7p0yUlBcH13Q6UhLDnjwymy4mLmiWZhls
 3uHEGqYLM0eAJBn6cq3eglfA4U2IMp01rPZkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nGBhSaBuMaImbsbpDD696OYT/ES8t/q7g+4eLy+bu8=;
 b=kdxUTB9ui9+n4XpZHjYQA4qTmUnDeljIIVg8kTFr/ahjr9qp4F1YhT6WXGBPRoZFIb
 LPtmL5sSYqxN8f6O7cuNpxXLbskRELq+V6DBvDCDNxbXNSiBU5bRxmn23Q0lRtS/V45j
 Om/Yf9oQi9nsmBBQcVM1UgOubjTAwjgDCEmcUo+jLYp7tpBP4u9dg9xqJ77mj7slOoF1
 1KU3BR29MpjLFPyq4M81iyTBQJ5QnQfJIfq6Gv6CT8lodqWVwD7E6fhidrgvtTu7dClp
 kZ4aCql6iwBgJgEZTE6F7jkpDeQZ5D2mw2DsiBd4i2emDHisFcuBvcd8G0iwEmnENu8Y
 katQ==
X-Gm-Message-State: AOAM531Igo2wvgeoB3VLMMFg4GdJjSGm821rgaxEtaLgqs+QTV5ONhZN
 IIo0jYpIk4vrwG2XAlvQA+f1pg==
X-Google-Smtp-Source: ABdhPJwDurk4oHPdsox9A9z3dqzjWUY5yj8mDDqlIRq04fNZyTcZK1l9lEzo723x7M0+yR9UN4D2tg==
X-Received: by 2002:a17:906:3bd7:: with SMTP id
 v23mr4829055ejf.100.1603500449274; 
 Fri, 23 Oct 2020 17:47:29 -0700 (PDT)
Received: from prevas-ravi.prevas.se (5.186.115.188.cgn.fibianet.dk.
 [5.186.115.188])
 by smtp.gmail.com with ESMTPSA id i14sm1527349ejp.2.2020.10.23.17.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 17:47:28 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/ttm: add __user annotation in radeon_ttm_vram_read
Date: Sat, 24 Oct 2020 02:47:06 +0200
Message-Id: <20201024004706.24518-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 26 Oct 2020 08:19:03 +0000
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
Cc: kernel test robot <lkp@intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Keep sparse happy by preserving the __user annotation when casting.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---

kernel test robot has already started spamming me due to 9c5743dff. If
I don't fix those warnings I'll keep getting those emails for
months, so let me do the easy ones.


 drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 36150b7f31a90aa1eece..ecfe88b0a35d8f317712 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -1005,7 +1005,7 @@ static ssize_t radeon_ttm_vram_read(struct file *f, char __user *buf,
 		value = RREG32(RADEON_MM_DATA);
 		spin_unlock_irqrestore(&rdev->mmio_idx_lock, flags);
 
-		r = put_user(value, (uint32_t *)buf);
+		r = put_user(value, (uint32_t __user *)buf);
 		if (r)
 			return r;
 
-- 
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
