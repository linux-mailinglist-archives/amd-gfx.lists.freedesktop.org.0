Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHIMGMdnoWkUsgQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 10:45:43 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E84FE1B583D
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Feb 2026 10:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4524810EAD5;
	Fri, 27 Feb 2026 09:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QlS568ON";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAED810EAD5
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NOqYG8tHwJ4xC1kdkaS2jOyPF7qYWTGiJR0bcq+hQls=; b=QlS568ONpE0EkOGrLcbhPRYSx2
 wu1pbF7AGuf/iKji4p/5Iyxe+CcQbp2/qCkDl2QoZuDMamoZQ7l/FARslyLKp0aNpTckNzmfyb+mC
 0RbpRdvPTP7taP47uiBqHNp4xQw3UbnAkXTLxeY1zQlMcc4sejd/l9apknc6NTT0f8O/Axa7XfQ0K
 kpR+zHnKesPqhRaSZtGgbooHiwHGz+HTkoVXEqS4tDsHkn+CGSMT/5A9z0GVoGduOf9eqajQBEgIW
 RUixpAb/eBUnMFeCVy1jOmJglr7RNuTbYNpDeidLL99OkhVSuzvSCqzO8z/QphAMJkA5LtExHJT0e
 inBFXFLg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vvuPh-006S5c-15; Fri, 27 Feb 2026 10:45:37 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 kernel test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH v2] drm/amdgpu/userq: Remove impossible NULL check from
 amdgpu_userq_signal_ioctl
Date: Fri, 27 Feb 2026 09:45:30 +0000
Message-ID: <20260227094530.99833-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260226154918.84354-1-tvrtko.ursulin@igalia.com>
References: <20260226154918.84354-1-tvrtko.ursulin@igalia.com>
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,igalia.com:mid,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,intel.com:email]
X-Rspamd-Queue-Id: E84FE1B583D
X-Rspamd-Action: no action

LKP reports two suspicious NULL pointer checks, triggered by
4ca06f6fb45d ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_userq_signal_ioctl")
but these checks were redundant even before. Remove them.

While doing this we notice the obj->resv NULL checks are redundant too,
since they have already been dereferenced in the drm_exec locking pass.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202602262219.UY2pqzl2-lkp@intel.com/
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
---
v2:
 * Drop the obj->resv checks too. (Christian)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index ba128b2a2d49..f54e0e2c0dbf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -547,21 +547,13 @@ int amdgpu_userq_signal_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	for (i = 0; i < num_read_bo_handles; i++) {
-		if (!gobj_read || !gobj_read[i]->resv)
-			continue;
-
+	for (i = 0; i < num_read_bo_handles; i++)
 		dma_resv_add_fence(gobj_read[i]->resv, fence,
 				   DMA_RESV_USAGE_READ);
-	}
-
-	for (i = 0; i < num_write_bo_handles; i++) {
-		if (!gobj_write || !gobj_write[i]->resv)
-			continue;
 
+	for (i = 0; i < num_write_bo_handles; i++)
 		dma_resv_add_fence(gobj_write[i]->resv, fence,
 				   DMA_RESV_USAGE_WRITE);
-	}
 
 	/* Add the created fence to syncobj/BO's */
 	for (i = 0; i < num_syncobj_handles; i++)
-- 
2.52.0

