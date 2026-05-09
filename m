Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKXTA5uFAWoFcAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 11 May 2026 09:30:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EA2509366
	for <lists+amd-gfx@lfdr.de>; Mon, 11 May 2026 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DFC10E4DD;
	Mon, 11 May 2026 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z89L4ZST";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com
 [74.125.82.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CFE610E062
 for <amd-gfx@lists.freedesktop.org>; Sat,  9 May 2026 02:04:12 +0000 (UTC)
Received: by mail-dy1-f196.google.com with SMTP id
 5a478bee46e88-2ee990e8597so4551722eec.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 08 May 2026 19:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778292251; x=1778897051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tqUPrapJmfk162jOprC1A32Q+Yo8c7HKbfTLBNJ4ZkA=;
 b=Z89L4ZSTY3YynYeQccIBQoBWvtEc02wrpuJ65Q17FYmNDcBitWBClfUMop04yOjof4
 35EiwORDEV9RKOmL1mbugI2RJSvLgFp7tM9pyZQMcHnHIpaEH5iDgfdtzchIpmz6PNVg
 s5uBwi81pZ5GBJkpuXP/la+AfsBu34SGq/LlolWCOMnwYw4/b2jEwqoplL0Rpqi0S0KD
 nQ/8YwKAjDzA9xtA6HRCTA7QfJ3dZdq7mDgrMwARlJc3NoMHE7ruYNjBjEm+bemiwicK
 /N6M/nSAU6t6qjZssXhh0AWZy2HfdFsVN7rhQNzHsbwiMwTltr9wtyf4UVbCtiXmNMZ8
 uGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778292251; x=1778897051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tqUPrapJmfk162jOprC1A32Q+Yo8c7HKbfTLBNJ4ZkA=;
 b=oad4BSok/o5O4VOC515YcTKH+ISYTFecpQ6RGHruDJvkGaCT27/tiftsCR5f0ygA4u
 lqvDskgjyTyxmzNHmhFv5b93ZR/M3aYJttS+udo0h3KGlMc+bAn04Fy2anWoPLi9hFDo
 5HQKp7+zIksn6KO4oGfVxvkh67KRJzBBWPWMIrcHps8hrfU15op5gbxM1sPvU0hx6QRT
 mEN9XX4zuC1V9VASM1tc9hTK8+yiWfc089DqEOWLenCcro2NUFksB9AA8F1dsrdAK3+p
 hezGjC7o7YEcxUVYMvCs4Wss5FP23KI+dRG8k8Hz8OIjNbWOFrPzP2SnUMmVRX6SE6M2
 LRoQ==
X-Gm-Message-State: AOJu0YzQOVre6jIqwDnBFPkuV8CaPe+cwj5JOzdLJasHHQvsflqjQ+EQ
 Bwq+fLXMr8vTqyQ0/mHz7DwfsEfZdjny1Pd9KJLdLesrRot/H6kEU8mQvmg0C7zSDKY=
X-Gm-Gg: AeBDievkjIR41Hmp9bQ/zq+D2+Qwa8/TM2zBRc4Rlq3uACTB7m7vU8r5XP+hhc3FByb
 zOaU6T2Ds2/Qc3e/toyAdDzrXZBOjVWBP02/EeeX7PEBNdeIe3XvvpTD9wBET7/Xrp3bGhGUnP0
 Orsm4XJ95BmmJLt/QUqnpkHdqeWLmXIS70H/0sKzeDQ8nT7PV4radJVy8C2IxC46xVdkvtiFJAe
 qPP/xN2hdg6Evi4S0q+2LuCXMYYRs/SjGORsoExgg4es/QPArjNZoxg9xQEXl8aa6ti6MJA80I0
 K1UAUXooZU/LGy9PiDNp6hkpgTOU9rX9KbZrb6lI14NelddtrGt3NbdvJjBylQ6OmfVkAIPYU1S
 LNQk2Rpqjii6HY4tcuZc4eGQoWxlkwHowt365yWR0CJ9xHPFZc2c+sYMJDo+G9PrQu0cnpSgBfz
 HutE5zkSYjrm7BGcjY2ZsFqbGXwSFNzmOdfaNWSz/ARtZ3oVn4TOaZ
X-Received: by 2002:a05:7300:bc1a:b0:2c7:ea98:da0 with SMTP id
 5a478bee46e88-2f54ac74b5fmr6826709eec.19.1778292250853; 
 Fri, 08 May 2026 19:04:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:1b3:a540:acd8:1326:c2e7:da88:93e])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2f8859eafcdsm5895619eec.6.2026.05.08.19.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 19:04:10 -0700 (PDT)
