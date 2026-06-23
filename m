Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CqvpJumtOmpODggAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 18:01:45 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E57D56B8863
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jun 2026 18:01:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=TP4TDWhY;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD2A10EBD9;
	Tue, 23 Jun 2026 16:01:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E905B10E874
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jun 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cnSBFXCd5pL6ihoKW9sa7Vs11XeZIKEy1sP0Zhk5fIU=; b=TP4TDWhY/dPl9wuvJX1jtwXn+J
 XwYgIZMdN1v1lHdMPzbKHVWwRWW7y82ry2UTN8pghPa1q/vcOx3AC7I6/Ve7zbsJ0H+ms/1iFbH0R
 ducUhxFiite2i9PsNx/7R42tx2+xw6Nx8ZVxUgRCKpqPipuyfcxF7rMzjoULTK8nxv9fxyKw6/Vvh
 8IPWoW2T5ocEJ8qMII+BsitOFOepG2JTDAMkfYuOmrwTiFjV1CZ8sckyR7eQeAcYUidN/WV+fp2od
 WSjxtd6jmI1goyhKGhMVgmTLzaaPgztb1YBeIaeAiuysv/wCQSS5vHDaSUVX+cTNgv9ZibILkPl+A
 boU+9RgA==;
Received: from 5.red-79-144-94.dynamicip.rima-tde.net ([79.144.94.5]
 helo=killbill.Home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wc3Yo-004FI4-5l; Tue, 23 Jun 2026 18:01:14 +0200
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
Subject: [PATCH v3 1/5] drm/amd/display: use GAMCOR for degamma private props
 in subsampled format
Date: Tue, 23 Jun 2026 17:58:57 +0200
Message-ID: <20260623160112.1636801-2-mwen@igalia.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,linux.dev:email,lists.freedesktop.org:from_smtp,igalia.com:email,igalia.com:mid,igalia.com:from_mime,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E57D56B8863

When setting plane degamma TF via AMD driver-specific color properties,
the driver uses PRE_DEGAM color block (ROM). However, this block cannot
be used with subsampled formats as it affects the linearity of color
space in which HW scaler operates. For subsampled format, use the AMD
color module to map plane degamma predefined curve to LUT and use GAMCOR
block instead (RAM).

This is based on Harry's implementation for Fixed Matrix Colorop.

Link: https://lore.kernel.org/dri-devel/20260330153451.99472-1-harry.wentland@amd.com/
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_color.c  | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index a9a741c21663..df781788ceec 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -1469,7 +1469,7 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 	const struct drm_color_lut *degamma_lut;
 	enum amdgpu_transfer_function tf = AMDGPU_TRANSFER_FUNCTION_DEFAULT;
 	uint32_t degamma_size;
-	bool has_degamma_lut;
+	bool has_degamma_lut, is_subsampled_format;
 	int ret;
 
 	degamma_lut = __extract_blob_lut(dm_plane_state->degamma_lut,
@@ -1499,12 +1499,20 @@ __set_dm_plane_degamma(struct drm_plane_state *plane_state,
 		if (ret)
 			return ret;
        } else {
-		dc_plane_state->in_transfer_func.type =
-			TF_TYPE_PREDEFINED;
+	       /* Check if format requires post-scale color processing (subsampled formats) */
+		is_subsampled_format = (dc_plane_state->format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN &&
+					dc_plane_state->format < SURFACE_PIXEL_FORMAT_SUBSAMPLE_END);
+
+		dc_plane_state->in_transfer_func.type = TF_TYPE_PREDEFINED;
 
 		if (!mod_color_calculate_degamma_params(color_caps,
-		    &dc_plane_state->in_transfer_func, NULL, false))
+							&dc_plane_state->in_transfer_func,
+							NULL,
+							is_subsampled_format)) {
+			drm_err(plane_state->state->dev,
+				"Failed to calculate degamma params.\n");
 			return -ENOMEM;
+		}
 	}
 	return 0;
 }
-- 
2.53.0

