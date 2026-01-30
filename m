Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJ2wGRGCfGlwNgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 11:04:01 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D1EB922B
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 11:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D0B10E967;
	Fri, 30 Jan 2026 10:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RXMp+Oxy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCBE10E972
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Jan 2026 10:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QZ3aEVDsFzfYIL71b2YaNe/32+Zb/AnI2kSsAmyXWu4=; b=RXMp+Oxyud+CdwjGRmmdBVA594
 CaL3mAfF+zOXkgkmoHRyF+MpYqRnkxZheZ5Z01KCxFVbNegmu0mIVxC05CrlC9QaqAtznsVf04FuT
 8kSUeqo5MFXBFqvuwKtNz7P/L8rJFiv/B5wgfpcSrtzjGm1h2W5k9ro9qs3quwNkP32oiS/5ma9pU
 E2p9UsptfFMZpeda9ABhfnAg9RJ4ej7CnPmGDIoRkNueYWIIr+dZXQYj64fljXouD3W0ut7VcSfuV
 dlDQeQ6yGlz+6L71JupONpZ7NFRtWIPtbyrwqkfecElwXPieTIdTW2flVgo88kRoiLX2y8yhVl6Pk
 VIvtXsSQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vllM2-00BhEj-MS; Fri, 30 Jan 2026 11:03:54 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC 2/2] drm/amdgpu: Only calculate register offset once in SOC15 RLC
Date: Fri, 30 Jan 2026 10:03:50 +0000
Message-ID: <20260130100350.2883-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130100350.2883-1-tvrtko.ursulin@igalia.com>
References: <20260130100350.2883-1-tvrtko.ursulin@igalia.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: D1D1EB922B
X-Rspamd-Action: no action

We can save some text by only calculating the register offset once
in a few of the SOC15 RLC register read/write macros.

add/remove: 0/0 grow/shrink: 2/65 up/down: 32/-1078 (-1046)
Total: Before=9079703, After=9078657, chg -0.01%

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15_common.h | 47 +++++++++++++----------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15_common.h b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
index b7f928521f39..5ee5867fe794 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15_common.h
+++ b/drivers/gpu/drm/amd/amdgpu/soc15_common.h
@@ -43,21 +43,25 @@
 #define __RREG32_SOC15_RLC__(reg, flag, hwip, inst) \
 	adev->gfx.rlc.reg_funcs->rreg32(adev, reg, flag, hwip, inst)
 
-#define WREG32_FIELD15(ip, idx, reg, field, val)	\
-	 __WREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg,	\
-				(__RREG32_SOC15_RLC__( \
-					adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg, \
-					0, ip##_HWIP, idx) & \
-				~REG_FIELD_MASK(reg, field)) | (val) << REG_FIELD_SHIFT(reg, field), \
-			      0, ip##_HWIP, idx)
+#define WREG32_FIELD15(ip, idx, reg_name, field, val) \
+do { \
+	u32 reg__ = adev->reg_offset[ip##_HWIP][idx][mm##reg_name##_BASE_IDX] + mm##reg_name; \
+	u32 val__ = __RREG32_SOC15_RLC__(reg__, 0, ip##_HWIP, idx); \
+\
+	val__ &= ~REG_FIELD_MASK(reg_name, field); \
+	val__ |= (val) << REG_FIELD_SHIFT(reg_name, field); \
+	__WREG32_SOC15_RLC__(reg__, val__, 0, ip##_HWIP, idx); \
+} while (0)
 
-#define WREG32_FIELD15_PREREG(ip, idx, reg_name, field, val)        \
-	__WREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][idx][reg##reg_name##_BASE_IDX] + reg##reg_name,   \
-			(__RREG32_SOC15_RLC__( \
-					adev->reg_offset[ip##_HWIP][idx][reg##reg_name##_BASE_IDX] + reg##reg_name, \
-					0, ip##_HWIP, idx) & \
-					~REG_FIELD_MASK(reg_name, field)) | (val) << REG_FIELD_SHIFT(reg_name, field), \
-			0, ip##_HWIP, idx)
+#define WREG32_FIELD15_PREREG(ip, idx, reg_name, field, val) \
+do { \
+	u32 reg__ = adev->reg_offset[ip##_HWIP][idx][reg##reg_name##_BASE_IDX] + reg##reg_name; \
+	u32 val__ = __RREG32_SOC15_RLC__(reg__, 0, ip##_HWIP, idx); \
+\
+	val__ &= ~REG_FIELD_MASK(reg_name, field); \
+	val__ |= (val) << REG_FIELD_SHIFT(reg_name, field); \
+	__WREG32_SOC15_RLC__(reg__, val__, 0, ip##_HWIP, idx); \
+} while (0)
 
 #define RREG32_SOC15(ip, inst, reg) \
 	__RREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg, \
@@ -177,12 +181,15 @@
 			WREG32_RLC_EX(prefix, target_reg, value, inst); \
 	} while (0)
 
-#define WREG32_FIELD15_RLC(ip, idx, reg, field, val)   \
-	__WREG32_SOC15_RLC__((adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg), \
-			     (__RREG32_SOC15_RLC__(adev->reg_offset[ip##_HWIP][idx][mm##reg##_BASE_IDX] + mm##reg, \
-						   AMDGPU_REGS_RLC, ip##_HWIP, idx) & \
-			      ~REG_FIELD_MASK(reg, field)) | (val) << REG_FIELD_SHIFT(reg, field), \
-			     AMDGPU_REGS_RLC, ip##_HWIP, idx)
+#define WREG32_FIELD15_RLC(ip, idx, reg_name, field, val) \
+do { \
+	u32 reg__ = adev->reg_offset[ip##_HWIP][idx][mm##reg_name##_BASE_IDX] + mm##reg_name; \
+	u32 val__ = __RREG32_SOC15_RLC__(reg__, AMDGPU_REGS_RLC, ip##_HWIP, idx); \
+\
+	val__ &= ~REG_FIELD_MASK(reg_name, field); \
+	val__ |= (val) << REG_FIELD_SHIFT(reg_name, field); \
+	__WREG32_SOC15_RLC__(reg__, val__, AMDGPU_REGS_RLC, ip##_HWIP, idx); \
+} while (0)
 
 #define WREG32_SOC15_OFFSET_RLC(ip, inst, reg, offset, value) \
 	__WREG32_SOC15_RLC__((adev->reg_offset[ip##_HWIP][inst][reg##_BASE_IDX] + reg) + offset, value, AMDGPU_REGS_RLC, ip##_HWIP, inst)
-- 
2.52.0

