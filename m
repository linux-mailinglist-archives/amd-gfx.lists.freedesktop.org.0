Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE4621A79E
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Jul 2020 21:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591D56EB0B;
	Thu,  9 Jul 2020 19:15:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9591A6EB0B
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Jul 2020 19:15:57 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g13so2536766qtv.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Jul 2020 12:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hV/3vVEL/fQDPzn/iLqRvunGFK7TAxiM1EnYThHu/vY=;
 b=WZ0FS9kIPb+SExj/77krQgdOxAzCxv2q5pvnj8zX/pz+p+vqqHRy0Gahn5FM2NPaFM
 g1WXffJrg08WHs+BnhL6iPeUzc4AdD2SXeBMZ6pxsNXo9gjCIOeouBc4fVsoL5YCj0AI
 xlkZ6Ei4K9uExrLNhgaP8nWvi8m1OqvuV6qaw4ritnZxgszbbUOwvJ3sT0pDehCqEVVN
 +tGgzkDjAaNv4mLiIdHQWIUuipZQl1nfKGFGIG/rv9AN+2VNCQB/PW1YT10sLpcE8SYL
 TYidNjBWQNzCHu4QEZvzSN7PRi7L3hN0diG7vpE37z8jD+6htR+6zLJajsYvpV7XfLUs
 KPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hV/3vVEL/fQDPzn/iLqRvunGFK7TAxiM1EnYThHu/vY=;
 b=lRlM028skwrUIT2ukZg85/n0B57pmxqIGOUXFaw35PQd9JEVTKiBH3tv8auSYkkK3f
 M4xJfHkpFOiMDWBydLNBJDc9Myww1+n7WYbKlsOmp2IkOHXLg6DVlcLTJR+o2g1YQAhV
 hNous05I6kJQCEoDQdlwLxzceXJC/OvljnfVUUJRd3PCiRJ7ybMm7WakzAugTXn4Vl7U
 twBnskVQOC9k1UeQCSFJZt/eD1lWZsGkkjFv+EySyDA5BkdLDTbSjBSFWjs6Fv1wHbe6
 gbVuHAGoRNMfBqhwBu1jQ8cuSLpFABTLYuaG76t/c0ayVNHppYcN4vqfpKXAohPQ1YW4
 OWKg==
X-Gm-Message-State: AOAM532h4RFG9O2haeOxIh0J9xa1AIXBmFg3ZeTJMAEyqycpVIpLv8tv
 yu7PW0dz6rk+oeZerxliQRnucoMRP2wmJQ==
X-Google-Smtp-Source: ABdhPJyyXldGbIwDLpShT4pMJuhbIav8nCr1Mt4Nw/pZgOrglzB7Sbn8EUxTSH/tK4tAKmzHQCE4qw==
X-Received: by 2002:ac8:3438:: with SMTP id u53mr68873857qtb.102.1594322156549; 
 Thu, 09 Jul 2020 12:15:56 -0700 (PDT)
Received: from brihaspati.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h131sm4711639qke.29.2020.07.09.12.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 12:15:56 -0700 (PDT)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: minor cleanup of phase1 suspend code
Date: Thu,  9 Jul 2020 21:17:58 +0200
Message-Id: <20200709191758.69565-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: Nirmoy Das <nirmoy.das@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Cleanup of phase1 suspend code to reduce unnecessary indentation.

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 23 ++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 2913e41f63a5..81ca92127c00 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2456,18 +2456,21 @@ static int amdgpu_device_ip_suspend_phase1(struct amdgpu_device *adev)
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.valid)
 			continue;
+
 		/* displays are handled separately */
-		if (adev->ip_blocks[i].version->type == AMD_IP_BLOCK_TYPE_DCE) {
-			/* XXX handle errors */
-			r = adev->ip_blocks[i].version->funcs->suspend(adev);
-			/* XXX handle errors */
-			if (r) {
-				DRM_ERROR("suspend of IP block <%s> failed %d\n",
-					  adev->ip_blocks[i].version->funcs->name, r);
-				return r;
-			}
-			adev->ip_blocks[i].status.hw = false;
+		if (adev->ip_blocks[i].version->type != AMD_IP_BLOCK_TYPE_DCE)
+			continue;
+
+		/* XXX handle errors */
+		r = adev->ip_blocks[i].version->funcs->suspend(adev);
+		/* XXX handle errors */
+		if (r) {
+			DRM_ERROR("suspend of IP block <%s> failed %d\n",
+				  adev->ip_blocks[i].version->funcs->name, r);
+			return r;
 		}
+
+		adev->ip_blocks[i].status.hw = false;
 	}
 
 	return 0;
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
