Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eh0YJivyMmrh7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:51 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4D69C1C1
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LkvglkBm;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8D310F0CE;
	Wed, 17 Jun 2026 19:14:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E9210F0CE
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:48 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4922244f7c7so603575e9.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723687; x=1782328487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fpd/wwMrXpj03ZBkmR7leZl7qqa3rMp86usexfFyvT8=;
 b=LkvglkBmL5RLSsJSQSZmbDuhhPqxE2zeCVIa0OMsThiqNm82vgIea45DfuXFHswJXU
 uPI6KqAzMLYkbqiIXEC3cQWAwyQttlwYYxoGdPuh9gkJQvGTTVwmwvgcxCdiGaC/uLqu
 UNe2t3zYoPC6DE8dHg1W+iSSocMneCl9BHJ+8gjunSW+34p0fO/fc2svC8KdTAwgUSqe
 9B8+opCNTo6l4fN3nUHWSf3ZQQLGlnd4NkFAThvgm+0XsbULh8U8i7Rtd7K4XuCIpz9A
 pQc6XXXvXIO5uh7xHm7jc86KKchMXARZ87RgCElgvHSmhUJurjPRzCwfNtPlrlrclYkH
 y3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723687; x=1782328487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fpd/wwMrXpj03ZBkmR7leZl7qqa3rMp86usexfFyvT8=;
 b=r6m6QB8v1jbbEX71RELpqgtYDmfexmHw5o38484MnhFiB2eJmqpHj1rf1OY73JN68k
 mO+gTcJjNX9sVEEYz7ApZEZH7tnVsKllZAIkrnW3nu5G/W67oIv+m50hR6E9Jy9F8PRs
 Ihj3CK6WtHqkRYgbDl5I3Py1cJNGT0PH66JwVpEDqvkG3s4+SodMqsrDEfoxdEZGn6xD
 k97KAYRYx/0DjEFrJeMsdOQpRnSI9P+SF8GGU7v4ThGjUe1zNAfpyHG7TolXh++PJW32
 +57EyunK7EPKw0MuNrPflGsEgaXNjh0qUGlNtL2gi6m3ndmM3D2PvH/pd5QDNX+9i5Lt
 RZ7A==
X-Gm-Message-State: AOJu0YxS3EzfJ/rQzaey72SE/YAY89o2n1sjeedNPuu5Pw9HowMx/cCS
 ZTDlVHUtll2eopKNV8N7/lzHKACsUQ45XNG6xCmoDHHNLlcakaAJ+CiEosWv7w==
X-Gm-Gg: Acq92OF1T4zBJqksonR6nfH9Nq4rc+Y3vLuVzfbYtwSjyZ98GV1fqNff4mQ4LfZC/nj
 QLZPJXD3oBF/H+Qy+xQUx2JtGlXERtEqtorAuD0TZiPIlyc4ZfSj6nWFBt7iIETXjRSliTcj+hI
 DvfbQZiR1tKekz3RgOYszS+8DU2UpwU7GQkYFWPWLCet2ZUGUrXSQ5atBduFm1cZ5Pub5N27zjY
 rqxHF/0aKbxwRgx3r5T5vU712UVdzQL6PMbG/Qj4gdK4r/wLZZtmkJAKThA4leESI1Mnvk+VDDO
 l/nkfaaS1iNBkcChk42ETbUj/ulL0g41FQ5govVLXhh66UcVYXQ+R5FZCtLkOteNNwTfu36Ad4a
 BA19T8s6mo05VMU7531PiNo3ynABJOd+dMQQk7NPS35O08qb8OReo0iH/5venFHJ6guwVJWioo6
 tVMByBMvRcu7PILq+1I7T55WzdvjJx0hX6l52xMu+bd3vQOp0kjU4Qug==
X-Received: by 2002:a05:600c:c114:b0:492:37b7:607a with SMTP id
 5b1f17b1804b1-4923822ef66mr9183285e9.31.1781723686985; 
 Wed, 17 Jun 2026 12:14:46 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:46 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 13/17] drm/amdgpu/gfx8: Return error when testing all rings
Date: Wed, 17 Jun 2026 21:14:24 +0200
Message-ID: <20260617191428.1784083-14-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 33F4D69C1C1

The gfx_v8_0_cp_test_all_rings() function should return success
only when all ring tests were successful.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 9fe430e3ae65..6d69d49539ae 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4703,12 +4703,14 @@ static int gfx_v8_0_cp_test_all_rings(struct amdgpu_device *adev)
 	if (r)
 		return r;
 
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
 
 static int gfx_v8_0_cp_resume(struct amdgpu_device *adev)
-- 
2.54.0

