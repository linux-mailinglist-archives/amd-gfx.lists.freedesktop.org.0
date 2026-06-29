Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9aWuJhNuQ2pBYQoAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 09:19:47 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA96E10F5
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2026 09:19:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="bReqqF0/";
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C58E710EB3F;
	Tue, 30 Jun 2026 07:19:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA0A10E6C0
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 15:28:49 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493ad116e05so7619665e9.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jun 2026 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782746928; x=1783351728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HFhwRQO/XnDqnsNCNRMiUIQQuhF/q4kw4HCjqPfc1vw=;
 b=bReqqF0/CtTYtcKbjZyeVugl+OjTwLWqr+CVLT0pT2XsoQSXXXmPF5eKKYfF+/7xNZ
 4I0knfqB2hk4o1bVaPGs0HLe8GgflvhqkeR0P8qOKwpYdYIVY51m9h4lyCT093xhULj0
 h97TDH/yc97CtrwbbrGIN392jJS6cr/tK3Xx9qm3c8juJDQkw9n9VEcg2+q3Md8wvf78
 ADS7G5/i5OpriPPXZYqSFE4CJ7XT8G7cVbyvb1e6GT7N89C8EecgqzMGtVHqLmY70vVF
 metLevno1pQMO7Gt+5Up+8Jnmj5rlonCQTbGGsKJoO4KTGDe86cS6D11l5cdzAHFtlSr
 1hQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782746928; x=1783351728;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFhwRQO/XnDqnsNCNRMiUIQQuhF/q4kw4HCjqPfc1vw=;
 b=E7WIgrXj6rAdc12q7ls82EbEipJdE+9EvuKSCyPsBbXBTCZT3Gitwa1ZOXyKLTorVq
 neY40HWcwCKAzKL2AWwb1QJrVagmHJMRAYf91u4vsvLnTrSICZY+PkNpG4KssersADU/
 ddW8xQSk7XRulFPf9wWrXSoa8sv7iRQhmfABLR5A3AAxPF6q10u8BwR6BCRa4zmtoOBs
 Vl6kxEJM26biF9dKA0u2wk+Hh2CL0oNCB7Q616o/WLGCAHHBNEMey+QX7pq+sPMxm4PH
 0cEetgWj7mqbtoALaBO1FJQ88qsqwRonb+fY5tlAH+CsQqrvNd2gkMr3bIvM7Ge/hFU4
 aQzg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+BQ9aflGUgemCoCp2Zj3tcHZJQdDhEhBbyBkzby7L/ZKmoYdKR6XkGzLv70if4Hf2/KMylFEDK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFjgdM9dUBuY1t8OoekrnXtUyBsWNp5nhcP67v39APiYQul2h2
 b1VgNDIduVTIKHQ6eKG6XM3Nc3OHalRabhxPg1EiouPMAb5jrOHiK3b9
X-Gm-Gg: AfdE7ckwZiTGKmo2lloFk4tBlpGmjd2037JIorpbO8GOmK21MJkhA0KW7/D6xQviriz
 eYUXboTn04Xof3r1VfLV187LA5SjZlkteFkvfmMTd/v/FmtNBvyQocVDfVFg7LK6U0FRd3Wy7rT
 ayupTsBrl3giOctxfDCKm/zoAjyfra9J3isBS0SdmdXcxofeewKixT6wQ9e1CNML92FJgPEdv4B
 UpToPNARck3ddmXe4DhYcn1CJYxNeNTMUUQKJk5GYq2q9IzcOxcnnbVq1+VDcke+Wz1BA0GBAMI
 IVw5GhXIdc6OBscsnRFBsa2eMqcXQi7XzezTaVl2yT7mBqEhEKR+wON2ZvP+28ZzExi+53j/eDh
 S5y+geM7McRV70TzBenAfLmSKqvBjjadpSBJavTiCS5CXpCqhW2ZsKfDo7gg8N5NoxeZl517VXB
 vSn13Rv00zdbXDtwuvigmUPVfMcQ==
X-Received: by 2002:a7b:cd96:0:b0:490:6237:5200 with SMTP id
 5b1f17b1804b1-493b828c480mr1572865e9.10.1782746927577; 
 Mon, 29 Jun 2026 08:28:47 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268f700c0sm371321555e9.0.2026.06.29.08.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 08:28:46 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH v3] drm/amdgpu: reject mapping info when BO VA is gone
Date: Mon, 29 Jun 2026 17:28:07 +0200
Message-ID: <20260629152807.13492-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 30 Jun 2026 07:19:28 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:alhouseenyousef@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alhouseenyousef@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DAA96E10F5

AMDGPU_GEM_OP_GET_MAPPING_INFO looks up the GEM object before taking
the object and VM locks. The object reference keeps the BO alive, but a
concurrent handle close can remove the per-file BO VA before
amdgpu_vm_bo_find() runs.

The mapping-list walks then dereference the NULL BO VA. Return -EINVAL
when the BO is no longer associated with the VM.

Suggested-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
Changes in v3:
- Generate a clean patch against drm-misc-next instead of stacking on v1.
- Keep only the intended !bo_va guard for the handle-close race.
- Clarify the v2 withdrawal confusion in thread replies.

Changes in v2:
- Describe the handle-close race instead of an initially unmapped BO.
- Return -EINVAL instead of -ENOENT.

 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 27be5083f2af..83ec994ad36b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -1087,6 +1087,12 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void *data,
 		struct drm_amdgpu_gem_vm_entry *vm_entries;
 		struct amdgpu_bo_va_mapping *mapping;
 		int num_mappings = 0;
+
+		if (!bo_va) {
+			r = -EINVAL;
+			goto out_exec;
+		}
+
 		/*
 		 * num_entries is set as an input to the size of the user-allocated array of
 		 * drm_amdgpu_gem_vm_entry stored at args->value.
-- 
2.54.0
