Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 887041EABA1
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ADE66E316;
	Mon,  1 Jun 2020 18:21:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7EE6E312
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:36 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id c12so8436892qtq.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VWoHTgnci3l4TWBgdO8mZriM97FyUXlcv2kkMgvZrKw=;
 b=VvYSmBT/qALJxJDdl+r+/p4CG1E2M7ElElVsYyIxz2IPbayT4ZI1K0B0Iax3SkLSak
 50MU5E+O3ndeqGF84vVXHJZBijkG7rKaVuRCfpB5+SEu1ac1OeKhuM6Ps4th6q5izhY7
 h1e+m//ULnVs6PEwPT7n7FJ3DW6TTcXuHu9xBKSw0RSKMU3MVY9qWEMgM0fwm88dwU/y
 qN6/InepSWLbYl9+Z7tE45/e9X30YQp5f7FWLKPBG85qKz6SjECbDjHiy4x+vRKiKBog
 StnFyRWMSkwD4jWoC5ReCnsNKzLmZFFLtQpjs/Hm5g2alioCAk40HyOWkvOgrbdOweTX
 CMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VWoHTgnci3l4TWBgdO8mZriM97FyUXlcv2kkMgvZrKw=;
 b=nN5c74b74vAW7krcw+NdXOhYQxJdGJtxPRFifzei2OgWQkmMREpI7VM/cAiYBUx2h6
 l/Xokj8nrSayiVGglDk47W+6RKw64SAf8xV6Ut3qnKkcgVyMYM+A/thUOTczSupnmKQK
 401y23iwsBoUCC82FN3NIC/W3tKM2IGEvW2KleiYAkFikCZO4hyxx0vKPmi/UQh8Km/R
 FC94xg0tYG1mOwpr18W0Cd0PhO4YPWinN3Jy47NqhKWQgG/O1K5rdfWRFvK8iVp4pO76
 xrRLo3snAzUkxEa2KZgnOfgUp3STvI6n3j0YkjjpvBxfsIqnVfJamAhwaE3YbJMWWJNV
 5TvQ==
X-Gm-Message-State: AOAM530JjDjXC9g8mDT+H3Mpre9rjlJdeRwVbtTCneNHZa7CNPi3NTid
 u2slnh8AScPbVs9coA+B306H4cvw
X-Google-Smtp-Source: ABdhPJxioz/pi5gc68ttAEB/yo3gf/xBr7NPchEV5jmcAkSwid+8s4W1y4OTXsacNkxEH29WppxeDQ==
X-Received: by 2002:ac8:1892:: with SMTP id s18mr23392492qtj.306.1591035695706; 
 Mon, 01 Jun 2020 11:21:35 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:35 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 114/207] sound/pci/hda: add sienna_cichlid audio asic id for
 sienna_cichlid up
Date: Mon,  1 Jun 2020 14:19:21 -0400
Message-Id: <20200601182054.1267858-25-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Hersen Wu <hersenxs.wu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hersen Wu <hersenxs.wu@amd.com>

dp/hdmi ati hda is not shown in audio settings

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 sound/pci/hda/hda_intel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 92a042e34d3e..4188bc4bd4e2 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2643,6 +2643,9 @@ static const struct pci_device_id azx_ids[] = {
 	{ PCI_DEVICE(0x1002, 0xab38),
 	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
 	  AZX_DCAPS_PM_RUNTIME },
+	{ PCI_DEVICE(0x1002, 0xab28),
+	  .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
+	  AZX_DCAPS_PM_RUNTIME },
 	/* VIA VT8251/VT8237A */
 	{ PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
 	/* VIA GFX VT7122/VX900 */
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