From: Andre Luiz Batista Bueno <andrebueno.mac@gmail.com>
To: amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: enzo.spinella@usp.br, Andre Luiz Batista Bueno <andrebueno.mac@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH V1 RESEND] drm/amdgpu: deduplicate JPEG v5.0 interrupt routine
Date: Fri,  8 May 2026 23:03:35 -0300
Message-ID: <20260509020339.262889-1-andrebueno.mac@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 May 2026 07:30:27 +0000
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
X-Rspamd-Queue-Id: 95EA2509366
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[53];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lists.freedesktop.org,amd.com,gmail.com,ffwll.ch];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.978];
	FROM_NEQ_ENVFROM(0.00)[andrebuenomac@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[usp.br,gmail.com,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,usp.br:email]
X-Rspamd-Action: no action

Both jpeg_v5_0_1.c and jpeg_v5_0_2.c implement identical
interrupt processing routines. To avoid code duplication,
extract this implementation into a shared common function
in new jpeg_v5_0_interrupt.c and .h files.

Signed-off-by: Andre Luiz Batista Bueno <andrebueno.mac@gmail.com>
Co-developed-by: Enzo Furegatti Spinella <enzo.spinella@usp.br>
Signed-off-by: Enzo Furegatti Spinella <enzo.spinella@usp.br>
---
 drivers/gpu/drm/amd/amdgpu/Makefile           |  1 +
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c      | 57 +----------------
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c      | 57 +----------------
 .../gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.c  | 64 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.h  | 12 ++++
 5 files changed, 83 insertions(+), 108 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.c
 create mode 100644 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.h

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index db66c6372199..69e5e55e1a2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -229,6 +229,7 @@ amdgpu-y += \
 	jpeg_v5_0_0.o \
 	jpeg_v5_0_1.o \
 	jpeg_v5_0_2.o \
+	jpeg_v5_0_interrupt.o \
 	jpeg_v5_3_0.o
 
 # add VPE block
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
index edecbfe66c79..6e5611921eda 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c
@@ -34,6 +34,8 @@
 #include "vcn/vcn_5_0_0_sh_mask.h"
 #include "ivsrcid/vcn/irqsrcs_vcn_5_0.h"
 
+#include "jpeg_v5_0_interrupt.h"
+
 static int jpeg_v5_0_1_start_sriov(struct amdgpu_device *adev);
 static void jpeg_v5_0_1_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v5_0_1_set_irq_funcs(struct amdgpu_device *adev);
@@ -759,60 +761,7 @@ static int jpeg_v5_0_1_process_interrupt(struct amdgpu_device *adev,
 					 struct amdgpu_irq_src *source,
 					 struct amdgpu_iv_entry *entry)
 {
-	u32 i, inst;
-
-	i = node_id_to_phys_map[entry->node_id];
-	DRM_DEV_DEBUG(adev->dev, "IH: JPEG TRAP\n");
-
-	for (inst = 0; inst < adev->jpeg.num_jpeg_inst; ++inst)
-		if (adev->jpeg.inst[inst].aid_id == i)
-			break;
-
-	if (inst >= adev->jpeg.num_jpeg_inst) {
-		dev_WARN_ONCE(adev->dev, 1,
-			      "Interrupt received for unknown JPEG instance %d",
-			      entry->node_id);
-		return 0;
-	}
-
-	switch (entry->src_id) {
-	case VCN_5_0__SRCID__JPEG_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[0]);
-		break;
-	case VCN_5_0__SRCID__JPEG1_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[1]);
-		break;
-	case VCN_5_0__SRCID__JPEG2_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[2]);
-		break;
-	case VCN_5_0__SRCID__JPEG3_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[3]);
-		break;
-	case VCN_5_0__SRCID__JPEG4_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[4]);
-		break;
-	case VCN_5_0__SRCID__JPEG5_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[5]);
-		break;
-	case VCN_5_0__SRCID__JPEG6_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[6]);
-		break;
-	case VCN_5_0__SRCID__JPEG7_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[7]);
-		break;
-	case VCN_5_0__SRCID__JPEG8_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[8]);
-		break;
-	case VCN_5_0__SRCID__JPEG9_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[9]);
-		break;
-	default:
-		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
-			      entry->src_id, entry->src_data[0]);
-		break;
-	}
-
-	return 0;
+	return jpeg_v5_0_process_interrupt_common(adev, entry);
 }
 
 static void jpeg_v5_0_1_core_stall_reset(struct amdgpu_ring *ring)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c
index 285c459379c4..daea95907639 100644
--- a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_2.c
@@ -34,6 +34,8 @@
 #include "vcn/vcn_5_0_0_sh_mask.h"
 #include "ivsrcid/vcn/irqsrcs_vcn_5_0.h"
 
