Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NRdAw9G4WlErAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CA6414A07
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Apr 2026 22:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30B210E281;
	Thu, 16 Apr 2026 20:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UoByyuof";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140AD10E232
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 20:26:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso82079385e9.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Apr 2026 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776371207; x=1776976007; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvlmRzambtKV7bTfKDXaraVMqNpHHjeyPJr+0EFVDSw=;
 b=UoByyuofSPEBET1DSyfrNM7N54Kgc29RyBtyTZ3B7xzAM+3kAydlTOtXDyRxroNDMJ
 qZIh7vpzYfC0PlK2DgI4rcB6+vDgDUtvbWbpyyGpeIGwO7Zugt6jqPI/c3tKpUIo7pPV
 rpfolXWADkfkPVml/7bDA3rZfRmcQ8zEAccdUynPyU+2lB9Lu3LGqrw3Hjp/gJNWafCI
 B3tJkyvz6eML7YtBSXYTXndxZw4TxR6ShUs7bKRVBLOog+wumXN3vmmnhn6KFHu8N2WZ
 QPOYA8kGL7hearhAhPBT8FJ8BnE4BWlYQks55MQa/fu48Gis6dcVGP01G5BJZ/eIrjtI
 elng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776371207; x=1776976007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tvlmRzambtKV7bTfKDXaraVMqNpHHjeyPJr+0EFVDSw=;
 b=g4fyy655j7UnUQ9aAgoVc2reagN3W9nEuwf2sSsRCdRpnMDDfPnxoQeBVQovOkH4Ct
 6lq1V1hY6bLOBVPNgKLN2MG0NP78WGWK9m78v0sGvH8cDYH4hpqA41ox3kOGevVAMyH0
 FuQq2iNc93WoCQ+4QyaZUD883pPy0aG3Tgm0mE/dQRfBl976ZVJ3GPFZrp99YtF+zNK/
 QwnD/5bjlNS+yh/Vm/KC5RFLoKa3pIRDGBwu6SSnmeb7REA5u2me69sVZGUlqzjHX+N7
 pvLSmPX6FaAF61w2ST4YAaIfRQBgPAZ1n4FwpBkL409qVoVsfbRhoe7HCmXe6rZqV8pC
 8z9Q==
X-Gm-Message-State: AOJu0Yxo/zjlVyO+6ciRac647D2vnIxfGwUHdvfRR4Wq2iz5Uw9/LRz+
 o9i3FfEVTweGMXYDD1J+SgXHbovYDkYK19i2PwUq+7ZEapCOpm1sE5pcf5GAnA==
X-Gm-Gg: AeBDiesJhI4g0zYwxQW6u7qfWZeYK1IOnTy6Pcf+qsQVIDOe6a1CCaGlbEnMQ3BPJ5W
 IIsZWSh0PtAm8L9QRbnRLVojQ55wtpYHvG+fnH8No7IwejZGg40OpZmBNevOogOYMESuksgTXXw
 xbFkhs4fGM7EXMxWP3XnvgyQUOEp7N8nLbQkqHSBxdoy6MoVvN7M/H6qBDDmJ/rbihE34RU4E9x
 kHRH5YjoXvKTFzcXkoVqkNW2Xxqda0adQDXYgAtECdNy/eYwpCcbkzz1tooe7bIgGFID+JHUISD
 L1CWb20ruIgewCaW52ARSo9IeOJl8X8VmMxNHrm3WjPn9wemm35T7EgOaOwaPNwszmkGWDTfKpu
 mUoQv0fxGDDjU1/a1XiljrOqCtNsIqOzc/yiRuAUIwlIdO+7dHmN2TJbSI0EZYQeuhVDlNBi5bh
 CP36k4CdEEQ8ktpxYvrDjB4JEkOHtdnzUwkfBvgD5Nn3K/p8fceLMYKl8jVZJyx0viXJzI9LhFN
 S5roA==
X-Received: by 2002:a05:600c:8183:b0:486:fe39:28b7 with SMTP id
 5b1f17b1804b1-488fb752e3cmr1353855e9.9.1776371207231; 
 Thu, 16 Apr 2026 13:26:47 -0700 (PDT)
Received: from Timur-Hyperion.home (5E1B98A2.dsl.pool.telekom.hu.
 [94.27.152.162]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f581b9fbsm76941355e9.5.2026.04.16.13.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 13:26:46 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/7] drm/amdgpu/gmc: Fix AMDGPU_GART_PLACEMENT_LOW to not
 overlap with VRAM
Date: Thu, 16 Apr 2026 22:26:37 +0200
Message-ID: <20260416202643.25350-2-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: B2CA6414A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When the GART placement is set to AMDGPU_GART_PLACEMENT_LOW:
Make sure that GART does not overlap with VRAM when
VRAM is configured to be in the low address space.

Solve this according to the following logic:
- When GART fits before VRAM, use zero address for GART
- Otherwise, put GART after the end of VRAM, aligned to 4 GiB

Previously, I had assumed this was not possible
so it was OK to not handle it, but now we got a report
from a user who has a board that is configured this way.

Fixes: 917f91d8d8e8 ("drm/amdgpu/gmc: add a way to force a particular placement for GART")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 1daf2546d3b26..b454b463bcb2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -314,7 +314,10 @@ void amdgpu_gmc_gart_location(struct amdgpu_device *adev, struct amdgpu_gmc *mc,
 		mc->gart_start = max_mc_address - mc->gart_size + 1;
 		break;
 	case AMDGPU_GART_PLACEMENT_LOW:
-		mc->gart_start = 0;
+		if (size_bf >= mc->gart_size)
+			mc->gart_start = 0;
+		else
+			mc->gart_start = ALIGN(mc->fb_end, four_gb);
 		break;
 	case AMDGPU_GART_PLACEMENT_BEST_FIT:
 	default:
-- 
2.53.0

