Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8kFWKBTjVGr5gQAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:32 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F13F74B4BA
	for <lists+amd-gfx@lfdr.de>; Mon, 13 Jul 2026 15:07:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mqYzPwby;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D731C10E99C;
	Mon, 13 Jul 2026 13:07:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17EF10E99C
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 13:07:29 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so23442165e9.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 13 Jul 2026 06:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783948048; x=1784552848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PrezrAXE6Kqn94vITH5Mc7zMdf4Gldzqus1c5T1sm1k=;
 b=mqYzPwbyhzk0iFztmEJ8KOaBPk1LREDgK+UxJ1S9VJafGgptzw3cFKjvWOh/YAONtf
 0HXPMcwF9EAge5y3KPXYp/Cz8rZQuuGYbJNpkxIHSBsGR8m1HXqasEhOXdOkjLXBcibL
 luaCrbNMAzka/G2R8hcdAW/wPnG8NVWm/wrKDJmHpLLnJ5RkL5lK+up3dH67XU7rlWIC
 6RjfdGbAJCOztajDF0XZfa//nBfC/KjS43MotBocOgpv1jTbzoHYxJJAUrTiV8N7ZPrc
 EvTOLnNxNKge/wnH4yefv8J58q9vtA1ehZhjqoUmDrWgKGdgX2+gghXxbJECh6hlkfjD
 myMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783948048; x=1784552848;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PrezrAXE6Kqn94vITH5Mc7zMdf4Gldzqus1c5T1sm1k=;
 b=GyZREiJwRHxj98t4LBe+1OFyBYcjlv4dWELeqLqBiPmuyedPvvAnZYFKto4Av1eEW9
 cHHi+8BW1i4qR+j4MhcfqrP3qXp4jd+B+L/HWoZF3WfenHmhW9DbpO+PZYLKpL22rRVn
 2G7D2L/3jjlCuyPwEB/JsnJhMC6Md9dt5pwse1GoTMwkTCVOATUsgAMpR/Re6H4leCt/
 q9+E7PyH31ovPBuyqTIJmJ6WRg0Npj3QLyxv+rTRezNdSyo0wwxzn3IOba/62L2p9Cdz
 Z8ZAz84UYeeobXo3/uEP2qTu6vscXFTZbiyzzHtmAYsrqDd+f1z7xrLjM1r5WRLUQWBZ
 PNPw==
X-Gm-Message-State: AOJu0YzqD82HXw7/8RbSufzeGS2oyLvGcWAd2FpxNKsPtX9i1L9ecqZo
 ATaWqIvxxbH+g9cuU6MynBgJFpabaCs0qZuRMrnu3o7YJQssivU/LTkuo3efVw==
X-Gm-Gg: AfdE7cl4zSK5rJxM3MA1jYvaPD3gsnTBDhnDiasSenzBqTg8MGJAna/WUIhP858Zv8u
 qKQVyZi0XmNdEbWnwel5swSyHbvILi5rwAMT2HIP7j23MvaCVsW2rjuIPpG+KTW0j7aCfwrQirn
 BLxO4S6ycTGMRIvJx3HPw6cFmV8HPd912zK8X3aOYT6j/Zrzxd6CgXawU9EW04oSavg7jp5du0y
 4GqAa9YonV4969mZKmkTDTHREuhSotoQnTb4Dbx/QqFF1Rh/++CGXLbCN2IrudsXjofSEi3/utW
 LeJhJ2wTbZ6FsxwIgtMr34Lsyq5LyHesGoh17YxtVg6KT11cxZwICLqaWW1jt79Zzz05nCpA7d3
 XOCEuKbwwn97cig7YFxZHPdqPb2aUR9P8R2Sx6ofTLHCB6VwCFuznaYFhk3h7+ZokdBFo+UiWaf
 HYma1dk3eZcm7PdWm6FLBjM63H7ww3GhpoeB/vjqMlPp5eWFViv8YmGg==
X-Received: by 2002:a05:600c:3e1b:b0:493:e890:9e0b with SMTP id
 5b1f17b1804b1-493f883157bmr96159155e9.26.1783948047962; 
 Mon, 13 Jul 2026 06:07:27 -0700 (PDT)
Received: from Timur-Hyperion.home (54001386.dsl.pool.telekom.hu.
 [84.0.19.134]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6df417sm387974995e9.8.2026.07.13.06.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 06:07:26 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 pierre-eric.pelloux-prayer@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 06/11] drm/amdgpu/gfx6: Execute CLEAR_STATE when initializing
 compute rings
Date: Mon, 13 Jul 2026 15:07:04 +0200
Message-ID: <20260713130709.34262-7-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 4F13F74B4BA

Emit a compute CLEAR_STATE packet on the compute rings after
the GFX ring already finished executing ME_INITIALIZE and
before the ring test, so that gfx_v6_0_cp_gfx_resume() can
wait until the CLEAR_STATE is complete.

For reference, see si_cp_start() in the old radeon driver.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
index eeada89bb31a..5b570a4b5c01 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v6_0.c
@@ -2263,6 +2263,14 @@ static int gfx_v6_0_cp_gfx_resume(struct amdgpu_device *adev)
 	for (i = 0; i < adev->gfx.num_compute_rings; i++) {
 		ring = &adev->gfx.compute_ring[i];
 
+		r = amdgpu_ring_alloc(ring, 2);
+		if (r)
+			return r;
+
+		amdgpu_ring_write(ring, PACKET3_COMPUTE(PACKET3_CLEAR_STATE, 0));
+		amdgpu_ring_write(ring, 0);
+		amdgpu_ring_commit(ring);
+
 		r = amdgpu_ring_test_helper(ring);
 		if (r)
 			return r;
-- 
2.55.0

