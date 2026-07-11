Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iQdSJEkpUmo5MwMAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:30:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98E74161F
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jul 2026 13:30:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=bci10ace;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3394410E12D;
	Sat, 11 Jul 2026 11:30:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7003E10E12D
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 11:30:13 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493f60208a5so11825635e9.3
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jul 2026 04:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783769412; x=1784374212; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=j3zaTFD4DmYHtC+mCgns+/CoT/DzymKPOF5vmvmtm7Y=;
 b=bci10aceXNrMmnNC8mbRB3+n3hNG7TOByS0u2gQmn/bT9J/X42NOm5abr35Wi8Jn7g
 EaSrMyMCb9BvbX8/AJy92Tu9wH059Xj/2akkrte5/cYuGqZA2KaBldOe9D8ams9NythH
 FhkInDVcnRvly2coDtaH40NzDxZe6oHtrqnf/VR+NcVFNUu+yiTktKylyZrGuvIhAzwS
 chXM/a0/BBqFzMiMRPVhVGKfW6JVGLPSiGCBzoZJFIDB8nMWKNFgyX2XaK3hCbcdb4Ot
 HqLj/HBJd1C5d6OYjrUCKcwJGg8McxtGms2xDfen4DHZCTUNY8YjO4eTwrsINw6ZkVnh
 Bx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783769412; x=1784374212;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=j3zaTFD4DmYHtC+mCgns+/CoT/DzymKPOF5vmvmtm7Y=;
 b=fePQlzzX8s1K2L0zXt/v1DvMyZCAx4OugEkSskJAmY6xkq0CgkeKGE1HBKDhTa9iZ5
 vuW7aPWpnnijyPu65NXMSXKB3jLMsfoJLgXNN3W/K4dygtFpV+ec48sefSyu1eQe3ydj
 oxhO1ZFhzbT5t9qLT75BAzGnoGvGaFQMIqXXR2dypgy1NKXKVhAOpskdWLTYbDBv13OT
 dzeIhJhcLBx4LKf8s0MnmlVlgJJ3XE9zASCS6XjONmqz5OJnXWgei0z+lLCfzLPPds77
 ogq2AWe+XZXld1x2XSWuwJChkRn0dfcqIzkjBgURgVp7naR0KZBULDYf+HW44b0Aa1q5
 XZ6g==
X-Gm-Message-State: AOJu0YwuRkoMr2aBp0OzXjPPq1a0EAVufvdeSy+zSk9jloKnDis5jHp0
 v4I3Hh59HOYoe27zmjlO5ywDZQMN21l5Jfy57Q33RrADyIyErAqMtz6aW/ZqCg==
X-Gm-Gg: AfdE7clwH9MVemjD1JpFPF0srjCtv/3TZ8ri7BUIt4jWWZlufeYJANBgyb2986rrWhy
 cEPeJkn6a0Cy4f91GjZOqF1Ryc8kMeLqBk6IPiDstVgtR/A7CY0TbJ6/iWTbKoHNbVxir3WhGSR
 0kzdUoXeTPK46Oj4qEj7qOAXN7lLHdHLjJX3zdUhXkl9esVTMBZFGpE4VCPjfQlWP4oQgokV6Tc
 /PvKOkMcbKF957L1cdtJztNHS1SGgihfpO5s8sbJTN0r5uPUbkayisGPMXDMFPXMHvAieW5p/YE
 gyFnLoQKtphIHZAo1KemTefabGwxi6jHiz20Qp9xsHn+/SoMMD+scI474fx3xH9PYFqgkbDL+NY
 4WP6RJP0cRZ/PZnKxFHO6s1vaPnbiUdukTg/O1bCmHwg1RlaGTjsPAOnGUPj0hl36fjvlfJvtUc
 I13yplU02cLLXY5CohhcLXO9e1RHx0pcR0Tap/RfxmiCJI5QztYPlS1Q==
X-Received: by 2002:a05:600c:1f91:b0:493:e79e:daa6 with SMTP id
 5b1f17b1804b1-493f8826e69mr21321075e9.33.1783769411747; 
 Sat, 11 Jul 2026 04:30:11 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f373csm349931035e9.14.2026.07.11.04.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jul 2026 04:30:11 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Natalie Vock <natalie.vock@gmx.de>,
 Melissa Wen <mwen@igalia.com>, mario.limonciello@amd.com,
 alex.hung@amd.com, harry.wentland@amd.com
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 1/2] drm/amd/display: Shorten name of FRL polling workqueue
Date: Sat, 11 Jul 2026 13:30:08 +0200
Message-ID: <20260711113009.26512-1-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.55.0
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
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,ursulin.net,gmx.de,igalia.com];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA98E74161F

The current name is too long and triggers a warning.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b97ceabe6173..6299f0e384f1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -829,9 +829,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	}
 	if (adev->dm.dc->caps.max_links > 0) {
 		adev->dm.hdmi_frl_status_polling_wq =
-			create_singlethread_workqueue("hdmi_frl_status_polling_workqueue");
+			create_singlethread_workqueue("hdmi_frl_status_polling_wq");
 		if (!adev->dm.hdmi_frl_status_polling_wq)
-			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_workqueue\n");
+			drm_err(adev_to_drm(adev), "failed to initialize hdmi_frl_status_polling_wq\n");
 	}
 	if (dc_is_dmub_outbox_supported(adev->dm.dc)) {
 		init_completion(&adev->dm.dmub_aux_transfer_done);
-- 
2.55.0

