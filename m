Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kJuOId8lOWrgnQcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A1B6AF4EC
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 14:09:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=HNvhnKEU;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596E010E672;
	Mon, 22 Jun 2026 12:09:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA6A10E667
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W+bm4kejcK4fkcqJtKtO60EWwbNIhKiH8mf2kIdNF5g=; b=HNvhnKEUGzLSglSRbgiEZJejIE
 geZkHgL3qCgnu8+6ll0sUq7wvWeVF9n3ZDMitoV3xVzybRuMFW8k1y0bg6MSUg+cQkaMbi6mLHF72
 3E34rCJzflsazQ4hurm6fujPQV2pXe8VRzf3DVj1WsEUmNKnOTpmpszkOTdIS5dYot0qxJbgKiIbw
 dL1SxECuei+RpQzzfyapdPtzbSoCygFkE+vK2/E+t+mGfl1Nx4+2AeCyV6g07r9+0+9cTU5WI0Iwu
 pMpCvyJ3uOaOtdt3sfPQiPU7d4KKLIki12VCpRLyhIk5i7dCk0cPn78o7eaXpNhNPn/HuOVAU/9EF
 5JXEawhg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wbdSO-003iys-6i; Mon, 22 Jun 2026 14:08:52 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 01/16] drm/amdgpu: More compact VCE IB emission
Date: Mon, 22 Jun 2026 13:08:20 +0100
Message-ID: <20260622120835.52473-2-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Queue-Id: 33A1B6AF4EC

Avoid constant register reloads while emitting IBs by using a local write
pointer and only updating the size at the end of each helper.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 96 +++++++++++++------------
 1 file changed, 50 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
index efdebd9c0a1f..2854c2e465b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
@@ -468,7 +468,8 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 	struct amdgpu_ib ib_msg;
 	struct dma_fence *f = NULL;
 	uint64_t addr;
-	int i, r;
+	u32 *ptr;
+	int r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
@@ -486,45 +487,46 @@ static int amdgpu_vce_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 		goto err;
 
 	ib = &job->ibs[0];
+	ptr = ib->ptr;
 	/* let addr point to page boundary */
 	addr = AMDGPU_GPU_PAGE_ALIGN(ib_msg.gpu_addr);
 
 	/* stitch together an VCE create msg */
-	ib->length_dw = 0;
-	ib->ptr[ib->length_dw++] = 0x0000000c; /* len */
-	ib->ptr[ib->length_dw++] = 0x00000001; /* session cmd */
-	ib->ptr[ib->length_dw++] = handle;
+	*ptr++ = 0x0000000c; /* len */
+	*ptr++ = 0x00000001; /* session cmd */
+	*ptr++ = handle;
 
 	if ((ring->adev->vce.fw_version >> 24) >= 52)
-		ib->ptr[ib->length_dw++] = 0x00000040; /* len */
+		*ptr++ = 0x00000040; /* len */
 	else
-		ib->ptr[ib->length_dw++] = 0x00000030; /* len */
-	ib->ptr[ib->length_dw++] = 0x01000001; /* create cmd */
-	ib->ptr[ib->length_dw++] = 0x00000000;
-	ib->ptr[ib->length_dw++] = 0x00000042;
-	ib->ptr[ib->length_dw++] = 0x0000000a;
-	ib->ptr[ib->length_dw++] = 0x00000001;
-	ib->ptr[ib->length_dw++] = 0x00000080;
-	ib->ptr[ib->length_dw++] = 0x00000060;
-	ib->ptr[ib->length_dw++] = 0x00000100;
-	ib->ptr[ib->length_dw++] = 0x00000100;
-	ib->ptr[ib->length_dw++] = 0x0000000c;
-	ib->ptr[ib->length_dw++] = 0x00000000;
+		*ptr++ = 0x00000030; /* len */
+	*ptr++ = 0x01000001; /* create cmd */
+	*ptr++ = 0x00000000;
+	*ptr++ = 0x00000042;
+	*ptr++ = 0x0000000a;
+	*ptr++ = 0x00000001;
+	*ptr++ = 0x00000080;
+	*ptr++ = 0x00000060;
+	*ptr++ = 0x00000100;
+	*ptr++ = 0x00000100;
+	*ptr++ = 0x0000000c;
+	*ptr++ = 0x00000000;
 	if ((ring->adev->vce.fw_version >> 24) >= 52) {
-		ib->ptr[ib->length_dw++] = 0x00000000;
-		ib->ptr[ib->length_dw++] = 0x00000000;
-		ib->ptr[ib->length_dw++] = 0x00000000;
-		ib->ptr[ib->length_dw++] = 0x00000000;
+		*ptr++ = 0x00000000;
+		*ptr++ = 0x00000000;
+		*ptr++ = 0x00000000;
+		*ptr++ = 0x00000000;
 	}
 
