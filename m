Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHJVITp7GWr3wwgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 13:40:42 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E59601BE2
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 13:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481810FDC5;
	Fri, 29 May 2026 11:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kfjACfDU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89210FDC3
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 11:40:37 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-45ef372c58aso274664f8f.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 May 2026 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780054836; x=1780659636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:reply-to:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CEPv0UPtOHI8HBuhLyDgSA2Y0BAqzABYlitiG/RkRyE=;
 b=kfjACfDUiAfYrS4Mwj4vO6U7Krp8lDNvyYnGFfTUUPGohI4uJEQDswUW+GwELbDAt9
 9Z1gTul8RPjyY7/PS32Kn3ve0ZaADMBoEOJvT7MMf6TDesC6PTYSvufGXqTX3PzH4MFT
 X47e8VnYN5lQ/rQWMGDciuIdg3vfG15560dM17cn0V96Al1aKKVNCLVESTHPUvD+T2oT
 fcZ7/KI9vFye9LZ6kL9w04kdKNZfXEI6yXUTIbYzwAB9ZwFgp1kAlEtTm2G9gRJ4kgjL
 OnEr2qkWnFmU+P5cG/R8k3aCE4rShDYdIPUbpKVwD0vQRXQCXxA22Z8wF9mSMUabcpeu
 E6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780054836; x=1780659636;
 h=content-transfer-encoding:reply-to:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CEPv0UPtOHI8HBuhLyDgSA2Y0BAqzABYlitiG/RkRyE=;
 b=e+6SNK13DDsDD7ym08OHHuNWpT7ZM+YE3l4gYMcU//jQjHGdP2iPIyF3gZ3jvop7Nw
 01kn9MP66xCgDz0o6u9eoEwm6l5XzqXhFoOz75xcTIQiZktZTWuUjeWL/nhfU9LpqYT0
 9cq1LdswNA6edxgj+gl+vY5tpAXN1UkINx7GFwYbFYqvfocaKnZcXP5g2sBgBTPm9Os3
 4RQAQvgRpOweRlPkYa1BoZcUShG1RZNAPmq2S+mBaRXxNwnhY0nlAUAoTHlM1v5NIZP8
 FGpCMxNcKJV2SNqKXsVKNLYlJuo8bt9BwtWo16HUxXR8pAoQFp2LZuudv76r2C18cegI
 E1Uw==
X-Gm-Message-State: AOJu0YxUV1wX3X2QGQASum0FFuz7FDM6liEerLSsgCPwC0e8IsOnaCKJ
 98cn+WPAqocqZ8ayPBhktUM6wNt+hj34FbHug0Z5dl7noOxsYLcFsv5E
X-Gm-Gg: Acq92OHM884QpaGdZOq9tI9rJLRpqkMy3kvsVO7DzCh6Kh5ubBtckcbDCjziiCTj7FC
 btnXtaQc7E8H9LnIwcGtpcpkW/Ja2SeF66u4GFwKyPLiM1DTfA09W6iFjvHOCb9sl415ixw4B8k
 Wwv4VoHxHICqm3RmwynRBCSu28BYevtprYDRHqSTNk52xDgep4ysE8uZMH6CusboetIvg5C4/Sj
 5JpLsEFdql0mi2LaH2XhP8Zj8WyYiPxUZG3jS5f+wJ9BnAOSSS8BgDoJ9n/6JphhYZwRS0UbYIE
 R5t6u8YDUgNswm3cHMr1kZy/Ann07bKdNKS+fl37RZf82gXzO1Mooyh9raVlsSWauc+CZXrl4PF
 neTFepJrH/f0nXuK2J9dZRC2pFWnvC0JIwBdM8gFCGypwKPTKo8gLRFAORTimCSNbS9n2GDk4K+
 ImMxE0KK4P7kqaHURicmcSDgfAKU/agfA+rSoV7r3nrX8=
X-Received: by 2002:a5d:6649:0:b0:43f:e2b7:7160 with SMTP id
 ffacd0b85a97d-45ef14024damr3234645f8f.4.1780054836131; 
 Fri, 29 May 2026 04:40:36 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1544:8100:da55:fa26:bd:a26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef354cf0dsm2993109f8f.17.2026.05.29.04.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 04:40:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: natalie.vock@gmx.de, honghuan@amd.com, Alexander.Deucher@amd.com,
 Felix.Kuehling@amd.com, Philip.Yang@amd.com, timur.kristof@gmail.com
Cc: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/13] drm/amdgpu: give different sizes for each SA pool type
Date: Fri, 29 May 2026 13:24:04 +0200
Message-ID: <20260529114031.3714-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529114031.3714-1-christian.koenig@amd.com>
References: <20260529114031.3714-1-christian.koenig@amd.com>
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
Reply-To: christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:natalie.vock@gmx.de,m:honghuan@amd.com,m:Alexander.Deucher@amd.com,m:Felix.Kuehling@amd.com,m:Philip.Yang@amd.com,m:timur.kristof@gmail.com,m:timurkristof@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmx.de,amd.com,gmail.com];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	HAS_REPLYTO(0.00)[christian.koenig@amd.com]
X-Rspamd-Queue-Id: 39E59601BE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IMMEDIATE (page fault) and DIRECT (reset) pool should be used only
very rarely and by a single thread.

Saves roughly 1.25MiB of memory and GART space for each amdgpu device.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c   | 8 +++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 2 --
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index f1ed4a436f5b..334f95f8f339 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -351,14 +351,20 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned int num_ibs,
  */
 int amdgpu_ib_pool_init(struct amdgpu_device *adev)
 {
+	const int sizes[AMDGPU_IB_POOL_MAX] = {
+		[AMDGPU_IB_POOL_DELAYED] = SZ_1M,
+		[AMDGPU_IB_POOL_IMMEDIATE] = SZ_128K,
+		[AMDGPU_IB_POOL_DIRECT] = SZ_512K
+	};
 	int r, i;
 
 	if (adev->ib_pool_ready)
 		return 0;
 
+
 	for (i = 0; i < AMDGPU_IB_POOL_MAX; i++) {
 		r = amdgpu_sa_bo_manager_init(adev, &adev->ib_pools[i],
-					      AMDGPU_IB_POOL_SIZE, 256,
+					      sizes[i], 256,
 					      AMDGPU_GEM_DOMAIN_GTT);
 		if (r)
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index 8f28b3bd7010..1a063a0a4280 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -68,8 +68,6 @@ enum amdgpu_ring_priority_level {
 
 #define to_amdgpu_ring(s) container_of((s), struct amdgpu_ring, sched)
 
-#define AMDGPU_IB_POOL_SIZE	(1024 * 1024)
-
 enum amdgpu_ring_type {
 	AMDGPU_RING_TYPE_GFX		= AMDGPU_HW_IP_GFX,
 	AMDGPU_RING_TYPE_COMPUTE	= AMDGPU_HW_IP_COMPUTE,
-- 
2.43.0

