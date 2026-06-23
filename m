Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fohI+mtOmpJDggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 18:01:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C66B8860
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 18:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=RXITl9dn;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05E0410E874;
	Tue, 23 Jun 2026 16:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34DC10EBD4
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N8uugx1yzGaS+T3ULhgtVXeK8Xnwc8N5ezJNDHNeiEs=; b=RXITl9dnpHYI9TwAe2nzXY+mVQ
 nCQkyNxUNZpboV+j7HX9bqbZEG/PDvZ/OSAVUrwrB6AvupXtSa8m9xSfTyXSrVhNYzPcq6r5LGLz6
 WZU6OhOyD5ABdjW4DLokg26cQY9Yivs3rxyUt29du2BaFsnZ2wSPX3ukqnE9OdFLXg6kd3cUU539e
 Iyn/tPDyDJv0Rk+8ESY8IgsWn/Gy9qpEv77LQCgtg5lZzcBOxRegcNUkybGyiBU9YkKF/I5SjhMMT
 gV9M0/+7OguIKcG7DtoesbL7M3ei79FwCxHKMmro0q4ZIL7C8g6BuCrhzH1a6+mnIwvPkhgZzqdC9
 yFY5WFPA==;
Received: from 5.red-79-144-94.dynamicip.rima-tde.net ([79.144.94.5]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc3Yq-004FI4-BJ; Tue, 23 Jun 2026 18:01:16 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 pekka.paalanen@collabora.com, Xaver Hugl <xaver.hugl@kde.org>,
 robert.mader@posteo.de, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: [PATCH v3 4/5] drm/amd/display: support up to 256 samples per region
 in degamma/blend LUT
Date: Tue, 23 Jun 2026 17:59:00 +0200
Message-ID: <20260623160112.1636801-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623160112.1636801-1-mwen@igalia.com>
References: <20260623160112.1636801-1-mwen@igalia.com>
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
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:airlied@gmail.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:harry.wentland@amd.com,m:simona@ffwll.ch,m:siqueira@igalia.com,m:sunpeng.li@amd.com,m:Krunoslav.Kovac@amd.com,m:linux@treblig.org,m:Bhawanpreet.Lakha@amd.com,m:alex.hung@amd.com,m:Aurabindo.Pillai@amd.com,m:matthew.schwartz@linux.dev,m:pekka.paalanen@collabora.com,m:xaver.hugl@kde.org,m:robert.mader@posteo.de,m:kernel-dev@igalia.com,s:lists@lfdr.de];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,ffwll.ch,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,igalia.com:email,igalia.com:mid,igalia.com:from_mime,lists.freedesktop.org:from_smtp,linux.dev:email,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 783C66B8860

cm3_helper_translate_curve_to_degamma_hw_format() reads one tf_pts entry
per HW LUT point, limiting the number of samples per region to
NUMBER_SW_SEGMENTS (16, at seg_distr[k] = 4) - higher seg_distr[k]
underflows the increment to 0. But the next patch introduces a halving
distribution for PQ/sRGB EOTFs that requires up to 128 samples in its
upper region (seg_distr[k] = 7).

As preparation, extend the loop index by 4 bits and linearly interpolate
adjacent tf_pts entries with the new interp_tf_pts() helper, where the 4
least significant bits are weight in 1/16 increments. This raises the
cap to 256 samples per region (seg_distr[k] = 8). seg_distr[k] <= 4
paths remain unchanged: the 4 least significant bits remain zero and
interp_tf_pts() reduces to a direct lookup.

Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index 0949b1dffc63..70b7bc3494a2 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -305,6 +305,22 @@ bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 
 #define NUM_DEGAMMA_REGIONS    12
 
+/* Linear interpolation of tf_pts entries, where (i >> 4) is the integer tf_pts
+ * index, (i & 0xf) is the 1/16 sub-position.
+ */
+static struct fixed31_32 interp_tf_pts(const struct fixed31_32 *output_tf_channel, int i)
+{
+	struct fixed31_32 in_plus_one, in, value;
+	uint32_t t = i & 0xf;
+
+	in_plus_one = output_tf_channel[(i >> 4) + 1];
+	in = output_tf_channel[i >> 4];
+	value = dc_fixpt_sub(in_plus_one, in);
+	value = dc_fixpt_shr(dc_fixpt_mul_int(value, t), 4);
+	value = dc_fixpt_add(in, value);
+
+	return value;
+}
 
 bool cm3_helper_translate_curve_to_degamma_hw_format(
 				const struct dc_transfer_func *output_tf,
@@ -348,18 +364,20 @@ bool cm3_helper_translate_curve_to_degamma_hw_format(
 
 	j = 0;
 	for (k = 0; k < (region_end - region_start); k++) {
-		increment = NUMBER_SW_SEGMENTS / (1 << seg_distr[k]);
+		increment = (NUMBER_SW_SEGMENTS << 4) / (1 << seg_distr[k]);
 		start_index = (region_start + k + MAX_LOW_POINT) *
 				NUMBER_SW_SEGMENTS;
-		for (i = start_index; i < start_index + NUMBER_SW_SEGMENTS;
-				i += increment) {
+		for (i = (start_index << 4);
+		     i < (start_index << 4) + (NUMBER_SW_SEGMENTS << 4);
+		     i += increment) {
 			if (j == hw_points - 1)
 				break;
-			if (i >= TRANSFER_FUNC_POINTS)
+			if ((i >> 4) + 1 >= TRANSFER_FUNC_POINTS)
 				return false;
-			rgb_resulted[j].red = output_tf->tf_pts.red[i];
-			rgb_resulted[j].green = output_tf->tf_pts.green[i];
-			rgb_resulted[j].blue = output_tf->tf_pts.blue[i];
+
+			rgb_resulted[j].red = interp_tf_pts(output_tf->tf_pts.red, i);
+			rgb_resulted[j].green = interp_tf_pts(output_tf->tf_pts.green, i);
+			rgb_resulted[j].blue = interp_tf_pts(output_tf->tf_pts.blue, i);
 			j++;
 		}
 	}
-- 
2.53.0

