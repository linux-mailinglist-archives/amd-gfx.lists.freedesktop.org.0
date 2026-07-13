Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tWsPKQ3hVGpJgQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 14:58:53 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221974B2EF
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 14:58:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WHP7+GHV;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925D10E89C;
	Mon, 13 Jul 2026 12:58:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B30610E62F
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 12:58:49 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493ec555a26so20412885e9.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 05:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783947527; x=1784552327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Kyn9O1pwIsT+lRxrQav83mRh9kcKOfr6CDA7+SuVIJE=;
 b=WHP7+GHVnWixOCejhTSJUE9pssdcTV6O7hk8xia5DhJO0GTD55O8XTjLOqSpjwX+V/
 o2/ywQQOhKUVkBOxy2UG7Xzkj2WK5AtAM3o7rI4wGTEwt5gAVvjMOXFxRqJ2LT91ynP0
 TdB/LCH0n5e1thbq/XqlEAapDccslHaN7tufHBeV3+L5DI3QvqmccVY/Lj6p9b2r87ie
 /ELTaKSwsfhmhqgU1uI5kTpMURAIwo4t8FRxswb1ZsJicFM3Nvl9qyEYc8HNfAmWJgWI
 SoHMm/HrVDWPriuL7h1DA7hZHQN9ijMQp8ks6ArcnW9n8SglNnFAmKxxfiOOO6nvuGEu
 FsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783947527; x=1784552327;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Kyn9O1pwIsT+lRxrQav83mRh9kcKOfr6CDA7+SuVIJE=;
 b=IPu4b4XvcCTcvuqgaZljXq2zMAxAMTFlycmhkUHKGhOLTrjeDBK1euerzat0VSskRi
 FyEm1Zv5/Kj6Z6SAnCGFPLtzt01bXcchWKQ9II0LQHp109YROXtVrK02fI5oHJk12Nst
 KSk4qf/SAUu1hbvufdGnWwK/+Vdk+0F6lvrl2EHpiRjDvX2SgbtVsI06SfPfIW/hbZFW
 d6yKh7WLD2gH2PixUf+BYnakelOr62ZtYE1/OeXJnC2jU2f26gWPZZouda2emNse//9V
 QZl+sdXXKHQRWhjFd/7cTIKHchBd87SbAl92AopHMKikK3xHSu2tRbxWtWOnY+C1h8Mm
 juLg==
X-Gm-Message-State: AOJu0YzpipF1bYHuwxbZdaD15Cx4ehtaF8oONfTk5dUpN8kKKdXLTGx+
 pCLhHqHZ7mM9AwQ2eHXIkL4Esr0qE9wX7o5GGSbnUw/hGoXA5Vb8FrLjKQFfBw==
X-Gm-Gg: AfdE7ckQfUgk+6zOO+B/bKUcm18/tDlGRxq9+dS1yPzRjDoR/rhfmM+Q4jP+1YpzTZT
 3Vz7NU4/J1ZyUzTJ2ztoXMRRdwP4tdyH+FTfajq6MouUjEzUd/EiesPloznsi3MrmhdJj1QlB0V
 kfbHmTQuEapCf4QZN40X5vpft0pa7usfjX9JVcl2S6PSke21V8MvCa4p3348fBY4Bt4qIGFYFYm
 1S1yH/gDv25nb0m7tU0GJ72b8t0IojQyV00IM6UX4VjGkPr4bdWRrSnRd6wLN8uy7joaLKHsOkW
 jtMnFw11Q+lT5Ow0ELOIewvqPPaHU91AN9CId9a0stImdITGUu3o4SBTYLcVp3P6VozsLyVbZaC
 lSlUJ5pWv3keIew6JKo/miwNvFbyYmr1ZntsHFvubcPxsLQa72wUUDSuHxWO2zYHx81azevxxEl
 oJi+ris+oMuUhpikFmtVc0ClTVppjiUjLCUqTumxV8Y1ZNr8rY0scmoQ==
X-Received: by 2002:a05:600c:348e:b0:493:bd37:1cdf with SMTP id
 5b1f17b1804b1-493f87d6219mr93703245e9.2.1783947527447; 
 Mon, 13 Jul 2026 05:58:47 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d6e4csm80456918f8f.10.2026.07.13.05.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 05:58:46 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 3/9] drm/amdgpu/gfx7: Return error code when compute ring
 tests fail
Date: Mon, 13 Jul 2026 14:58:32 +0200
Message-ID: <20260713125838.30607-4-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713125838.30607-1-timur.kristof@gmail.com>
References: <20260713125838.30607-1-timur.kristof@gmail.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5221974B2EF

The gfx_v7_0_cp_compute_resume() function should only return
success when all compute rings are actually functional.
This will be especially important for soft reset which needs
this to know whether the reset was successful.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
index 9c4b3ac27e1f..a1a9f3fc4567 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
@@ -3019,12 +3019,14 @@ static int gfx_v7_0_cp_compute_resume(struct amdgpu_device *adev)
 
 	gfx_v7_0_cp_compute_enable(adev, true);
 
+	r = 0;
+
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		ring = &adev->gfx.compute_ring[i];
-		amdgpu_ring_test_helper(ring);
+		r |= amdgpu_ring_test_helper(ring);
 	}
 
-	return 0;
+	return r;
 }
 
 static void gfx_v7_0_cp_enable(struct amdgpu_device *adev, bool enable)
-- 
2.55.0

