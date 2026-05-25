Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAsfMIszFGo7KwcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 25 May 2026 13:33:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D615C9F57
	for <lists+amd-gfx@lfdr.de>; Mon, 25 May 2026 13:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7338510E294;
	Mon, 25 May 2026 11:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="omqo0QIH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB23310E28F
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 May 2026 11:33:27 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4903f7a90d1so27394275e9.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 May 2026 04:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779708806; x=1780313606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VZOTjfdvVUoAxPEDBuME1CuF9RE2uhmL8jaSYcYhLV4=;
 b=omqo0QIHCxNB/8vWvTXA2EH7TX9kQeTURQo5YbPgsq8yxJXDNeTAMV36pQonFrd+Bo
 uDQRKQuVqNI9s9uj5xUpLg8l2Fold8rGPB4yIimrYnRuVh1xQ/ShODw9jLT4shkAHd79
 7HZvMEEVlkgavUw0OgyU9v1cvdH2kCRaI6NJip1J9uVAv9mfWpfHTk0gPQv1XyW+zle8
 cPfleu0eVoIfRgbLHzv04t4C1t7hS/WTjD2D2Q3iOjbH/cKd3Fn4kt26X6EIxafUH7BS
 1npWFKt3lvYg3+LL7P3Kxw2F/7cYR+52YGujSw4dUfZBmY/nH6E13SARS66UzXkf2s42
 D1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779708806; x=1780313606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VZOTjfdvVUoAxPEDBuME1CuF9RE2uhmL8jaSYcYhLV4=;
 b=hpnbq30f9/euevIa7MNSyxiGrNA/iffCpuYvX6cjG3Y89C0zQT2hXQ2pIxcbsovg/Y
 hX8VpY8NFH3KUsBQ7mHx5+Tjw1heR+PyuXJEi2IzTiod2nCnvwieevnyvHLqqAvvF93a
 nEB4gI+dGLIMuzjOvhCJIyHpuHB7Z8u9+Upd2xQ3dxP1Gzydxwfv6pFwm4I+Ga4ZfyAU
 6lrUEvfU3nrJ5mP25vq+ySNxReQT7QibMba88xwcFOm1zT8dj0cKIn4jZNxeQx5LXdKG
 vO1lpjJAzIVn4Yg7KAjXYu1bg8KbTPrOfcWOJX2xYc0o/G3SZ7KTtd4ZvPf7LP70YX1n
 1lyw==
X-Gm-Message-State: AOJu0Yww4jk8IYmkiOpiUkugFF/K+3gPKhUziFWq2kev6LCpOXDMgxdy
 bfPB0v155RDCuENBW5/1bKaQXEfHzWBL5h0u3D3DmgObccTNP6TQ1z5OPeasVw==
X-Gm-Gg: Acq92OF2y3ssdfyHK97aHmfIr+Rp1A2ZOgbHMPUPV4TZ7DmVBLmD1M8p7aJXdwgUlyv
 c6we7bunePKk+O2L7C8NhqgBk2NI6yK7sGuN0O6/Si2vxGXhAp5sh+XOc+juGW1zhybzFend+Xx
 33jh6oLHEUPdomavTXVL6KO4+QUKavSCX5c8SYxr5l0G6X74cOcGg2+pu1iKi4CHC0njm81y/e9
 RsLi/iGwc/+PI83dGwUu3Ojabp17ILb2mXFP6TMMAzPYrnns8yRuHevpu8bDddt+2XJqJbZ70ey
 cGsT+VRdvGx+ynXSvWe2bs1KZ7BgnhLwZPQixGJJgR/90GcVmqgp4hK7HaCzpPZHBpXQ84d2V6g
 pE1qKY/tczlHBjyMCB5OoZGMJb1sai854aa8hq9ztyIhtCBNerNrfSGU6v3V6HWKs7agkQ+r9JH
 eV1/RdT9qtl5GadL3tnINSg7aKOOy0aQMU6SKYDKM0bWeEUvg5tJUOVRxjYYxwo7Zb
X-Received: by 2002:a05:600c:8485:b0:490:5074:651e with SMTP id
 5b1f17b1804b1-4905074659bmr151264905e9.25.1779708806028; 
 Mon, 25 May 2026 04:33:26 -0700 (PDT)
Received: from Timur-Hyperion.home (54001290.dsl.pool.telekom.hu.
 [84.0.18.144]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49045284855sm241047845e9.0.2026.05.25.04.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 04:33:25 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com, Natalie Vock <natalie.vock@gmx.de>,
 Mario Limonciello <mario.limonciello@amd.com>,
 John Olender <john.olender@gmail.com>, Liu Leo <Leo.Liu@amd.com>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 3/4] drm/amdgpu/uvd: Place VCPU BO only in VRAM for UVD 4.x
 and older
Date: Mon, 25 May 2026 13:33:19 +0200
Message-ID: <20260525113321.17953-4-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525113321.17953-1-timur.kristof@gmail.com>
References: <20260525113321.17953-1-timur.kristof@gmail.com>
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 75D615C9F57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These UVD versions don't fully support GPUVM and are only
validated to work when their VCPU BO is placed in VRAM.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 3a3bc0d370fa..1e59ca924abe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -188,6 +188,7 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 	const struct common_firmware_header *hdr;
 	unsigned int family_id;
 	int i, j, r;
+	u32 vcpu_bo_domain;
 
 	INIT_DELAYED_WORK(&adev->uvd.idle_work, amdgpu_uvd_idle_work_handler);
 
@@ -319,12 +320,20 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 	if (adev->firmware.load_type != AMDGPU_FW_LOAD_PSP)
 		bo_size += AMDGPU_GPU_PAGE_ALIGN(le32_to_cpu(hdr->ucode_size_bytes) + 8);
 
+	/* UVD 5.0 and newer HW can use 64 bit addressing. */
+	adev->uvd.address_64_bit =
+		!amdgpu_device_ip_block_version_cmp(adev, AMD_IP_BLOCK_TYPE_UVD, 5, 0);
+
+	vcpu_bo_domain = AMDGPU_GEM_DOMAIN_VRAM;
+	if (adev->uvd.address_64_bit)
+		vcpu_bo_domain |= AMDGPU_GEM_DOMAIN_GTT;
+
 	for (j = 0; j < adev->uvd.num_uvd_inst; j++) {
 		if (adev->uvd.harvest_config & (1 << j))
 			continue;
+
 		r = amdgpu_bo_create_kernel(adev, bo_size, PAGE_SIZE,
-					    AMDGPU_GEM_DOMAIN_VRAM |
-					    AMDGPU_GEM_DOMAIN_GTT,
+					    vcpu_bo_domain,
 					    &adev->uvd.inst[j].vcpu_bo,
 					    &adev->uvd.inst[j].gpu_addr,
 					    &adev->uvd.inst[j].cpu_addr);
@@ -339,10 +348,6 @@ int amdgpu_uvd_sw_init(struct amdgpu_device *adev)
 		adev->uvd.filp[i] = NULL;
 	}
 
-	/* from uvd v5.0 HW addressing capacity increased to 64 bits */
-	if (!amdgpu_device_ip_block_version_cmp(adev, AMD_IP_BLOCK_TYPE_UVD, 5, 0))
-		adev->uvd.address_64_bit = true;
-
 	r = amdgpu_uvd_create_msg_bo_helper(adev, 128 << 10, &adev->uvd.ib_bo);
 	if (r)
 		return r;
-- 
2.54.0

