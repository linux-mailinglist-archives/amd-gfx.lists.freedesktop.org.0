Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPX2MHeG6GnsLQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 10:27:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358BC443726
	for <lists+amd-gfx@lfdr.de>; Wed, 22 Apr 2026 10:27:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EAA10E978;
	Wed, 22 Apr 2026 08:27:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 468 seconds by postgrey-1.36 at gabe;
 Tue, 21 Apr 2026 13:30:02 UTC
Received: from air.basealt.ru (air.basealt.ru [193.43.8.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EDF010E1E1
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Apr 2026 13:30:02 +0000 (UTC)
Received: from altlinux.ipa.basealt.ru (unknown [193.43.11.2])
 (Authenticated sender: kovalevvv)
 by air.basealt.ru (Postfix) with ESMTPSA id 448DA2338E;
 Tue, 21 Apr 2026 16:22:11 +0300 (MSK)
From: Vasiliy Kovalev <kovalev@altlinux.org>
To: stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, lvc-project@linuxtesting.org,
 kovalev@altlinux.org
Subject: [PATCH 5.10.y] drm/amd/display: Fix memory leak
Date: Tue, 21 Apr 2026 16:22:10 +0300
Message-Id: <20260421132210.38325-1-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Apr 2026 08:27:32 +0000
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
X-Spamd-Result: default: False [0.89 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:alexander.deucher@amd.com,m:sunpeng.li@amd.com,m:lvc-project@linuxtesting.org,m:kovalev@altlinux.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[altlinux.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER(0.00)[kovalev@altlinux.org,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[kovalev@altlinux.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,pku.edu.cn:email]
X-Rspamd-Queue-Id: 358BC443726
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongzhi Liu <lyz_cs@pku.edu.cn>

commit 5d5c6dba2b43e28845d7d7ed32a36802329a5f52 upstream.

[why]
Resource release is needed on the error handling path
to prevent memory leak.

[how]
Fix this by adding kfree on the error handling path.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Fixes: f8ac2cf78f27 ("drm/amd/display: Linux set/read lane settings through debugfs")
Fixes: c06e09b76639 ("drm/amd/display: Add DSC parameters logging to debugfs")
[ kovalev: bp to fix CVE-2022-49135; added Fixes tags ]
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 72 ++++++++++++++-----
 1 file changed, 54 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 6914738f0275..f4a1ad8959b7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -229,8 +229,10 @@ static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -388,8 +390,10 @@ static ssize_t dp_phy_settings_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user((*(rd_buf + result)), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1195,8 +1199,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1212,8 +1218,10 @@ static ssize_t dp_dsc_clock_en_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1351,8 +1359,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1368,8 +1378,10 @@ static ssize_t dp_dsc_slice_width_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1505,8 +1517,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1522,8 +1536,10 @@ static ssize_t dp_dsc_slice_height_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1655,8 +1671,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1672,8 +1690,10 @@ static ssize_t dp_dsc_bits_per_pixel_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1800,8 +1820,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1817,8 +1839,10 @@ static ssize_t dp_dsc_pic_width_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1857,8 +1881,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1874,8 +1900,10 @@ static ssize_t dp_dsc_pic_height_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -1929,8 +1957,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -1946,8 +1976,10 @@ static ssize_t dp_dsc_chunk_size_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
@@ -2001,8 +2033,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
 				break;
 	}
 
-	if (!pipe_ctx)
+	if (!pipe_ctx) {
+		kfree(rd_buf);
 		return -ENXIO;
+	}
 
 	dsc = pipe_ctx->stream_res.dsc;
 	if (dsc)
@@ -2018,8 +2052,10 @@ static ssize_t dp_dsc_slice_bpg_offset_read(struct file *f, char __user *buf,
 			break;
 
 		r = put_user(*(rd_buf + result), buf);
-		if (r)
+		if (r) {
+			kfree(rd_buf);
 			return r; /* r = -EFAULT */
+		}
 
 		buf += 1;
 		size -= 1;
-- 
2.50.1

