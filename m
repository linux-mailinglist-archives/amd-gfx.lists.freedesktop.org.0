Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B521D228B00
	for <lists+amd-gfx@lfdr.de>; Tue, 21 Jul 2020 23:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F84C6E0FB;
	Tue, 21 Jul 2020 21:19:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 374 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jul 2020 21:19:09 UTC
Received: from us-smtp-delivery-172.mimecast.com
 (us-smtp-delivery-172.mimecast.com [63.128.21.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3336E0FB
 for <amd-gfx@lists.freedesktop.org>; Tue, 21 Jul 2020 21:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valvesoftware.com;
 s=mc20150811; t=1595366348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5TzIyA5sTu5tHG1spCyva9OsQW+qON4td8tIEdyOlLM=;
 b=kRT8pRkk9NHRUq6dj5EkO5L7uWwYilvmZE6x8t2SXc+jAIvgtHifr3jGuTEzSv6VMQK8ed
 ep9DE2bewVYc5UZbK18vZpY0TpZXdArmuTMph23m1CFqSOQv/TvZQjVf3ckPh1bEjBDMrn
 BgxYaUf5x1O9BOjETXJCtzyyP4hIryM=
Received: from smtp-01-blv1.valvesoftware.com (smtp01.valvesoftware.com
 [208.64.203.181]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-R-l1spmJPDmIEgll9e1McA-1; Tue, 21 Jul 2020 17:12:49 -0400
X-MC-Unique: R-l1spmJPDmIEgll9e1McA-1
Received: from [172.16.1.107] (helo=antispam.valve.org)
 by smtp-01-blv1.valvesoftware.com with esmtp (Exim 4.86_2)
 (envelope-from <pgriffais@valvesoftware.com>) id 1jxzZB-000B0Y-01
 for amd-gfx@lists.freedesktop.org; Tue, 21 Jul 2020 14:12:48 -0700
Received: from antispam.valve.org (127.0.0.1) id h2td500171st for
 <amd-gfx@lists.freedesktop.org>;
 Tue, 21 Jul 2020 14:12:48 -0700 (envelope-from <pgriffais@valvesoftware.com>)
Received: from mail1.valvemail.org ([172.16.144.22])
 by antispam.valve.org ([172.16.1.107]) (SonicWALL 9.0.5.2081 )
 with ESMTP id o202007212112480020517-5; Tue, 21 Jul 2020 14:12:48 -0700
Received: from pgriffais.valve.org (172.18.21.27) by mail1.valvemail.org
 (172.16.144.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 21 Jul
 2020 14:12:48 -0700
From: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Create plane rotation property
Date: Tue, 21 Jul 2020 14:13:21 -0700
Message-ID: <20200721211321.10303-1-pgriffais@valvesoftware.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-ClientProxiedBy: mail1.valvemail.org (172.16.144.22) To mail1.valvemail.org
 (172.16.144.22)
X-EXCLAIMER-MD-CONFIG: fe5cb8ea-1338-4c54-81e0-ad323678e037
X-Mlf-CnxnMgmt-Allow: 172.16.144.22
X-Mlf-Version: 9.0.5.2081
X-Mlf-License: BSVKCAP__
X-Mlf-UniqueId: o202007212112480020517
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: valvesoftware.com
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
Cc: "Pierre-Loup A. Griffais" <pgriffais@valvesoftware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It's otherwise properly supported, just needs exposing to userspace.

Signed-off-by: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a52f0b13a2c8..b7bef398057e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4713,6 +4713,7 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	uint32_t formats[32];
 	int num_formats;
 	int res = -EPERM;
+	unsigned int supported_rotations;
 
 	num_formats = get_plane_formats(plane, plane_cap, formats,
 					ARRAY_SIZE(formats));
@@ -4744,6 +4745,13 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE);
 	}
 
+	supported_rotations =
+		DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
+		DRM_MODE_ROTATE_180 | DRM_MODE_ROTATE_270;
+
+	drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
+					   supported_rotations);
+
 	drm_plane_helper_add(plane, &dm_plane_helper_funcs);
 
 	/* Create (reset) the plane state */
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
