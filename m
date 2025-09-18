Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223F2B5311C
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Sep 2025 13:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC3E10EAC9;
	Thu, 11 Sep 2025 11:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="n6ywdAcJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243FB10EAD2
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Sep 2025 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2zeFP5vNkFk07QugcNvAJItYihdTo7QOYyNZ7gVD9/k=; b=n6ywdAcJYDyGU2HNWeUj6drG2Z
 q0NW7ia1I5uqaHwQdTm0LvxGCQB1NfRgCgA5QVxIA43xS1HtGNnqxruJM9JDYBCURX6UeNOzZtwPX
 4Bhkrq9zxyUDbE22Djfot9Rj5JbVP+dne4kkcjf50JkC53xhYbJxysrihcZbEfuSWk7GKuDTWLS1v
 zjPjBHmS22V278QmgYxkOmoWxbYBcWb2eHypfXi9/x0C7G0WsPZMfMxSRJ7g/SJcBbVFNOKwA9NWh
 eypYM37eYTikeZDA/EjOHIIeH6Sy5JXfhJXcxiwHHjGiw6Al9GR4oaCT+ZBhkgw4NLaTXtk6OFrSz
 SFQov7tg==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uwfhJ-009n5Y-4s; Thu, 11 Sep 2025 13:42:41 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 16/16] drm/amdgpu: More compact SDMA 7.0 IB emission
Date: Thu, 11 Sep 2025 12:41:55 +0100
Message-ID: <20250911114155.24786-17-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250911114155.24786-1-tvrtko.ursulin@igalia.com>
References: <20250911114155.24786-1-tvrtko.ursulin@igalia.com>
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

Avoid constant register reloads while emitting IBs by using a local write
pointer and only updating the size at the end of each helper.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c | 119 +++++++++++++++----------
 1 file changed, 70 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
index 326ecc8d37d2..f8e1e5a7835f 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
@@ -1077,19 +1077,22 @@ static void sdma_v7_0_vm_copy_pte(struct amdgpu_ib *ib,
 				  uint64_t pe, uint64_t src,
 				  unsigned count)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned bytes = count * 8;
 
-	ib->ptr[ib->length_dw++] = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_COPY) |
-		SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR) |
-		SDMA_PKT_COPY_LINEAR_HEADER_CPV(1);
+	*ptr++ = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_COPY) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_CPV(1);
 
-	ib->ptr[ib->length_dw++] = bytes - 1;
-	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
-	ib->ptr[ib->length_dw++] = lower_32_bits(src);
-	ib->ptr[ib->length_dw++] = upper_32_bits(src);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
-	ib->ptr[ib->length_dw++] = 0;
+	*ptr++ = bytes - 1;
+	*ptr++ = 0; /* src/dst endian swap */
+	*ptr++ = lower_32_bits(src);
+	*ptr++ = upper_32_bits(src);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = upper_32_bits(pe);
+	*ptr++ = 0;
+
+	ib->length_dw = ptr - ib->ptr;
 
 }
 
@@ -1108,18 +1111,21 @@ static void sdma_v7_0_vm_write_pte(struct amdgpu_ib *ib, uint64_t pe,
 				   uint64_t value, unsigned count,
 				   uint32_t incr)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	unsigned ndw = count * 2;
 
-	ib->ptr[ib->length_dw++] = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_WRITE) |
-		SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe);
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
-	ib->ptr[ib->length_dw++] = ndw - 1;
+	*ptr++ = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_WRITE) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_WRITE_LINEAR);
+	*ptr++ = lower_32_bits(pe);
+	*ptr++ = upper_32_bits(pe);
+	*ptr++ = ndw - 1;
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
@@ -1139,17 +1145,21 @@ static void sdma_v7_0_vm_set_pte_pde(struct amdgpu_ib *ib,
 				     uint64_t addr, unsigned count,
 				     uint32_t incr, uint64_t flags)
 {
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
 	/* for physically contiguous pages (vram) */
-	ib->ptr[ib->length_dw++] = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_PTEPDE);
-	ib->ptr[ib->length_dw++] = lower_32_bits(pe); /* dst addr */
-	ib->ptr[ib->length_dw++] = upper_32_bits(pe);
-	ib->ptr[ib->length_dw++] = lower_32_bits(flags); /* mask */
-	ib->ptr[ib->length_dw++] = upper_32_bits(flags);
-	ib->ptr[ib->length_dw++] = lower_32_bits(addr); /* value */
-	ib->ptr[ib->length_dw++] = upper_32_bits(addr);
-	ib->ptr[ib->length_dw++] = incr; /* increment size */
-	ib->ptr[ib->length_dw++] = 0;
-	ib->ptr[ib->length_dw++] = count - 1; /* number of entries */
+	*ptr++ = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_PTEPDE);
+	*ptr++ = lower_32_bits(pe); /* dst addr */
+	*ptr++ = upper_32_bits(pe);
+	*ptr++ = lower_32_bits(flags); /* mask */
+	*ptr++ = upper_32_bits(flags);
+	*ptr++ = lower_32_bits(addr); /* value */
+	*ptr++ = upper_32_bits(addr);
+	*ptr++ = incr; /* increment size */
+	*ptr++ = 0;
+	*ptr++ = count - 1; /* number of entries */
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -1163,18 +1173,22 @@ static void sdma_v7_0_vm_set_pte_pde(struct amdgpu_ib *ib,
 static void sdma_v7_0_ring_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib)
 {
 	struct amdgpu_sdma_instance *sdma = amdgpu_sdma_get_instance_from_ring(ring);
+	u32 *ptr = &ib->ptr[ib->length_dw];
 	u32 pad_count;
 	int i;
 
 	pad_count = (-ib->length_dw) & 0x7;
+	if (!pad_count)
+		return;
+
 	for (i = 0; i < pad_count; i++)
 		if (sdma && sdma->burst_nop && (i == 0))
-			ib->ptr[ib->length_dw++] =
-				SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_NOP) |
+			*ptr++= SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_NOP) |
 				SDMA_PKT_NOP_HEADER_COUNT(pad_count - 1);
 		else
