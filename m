Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A03D74D706
	for <lists+amd-gfx@lfdr.de>; Mon, 10 Jul 2023 15:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 513F010E278;
	Mon, 10 Jul 2023 13:09:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.208.org (unknown [183.242.55.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFA110E110
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jul 2023 07:52:00 +0000 (UTC)
Received: from mail.208.org (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTP id 4Qzx6P0KG4zBHXh3
 for <amd-gfx@lists.freedesktop.org>; Mon, 10 Jul 2023 15:51:57 +0800 (CST)
Authentication-Results: mail.208.org (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=208.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=208.org; h=
 content-transfer-encoding:content-type:message-id:user-agent
 :references:in-reply-to:subject:to:from:date:mime-version; s=
 dkim; t=1688975516; x=1691567517; bh=ZsIIaEJUxDOM5c2jsdgVlh2jw5J
 ZbRvAFii5FM/EEdQ=; b=N0Nhc4cia7dHWDPJed0PiaYkaWENxQXS6hLyXCcKkBY
 lHIjesx+H+OxXBOKDWGGtWtYu0QkVDcqpLbZD72Q7rko2iAfKl2wz05yszEPJHu8
 R+c2qL2HO7bGlC/wPpWzasyv3RvdIEYr3/vXH0wAT+cp/1Foi+pe/D4LsrkBulhV
 w+nK9HOcvEFwFYnxt+/zUTKdSF0xFgfKxG+T7sM7NLNI/jbtQG/40gICfBGdCPyf
 iAz0aTNE7HXR1ePfhfslqu6/5BL+sO5e8UO3qYqwsG1qxinefEGmgyF7Z6bs8Kdf
 JupI2g+ig7SldCDhDwGcOuUnp/daMIla/lqEvM11acg==
X-Virus-Scanned: amavisd-new at mail.208.org
Received: from mail.208.org ([127.0.0.1])
 by mail.208.org (mail.208.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Udh_6bUnkdDA for <amd-gfx@lists.freedesktop.org>;
 Mon, 10 Jul 2023 15:51:56 +0800 (CST)
Received: from localhost (email.208.org [127.0.0.1])
 by mail.208.org (Postfix) with ESMTPSA id 4Qzx6N4GsXzBHXgs;
 Mon, 10 Jul 2023 15:51:56 +0800 (CST)
MIME-Version: 1.0
Date: Mon, 10 Jul 2023 15:51:56 +0800
From: sunran001@208suo.com
To: airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: ERROR: "(foo*)" should be "(foo *)"
In-Reply-To: <20230710074943.54300-1-xujianghui@cdjrlc.com>
References: <20230710074943.54300-1-xujianghui@cdjrlc.com>
User-Agent: Roundcube Webmail
Message-ID: <21106d58871949c9f301c1bab81ae111@208suo.com>
X-Sender: sunran001@208suo.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jul 2023 13:09:18 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Fix four occurrences of the checkpatch.pl error:
ERROR: "(foo*)" should be "(foo *)"

Signed-off-by: Ran Sun <sunran001@208suo.com>
---
  drivers/gpu/drm/radeon/radeon_test.c | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_test.c 
b/drivers/gpu/drm/radeon/radeon_test.c
index a5e1d2139e80..c9fef9b61ced 100644
--- a/drivers/gpu/drm/radeon/radeon_test.c
+++ b/drivers/gpu/drm/radeon/radeon_test.c
@@ -156,10 +156,10 @@ static void radeon_do_test_moves(struct 
radeon_device *rdev, int flag)
                        i, *vram_start, gtt_start,
                        (unsigned long long)
                        (gtt_addr - rdev->mc.gtt_start +
-                       (void*)gtt_start - gtt_map),
+                       (void *)gtt_start - gtt_map),
                        (unsigned long long)
                        (vram_addr - rdev->mc.vram_start +
-                       (void*)gtt_start - gtt_map));
+                       (void *)gtt_start - gtt_map));
                  radeon_bo_kunmap(vram_obj);
                  goto out_lclean_unpin;
              }
@@ -207,10 +207,10 @@ static void radeon_do_test_moves(struct 
radeon_device *rdev, int flag)
                        i, *gtt_start, vram_start,
                        (unsigned long long)
                        (vram_addr - rdev->mc.vram_start +
-                       (void*)vram_start - vram_map),
+                       (void *)vram_start - vram_map),
                        (unsigned long long)
                        (gtt_addr - rdev->mc.gtt_start +
-                       (void*)vram_start - vram_map));
+                       (void *)vram_start - vram_map));
                  radeon_bo_kunmap(gtt_obj[i]);
                  goto out_lclean_unpin;
              }