-	ib->ptr[ib->length_dw++] = 0x00000014; /* len */
-	ib->ptr[ib->length_dw++] = 0x05000005; /* feedback buffer */
-	ib->ptr[ib->length_dw++] = upper_32_bits(addr);
-	ib->ptr[ib->length_dw++] = addr;
-	ib->ptr[ib->length_dw++] = 0x00000001;
+	*ptr++ = 0x00000014; /* len */
+	*ptr++ = 0x05000005; /* feedback buffer */
+	*ptr++ = upper_32_bits(addr);
+	*ptr++ = addr;
+	*ptr++ = 0x00000001;
 
-	for (i = ib->length_dw; i < ib_size_dw; ++i)
-		ib->ptr[i] = 0x0;
+	ib->length_dw = ptr - ib->ptr;
+
+	memset32(ptr, 0, ib_size_dw - ib->length_dw);
 
 	r = amdgpu_job_submit_direct(job, ring, &f);
 	amdgpu_ib_free(&ib_msg, f);
@@ -558,7 +560,8 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 	struct amdgpu_job *job;
 	struct amdgpu_ib *ib;
 	struct dma_fence *f = NULL;
-	int i, r;
+	u32 *ptr;
+	int r;
 
 	r = amdgpu_job_alloc_with_ib(ring->adev, &ring->adev->vce.entity,
 				     AMDGPU_FENCE_OWNER_UNDEFINED,
@@ -570,27 +573,28 @@ static int amdgpu_vce_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 		return r;
 
 	ib = &job->ibs[0];
+	ptr = ib->ptr;
 
 	/* stitch together an VCE destroy msg */
-	ib->length_dw = 0;
-	ib->ptr[ib->length_dw++] = 0x0000000c; /* len */
-	ib->ptr[ib->length_dw++] = 0x00000001; /* session cmd */
-	ib->ptr[ib->length_dw++] = handle;
+	*ptr++ = 0x0000000c; /* len */
+	*ptr++ = 0x00000001; /* session cmd */
+	*ptr++ = handle;
 
-	ib->ptr[ib->length_dw++] = 0x00000020; /* len */
-	ib->ptr[ib->length_dw++] = 0x00000002; /* task info */
-	ib->ptr[ib->length_dw++] = 0xffffffff; /* next task info, set to 0xffffffff if no */
-	ib->ptr[ib->length_dw++] = 0x00000001; /* destroy session */
-	ib->ptr[ib->length_dw++] = 0x00000000;
-	ib->ptr[ib->length_dw++] = 0x00000000;
-	ib->ptr[ib->length_dw++] = 0xffffffff; /* feedback is not needed, set to 0xffffffff and firmware will not output feedback */
-	ib->ptr[ib->length_dw++] = 0x00000000;
+	*ptr++ = 0x00000020; /* len */
+	*ptr++ = 0x00000002; /* task info */
+	*ptr++ = 0xffffffff; /* next task info, set to 0xffffffff if no */
+	*ptr++ = 0x00000001; /* destroy session */
+	*ptr++ = 0x00000000;
+	*ptr++ = 0x00000000;
+	*ptr++ = 0xffffffff; /* feedback is not needed, set to 0xffffffff and firmware will not output feedback */
+	*ptr++ = 0x00000000;
 
-	ib->ptr[ib->length_dw++] = 0x00000008; /* len */
-	ib->ptr[ib->length_dw++] = 0x02000001; /* destroy cmd */
+	*ptr++ = 0x00000008; /* len */
+	*ptr++ = 0x02000001; /* destroy cmd */
 
-	for (i = ib->length_dw; i < ib_size_dw; ++i)
-		ib->ptr[i] = 0x0;
+	ib->length_dw = ptr - ib->ptr;
+
+	memset32(ptr, 0, ib_size_dw - ib->length_dw);
 
 	if (direct)
 		r = amdgpu_job_submit_direct(job, ring, &f);
-- 
2.54.0

