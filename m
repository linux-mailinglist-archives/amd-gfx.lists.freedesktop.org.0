Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 550C6161568
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Feb 2020 16:02:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE776E981;
	Mon, 17 Feb 2020 15:02:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DFB6E981;
 Mon, 17 Feb 2020 15:02:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so20092903wrl.13;
 Mon, 17 Feb 2020 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vs9pAsIPyDEOW/NNb3UJYtJC8LXr2Zm3bruWbPceTS8=;
 b=a0enNHoWS/Cq69OOlNsRnrRLA+yFNiz7gL4um9spRTqDSWtDQKV2Cz/G0Gjcag6wCv
 sB5aSe/NKFiiccks8PswpCuwQsaE1RuqtXhSG81cmf36+iYrbZ5MuSUX7joJTTJqIWUn
 BduDccsYaJuytgAIm/xld8CRbAQPSymGylS2OoandqLhVq6g7/ZquOFi2ieuEHmOjdgv
 PlyjTRZM5cmezjGZseJVFIH6i6r01P6bMezDz6UYKHqIHFQwUsrsfDvvBYMIbJEQNvmm
 VM57NTxW7eaTJlqao+RDHfDKr/w7x+4pjosZ7wX0vw2ONpVfgf+CgNxK6QO1FAPKV/sU
 8U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vs9pAsIPyDEOW/NNb3UJYtJC8LXr2Zm3bruWbPceTS8=;
 b=qJLc81Rp7NRPeAdJZfx7Zd5Y/Ydxg9/Q0/IvxQLHIQmI1O+NhuATCR/IM1i1gmutke
 +G6bV6MEBiwPS5CKYVqA2p2xLdjtY4ZU1niiBoTFCZEdfYH+VV5+dGdntoCtUrAZh23i
 r5B3WUkwX689kuXssWT/6ZKNoUjn9UMX1NJUxb9s60/j0VCqY2/enxS/eA+0tubxYXrS
 IASvRfPPzNhaQNzX/fBgTNb9ipGwzeK0UHM3KzEOcTwbU6nwnmRh5UzNYy4DLn55xRoI
 1iDYENNSj/yaV1KjGo0VvPP/sXuTb6cfv5EsSBLKbfH8h9VGiwoHQL4i4hdnnNHTM2e/
 SyEg==
X-Gm-Message-State: APjAAAVigjnDEECc2HP1OcOGZl884ocQKTZdTSI9yHCT+zeHErRDcUod
 4fwJfksGOXH3hNX41nCXyMKs3EUeX1FAww==
X-Google-Smtp-Source: APXvYqzNJdePKICzejsOQxv04YZ2wBF69IS7Uz6jyyxxNDwKGtywavKzKZkzN6JQ7hfkXaKbZGlVEg==
X-Received: by 2002:a5d:4052:: with SMTP id w18mr22373918wrp.112.1581951736547; 
 Mon, 17 Feb 2020 07:02:16 -0800 (PST)
Received: from brihaspati.fritz.box (pD9566D64.dip0.t-ipconnect.de.
 [217.86.109.100])
 by smtp.gmail.com with ESMTPSA id j15sm1441099wrp.9.2020.02.17.07.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 07:02:16 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset
Date: Mon, 17 Feb 2020 16:04:26 +0100
Message-Id: <20200217150427.49994-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217150427.49994-1-nirmoy.das@amd.com>
References: <20200217150427.49994-1-nirmoy.das@amd.com>
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
Cc: David1.Zhou@amd.com, thellstrom@vmware.com, airlied@linux.ie,
 kenny.ho@amd.com, brian.welty@intel.com, maarten.lankhorst@linux.intel.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Switch over to GEM VRAM's implementation to retrieve bo->offset

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/bochs/bochs_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 8066d7d370d5..b8e1079f077e 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -38,7 +38,7 @@ static void bochs_plane_update(struct bochs_device *bochs,
 			 state->crtc_x,
 			 state->crtc_y,
 			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gbo->bo.offset);
+			 state->fb->offsets[0] + drm_gem_vram_offset(gbo));
 	bochs_hw_setformat(bochs, state->fb->format);
 }
 
-- 
2.25.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
