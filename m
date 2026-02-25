Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB9VC8VQoGmIiAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 14:55:17 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F9D1A70EC
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Feb 2026 14:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0EE10E94A;
	Thu, 26 Feb 2026 13:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WgUTGat2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5A710E18C
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 14:52:15 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-79827d28feaso46995467b3.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Feb 2026 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772031134; x=1772635934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x2TBYz73kHEnIkCuW8JdOuhSWd80jhSztg/rGzlnY3s=;
 b=WgUTGat2n9ir4qki85B4rLWUDAoPl9AtdO0ke0eO6dhxZKMzxBoe9peRiDstmX/kav
 NZ9doOJVb1bwLeJ4VL3+i3PNlsItsOdyR5ebEPzqDkaw7GrirGPGefAPH630qAf5LEdY
 LopyNOKlD2RBKO1KfGA+NE5u9vFpNcfix/SDDomnPk+6QpL9H/y8omN/eSM/qmj6h6so
 0rz0ACEfFZh5RMPcVui1opIMypMioOikVe9YOWu5+hKFbaCgiYrqlFsRjm7hoEqebeko
 yqQjZlv1Ts9GUL2aN8nClSRSxfxEuTWoYILHj1MYPA4gplCu0vPLKl8YXEOwarZ26i4D
 vIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772031134; x=1772635934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x2TBYz73kHEnIkCuW8JdOuhSWd80jhSztg/rGzlnY3s=;
 b=N8EiBMVtPvZnOOjmXtB3iAYGgcf+/9IBvFT9N/kQv0Wx+yyGX5/s/c+i+8rS3nJ2KW
 Zy+sLxzgMs6ZSNDLjC5oQZZPaHi1klGMirwml+UYr7AfXcLqQeqAmh0FUqbOJQnqHf5c
 q+30AUkA5bYO8KJuVSvKGkxbkAiLjh2Gheon9du52wxPhz+zq89iaWp3jZCLJugiHIOk
 n0u2NRH1M32s0h48VojNTrNUl4X2IujKOeXvWeFiH2oCx9bXoZQeLUdbVpzam4WCXy8s
 X5zRBKmFguRjJTNqO3UOnsxECMVLMXrZmicHQmivnF+ujPTlpZ/rw8Av3KV/Zvfx8URD
 SlvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv6Ue7NSTakmHbX+7NO95d3j24msWtqMnh21YALBXG2EGsOwfnx0lOxdGxY0/854d3YOKi5P3H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxhmWbMPXVG1qky00H24TXD/34ueOmnUfykd4SIbNgNuFMgNu6l
 szuGa9lrRdYnVOF/micZ/gX4KRT6wLUEdS47cOKUCAfiNbwAG3zgjOH4
X-Gm-Gg: ATEYQzxzQOcx69k3vZazYm79tQX+79EQPdTOZuHP2OL+DNyZY6PCHmu+Z2IqB6G3yrn
 Q/NzHZOGLMIIHlIIlSNUcRsiW0r4F+l82OkAI9gpjy7JM7oBQ1IU6TFMwxODrI4efF4X5sJDLjW
 i/GD1y3GeJxK9Yn698SEBZsWz1e+usUm0TLQfHhrgJMNSMN5m2WBdW0/iQ2Z/jZs1wNhEKcRkIg
 Y9tiVLCK21QyoA3MnSu9ritFn/6F9MrVO9jkip4wRBcp0k45CjVkJUuBhVpHNpnTY3wZh6OoUlG
 mV8cCDKg5Tj0k84QrYotPF8vdB7G9weyZs/J9YvUeKrlL2z7chEi014qazhOFgKP38gbscN6HpN
 NSi6nDeePvNKpOuiBISVt3QjwDcvsjiFU5Y6VP3hsSnh/b6+5YzqiiiTq4whf6j8l46jUbiWO0j
 8e5B+rO8XGjU/ChE2nfFJpZ5Gg9AIYyUZKiNw4/+Yd0YAjKcqdYUrik/Yvr/8SBfQ8eyguuIBpT
 pXqvJR6r2TVjlnDxntr0Vh3
X-Received: by 2002:a05:690c:101:b0:797:db54:b876 with SMTP id
 00721157ae682-7982902d571mr150381117b3.43.1772031133627; 
 Wed, 25 Feb 2026 06:52:13 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::5c0b])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-7982dd81e22sm57803827b3.33.2026.02.25.06.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Feb 2026 06:52:13 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, lijo.lazar@amd.com, superm1@kernel.org,
 mario.limonciello@amd.com, cesun102@amd.com, Leo.Lin@amd.com,
 Jammy.Zhou@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2] drm/amdgpu: Fix resource leaks
Date: Wed, 25 Feb 2026 08:51:54 -0600
Message-ID: <20260225145154.14168-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 26 Feb 2026 13:55:07 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,amd.com,kernel.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:lijo.lazar@amd.com,m:superm1@kernel.org,m:mario.limonciello@amd.com,m:cesun102@amd.com,m:Leo.Lin@amd.com,m:Jammy.Zhou@amd.com,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ethantidmore06@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 72F9D1A70EC
X-Rspamd-Action: no action

There are multiple resource leaks due to ioremap() being used and
iounmap never being called in multiple possible error paths.

Change ioremap() to devm_ioremap() to fix all resource leaks at
once.

Detected by Smatch:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4834 amdgpu_device_init() warn:
'adev->rmmio' from ioremap() not released on lines:
4539,4549,4563,4574,4592,4834.

Fixes: d38ceaf99ed01 ("drm/amdgpu: add core driver (v4)")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Removed unused variable idx.

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 0acddcb04730..3bc685162974 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4520,7 +4520,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	for (i = 0; i < AMD_IP_BLOCK_TYPE_NUM; i++)
 		atomic_set(&adev->pm.pwr_state[i], POWER_STATE_UNKNOWN);
 
-	adev->rmmio = ioremap(adev->rmmio_base, adev->rmmio_size);
+	adev->rmmio = devm_ioremap(adev->dev, adev->rmmio_base, adev->rmmio_size);
 	if (!adev->rmmio)
 		return -ENOMEM;
 
@@ -4843,8 +4843,6 @@ static void amdgpu_device_unmap_mmio(struct amdgpu_device *adev)
 	/* Unmap all mapped bars - Doorbell, registers and VRAM */
 	amdgpu_doorbell_fini(adev);
 
-	iounmap(adev->rmmio);
-	adev->rmmio = NULL;
 	if (adev->mman.aper_base_kaddr)
 		iounmap(adev->mman.aper_base_kaddr);
 	adev->mman.aper_base_kaddr = NULL;
@@ -4927,7 +4925,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 {
-	int i, idx;
+	int i;
 	bool px;
 
 	amdgpu_device_ip_fini(adev);
@@ -4970,13 +4968,6 @@ void amdgpu_device_fini_sw(struct amdgpu_device *adev)
 	if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
 		vga_client_unregister(adev->pdev);
 
-	if (drm_dev_enter(adev_to_drm(adev), &idx)) {
-
-		iounmap(adev->rmmio);
-		adev->rmmio = NULL;
-		drm_dev_exit(idx);
-	}
-
 	if (IS_ENABLED(CONFIG_PERF_EVENTS))
 		amdgpu_pmu_fini(adev);
 	if (adev->discovery.bin)
-- 
2.53.0