-			ib->ptr[ib->length_dw++] =
-				SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_NOP);
+			*ptr++ = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_NOP);
+
+	ib->length_dw += pad_count;
 }
 
 /**
@@ -1765,31 +1779,34 @@ static void sdma_v7_0_emit_copy_buffer(struct amdgpu_ib *ib,
 				       uint32_t copy_flags)
 {
 	uint32_t num_type, data_format, max_com, write_cm;
+	u32 *ptr = &ib->ptr[ib->length_dw];
 
 	max_com = AMDGPU_COPY_FLAGS_GET(copy_flags, MAX_COMPRESSED);
 	data_format = AMDGPU_COPY_FLAGS_GET(copy_flags, DATA_FORMAT);
 	num_type = AMDGPU_COPY_FLAGS_GET(copy_flags, NUMBER_TYPE);
 	write_cm = AMDGPU_COPY_FLAGS_GET(copy_flags, WRITE_COMPRESS_DISABLE) ? 2 : 1;
 
-	ib->ptr[ib->length_dw++] = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_COPY) |
-		SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR) |
-		SDMA_PKT_COPY_LINEAR_HEADER_TMZ((copy_flags & AMDGPU_COPY_FLAGS_TMZ) ? 1 : 0) |
-		SDMA_PKT_COPY_LINEAR_HEADER_CPV(1);
+	*ptr++ = SDMA_PKT_COPY_LINEAR_HEADER_OP(SDMA_OP_COPY) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(SDMA_SUBOP_COPY_LINEAR) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_TMZ((copy_flags & AMDGPU_COPY_FLAGS_TMZ) ? 1 : 0) |
+		 SDMA_PKT_COPY_LINEAR_HEADER_CPV(1);
 
-	ib->ptr[ib->length_dw++] = byte_count - 1;
-	ib->ptr[ib->length_dw++] = 0; /* src/dst endian swap */
-	ib->ptr[ib->length_dw++] = lower_32_bits(src_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(src_offset);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
+	*ptr++ = byte_count - 1;
+	*ptr++ = 0; /* src/dst endian swap */
+	*ptr++ = lower_32_bits(src_offset);
+	*ptr++ = upper_32_bits(src_offset);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = upper_32_bits(dst_offset);
 
 	if ((copy_flags & (AMDGPU_COPY_FLAGS_READ_DECOMPRESSED | AMDGPU_COPY_FLAGS_WRITE_COMPRESSED)))
-		ib->ptr[ib->length_dw++] = SDMA_DCC_DATA_FORMAT(data_format) | SDMA_DCC_NUM_TYPE(num_type) |
+		*ptr++ = SDMA_DCC_DATA_FORMAT(data_format) | SDMA_DCC_NUM_TYPE(num_type) |
 			((copy_flags & AMDGPU_COPY_FLAGS_READ_DECOMPRESSED) ? SDMA_DCC_READ_CM(2) : 0) |
 			((copy_flags & AMDGPU_COPY_FLAGS_WRITE_COMPRESSED) ? SDMA_DCC_WRITE_CM(write_cm) : 0) |
 			SDMA_DCC_MAX_COM(max_com) | SDMA_DCC_MAX_UCOM(1);
 	else
-		ib->ptr[ib->length_dw++] = 0;
+		*ptr++ = 0;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 /**
@@ -1807,12 +1824,16 @@ static void sdma_v7_0_emit_fill_buffer(struct amdgpu_ib *ib,
 				       uint64_t dst_offset,
 				       uint32_t byte_count)
 {
-	ib->ptr[ib->length_dw++] = SDMA_PKT_CONSTANT_FILL_HEADER_OP(SDMA_OP_CONST_FILL) |
-		SDMA_PKT_CONSTANT_FILL_HEADER_COMPRESS(1);
-	ib->ptr[ib->length_dw++] = lower_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = upper_32_bits(dst_offset);
-	ib->ptr[ib->length_dw++] = src_data;
-	ib->ptr[ib->length_dw++] = byte_count - 1;
+	u32 *ptr = &ib->ptr[ib->length_dw];
+
+	*ptr++ = SDMA_PKT_CONSTANT_FILL_HEADER_OP(SDMA_OP_CONST_FILL) |
+		 SDMA_PKT_CONSTANT_FILL_HEADER_COMPRESS(1);
+	*ptr++ = lower_32_bits(dst_offset);
+	*ptr++ = upper_32_bits(dst_offset);
+	*ptr++ = src_data;
+	*ptr++ = byte_count - 1;
+
+	ib->length_dw = ptr - ib->ptr;
 }
 
 static const struct amdgpu_buffer_funcs sdma_v7_0_buffer_funcs = {
-- 
2.48.0

