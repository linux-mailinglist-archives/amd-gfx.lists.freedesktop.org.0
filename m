Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CC194C6C
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 00:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563396E96A;
	Thu, 26 Mar 2020 23:25:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6706E962;
 Thu, 26 Mar 2020 23:25:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC17E2083E;
 Thu, 26 Mar 2020 23:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585265100;
 bh=64g/FuVY4FkADB9UpvuwvHmWfRLDc5mR7iw725sbOe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tcSGkmKzns7w2uSE4BzIaZmhIvnPjTVuKbdpaNoIwf4yoiazGt7CunDyCOmMK+Nrz
 G7kckm9Zi6g3+HnX5ntqoHdiBF3OrwDugCDYN57uMoqblxMI821nOCYTTTspWtMuCT
 DlyUg0+G0b2Qeh6loM/19+nsjZqW7SiGCZ7u8VBI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 04/15] drm/amd/display: Add link_rate quirk for
 Apple 15" MBP 2017
Date: Thu, 26 Mar 2020 19:24:44 -0400
Message-Id: <20200326232455.8029-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232455.8029-1-sashal@kernel.org>
References: <20200326232455.8029-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Mario Kleiner <mario.kleiner.de@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mario Kleiner <mario.kleiner.de@gmail.com>

[ Upstream commit dec9de2ada523b344eb2428abfedf9d6cd0a0029 ]

This fixes a problem found on the MacBookPro 2017 Retina panel:

The panel reports 10 bpc color depth in its EDID, and the
firmware chooses link settings at boot which support enough
bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2
aka 0xc), but the DP_MAX_LINK_RATE dpcd register only reports
2.7 Gbps (multiplier value 0xa) as possible, in direct
contradiction of what the firmware successfully set up.

This restricts the panel to 8 bpc, not providing the full
color depth of the panel on Linux <= 5.5. Additionally, commit
'4a8ca46bae8a ("drm/amd/display: Default max bpc to 16 for eDP")'
introduced into Linux 5.6-rc1 will unclamp panel depth to
its full 10 bpc, thereby requiring a eDP bandwidth for all
modes that exceeds the bandwidth available and causes all modes
to fail validation -> No modes for the laptop panel -> failure
to set any mode -> Panel goes dark.

This patch adds a quirk specific to the MBP 2017 15" Retina
panel to override reported max link rate to the correct maximum
of 0xc = LINK_RATE_RBR2 to fix the darkness and reduced display
precision.

Please apply for Linux 5.6+ to avoid regressing Apple MBP panel
support.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 122249da03ab7..a4928854a3de5 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -2440,6 +2440,17 @@ static bool retrieve_link_cap(struct dc_link *link)
 		sink_id.ieee_device_id,
 		sizeof(sink_id.ieee_device_id));
 
+	/* Quirk Apple MBP 2017 15" Retina panel: Wrong DP_MAX_LINK_RATE */
+	{
+		uint8_t str_mbp_2017[] = { 101, 68, 21, 101, 98, 97 };
+
+		if ((link->dpcd_caps.sink_dev_id == 0x0010fa) &&
+		    !memcmp(link->dpcd_caps.sink_dev_id_str, str_mbp_2017,
+			    sizeof(str_mbp_2017))) {
+			link->reported_link_cap.link_rate = 0x0c;
+		}
+	}
+
 	core_link_read_dpcd(
 		link,
 		DP_SINK_HW_REVISION_START,
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
