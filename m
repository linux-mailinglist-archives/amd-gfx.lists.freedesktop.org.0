Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4P+MEEQg72lv7QAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 10:37:24 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E328546F344
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 10:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EF8010E630;
	Mon, 27 Apr 2026 08:37:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="ECyPV9rG";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com
 [203.205.221.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B73C610E191;
 Mon, 27 Apr 2026 06:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1777272705; bh=ks8ggYiCLDadKMxcZ8CW+2cQqlh6RyPsgTtN23PYkL0=;
 h=From:To:Cc:Subject:Date;
 b=ECyPV9rGTiY7Y7rWX2D8ICYsmhJhQu8A0m6MhX7knfQkzfsloo1kmuz6Y0uLESf1x
 3oxADBBgd+xBoc+p5hgF0sj1cdu3oLs3Kv0zx/MKrYelKuigkHf9QTqzWI9OE1PkNq
 6AJJBeMUB772WCfOtVEYi+Gg6c37wYqIG9ipCszw=
Received: from NTT-kernel-dev ([60.247.85.88])
 by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
 id CE98AADB; Mon, 27 Apr 2026 14:51:41 +0800
X-QQ-mid: xmsmtpt1777272701t78vn4y9q
Message-ID: <tencent_8DBF29E0271CF7880497A344239DA11C2B0A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XhMGAw4Y2fX3RcOFCSr9oRvruFjIRTe12uuhbLspCq/SNuxvm7A
 /fk2dEjaYSKw0EedVgPO6nIz6hLkHgVIovQaqi2r98YMvjd3U2/vqzWwcywvrK2hcL8XMVFi5mTr
 aFZyz7oKC2HY+LAukPfbcNgTYO3cPCFsLHpUb88LlzUhakacuGNho12hcp7o1tkkH7SpO82enzTC
 l0rglZjLbzM3vjgjglGL7IwDQNU7U/+KInd23qTD/reO+HdVks9XQNft/Sxih3dBovBCYiwqlwh7
 VWHVMwhILJHDTs/9QmilCLXVHswg0JKsnu7b55aeN4XFb1ZJM9U7iEu15UXsoZNy7ai1EuUIV2s5
 SRlfPND3AQ1Zy3BEShDgJY/qNHnUWu9uFxFGG7SBsGsEstl+uN+bph6AGZ8kajr/6RlJzxs1x30Y
 wsVgutCd1YZb8grk02KL8527aQ7SDXjTjHgtVfYdiYMYj0LBroUGAiz8pDGlfQmYJ5mcAacQeNvv
 q/G1237Jw+nE27gSCTdRFRtpBDQKalmmkFXAxf1SVX2ciLNkbmXVFkeRhCVZxzjM/sZU39Ox4EEN
 dEzbzP581qm8P/KRqZY119BhwP0NTihokx3mIKXDMTrncrEl9DMUSPrWSYQqTk0hRyHmSPt2UwF1
 w0yRTeSJ+Ybj2Nye9IYpODU6cq3/aiCVv3pO6fBZNpGqz2mJbmh6qvE1tKeaMQOl7B8pemJHyYzZ
 9PM6fFZ0h0WYQIdj5xtVe9ZUi5QLRNVEJ4oRtWtfbPcBGQcxDrsxPKihk/yCDEK5jaey9QixmhQh
 ID90LasAN1l0o+VryfPK7FkJ92QdCtRIffUqMET+vdgBLloEQTd5qyZkz6SQHmrtPt9nd84s072j
 ExqWgGdRNSz9B9yTzEmmsvTiBkpo+/PmN4K1lTmGuogumRLBnJ3vhP3n2e+bnIgNrH9pJbn9f7op
 Mi2kXYMCcsMJ5DBts/0KhejMXs313OQ2R0ENTa6EurJ77/3OqDZAUDM4tdvpx3MR+acCRRR24=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
From: Fang Wang <32840572@qq.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 tvrtko.ursulin@igalia.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Jesse.Zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.12.y 1/2] drm/amdgpu: Use vmemdup_array_user in
 amdgpu_bo_create_list_entry_array
Date: Mon, 27 Apr 2026 14:51:41 +0800
X-OQ-MSGID: <20260427065141.4118590-1-32840572@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Apr 2026 08:37:20 +0000
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
X-Rspamd-Queue-Id: E328546F344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[qq.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[32840572@qq.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qq.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,qq.com:dkim,qq.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:email,amd.com:email]

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

[ Upstream commit c4ac100e9ae252b09986766ad23b1f83ca3a369d ]

Replace kvmalloc_array() + copy_from_user() with vmemdup_array_user() on
the fast path.

This shrinks the source code and improves separation between the kernel
and userspace slabs.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Fang Wang <32840572@qq.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 41 +++++++++------------
 1 file changed, 17 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
index 702f6610d024..66fb37b64388 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -184,43 +184,36 @@ void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
 int amdgpu_bo_create_list_entry_array(struct drm_amdgpu_bo_list_in *in,
 				      struct drm_amdgpu_bo_list_entry **info_param)
 {
-	const void __user *uptr = u64_to_user_ptr(in->bo_info_ptr);
 	const uint32_t info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+	const void __user *uptr = u64_to_user_ptr(in->bo_info_ptr);
+	const uint32_t bo_info_size = in->bo_info_size;
+	const uint32_t bo_number = in->bo_number;
 	struct drm_amdgpu_bo_list_entry *info;
-	int r;
-
-	info = kvmalloc_array(in->bo_number, info_size, GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
 
 	/* copy the handle array from userspace to a kernel buffer */
-	r = -EFAULT;
-	if (likely(info_size == in->bo_info_size)) {
-		unsigned long bytes = in->bo_number *
-			in->bo_info_size;
-
-		if (copy_from_user(info, uptr, bytes))
-			goto error_free;
-
+	if (likely(info_size == bo_info_size)) {
+		info = vmemdup_array_user(uptr, bo_number, info_size);
+		if (IS_ERR(info))
+			return PTR_ERR(info);
 	} else {
-		unsigned long bytes = min(in->bo_info_size, info_size);
+		const uint32_t bytes = min(bo_info_size, info_size);
 		unsigned i;
 
-		memset(info, 0, in->bo_number * info_size);
-		for (i = 0; i < in->bo_number; ++i) {
-			if (copy_from_user(&info[i], uptr, bytes))
-				goto error_free;
+		info = kvmalloc_array(bo_number, info_size, GFP_KERNEL);
+		if (!info)
+			return -ENOMEM;
 
-			uptr += in->bo_info_size;
+		memset(info, 0, bo_number * info_size);
+		for (i = 0; i < bo_number; ++i, uptr += bo_info_size) {
+			if (copy_from_user(&info[i], uptr, bytes)) {
+				kvfree(info);
+				return -EFAULT;
+			}
 		}
 	}
 
 	*info_param = info;
 	return 0;
-
-error_free:
-	kvfree(info);
-	return r;
 }
 
 int amdgpu_bo_list_ioctl(struct drm_device *dev, void *data,
-- 
2.34.1

