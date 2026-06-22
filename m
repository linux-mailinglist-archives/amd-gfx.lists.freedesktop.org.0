Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AX9CM90lOWrdnQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:01 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4046AF4DD
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=FyQZ9Y8+;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D5E10E66F;
	Mon, 22 Jun 2026 12:08:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D4D10E66B
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 12:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=34WjMk9KydpUzsKPkmA/orbQUVn92NgABJLadHQsVwQ=; b=FyQZ9Y8+bwSV34FeZYYpA8krRe
 yB5xISuAyCFLlFwioSduSfqcd98KGFPo9Wk0IdS+RO5iRHwwfxp8G4ikMNpoxIivlgTz4N0M+NLA2
 RmkVfpoYd1pzxK6BQI1YOiaebPUjgxdoHYlC0f02tt7Xs+pDIThTxjf4qMTrVfUUUuFAN+VRVsPNy
 SXcG6YHAklCZrYDDT2gQiN7CwXy1TgygXd3hGcE/CRUOZQwifedgbcpfcPDvzTXmVJBf2HQcHuLcs
 dzC0kJXRxJzBs57v5Dxv+KN2phgjW28NvlewnwwB1V7/nO/ZIHcqQ+0ApnUdUr90dviaGHoJ3jt2e
 CrvbuSqA==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wbdSS-003izK-9f; Mon, 22 Jun 2026 14:08:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 06/16] drm/amdgpu: More compact CIK SDMA IB emission
Date: Mon, 22 Jun 2026 13:08:25 +0100
Message-ID: <20260622120835.52473-7-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: 4E4046AF4DD

Avoid constant register reloads while emitting IBs by using a local write
pointer and only updating the size at the end of each helper.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c | 105 +++++++++++++++-----------
 1 file changed, 63 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index 120da838ac28..158357700ab1 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -717,16 +717,18 @@ static void cik_sdma_vm_copy_pte(struct amdgpu_ib *ib,
 				 uint64_t pe, uint64_t src,
 				 unsigned count)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned bytes = count * 8;
 
-	ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_COPY,
-		SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
-	ib->ptr[ib->length_dw++] = bytes;
-	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
-	ib->ptr[ib->length_dw++] = lower_32_bits(src);
-	ib->ptr[ib->length_dw++] = upper_32_bits(src);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
+	*ptr++ = SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
+	*ptr++ = bytes;
+	*ptr++ = 0; /* src/dst endian swap */
+	*ptr++ = lower_32_bits(src);
+	*ptr++ = upper_32_bits(src);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = upper_32_bits(pe);
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -744,18 +746,21 @@ static void cik_sdma_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
 				  uint64_t value, unsigned count,
 				  uint32_t incr)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned ndw = count * 2;
 
-	ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
-		SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
-	ib->ptr[ib->length_dw++] = ndw;
+	*ptr++ = SDMA_PACKET(SDMA_OPCODE_WRITE,
+			     SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = upper_32_bits(pe);
+	*ptr++ = ndw;
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
@@ -774,17 +779,21 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 				    uint64_t addr, unsigned count,
 				    uint32_t incr, uint64_t flags)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
 	/* for physically contiguous pages (vram) */
-	ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_GENERATE_PTE_PDE, 0, 0);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe); /* dst addr */
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
-	ib->ptr[ib->length_dw++] = lower_32_bits(flags); /* mask */
-	ib->ptr[ib->length_dw++] = upper_32_bits(flags);
-	ib->ptr[ib->length_dw++] = lower_32_bits(addr); /* value */
-	ib->ptr[ib->length_dw++] = upper_32_bits(addr);
-	ib->ptr[ib->length_dw++] = incr; /* increment size */
-	ib->ptr[ib->length_dw++] = 0;
-	ib->ptr[ib->length_dw++] = count; /* number of entries */
+	*ptr++ = SDMA_PACKET(SDMA_OPCODE_GENERATE_PTE_PDE, 0, 0);
+	*ptr++ = lower_32_bits(pe); /* dst addr */
+	*ptr++ = upper_32_bits(pe);
+	*ptr++ = lower_32_bits(flags); /* mask */
+	*ptr++ = upper_32_bits(flags);
+	*ptr++ = lower_32_bits(addr); /* value */
+	*ptr++ = upper_32_bits(addr);
+	*ptr++ = incr; /* increment size */
+	*ptr++ = 0;
+	*ptr++ = count; /* number of entries */
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -797,18 +806,22 @@ static void cik_sdma_vm_set_pte_pde(struct amdgpu_ib *ib, uint64_t pe,
 static void cik_sdma_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	u32 pad_count;
 	int i;
 
 	pad_count = (-ib->length_dw) & 7;
+	if (!pad_count)
+		return;
+
 	for (i = 0; i < pad_count; i++)
 		if (sdma && sdma->burst_nop && (i == 0))
-			ib->ptr[ib->length_dw++] =
-					SDMA_PACKET(SDMA_OPCODE_NOP, 0, 0) |
-					SDMA_NOP_COUNT(pad_count - 1);
+			*ptr++ = SDMA_PACKET(SDMA_OPCODE_NOP, 0, 0) |
+				 SDMA_NOP_COUNT(pad_count - 1);
 		else
-			ib->ptr[ib->length_dw++] =
-					SDMA_PACKET(SDMA_OPCODE_NOP, 0, 0);
+			*ptr++ = SDMA_PACKET(SDMA_OPCODE_NOP, 0, 0);
+
+	ib->length_dw += pad_count;
 }
 
 /**
@@ -1303,13 +1316,17 @@ static void cik_sdma_emit_copy_buffer(struct amdgpu_ib *ib,
 				      uint32_t byte_count,
 				      uint32_t copy_flags)
 {
-	ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_COPY_SUB_OPCODE_LINEAR, 0);
-	ib->ptr[ib->length_dw++] = byte_count;
-	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
-	ib->ptr[ib->length_dw++] = lower_32_bits(src_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(src_offset);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
+	*ptr++ = SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_COPY_SUB_OPCODE_LINEAR, 0);
+	*ptr++ = byte_count;
+	*ptr++ = 0; /* src/dst endian swap */
+	*ptr++ = lower_32_bits(src_offset);
+	*ptr++ = upper_32_bits(src_offset);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = upper_32_bits(dst_offset);
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -1327,11 +1344,15 @@ static void cik_sdma_emit_fill_buffer(struct amdgpu_ib *ib,
 				      uint64_t dst_offset,
 				      uint32_t byte_count)
 {
-	ib->ptr[ib->length_dw++] = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0, 0);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = src_data;
-	ib->ptr[ib->length_dw++] = byte_count;
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
+	*ptr++ = SDMA_PACKET(SDMA_OPCODE_CONSTANT_FILL, 0, 0);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = upper_32_bits(dst_offset);
+	*ptr++ = src_data;
+	*ptr++ = byte_count;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 static const struct amdgpu_buffer_funcs cik_sdma_buffer_funcs = {
-- 
2.54.0

