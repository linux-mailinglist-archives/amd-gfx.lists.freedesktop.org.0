Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XPXyCCLjVGoFggAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C064974B4E5
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XVdg4R54;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5410E9A4;
	Mon, 13 Jul 2026 13:07:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B010E9A3
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:07:43 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493c7902f47so29055245e9.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783948061; x=1784552861; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=vZlgf0u1U1v2SqbI/Ib49u1TrAtu6TbT9Yn51lKShQY=;
 b=XVdg4R54Mcup7XmzzbPZ5eD9sjvXgcQwCfbYKU1zO5a//nPP81j5UquIVMthMq/vFV
 q7I9DsfOrXHJQB/b6WwuTJ7X/MYEjd2VAqV0flQdna1zdRtQAklrLXsxqBz0DiI+n85l
 CxlzZBJPIeLR+obY3sNb2P5bjQxLzJbmUxvZABfHkT2d2h1KkkEXdbtMAzAsvaA4TWpH
 71fHiHKNrWxmvnJaue6oY6xmMsBp/mxJOPEYU5eWPCBkl1niNCLnq9kS2Xzpj7rboURs
 xooCA3ZJ1WA4rs58SPoyJDn2ZNKfPcj+ngSILO42XQpCKi1l6jVwZx7mD8YwkdJVbzyO
 vbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948061; x=1784552861;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=vZlgf0u1U1v2SqbI/Ib49u1TrAtu6TbT9Yn51lKShQY=;
 b=EWh8V3KOCkc7AWjAdQ8bW365hSheKU2xWtbEin7qZhVVs3pFi7ZGLjVT9cCGoQRH7T
 MeOqkbUaLhjhzNIdJZpBXtmpTelr2snC1CtLzZMkmN1lgTJ2+jroBRs5w3eBCVfXI00D
 wqgOLE0otDM4vXP157RERCM4XDRm0nmiIztNUdI9pLCTnThT3KVj2GGnBt9iTJSFV3LO
 mAmCSdktjeLEnpduCv+LmnBrvy35G1zrM+fppCKymSPCWjtzSO0K67d3uvFKpIMUGCZ1
 uDilLJ/UKBoNZruYylzYv8naYC8XL2mJHYATokDmeyovc8HOUrWCIhx8NiLjJQRHukUh
 iBrQ==
X-Gm-Message-State: AOJu0YySTPl8N7nCB5xLRlUZDi6ZHWArBMsuz4ggeESGxO7nJ+aJv7Ze
 xfSv/BCmCN/WveeKIWXv1RlJayVgwssC6a/5UrAXVutFBcjbkZYO3wSufQx+OQ==
X-Gm-Gg: AfdE7cl2JpqAL7CG2Zw01d0bse90ogXmsgrboQ89EHswOGMKDhtLSmvqF2Tzc6FnNfj
 txH2mDtVJP5LyinK9ZO4zv3hCV33mOjp/PacRNSePs2o+2QAqs9FtDfCEe0d7txfbTwieuSSCvj
 AtGFIB+PdFCt8RrFsk++yHLMXmq09lqoiqIWIZkba4PAbnRSXM+Ndc9hQEp7GBrzzVSWF3jbCxl
 C/7rOnK8jicT/wS+HWUK8rRyKw8NTOUMWKqeIro1mZJJBK9pxqBfwF4ChAQJyElf0vHaRTssGBf
 PGxiAOID7OozJVgoPZ0pDBcXF4yl4HFKVYBgn24X8eoAt2xlMZZ6l4tRa0WtKgiWhW+tm2Kof1t
 Y22KKqizYL5ZJRW2HoF+c6p89OkFgRNotrFXsUHLlUsZyQwi0flz914OGgzgxqflJTzYU/b8cwu
 GjYzHGs1yv+kx49Ew96vgps5a0fO+QqHQBOk4xuOZT9UfKNmKqAlUN9w==
X-Received: by 2002:a05:600c:8b88:b0:494:e456:4596 with SMTP id
 5b1f17b1804b1-494e45645ccmr5056155e9.21.1783948061282; 
 Mon, 13 Jul 2026 06:07:41 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm387974995e9.8.2026.07.13.06.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:07:39 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 11/11] drm/amdgpu/gfx6: Enable IP block soft reset as a GPU
 recovery method
Date: Mon, 13 Jul 2026 15:07:09 +0200
Message-ID: <20260713130709.34262-12-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713130709.34262-1-timur.kristof@gmail.com>
References: <20260713130709.34262-1-timur.kristof@gmail.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,ursulin.net,gmx.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C064974B4E5

Enable IP block soft reset as a GPU recovery method for GFX6
graphics and compute rings.

This improves current user experience on all GFX6 chips.
The current GPU recovery method is a legacy ASIC reset which
always clears the contents of VRAM, which means that a buggy
(hanging) app can crash the whole graphical session, which
is less than ideal. Also on some GPUs the ASIC reset causes
the GPU to fall off the PCIe bus so it's not desireable.

Using GFX IP block soft reset means that we can now
move on from GFX hangs on GFX6 dGPUs without crashing the
whole system.

Tested with the "hard_reset_cp_wait" test case from the
Hang Test Suite created by Natalie Vock and Konstantin Seurer.
This Vulkan testcase waits for an event that never occurs,
effectively a WAIT_REG_MEM packet that intentionally hangs.
IP block soft reset can resolve that hang and allow
the rest of the system to move on and keep functioning
without needing a full ASIC reset.

Tested on the following chips:

Tahiti (FirePro W9000, Radeon HD 7870 XT)
Cape Verde (Radeon R7 450)
Pitcairn (Radeon R9 270X)
Oland (Radeon 430)

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index a033da5fc307..f24129b54408 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -3242,6 +3242,11 @@ static int gfx_v6_0_sw_init(struct amdgpu_ip_block *ip_block)
 	adev->gfx.compute_supported_reset =
 		amdgpu_get_soft_full_reset_mask(&adev->gfx.compute_ring[0]);
 
+	if (!amdgpu_sriov_vf(adev) && !adev->debug_disable_ip_block_soft_reset) {
+		adev->gfx.compute_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
+		adev->gfx.gfx_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
+	}
+
 	return r;
 }
 
-- 
2.55.0

