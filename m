Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qa0cHqo9RWrB9AoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:46 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BBE6EFA8A
	for <lists+amd-gfx@lfdr.de>; Wed, 01 Jul 2026 18:17:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UXz5AxfF;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A685010F000;
	Wed,  1 Jul 2026 16:17:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696CB10F000
 for <amd-gfx@lists.freedesktop.org>; Wed,  1 Jul 2026 16:17:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493ba701891so5973935e9.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 01 Jul 2026 09:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782922663; x=1783527463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=5dh/jOWvZjnPY9lWxXw/QxeD/vswDImEal1N1owDB20=;
 b=UXz5AxfFVoMwLTXBhMuT4f3crpGTuY1nS0x6N1Rryq/8XbatEsi4qDtGIBDbMphmhQ
 INPSfKCkK7M2JmwFDe61RYVR4jBkviPOQje3mJZNLdcqOAf5Ap9v8CrdxYK9di8LOU4b
 WoSl2TMo0oQYT+XfloSr3SDyhihO4yvAYxDiL4bcUPAINe7gCWg0aZWVAoclLkSSwkB/
 hi3AN+q90+DGbE7YANMivbvVzb1bPegSF7G4AO88tVRssk1B+1EaQ6Dc2dRql6+G787t
 U1opjk4eXw24PCZLNsL+CGmg2n57bolWargCD4KtlzOtpYhQa2lplPbdwTilQ6PA+dXc
 SkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782922663; x=1783527463;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5dh/jOWvZjnPY9lWxXw/QxeD/vswDImEal1N1owDB20=;
 b=sEo94lxc1AfWSDW+3SE0Uj6YPkxb5XLl38nnYZUstIHu5FMS+Y81zb+OpxfIWFtPzZ
 FXXkYWj0hWTh1PykdqbEdeK0ZAtFi2bbF8LOfbwULHL14Jt7TSY2DxWS6fQxfiN98EX6
 QFtoiSFh/S6NKHJ5F3aJ9ZatrTYCl93UrahKBQoObtIevyc5AApGuD6xn6I3AcYUTZ8H
 70NOypy+oNn9xeaGgS4mtz0IxaBRevptTGVuLPO71jfr8pozucZQkY43WA1QSV7Mrot4
 S01rgwDya46ljY6+0kPv4DcjaN43/vGXIQXLc8Rr34D0Kkv4eF5Pysrm32szhpm3CnBn
 8UbQ==
X-Gm-Message-State: AOJu0Yy0EBsViZR/canNYKBBS0k0GU3k0P5NB+/fLsAtnDxDloDkTnyr
 kpCQ6MTRa37LQsRSYT+9CBq97v7qOLdIFbIVz7vP6qgOLMtuWzISxq8WOVJrhnAT
X-Gm-Gg: AfdE7cmLJGDTHaMn3PD8WiOKSG+NLKb/rNPA+FC1inAKFBtSFiuFmoCwi82x1IolMTh
 EmAmWvpgnQ1kB7TKmOqmpGAQhYGo6aXRlps/uuGEOoZc3FItAeGTGEp7uezUlB27kxclaguDElE
 l3LwoIpT1RHc7RIN4pquOADhh+f5gOREba4dsq7C9uqhurEUprnwiFoW8yQQ09UpPFxtOPi+CkF
 C+uh7E0FUbe7Pjzlvron1ut2iqCKXHdT6bpBEQpXGQYpCDWBReIiQ3L90bQwg+HjBRTnllUeB6R
 fQE75/vwXJT9V+sNBpRXqngDj3bhlOYtd7l9F8viSs4gqJdQrCo9eyPLKQkMJLcJsHvkDwPa4NX
 WFPCbQ9rwq8U4GZ1daIjxUh16j3gQm0lQZmoNoUmqNENjEwg7Dgmj+ycTxNFV1R50S+5eLmkaG5
 r7qpvHXg4iG8XZx5II
X-Received: by 2002:a05:600c:5307:b0:493:bc4a:c6b5 with SMTP id
 5b1f17b1804b1-493c3df7a3bmr20914485e9.39.1782922662653; 
 Wed, 01 Jul 2026 09:17:42 -0700 (PDT)
Received: from Timur-Max ([212.108.193.106]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493be81df2asm168812255e9.12.2026.07.01.09.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2026 09:17:42 -0700 (PDT)
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
Subject: [PATCH 08/14] drm/amdgpu/gmc12: Pass cam_index to retry fault handler
Date: Wed,  1 Jul 2026 18:17:15 +0200
Message-ID: <20260701161721.85681-9-timur.kristof@gmail.com>
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
X-Rspamd-Queue-Id: 26BBE6EFA8A

This is necessary if we want to make use of the filter CAM.

Signed-off-by: Timur Kristóf <timur.kristof@gmail.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
index 84c93364d220..299fe960b99e 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
@@ -99,6 +99,7 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
 	bool write_fault = !!(entry->src_data[1] &
 			      AMDGPU_GMC9_FAULT_SOURCE_DATA_WRITE);
 	uint32_t status = 0;
+	uint32_t cam_index;
 	u64 addr;
 
 	addr = (u64)entry->src_data[0] << 12;
@@ -110,7 +111,9 @@ static int gmc_v12_0_process_interrupt(struct amdgpu_device *adev,
 		hub = &adev->vmhub[AMDGPU_GFXHUB(0)];
 
 	if (retry_fault) {
-		int ret = amdgpu_gmc_handle_retry_fault(adev, entry, addr, 0, 0,
+		cam_index = entry->src_data[2] & 0x3ff;
+
+		int ret = amdgpu_gmc_handle_retry_fault(adev, entry, addr, cam_index, 0,
 							write_fault);
 		/* Returning 1 here also prevents sending the IV to the KFD */
 		if (ret == 1)
-- 
2.54.0

