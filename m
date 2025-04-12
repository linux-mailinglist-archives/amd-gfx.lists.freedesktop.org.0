Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A974A86F9F
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Apr 2025 22:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2568910E3F4;
	Sat, 12 Apr 2025 20:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pHTPFjVc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CD410E3F4
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Apr 2025 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wv6TedY9z2LAkzoE8SdS3UBKl5Dz99dVinCl13nDBuI=; b=pHTPFjVcrHM5tQGmyEKL3qvm54
 uW3HBmFqfpapMz6mpOWGfZzPciT8F9ApRrg8DKB8YRLPL869micglePfdsrhcU+CRMr78g07bqfGq
 2uu15HWE8YTmNUlRLDtsU7gikYrIinMrAKLGZs+pNE+6xpw0JFYLo5vajBZs3Tr4R2dD5iF7JgI8M
 cvKyyzXW4sJKJ43GxVsTruJvdKFGEPdKpVBk4bB9VzIt6isznpJlThlUokwVcnIx18EVYrtnQVYWE
 1+VHOPFnsaUdr4IVkPNsfj2i8ztapNmbxbJnMEbRdh7AxlTwVMod375M7UQuvK9ZCXvZEt1esdoZR
 1Ytz3NIQ==;
Received: from d162-157-58-14.abhsia.telus.net ([162.157.58.14]
 helo=maloca.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3hcE-00Ff2l-SD; Sat, 12 Apr 2025 22:38:15 +0200
From: Rodrigo Siqueira <siqueira@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH] drm/amdgpu: Add documentation to some parts of the AMDGPU
 ring and wb
Date: Sat, 12 Apr 2025 14:37:31 -0600
Message-ID: <20250412203757.3026858-1-siqueira@igalia.com>
X-Mailer: git-send-email 2.49.0
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

Add some random documentation associated with the ring buffer
manipulations and writeback.

Signed-off-by: Rodrigo Siqueira <siqueira@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h      | 29 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h | 37 ++++++++++++++++++++++++
 2 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 804d37703709..a8206ad210b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -522,9 +522,36 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv);
 
 struct amdgpu_wb {
 	struct amdgpu_bo	*wb_obj;
+
+	/**
+	 * @wb:
+	 *
+	 * Pointer to the first writeback slot. In terms of CPU address
+	 * this value can be access directly by using the offset as an
+	 * index. For the GPU address, it is necessary to use gpu_addr and
+	 * the offset.
+	 */
 	volatile uint32_t	*wb;
+
+	/**
+	 * @gpu_addr:
+	 *
+	 * Writeback base address in the GPU.
+	 */
 	uint64_t		gpu_addr;
-	u32			num_wb;	/* Number of wb slots actually reserved for amdgpu. */
+
+	/**
+	 * @num_wb:
+	 *
+	 * Number of writeback slots actually reserved for amdgpu.
+	 */
+	u32			num_wb;
+
+	/**
+	 * @used:
+	 *
+	 * Track the writeback slot already used.
+	 */
 	unsigned long		used[DIV_ROUND_UP(AMDGPU_MAX_WB, BITS_PER_LONG)];
 	spinlock_t		lock;
 };
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
index ec4de8df34e7..82972978c546 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
@@ -241,6 +241,9 @@ struct amdgpu_ring_funcs {
 	bool (*is_guilty)(struct amdgpu_ring *ring);
 };
 
+/**
+ * amdgpu_ring - Holds ring information
+ */
 struct amdgpu_ring {
 	struct amdgpu_device		*adev;
 	const struct amdgpu_ring_funcs	*funcs;
@@ -255,10 +258,44 @@ struct amdgpu_ring {
 	u64			wptr;
 	u64			wptr_old;
 	unsigned		ring_size;
+
+	/**
+	 * @max_dw:
+	 *
+	 * Maximum number of DWord for ring allocation. This information is
+	 * provided at the ring initialization time, and each IP block can
+	 * specify a specific value.
+	 */
 	unsigned		max_dw;
+
+	/**
+	 * @count_dw:
+	 *
+	 * Count DWords: this value starts with the maximum amount of DWords
+	 * supported by the ring. This value is updated based on the ring
+	 * manipulation.
+	 */
 	int			count_dw;
 	uint64_t		gpu_addr;
+
+	/**
+	 * @ptr_mask:
+	 *
+	 * Some IPs provide support for 64-bit pointers and others for 32-bit
+	 * only; this behavior is component-specific and defined by the field
+	 * support_64bit_ptr. If the IP block supports 64-bits, the mask
+	 * 0xffffffffffffffff is set; otherwise, this value assumes buf_mask.
+	 * Notice that this field is used to keep wptr under a valid range.
+	 */
 	uint64_t		ptr_mask;
+
+	/**
+	 * @buf_mask:
+	 *
+	 * Buffer mask is a value used to keep wptr count under its
+	 * thresholding. Buffer mask initialized during the ring buffer
+	 * initialization time, and it is defined as (ring_size / 4) -1.
+	 */
 	uint32_t		buf_mask;
 	u32			idx;
 	u32			xcc_id;
-- 
2.49.0

