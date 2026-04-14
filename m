Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLWVO6q53mkqHwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2026 00:03:23 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AAE3FEC4F
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Apr 2026 00:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0988010E12E;
	Tue, 14 Apr 2026 22:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X31BDlLc";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8574610E08D;
 Tue, 14 Apr 2026 22:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rrr92PdelXQn6w8/+6Nldx/L8DIfFyGm9uMs1ZaC3Hg=; b=X31BDlLczaorYcmliu6PTn7h/e
 dENboZkfYXCC+NpLRSfJnRI5dRKPCl3jOA+Bivwz3lDWxYBkshacodsUDmCGwf+kYp2ZXmHtGpw0H
 G3faB07yiEHKEZqTiasOGcSdClXmUR6YwjoB35219AvQuKZjjBq9ROcv9z+4RelnwUCO+dXUnuRIJ
 +5RD0FUF79CdTs5nsdf34rEyoBsSOcCe/IjsJDDwQBpz+cy9/cnXj7q3n2saCXeMwkegUix/H4u1i
 1yjfTK3jAK4JrVsvo3xtRAzVqzvfr8B7qod34PMBSuQjzLWTehj+QuIEFdxNjevSDTO9Yrdn8X9Ty
 hIul/n2Q==;
Received: from [186.208.73.228] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wClqi-00G60j-8J; Wed, 15 Apr 2026 00:03:12 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, siqueira@igalia.com,
 sunpeng.li@amd.com
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 "Dr . David Alan Gilbert" <linux@treblig.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Alex Hung <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>,
 pekka.paalanen@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 4/4] drm/amd/display: rework segmentation for linearizing LUT
Date: Tue, 14 Apr 2026 18:55:03 -0300
Message-ID: <20260414220237.184289-5-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414220237.184289-1-mwen@igalia.com>
References: <20260414220237.184289-1-mwen@igalia.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,ffwll.ch,igalia.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.199];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,igalia.com:mid,igalia.com:email,amd.com:email]
X-Rspamd-Queue-Id: 86AAE3FEC4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When linearizing (degamma), the input is an encoded signal bounded to
[0,1] and PQ/sRGB EOTFs are steepest near 1. To increase precision in
the brightest half without increasing total LUT usage, change
region/segment distribution only for PQ/sRGB pre-defined degamma TF by
halving the #pts as you go down, so 128 pts in the top region, then 64
in the next smaller, 32 etc. This way the spacing in [0.5,1] region is
(1-0.5)/128, in [0.25,0.5] region it's (0.5-0.25)/64 == 0.5/128, and so
on.

Suggested-by: Krunoslav Kovac <Krunoslav.Kovac@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../amd/display/dc/dcn30/dcn30_cm_common.c    | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
index b5cb2cd312ba..dc91054134ee 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c
@@ -301,8 +301,6 @@ bool cm3_helper_translate_curve_to_hw_format(struct dc_context *ctx,
 	return true;
 }
 
-#define NUM_DEGAMMA_REGIONS    12
-
 /* Linear interpolation of tf_pts entries, where (i >> 4) is the integer tf_pts
  * index, (i & 0xf) is the 1/16 sub-position.
  */
@@ -343,17 +341,34 @@ bool cm3_helper_translate_curve_to_degamma_hw_format(
 	memset(lut_params, 0, sizeof(struct pwl_params));
 	memset(seg_distr, 0, sizeof(seg_distr));
 
-	region_start = -NUM_DEGAMMA_REGIONS;
-	region_end   = 0;
+	if (output_tf->tf == TRANSFER_FUNCTION_PQ ||
+	    output_tf->tf == TRANSFER_FUNCTION_SRGB) {
+		/* 9 segments
+		 * segments are from 2^-9 to 0
+		 */
+		const uint8_t SEG_COUNT = 9;
+		seg_distr[0] = 0; // Since we only have one point in darkest region
+		for (k = 1; k < SEG_COUNT; k++)
+			seg_distr[k] = k - 1; // 2^(k-1) points per region; halves as k decreases
 
+		region_start = -SEG_COUNT;
+		region_end = 0;
+	} else {
+		/* 12 segments
+		 * segments are from 2^-12 to 2^0
+		 * There are less than 256 points, for optimization
+		 */
+		const uint8_t SEG_COUNT = 12;
+
+		for (i = 0; i < SEG_COUNT; i++)
+			seg_distr[i] = 4;
+
+		region_start = -SEG_COUNT;
+		region_end = 0;
+	}
 
 	for (i = region_end - region_start; i < MAX_REGIONS_NUMBER ; i++)
 		seg_distr[i] = -1;
-	/* 12 segments
-	 * segments are from 2^-12 to 0
-	 */
-	for (i = 0; i < NUM_DEGAMMA_REGIONS ; i++)
-		seg_distr[i] = 4;
 
 	for (k = 0; k < MAX_REGIONS_NUMBER; k++) {
 		if (seg_distr[k] != -1)
-- 
2.53.0

