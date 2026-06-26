Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmPGBUUwPmq0BAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E176CB245
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 09:54:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=usp.br header.s=usp-google header.b=dLNPlVo4;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=usp.br
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B787E10F4A7;
	Fri, 26 Jun 2026 07:54:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A4310F3F4
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 02:51:28 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-30c99ccb1afso447817eec.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2026 19:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1782442288; x=1783047088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtS/kmZ/uTxQKqZxPH1/+2V/jDxVEHNoVXNcZX4R18E=;
 b=dLNPlVo4zZTTbMISZiCax6utHH3x98j6a9NExigEtydem6RYEfj2aO3V6CaCx49lOT
 ke7wU6U+IXyJ1c0C7ylzOg82/2ZkgTI+qxjZ40QDURM9Qq5XMvelGReO3NicA5Gqlwwk
 tcFjry2T9DojLVXku6zvmFJ/bpxdnxLlLIgQkg5AFtsdMvCVWe6tEiIk+dgU/4loISrS
 kpqoTYt5yCNdP/CaJ+3ul0riFTho15jv46p5NQMnyk5HRjhuZJJFUBqzgqgk+mINR5DN
 40Jo1CxHxEwfumcptSu4fY0Hy/lX8iLVeVT5TGQwUKhgBpchb9bHjErnmVGjNYNQY4Uv
 7jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782442288; x=1783047088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JtS/kmZ/uTxQKqZxPH1/+2V/jDxVEHNoVXNcZX4R18E=;
 b=P0CrlcFFF0OynjNQ8lPwJO2h8w1p4lsWVnhWuykaIT4lSmsNLlrvK0mrSAGxIbKXeE
 p/KO8EtoWDyy+mtgY92n8w6r2lit8UecxKHSx1vTwYFku14XMzcOu5B+Y4f7OIvhQOyQ
 pRSLl/QCfYDQbnGiYvBLKFIjerjRsUb90dj800rcLOrFsbTAaLPSZke0H3q7CB5u7HUC
 tojO4aEHFE4rSQa5T3FcDPSZ8F+8nI0vQleFdlomJvY/Gv9hAmXnwGDkgwZQkt0TxdvL
 WF1LXDp3oQTO3M9mzWvL0NFeWSNmY/DixXYZZLNRgI+Z44EVPZ3BGtUBrmQ8J8Zkxjau
 QitQ==
X-Gm-Message-State: AOJu0YwXwW2fCnydfzZTuV9ANcPNc1Hq73kaVfe/ybOx4nrL3PsjSXaI
 ZuKLjiAvK+Tuf7nEnunsna5ioQwGXRrwcbdusWefe4iyxP8xefDm+aKVT+Z7y+TsskaVxjM1Kk9
 UccfF0isQsg==
X-Gm-Gg: AfdE7cluhgY0fYiuxaVLI6prW8EmEonA0bwCmUrYfHRMHVbU3h/02EHnQShrUibpdsE
 /hu/xfs6XqNhWTiRHh/9mvDa0ao6temdLxbbTp8hM34OlY4fy5gcV39u0zK6W5XnF73aB5Ukprc
 86m8WuyzmXANIZmwY/yGgoX+qFA5PkNVFr4XTo9SxuM1q1YnRiICpsOssbJtlY9C3EUYA4o6jNG
 RvH0tt8eut625dFYQ6eWepN13Rd2X0awfrYlopM8uESSp1ImZAyURQGUEAFIV5Ni1/YRFKlga4P
 Vm035NofIXVmoTZSadXJEJ6LMWWg6YTFS6zojvLk2FxiNZxQkrdzNERU1VwBRIu40nTcmay8eWp
 ohvUcDUuvNHplLsKkBOi9D7gAIb7e2QdPGbS6HkY+qv2z6BYlx15iBNWLQZmBFCaUZH8tRlaZ3g
 RpMSvuD/K1/MEYrjHEht4RXynsVV3fGlB5YxwYQK+z29hDobTPSuLYbZ+ETom5XJ1WAE1H1Q==
X-Received: by 2002:a05:693c:88c8:20b0:30c:9cea:563a with SMTP id
 5a478bee46e88-30c9cea5670mr469061eec.24.1782442287594; 
 Thu, 25 Jun 2026 19:51:27 -0700 (PDT)