+#include "jpeg_v5_0_interrupt.h"
+
 static void jpeg_v5_0_2_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void jpeg_v5_0_2_set_irq_funcs(struct amdgpu_device *adev);
 static int jpeg_v5_0_2_set_powergating_state(struct amdgpu_ip_block *ip_block,
@@ -587,60 +589,7 @@ static int jpeg_v5_0_2_process_interrupt(struct amdgpu_device *adev,
 					 struct amdgpu_irq_src *source,
 					 struct amdgpu_iv_entry *entry)
 {
-	u32 i, inst;
-
-	i = node_id_to_phys_map[entry->node_id];
-	DRM_DEV_DEBUG(adev->dev, "IH: JPEG TRAP\n");
-
-	for (inst = 0; inst < adev->jpeg.num_jpeg_inst; ++inst)
-		if (adev->jpeg.inst[inst].aid_id == i)
-			break;
-
-	if (inst >= adev->jpeg.num_jpeg_inst) {
-		dev_WARN_ONCE(adev->dev, 1,
-			      "Interrupt received for unknown JPEG instance %d",
-			      entry->node_id);
-		return 0;
-	}
-
-	switch (entry->src_id) {
-	case VCN_5_0__SRCID__JPEG_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[0]);
-		break;
-	case VCN_5_0__SRCID__JPEG1_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[1]);
-		break;
-	case VCN_5_0__SRCID__JPEG2_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[2]);
-		break;
-	case VCN_5_0__SRCID__JPEG3_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[3]);
-		break;
-	case VCN_5_0__SRCID__JPEG4_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[4]);
-		break;
-	case VCN_5_0__SRCID__JPEG5_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[5]);
-		break;
-	case VCN_5_0__SRCID__JPEG6_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[6]);
-		break;
-	case VCN_5_0__SRCID__JPEG7_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[7]);
-		break;
-	case VCN_5_0__SRCID__JPEG8_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[8]);
-		break;
-	case VCN_5_0__SRCID__JPEG9_DECODE:
-		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[9]);
-		break;
-	default:
-		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
-			      entry->src_id, entry->src_data[0]);
-		break;
-	}
-
-	return 0;
+	return jpeg_v5_0_process_interrupt_common(adev, entry);
 }
 
 static void jpeg_v5_0_2_core_stall_reset(struct amdgpu_ring *ring)
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.c b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.c
new file mode 100644
index 000000000000..a76ee6586b63
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+#include "amdgpu.h"
+#include "ivsrcid/vcn/irqsrcs_vcn_5_0.h"
+#include "jpeg_v5_0_interrupt.h"
+
+int jpeg_v5_0_process_interrupt_common(struct amdgpu_device *adev,
+				       struct amdgpu_iv_entry *entry)
+{
+	u32 i, inst;
+
+	i = node_id_to_phys_map[entry->node_id];
+	DRM_DEV_DEBUG(adev->dev, "IH: JPEG TRAP\n");
+
+	for (inst = 0; inst < adev->jpeg.num_jpeg_inst; ++inst)
+		if (adev->jpeg.inst[inst].aid_id == i)
+			break;
+
+	if (inst >= adev->jpeg.num_jpeg_inst) {
+		dev_WARN_ONCE(adev->dev, 1,
+			      "Interrupt received for unknown JPEG instance %d",
+			      entry->node_id);
+		return 0;
+	}
+
+	switch (entry->src_id) {
+	case VCN_5_0__SRCID__JPEG_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[0]);
+		break;
+	case VCN_5_0__SRCID__JPEG1_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[1]);
+		break;
+	case VCN_5_0__SRCID__JPEG2_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[2]);
+		break;
+	case VCN_5_0__SRCID__JPEG3_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[3]);
+		break;
+	case VCN_5_0__SRCID__JPEG4_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[4]);
+		break;
+	case VCN_5_0__SRCID__JPEG5_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[5]);
+		break;
+	case VCN_5_0__SRCID__JPEG6_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[6]);
+		break;
+	case VCN_5_0__SRCID__JPEG7_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[7]);
+		break;
+	case VCN_5_0__SRCID__JPEG8_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[8]);
+		break;
+	case VCN_5_0__SRCID__JPEG9_DECODE:
+		amdgpu_fence_process(&adev->jpeg.inst[inst].ring_dec[9]);
+		break;
+	default:
+		DRM_DEV_ERROR(adev->dev, "Unhandled interrupt: %d %d\n",
+			      entry->src_id, entry->src_data[0]);
+		break;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.h b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.h
new file mode 100644
index 000000000000..046bcb4a3906
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_interrupt.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __JPEG_V5_0_INTERRUPT_H__
+#define __JPEG_V5_0_INTERRUPT_H__
+
+struct amdgpu_device;
+struct amdgpu_iv_entry;
+
+int jpeg_v5_0_process_interrupt_common(struct amdgpu_device *adev,
+				       struct amdgpu_iv_entry *entry);
+
+#endif /* __JPEG_V5_0_INTERRUPT_H__ */
-- 
2.43.0

