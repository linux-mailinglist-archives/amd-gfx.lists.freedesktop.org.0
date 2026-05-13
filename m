Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MP25Dk3ZBGovPwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 22:04:29 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AC53A4F6
	for <lists+amd-gfx@lfdr.de>; Wed, 13 May 2026 22:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089BC10F049;
	Wed, 13 May 2026 20:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eu9JlwNZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6817910F045
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2026 20:04:25 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso50437055e9.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 May 2026 13:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778702664; x=1779307464; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+s7Yv0PQMSDwKLle4KzYih7DF+l2OmPsgWkNSdK46Q=;
 b=eu9JlwNZZoT2YagsaWAAa/XPZ+NC/YlG8Y9bQOdyUFwWb9o5VPVfp9e3TEY6OUac42
 GrqVLeNBfJL/tztavTjtCvGeXScHfQVIvH8BrikSjB4LKQ21WL+cGrlKdHM9eY/4JJXM
 XNGukKXQnvd+sFxVsiD2e/A5GjvvQqGykqH99TjZ5yjHBEvocW8Mvi9umXQzrWP4hazC
 iojgDOVcAXG6lSFVa7JWqYDGm0iGJRVpP0j+cnGKXSQXTSGA6JjZsX/+RGJ/13ETsry9
 Eoj3K3hB/B29rhroKM0KTO+j7w8soZhbzM2m/LbYb/n5UENi+lVicvG6gosdupCyxA+o
 D2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778702664; x=1779307464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=z+s7Yv0PQMSDwKLle4KzYih7DF+l2OmPsgWkNSdK46Q=;
 b=c5LOYgu67JrfR9esKaZrxwmlqhZK1hpyQ+wfHJdeCx9kbK5zae80sU1YQiRZ7sDbt5
 0V081i7srbyrz4XKoDD2fMqsOxpl0LsQWjSpsQ5R57YCzGgyvkFMH8Ql1U3qy2gmFrrI
 lgOydn/pqlaMYXPJQg94PfObFAcvXBDBBUgXvfG8iuC9PzDukSUfrS2qcjK66s9hwVrh
 mJ3NU2U30ztNTuLXithBBdi6s3djS8VpxIt/MYdFktYaIWKXhcHFKv8r4+tYyN+Vgf1N
 fcIxN1JuNNuq+WJquZLmjG3fI8R43xDQAEZVS7eaYy0L6pekOgNUxmbAp8KOF2m/djtU
 0MfQ==
X-Gm-Message-State: AOJu0YzFtJSJKjPPWuzq7yoBizSmq/ZGYhitwzpEYdaWDYUEsPdA9o4c
 i9yxmcOOwmUxNsx4Q3IDbKXKT+m71UeLTo8riaiHVjHxPA/2/bXc7SNni3u+hg==
X-Gm-Gg: Acq92OGt2zBi16SA7yxJiEzlBw3kKaCn7VVR0j1wLLyMPIpnVt8+jFflvyporFewqcH
 untscIodfBXJZ5R5SWY/AertdqqvLIDnPCId/ATyJpvhfSkYLEIuuThKxp/pO+YKxfiGpZzywVm
 gAt0fn65OUfXaNOskxTTbIqhGwuzN9BaZNdq9ceJ9GXG0/ih9vCtr7C+E5k6Uc7uWBgbc0XuT9Q
 Th99S+4dMelxDXRUSjRiXvb3u5s37MnQZ1M3lJSUMlP224e4VJ2G+oOCe8K8wOth4LkScxBLUh9
 uKHfE0Lm3MHeVsK9GpYRDoGaBRu8AbNMowl3O9FOBukBRv1eFQeOKHyJ2W1bDMTejuyZvFdaTs+
 asa1z8JyktXNFl5+znFV2oNTOq0HP/Hb+3l/lVIxEPK121lSuMyT3q5aSm5OITyg2RFwu5u2ger
 oiDPW9WudZmhzmVedH6BseS4m8P3x5++IN+mU1VIyRslvBIbGj+IVGYvC5+jIMIkBQ
X-Received: by 2002:a05:600c:870f:b0:48a:58ae:993b with SMTP id
 5b1f17b1804b1-48fc9a307d7mr75261155e9.16.1778702663694; 
 Wed, 13 May 2026 13:04:23 -0700 (PDT)
Received: from Timur-Hyperion.home (540017BE.dsl.pool.telekom.hu.
 [84.0.23.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768c4fsm1257463f8f.8.2026.05.13.13.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 13:04:23 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 5/9] drm/amdgpu/vce1: Don't repeat GTT MGR node allocation
Date: Wed, 13 May 2026 22:04:12 +0200
Message-ID: <20260513200416.35631-6-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513200416.35631-1-timur.kristof@gmail.com>
References: <20260513200416.35631-1-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: DE9AC53A4F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email]
X-Rspamd-Action: no action

Only allocate entries from the GTT manager when the
VCE GTT node is not allocated yet. This prevents the
possibility of allocating them multiple times, which
causes issues during GPU reset and suspend/resume.

Fixes: 66a80158aa2a ("amdgpu/vce: use amdgpu_gtt_mgr_alloc_entries")
Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vce_v1_0.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
index a49f11be74b2..92c3cf3fce4f 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
@@ -545,11 +545,13 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
 	if (adev->gmc.vram_start < adev->gmc.gart_start)
 		return amdgpu_bo_gpu_offset(adev->vce.vcpu_bo) <= max_vcpu_bo_addr ? 0 : -EINVAL;
 
-	r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
-					 &adev->vce.gart_node, num_pages,
-					 DRM_MM_INSERT_LOW);
-	if (r)
-		return r;
+	if (!drm_mm_node_allocated(&adev->vce.gart_node)) {
+		r = amdgpu_gtt_mgr_alloc_entries(&adev->mman.gtt_mgr,
+						 &adev->vce.gart_node, num_pages,
+						 DRM_MM_INSERT_LOW);
+		if (r)
+			return r;
+	}
 
 	vce_gart_start_offs = amdgpu_gtt_node_to_byte_offset(&adev->vce.gart_node);
 
-- 
2.54.0

