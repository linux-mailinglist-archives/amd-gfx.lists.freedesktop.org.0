Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pHGHDCzyMmrj7wUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:52 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E9B69C1C7
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 21:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Hm7Wjx6W;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F9F10F0DC;
	Wed, 17 Jun 2026 19:14:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3289810F0CE
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 19:14:47 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so480475e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2026 12:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781723686; x=1782328486; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pFaBTQlbUPtRW85ENB7kycXvD7e/DLvOEgwsVVNiRzY=;
 b=Hm7Wjx6WD7ELAXQcIncpsty27MeId8+HpFdm2HDFwYq42K8D6qko4jFhj+IUrKOXg5
 muFe+3hNNZ25AE4cpxqB7s9WLWTvIqQMngLECK2Zo/8XNEkAOwXJcS9ZhUzJRnLled+Y
 SZy3N6qoXw2O0bDgMXfJqhjoWLCeCQLT8HJUXAIMl9h3KJq+PtiERLYQ/ldX9DhYxhCz
 xi675ToARcLugiP3AIt1aSxNRtsmSq5QrECMYfjS2THqMBTgJ+WbF0vnkRYW01oPtqwc
 c2hR2CXMmXR31XUsOrFl4kws5L7ZAC0fKZIqA7SGla02KxeUaxt8QRWTqvMcA1+8E12t
 vHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781723686; x=1782328486;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pFaBTQlbUPtRW85ENB7kycXvD7e/DLvOEgwsVVNiRzY=;
 b=l8ascANVH32aajg+8Ecq1PJzWI0wCnbfBu74BxIquFbbWGxjdfpthv8ka5OOrXKfiB
 WI5QT34xMhJRFRUiiI6HxNbvKsYlT4EF70a6P0W/9DnyhdOVIqh+S02q+TuiP0ozeipg
 28ZlPygMBdhiFG1a/hB4l3SBaHO7m8z0MLTl539Ji39ghWlUI5Zn3P6kSdkCrn8RJaHH
 yfGcBnzzEBsZ63wvgyldWYDBDGA9sOqyI0A1y/8B2wVB1+VxU+D5lbDuAh8IRc5TcYND
 aocuGzeYp2B55hj10bcFClMgxMZWwSwDskUQ8p+OdG4eJl+qf7In8bClwme1kEMiRDQk
 yfeA==
X-Gm-Message-State: AOJu0YzNWADJlRiBlIKrp+Rc9bDdab71zW6fXNP/xBPNzwTegecDMFMS
 WMh5p3htfSGEZ7DMhsnsanXnL7wFT4+UGcTVwXoTxuqcDsvijl2sJvY/EYAtsA==
X-Gm-Gg: Acq92OHKRyhIVCfwyjGpqU75Kccy2uPdSvQgEoAI//DgL+2BEvLBnQ+BUHbMywOnXE6
 8NVY1tGOOnbYc/FtrW7P0KcvlJ/z+Ge8WeJ3fBQQW8+nzbBNcv8sf2nqw/GT68c+ywANItHUqwk
 CbdaRG19adG14JjZgpLGk2vntlyxf5rmgMOUbie7/wKrx5P65QEZQ9dxatlyVIZx7G21nt12i+m
 QuyU3JHlPnYu0mb3wSjlbZ1PGI41L/5ACk1274iE72msUPGw1W4mW8J5n4vTFFK4+3RSHhNRoqX
 8A4Fyi0J1LBx6cizSyIBTHfayB1EWTV3hez2TzrfgWpWzoPzhcO3tpj8x2alhXyVSrVKz0DxGnq
 BbzusWfAoFvrPLaanhu8ZGLuFJzmzla0SjoUPsIWMkKi8etyblzwXnvLquBI9O6XZ2VZ4LAmL8j
 Q7byGRTvNv5JU/cDaOLgN/WSBV3FVGAo4RvReUQuA5RUccDmWN8msGVg==
X-Received: by 2002:a05:600c:3595:b0:490:a964:14f8 with SMTP id
 5b1f17b1804b1-492381e1c96mr15633985e9.8.1781723685643; 
 Wed, 17 Jun 2026 12:14:45 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa96f0esm204686325e9.12.2026.06.17.12.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 12:14:45 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Lazar Lijo <lijo.lazar@amd.com>, Martin Roukala <martin.roukala@mupuf.org>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 12/17] drm/amdgpu/gfx8: Stop CP and RLC during reset
Date: Wed, 17 Jun 2026 21:14:23 +0200
Message-ID: <20260617191428.1784083-13-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: D0E9B69C1C7

The only case when they may not go idle is when we are dealing
with a GPU hang, in which case we should just forcibly disable
these even when they aren't idle.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
index 7bd668f71b41..9fe430e3ae65 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
@@ -4868,14 +4868,12 @@ static int gfx_v8_0_hw_fini(struct amdgpu_ip_block *ip_block)
 	}
 
 	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
-	if (!gfx_v8_0_wait_for_idle(ip_block))
-		gfx_v8_0_cp_enable(adev, false);
-	else
+	if (!amdgpu_in_reset(adev) && gfx_v8_0_wait_for_idle(ip_block))
 		pr_err("cp is busy, skip halt cp\n");
-	if (!gfx_v8_0_wait_for_rlc_idle(adev))
-		adev->gfx.rlc.funcs->stop(adev);
-	else
-		pr_err("rlc is busy, skip halt rlc\n");
+	if (!amdgpu_in_reset(adev) && gfx_v8_0_wait_for_rlc_idle(adev))
+		pr_err("rlc is busy\n");
+	gfx_v8_0_cp_enable(adev, false);
+	adev->gfx.rlc.funcs->stop(adev);
 	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
 
 	return 0;
-- 
2.54.0

