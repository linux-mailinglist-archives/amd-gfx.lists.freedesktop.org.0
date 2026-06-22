Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Yo1cJt4lOWrenQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:02 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 468436AF4E4
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=Kdmbpuxb;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DBF10E66E;
	Mon, 22 Jun 2026 12:08:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38210E66B
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=guZAzR/HaPX5nouPkmmOndViroP4NBu1zWWoLuifdnY=; b=KdmbpuxbSIX6pw0LOgarVfsGgY
 7w9uepKokSTwuXTGOOc0Zj6cy5SKH01h5IFsKF/RYbcFhQqu0xQTeCD5ICVcaL16AFXiBgydpvXWs
 vno3Xe1L07q1otY6zAtdsfsxhVnKS8gwTa7VadGFhBbkRkvsNm8k4Z7yY7OIHFiyywd+35U6CJM1G
 7ellaSCP3l0xotagWpZn86rqnyg8MFlIg+qyt98bTBY28F/Qr46hFOkBIEQ80vKaH8x4eM8QR5ZWS
 pvFlqm6ki3m1ej023UPDGKL2dCwJMP3wwPws13y6a6ovqNjbXCJ/tHH8SJ1EFpCQL4fmrhe64bwNa
 3xthQJNA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wbdSR-003izE-G0; Mon, 22 Jun 2026 14:08:55 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 05/16] drm/amdgpu: More compact SI SDMA emission
Date: Mon, 22 Jun 2026 13:08:24 +0100
Message-ID: <20260622120835.52473-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622120835.52473-1-tvrtko.ursulin@igalia.com>
References: <20260622120835.52473-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 468436AF4E4

Avoid constant register reloads while emitting IBs by using a local write
pointer and only updating the size at the end of each helper.
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/si_dma.c | 84 +++++++++++++++++------------
 1 file changed, 51 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 549708075eb4..6343d14512fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -322,14 +322,16 @@ static void si_dma_vm_copy_pte(struct amdgpu_ib *ib,
 			       uint64_t pe, uint64_t src,
 			       unsigned count)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned bytes = count * 8;
 
-	ib->ptr[ib->length_dw++] = DMA_PACKET(DMA_PACKET_COPY,
-					      1, 0, 0, bytes);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = lower_32_bits(src);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe) & 0xff;
-	ib->ptr[ib->length_dw++] = upper_32_bits(src) & 0xff;
+	*ptr++ = DMA_PACKET(DMA_PACKET_COPY, 1, 0, 0, bytes);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = lower_32_bits(src);
+	*ptr++ = upper_32_bits(pe) & 0xff;
+	*ptr++ = upper_32_bits(src) & 0xff;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -347,16 +349,19 @@ static void si_dma_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
 				uint64_t value, unsigned count,
 				uint32_t incr)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned ndw = count * 2;
 
-	ib->ptr[ib->length_dw++] = DMA_PACKET(DMA_PACKET_WRITE, 0, 0, 0, ndw);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
+	*ptr++ = DMA_PACKET(DMA_PACKET_WRITE, 0, 0, 0, ndw);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = upper_32_bits(pe);
 	for (; ndw > 0; ndw -= 2) {
-		ib->ptr[ib->length_dw++] = lower_32_bits(value);
-		ib->ptr[ib->length_dw++] = upper_32_bits(value);
+		*ptr++ = lower_32_bits(value);
+		*ptr++ = upper_32_bits(value);
 		value += incr;
 	}
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -376,6 +381,7 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *ib,
 				     uint64_t addr, unsigned count,
 				     uint32_t incr, uint64_t flags)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	uint64_t value;
 	unsigned ndw;
 
@@ -390,19 +396,21 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *ib,
 			value = 0;
 
 		/* for physically contiguous pages (vram) */
-		ib->ptr[ib->length_dw++] = DMA_PTE_PDE_PACKET(ndw);
-		ib->ptr[ib->length_dw++] = pe; /* dst addr */
-		ib->ptr[ib->length_dw++] = upper_32_bits(pe) & 0xff;
-		ib->ptr[ib->length_dw++] = lower_32_bits(flags); /* mask */
-		ib->ptr[ib->length_dw++] = upper_32_bits(flags);
-		ib->ptr[ib->length_dw++] = value; /* value */
-		ib->ptr[ib->length_dw++] = upper_32_bits(value);
-		ib->ptr[ib->length_dw++] = incr; /* increment size */
-		ib->ptr[ib->length_dw++] = 0;
+		*ptr++ = DMA_PTE_PDE_PACKET(ndw);
+		*ptr++ = pe; /* dst addr */
+		*ptr++ = upper_32_bits(pe) & 0xff;
+		*ptr++ = lower_32_bits(flags); /* mask */
+		*ptr++ = upper_32_bits(flags);
+		*ptr++ = value; /* value */
+		*ptr++ = upper_32_bits(value);
+		*ptr++ = incr; /* increment size */
+		*ptr++ = 0;
 		pe += ndw * 4;
 		addr += (ndw / 2) * incr;
 		count -= ndw / 2;
 	}
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -414,8 +422,12 @@ static void si_dma_vm_set_pte_pde(struct amdgpu_ib *ib,
  */
 static void si_dma_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 {
-	while (ib->length_dw & 0x7)
-		ib->ptr[ib->length_dw++] = DMA_PACKET(DMA_PACKET_NOP, 0, 0, 0, 0);
+	int pad = 8 - (ib->length_dw & 0x7);
+
+	if (pad && pad < 8) {
+		memset32(ib->ptr, DMA_PACKET(DMA_PACKET_NOP, 0, 0, 0, 0), pad);
+		ib->length_dw += pad;
+	}
 }
 
 /**
@@ -795,12 +807,15 @@ static void si_dma_emit_copy_buffer(struct amdgpu_ib *ib,
 				       uint32_t byte_count,
 				       uint32_t copy_flags)
 {
-	ib->ptr[ib->length_dw++] = DMA_PACKET(DMA_PACKET_COPY,
-					      1, 0, 0, byte_count);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = lower_32_bits(src_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset) & 0xff;
-	ib->ptr[ib->length_dw++] = upper_32_bits(src_offset) & 0xff;
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
+	*ptr++ = DMA_PACKET(DMA_PACKET_COPY, 1, 0, 0, byte_count);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = lower_32_bits(src_offset);
+	*ptr++ = upper_32_bits(dst_offset) & 0xff;
+	*ptr++ = upper_32_bits(src_offset) & 0xff;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -818,11 +833,14 @@ static void si_dma_emit_fill_buffer(struct amdgpu_ib *ib,
 				       uint64_t dst_offset,
 				       uint32_t byte_count)
 {
-	ib->ptr[ib->length_dw++] = DMA_PACKET(DMA_PACKET_CONSTANT_FILL,
-					      0, 0, 0, byte_count / 4);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = src_data;
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset) << 16;
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
+	*ptr++ = DMA_PACKET(DMA_PACKET_CONSTANT_FILL, 0, 0, 0, byte_count / 4);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = src_data;
+	*ptr++ = upper_32_bits(dst_offset) << 16;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 
-- 
2.54.0

