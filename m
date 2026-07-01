Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZrfAMqM9RWq79AoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:39 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560616EFA73
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Zg+LCZTr;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF49910E3DE;
	Wed,  1 Jul 2026 16:17:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 409CA10EECD
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 16:17:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4921eed3fa2so5934275e9.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Jul 2026 09:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782922655; x=1783527455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rb34oSlRm8xuknA5nzYeSB9cTOq95LqjBQ6dYTj5ggQ=;
 b=Zg+LCZTrSj7RpP67GzuK15KxrvUz7FrOaNu6DWHTDAN+5ADHPFkMylz07UGd1Ufj2+
 PUFIzgVAh2/eH3v2ZdYk1k1DtD5MihVzqGogtGeiZj/WnjgrDGPtxJjQuaH1Pa1dYDgp
 sC/qh+E7W4FsF4iousIvVQ7l0+2aLEb73DViAxJehMJJpTTnntrfwL37wEHjnsisq/Yj
 hIo+ayHEoysg8lc8TD57NxrNU124+ShlvQWUyMRAyzhZZL24JvXJ5G86pj2QK86zJPuS
 fA4RKKUgt7iDeXNdnsBvFb1eMiqEBfuSEbhCr3C6G9KwuJdLiDUx33trMzH2Q7iQJWmb
 qcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782922655; x=1783527455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rb34oSlRm8xuknA5nzYeSB9cTOq95LqjBQ6dYTj5ggQ=;
 b=I3WXzL7sr+mkf0Llc7ubbIZktLg1Mlyq3FolJAxqeJoYDKs21esJc+vTOdpV5XRz37
 fhho0x6SBJhMqoGaVspEzGc99igaaQmjJu+nxYUrEV6dHbGHH3kbhmpQx98K2O4avC2T
 AcwKuDuMQl28Gx+0ggZ1LwCm4kTYMNHPq/snEJNnzDxw7bR4APx+ZSnPRp9dPrjTsyZV
 nQ9qZdV3Yvuh4B8zRstg5U8ux5KornrBAzgDg/w5MKWZIfqE9ZIFtPVuz3Y6jH53hKVU
 VzIdMuwcckTteSUXE9EmJosYPmRfcQQl9uGSGDmGqUI2LAdZZ4OejjUuIWxtCKgqLzY/
 Sfuw==
X-Gm-Message-State: AOJu0Yw/def+IKqJTLcDUqbnVOZeuCXBZqqewfMAIHTUfS5zv2leOA/P
 xTFtfocEg8QdbHbvWQuS09zVMdCDRtkF2n39tXppoTRojETk9IG2hAQRlwveYyyk
X-Gm-Gg: AfdE7cmLqQKBGXBsiLFiFjEu2peRbw56xv/TitQ4jFqTIZe2H6tWuM6Uuj9qs7rjMel
 5wsrP38cxYsJGLPSvOCXFfof+n09m5V4i/crlklfSl+zuK0SMFM56Z4J23/5eI2kikeq2Dtv2RN
 zJsZtvLSqwhei1EKPVVLUszXDbolkd6aqqjK2j0vCPnunZ1zX5k5ZzDkkub5e5cZtxH9W7spETh
 SEYm3gEr6exJiDaSIO4u3BhVYBjQeZ/EpkGKj/HZctSquGu9Z3GA5Cl0BfT60rPraKVOLHf34B+
 Z8OBkBvYzR9AXCmTc6tsTU+rEdZuGXEJ7H4MKo05ie8L+mlCmtO0pVutxEfI7ByS4TqRvsL2EW/
 qhCvBH/eTg8Oyj2fRaIBDkBp7KCftgsugpsMobSXZXpZeP+DVLH3ySh+ybQ08BSbmlGFEYYHeXY
 K8fdIrHrhtrpEYS2hI
X-Received: by 2002:a05:600d:4452:10b0:493:bdde:e400 with SMTP id
 5b1f17b1804b1-493c2b38c42mr28609095e9.4.1782922655242; 
 Wed, 01 Jul 2026 09:17:35 -0700 (PDT)
