Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGG1EyfFFWqxawcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 18:07:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C95D94FC
	for <lists+amd-gfx@lfdr.de>; Tue, 26 May 2026 18:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C877410E657;
	Tue, 26 May 2026 16:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XDg6XD8t";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C82410E4F7
 for <amd-gfx@lists.freedesktop.org>; Tue, 26 May 2026 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lz9dja9hex3GTFTImUZK+sHwdq4ZW5WxMtXeXfprSdQ=; b=XDg6XD8tXh0zhg7znqI+7oSnHU
 JfbybqERlAHyY4uHyWDpk7geluHO8DPS4gLiQvtUjCGJ8ZtBYloukWV41YGO4eklWY0VCRPC3etg2
 LPhLELixVvwi4DiAjIFF39jwFPDAu1n/TrmoS055ZP5CDdcJg+0qczRfNZC5YTNXiAtA+0hkutUX8
 MU88lEULo0e933WwvG+N7e5rN8oXuCD1gKo5BUypmyhB4wgWTtrAqgoH70NsPCkp/N/KSt8nuh84h
 l7fw0T+G3vh5olLX/vcP65pSt8pcVawjAjnqzvgPMOH3M95AoRjRRxP7jsY602KtWarfB59dihkQf
 nser3JAQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRuIy-008VbD-N9; Tue, 26 May 2026 18:06:56 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, David Francis <David.Francis@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [RFC 2/5] drm/amdgpu: Add a reserved VM ID query
Date: Tue, 26 May 2026 17:06:27 +0100
Message-ID: <20260526160630.35562-3-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526160630.35562-1-tvrtko.ursulin@igalia.com>
References: <20260526160630.35562-1-tvrtko.ursulin@igalia.com>
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
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[amd-gfx];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: 250C95D94FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new query (AMDGPU_VM_OP_QUERY_RESERVED_VMID) to the
DRM_IOCTL_AMDGPU_VM ioctl.

This is required for the checkpoint and restore to be able to correctly
restore the client VM.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 4 ++++
 include/uapi/drm/amdgpu_drm.h          | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 9ba9de16a27a..ce068e2d32d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2942,6 +2942,10 @@ int amdgpu_vm_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	case AMDGPU_VM_OP_UNRESERVE_VMID:
 		amdgpu_vmid_free_reserved(adev, vm, AMDGPU_GFXHUB(0));
 		break;
+	case AMDGPU_VM_OP_QUERY_RESERVED_VMID:
+		if (vm->reserved_vmid[AMDGPU_GFXHUB(0)])
+			args->out.flags = AMDGPU_VM_OUT_FLAG_VMID_RESERVED;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 3069560ac26e..8a6f4c558102 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -587,6 +587,7 @@ struct drm_amdgpu_userq_wait {
 /* vm ioctl */
 #define AMDGPU_VM_OP_RESERVE_VMID	1
 #define AMDGPU_VM_OP_UNRESERVE_VMID	2
+#define AMDGPU_VM_OP_QUERY_RESERVED_VMID	3
 
 struct drm_amdgpu_vm_in {
 	/** AMDGPU_VM_OP_* */
@@ -594,8 +595,10 @@ struct drm_amdgpu_vm_in {
 	__u32	flags;
 };
 
+/* drm_amdgpu_vm_out flags */
+#define AMDGPU_VM_OUT_FLAG_VMID_RESERVED	(1ul << 63)
+
 struct drm_amdgpu_vm_out {
-	/** For future use, no flags defined so far */
 	__u64	flags;
 };
 
-- 
2.54.0

