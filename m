Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLCyIlQg72ma7QAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 10:37:40 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D846F383
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Apr 2026 10:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5119410E636;
	Mon, 27 Apr 2026 08:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="H90BX9qc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com
 [203.205.221.153])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A7310E191;
 Mon, 27 Apr 2026 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1777272869; bh=lHLU024aAwcguS5ARAG4kBqUfkxnD5hl6+Lo4kd7XPY=;
 h=From:To:Cc:Subject:Date;
 b=H90BX9qcBLE+uU8EcshUZIosNX0ZZ4eg4QDQdyxHcOM4X0k/eGS/ZWYaDwRa/0z6F
 /RpdYCUS0RNRGsg1Cb9b0Omw9NaHGcnB13jSGhLwBm6yeyWjSQA9r+eO1haGGegL6g
 vyzill9D1tqOGwE/uvUqvd+0UrIxZ4W8vvHJaqqA=
Received: from NTT-kernel-dev ([60.247.85.88])
 by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
 id D99A8494; Mon, 27 Apr 2026 14:54:25 +0800
X-QQ-mid: xmsmtpt1777272865tepqw5bdl
Message-ID: <tencent_983388E3E437227CF3632311A472F9E89907@qq.com>
X-QQ-XMAILINFO: NGZp1yYNf7Y+XImPKHod7cmbUONk4HZ2f3rdMQkVnqsXgSgz30B4xqrsAGR7js
 kFrpGcBqy7N9NtT1oJLAgLyFdGeXQeT4hTfZvvB3UIc+mwTT9w7+rcoCRedGfRn32joDZ1N2CpeT
 jhJNkkL4VCkMUUgYqkpuLnsU7ru3cU6Go887wJd09ri9XQyJD1QQZAG708uNyBR0kIrh4D5J2EGg
 vu1bOEh88zwYaQ9Vb9q8GYJpvS+Nk6PQ9RMZf2t1w+qaZkrbu0OEwaqQ6fhRr4pTV2Q0vo+c90CJ
 cohxr2xmdbBZK+ymZ0bKVp5bozy/tqvJ9iCSNbbbOMNA+hzobsiCChWxjRhUYPWjWyFQgcSFugiP
 zGXak2ssj1h6N0JFHs3Giu+II7T+eWkpTaVx+6rXVjjbqmpLHtrF1PD2Nv21legm0BlxTgyqMV8V
 EYgj+kBjVMN9VKVZExlf5Sk8VcVYdIpoUIs/Z1xK4TRKp8680/ZVZf3px3JYQmrl19xtbvugMMEx
 YUx7LpTuHCA5C5LTAOGfSXdn3NcYcQbAUcmTBv0YHr6W6En+XFgHkZMkbqVps+P0CtcUKxCGizo0
 58MMu4g0mGSUkwezMc8CcMiJ2lrmkui0OlJ/kMOtEt1HEm75hNkKwWRUNaZtPzgfnJFAwg4RZzYo
 S7PVrMBnYPN+jj2cV4AC6tmARxa0/Ft1qdP3rKGDyO+dkJyIQS8N2CYYNzm9VCxW+re4HIVEdTf4
 1jC3HXLu75GO8Z8H+cJACJLDXlPXzVOqCFJs5Ol/CWyfPIue4OovUdnxhTz/Qfb37Xog8yLUTPya
 IcRfhBCobFUZD4p4wCEjp20b+ws9OpAfxQVZ8FUTbpKNBw6d58TzydDA2B1zp7KGokVrCwiJBT4+
 b3NVHAYqgmQ01jjLmJwg/J6iKdJCN4U893Qbr/WwWzAMHh3jo+Y8ym8sjeGvHH+2jR+B89e/vKht
 aofPLQbwymIYgyLfeufqB6C4UglGjaOwjlNgsdw8zzL6zsWoGCSWFQzvX4FipIOl/S3KVHhIwQe4
 bipDdVA/gtnICNu+aV1v/8+QDNKZtwij3nSuqlWoLD5nNUup0FoXB7jLXfU9A=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Fang Wang <32840572@qq.com>
To: gregkh@linuxfoundation.org, stable@vger.kernel.org,
 tvrtko.ursulin@igalia.com
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, Jesse.Zhang@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.1.y 1/2] drm/amdgpu: Use vmemdup_array_user in
 amdgpu_bo_create_list_entry_array
Date: Mon, 27 Apr 2026 14:54:25 +0800
X-OQ-MSGID: <20260427065425.4120132-1-32840572@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Apr 2026 08:37:19 +0000
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
X-Rspamd-Queue-Id: 372D846F383
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,igalia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qq.com:email,qq.com:dkim,qq.com:mid]

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
index fdc302aa59e7..79e43896eddd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
@@ -226,43 +226,36 @@ void amdgpu_bo_list_put(struct amdgpu_bo_list *list)
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

