Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8GYcKDTyMmrr7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:15:00 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B5569C1E8
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:15:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mQA99Oo3;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D8910F0E1;
	Wed, 17 Jun 2026 19:14:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F39B10F0DE
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:55 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so604275e9.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723693; x=1782328493; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yuTGuYVt8fllS4J4qN2aqHiPNgNYSV9TGnIeSi2gAkc=;
 b=mQA99Oo3zppAMVH2WS6VaChjSSF94M6fSMRWbxrelbOYSumjsMBwkYIbsY3i1dCTBJ
 hk/SyD1D6p+kVPjxZllpdrgKoNFoOfd49SYw4akTRKsseUSjIuRbAYJrVZRYVjRsH//1
 ZGFmyDYBsBbqMfIWU94dcRP4UeHHn4GSkXFd6Z3c2CNVGHHuNXTyjfhXsaziBNyhe9gr
 wEH/USN/vzbE8KYOMKjY5KCq99CvoqlZPo280HUC/9pn6RqSlLFqlyYQjnOCyv3n/BMA
 BpGnIv/Yw1y9qtKDZy9X0QUiNtVi0wSDrHUFUsdinFvfiFahWYUI9PKotM2Re6RbII9Y
 iMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723693; x=1782328493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yuTGuYVt8fllS4J4qN2aqHiPNgNYSV9TGnIeSi2gAkc=;
 b=T05sihMeJ+EXci4ANojnQYf9TW7TkzB2q7OhNQEYDO8IQTWVS4tZShA0ceGSjx1EaT
 UpUhZKhNDJMD+rYdWw30P6iA1H8BEsptCgUl7nP6k717dPvkehNIIA1coSzRTnmTIDTT
 GQVO5NOgpRCTtA8WhU5g2BWjOeoExXWkCVNjzNrGh0L/AM5W73ts0BSsKXx22YYvLHHf
 Nk7K4N/+1+NOpv/o466VoCkEp/cFd1ZhR42yu14mGVxGaxgTlbGETEVXYMWIJCtq405p
 GyUPUwxnqjSVVXlzVnFH7lr4VQS9VJ4FfUjD88OE3k5FX5VYkwbvgHxaGX07mnlr4j3L
 TB0g==
X-Gm-Message-State: AOJu0YwX1L0hbY6WJuMyZpW3ox7T+uuQ9+PKgQbefW0EubGO27TrcTD0
 e+sOK96AZOXVKh1e3Ha86G2GzoybBI35Yf4chjXtg7Li3JNvW3HePR05QZ8ogQ==
X-Gm-Gg: Acq92OH5w9CLQOEBddFpTh6eNSkUqZmAdGQdaLK91QyMqvjVgED93epxAVl20/U3OfE
 tPcglTR9acDj5notGWOp2/4G/ftNoyZCJB8RQkxpUa8ZCYPHLyoNGFnxdBdygPM3zhrkwHEOpnX
 enzrhRAx9t1582abF70Kfk2ApRMfpMKjsM6gosXQqCTuihQno0C1dJ8QGuVB/dbpxiDwucapuYy
 d/bAGq5yKsXyc1+qlEY3yGo/T3CQJWT36xybvpYY4T18vOgovTZLKRgYg0W+8uOIXnuf76CoInF
 aHmbjoSkNtEVsMQwAYbF2l9F5syH1v9/OPruAKtDl0L/oEv1JkRKTSgsaYJsaoW15d5wZ2C89mZ
 szXO7DjqnWlUIjnZYSeGf5EtySQguXeFKYqDC4SteuOo3EI1Rz2i5f5Bp0ygA31mpaTDTkVn/z6
 483UOCXc3M9Hq0wQzoIrSdhIQhSbMbbcMuoOkocBVk//R8mjZxbxV46g==
X-Received: by 2002:a05:600c:8010:b0:490:bad9:de43 with SMTP id
 5b1f17b1804b1-492381a5b88mr12752385e9.0.1781723693567; 
 Wed, 17 Jun 2026 12:14:53 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:53 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 17/17] drm/amdgpu/gfx8: Enable IP block soft reset as a GPU
 recovery method
Date: Wed, 17 Jun 2026 21:14:28 +0200
Message-ID: <20260617191428.1784083-18-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617191428.1784083-1-timur.kristof@gmail.com>
References: <20260617191428.1784083-1-timur.kristof@gmail.com>
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
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,igalia.com,mupuf.org];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43B5569C1E8

Enable IP block soft reset as a GPU recovery method for GFX8
graphics and compute rings.

Tested with the "hard_reset_cp_wait" test case from the
Hang Test Suite created by Natalie Vock and Konstantin Seurer.
This Vulkan testcase waits for an event that never occurs,
effectively a WAIT_REG_MEM packet that intentionally hangs.
IP block soft reset can resolve that hang and allow
the rest of the system to move on and keep functioning
without needing a full ASIC reset.

Tested on the following chips:

Polaris 10 (Radeon RX 570)
Polaris 11 (Radeon RX 560)
Polaris 12 (Radeon RX 550)
Fiji (Radeon R9 Nano)
Tonga (Radeon R9 380X)
Carrizo (A8-9600)

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index e5b25d6b8268..54c974a72f84 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -2035,6 +2035,11 @@ static int gfx_v8_0_sw_init(struct amdgpu_ip_block *ip_block)
 	adev->gfx.compute_supported_reset =
 		amdgpu_get_soft_full_reset_mask(&adev->gfx.compute_ring[0]);
 
+	if (!amdgpu_sriov_vf(adev) && !adev->debug_disable_ip_block_soft_reset) {
+		adev->gfx.compute_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
+		adev->gfx.gfx_supported_reset |= AMDGPU_RESET_TYPE_IP_BLOCK_SOFT_RESET;
+	}
+
 	return 0;
 }
 
-- 
2.54.0