Received: from voyager.. ([179.119.40.186]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30c7ca438ddsm12905797eec.23.2026.06.25.19.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2026 19:51:27 -0700 (PDT)
From: Tiago Dourado <tiagodourado@usp.br>
To: amd-gfx@lists.freedesktop.org, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, simona@ffwll.ch
Cc: luiz.f.f.fernandes@usp.br, Tiago Dourado <tiagodourado@usp.br>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/amdgpu/jpeg: deduplicate jpeg_v5_3_0
 process_interrupt
Date: Thu, 25 Jun 2026 23:47:24 -0300
Message-ID: <20260626024948.19131-3-tiagodourado@usp.br>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626024948.19131-1-tiagodourado@usp.br>
References: <20260626024948.19131-1-tiagodourado@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 26 Jun 2026 07:54:04 +0000
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
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[usp.br,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[usp.br:s=usp-google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,gmail.com,amd.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tiagodourado@usp.br,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[usp.br:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,usp.br:dkim,usp.br:email,usp.br:mid,usp.br:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6E176CB245

The jpeg_v5_3_0_process_interrupt function is identical to
jpeg_v5_0_0_process_interrupt. Remove the duplicate implementation
in jpeg_v5_3_0 and assign the jpeg_v5_0_0 version directly to the irq_funcs struct.
Export jpeg_v5_0_0_process_interrupt through jpeg_v5_0_0.h to allow
cross-version reuse.

Signed-off-by: Tiago Dourado <tiagodourado@usp.br>
Co-developed-by: Luiz Fernandes <luiz.f.f.fernandes@usp.br>
Signed-off-by: Luiz Fernandes <luiz.f.f.fernandes@usp.br>
---

v2:
- Assigned function directly to irq_funcs instead of using a macro.

 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h |  4 ++++
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c | 22 ++--------------------
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
index 46bf15dce..4575d1f9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c
@@ -625,7 +625,7 @@ static int jpeg_v5_0_0_set_interrupt_state(struct amdgpu_device *adev,
 	return 0;
 }
 
-static int jpeg_v5_0_0_process_interrupt(struct amdgpu_device *adev,
+int jpeg_v5_0_0_process_interrupt(struct amdgpu_device *adev,
 				      struct amdgpu_irq_src *source,
 				      struct amdgpu_iv_entry *entry)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h
index 5abb96159..4eeb0c147 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h
@@ -32,4 +32,8 @@
 
 extern const struct amdgpu_ip_block_version jpeg_v5_0_0_ip_block;
 
+int jpeg_v5_0_0_process_interrupt(struct amdgpu_device *adev,
+				  struct amdgpu_irq_src *source,
+				  struct amdgpu_iv_entry *entry);
+
 #endif /* __JPEG_V5_0_0_H__ */
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
index 1821dced9..a67c6e916 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_3_0.c
@@ -32,6 +32,7 @@
 #include "vcn/vcn_5_3_0_offset.h"
 #include "vcn/vcn_5_3_0_sh_mask.h"
 #include "ivsrcid/vcn/irqsrcs_vcn_5_0.h"
+#include "jpeg_v5_0_0.h"
 #include "jpeg_v5_3_0.h"
 
 static void jpeg_v5_3_0_set_dec_ring_funcs(struct amdgpu_device *adev);
@@ -608,25 +609,6 @@ static int jpeg_v5_3_0_set_interrupt_state(struct amdgpu_device *adev,
 	return 0;
 }
 
-static int jpeg_v5_3_0_process_interrupt(struct amdgpu_device *adev,
-				      struct amdgpu_irq_src *source,
-				      struct amdgpu_iv_entry *entry)
-{
-	DRM_DEBUG("IH: JPEG TRAP\n");
-
-	switch (entry->src_id) {
-	case VCN_5_0__SRCID__JPEG_DECODE:
-		amdgpu_fence_process(adev->jpeg.inst->ring_dec);
-		break;
-	default:
-		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
-			  entry->src_id, entry->src_data[0]);
-		break;
-	}
-
-	return 0;
-}
-
 static int jpeg_v5_3_0_ring_reset(struct amdgpu_ring *ring,
 				  unsigned int vmid,
 				  struct amdgpu_fence *timedout_fence)
@@ -696,7 +678,7 @@ static void jpeg_v5_3_0_set_dec_ring_funcs(struct amdgpu_device *adev)
 
 static const struct amdgpu_irq_src_funcs jpeg_v5_3_0_irq_funcs = {
 	.set = jpeg_v5_3_0_set_interrupt_state,
-	.process = jpeg_v5_3_0_process_interrupt,
+	.process = jpeg_v5_0_0_process_interrupt,
 };
 
 static void jpeg_v5_3_0_set_irq_funcs(struct amdgpu_device *adev)
-- 
2.43.0