Received: from Timur-Max ([212.108.193.106]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm168812255e9.12.2026.07.01.09.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 09:17:34 -0700 (PDT)
From: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
To: amd-gfx@lists.freedesktop.org, Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Amir Shetaia <Amir.Shetaia@amd.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Siwei He <siwei.he@amd.com>, Philip Yang <philip.yang@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>
Cc: =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 03/14] drm/amdgpu/ih: Don't perturb HW registers when
 accessing soft IH ring
Date: Wed,  1 Jul 2026 18:17:10 +0200
Message-ID: <20260701161721.85681-4-timur.kristof@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701161721.85681-1-timur.kristof@gmail.com>
References: <20260701161721.85681-1-timur.kristof@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmx.de,gmail.com,ursulin.net];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[gmail.com,igalia.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[timurkristof@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 560616EFA73

The soft IH ring is implemented entirely in software.
We shouldn't read (or write) any HW registers when accessing it.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c   | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c   | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c   | 7 +++++++
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 4 ++++
 4 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
index 333e9c30c091..65e5d21753f9 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_0.c
@@ -439,6 +439,10 @@ static u32 ih_v6_0_get_wptr(struct amdgpu_device *adev,
 	struct amdgpu_ih_regs *ih_regs;
 
 	wptr = le32_to_cpu(*ih->wptr_cpu);
+
+	if (ih == &adev->irq.ih_soft)
+		goto out;
+
 	ih_regs = &ih->ih_regs;
 
 	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
@@ -514,6 +518,9 @@ static void ih_v6_0_set_rptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_ih_regs *ih_regs;
 
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	if (ih->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
 		*ih->rptr_cpu = ih->rptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
index 699c274d357e..9dbc20131410 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v6_1.c
@@ -410,6 +410,10 @@ static u32 ih_v6_1_get_wptr(struct amdgpu_device *adev,
 	struct amdgpu_ih_regs *ih_regs;
 
 	wptr = le32_to_cpu(*ih->wptr_cpu);
+
+	if (ih == &adev->irq.ih_soft)
+		goto out;
+
 	ih_regs = &ih->ih_regs;
 
 	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
@@ -481,6 +485,9 @@ static void ih_v6_1_irq_rearm(struct amdgpu_device *adev,
 static void ih_v6_1_set_rptr(struct amdgpu_device *adev,
 			       struct amdgpu_ih_ring *ih)
 {
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	struct amdgpu_ih_regs *ih_regs;
 
 	if (ih->use_doorbell) {
diff --git a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
index 6de9e87e04e1..bd332e8cc5bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/ih_v7_0.c
@@ -457,6 +457,10 @@ static u32 ih_v7_0_get_wptr(struct amdgpu_device *adev,
 	struct amdgpu_ih_regs *ih_regs;
 
 	wptr = le32_to_cpu(*ih->wptr_cpu);
+
+	if (ih == &adev->irq.ih_soft)
+		goto out;
+
 	ih_regs = &ih->ih_regs;
 
 	if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
@@ -527,6 +531,9 @@ static void ih_v7_0_set_rptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_ih_regs *ih_regs;
 
+	if (ih == &adev->irq.ih_soft)
+		return;
+
 	if (ih->use_doorbell) {
 		/* XXX check if swapping is necessary on BE */
 		*ih->rptr_cpu = ih->rptr;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 4cd325149b63..e7ed37bb48e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -417,6 +417,10 @@ static u32 navi10_ih_get_wptr(struct amdgpu_device *adev,
 		 */
 		wptr = le32_to_cpu(*ih->wptr_cpu);
 
+		if (ih == &adev->irq.ih_soft)
+			goto out;
+
+
 		if (!REG_GET_FIELD(wptr, IH_RB_WPTR, RB_OVERFLOW))
 			goto out;
 	}
-- 
2.54.0

