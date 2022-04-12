Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB24FC97E
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Apr 2022 02:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773910FAA9;
	Tue, 12 Apr 2022 00:44:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5430B10FAA7
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Apr 2022 00:44:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 64FDDCE1ACD;
 Tue, 12 Apr 2022 00:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE7D1C385BB;
 Tue, 12 Apr 2022 00:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649724292;
 bh=KY/pX7yzAPIq+xhRMscwIpoouxax//xE9EEAO7UQbhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lf9s4SejnIUubRidldyZCJgvZ9bMSakOZndMKJ84RtovVmWS5yDuI2QRUeAgDOmdB
 wokEvCqsl7nOF7toCm7mlQrnQDBBdIL2azMWOtLsE5irPQe63quCAkFjnwK/2s8oJd
 obWXycOobnLjwmhXERL0eD/Uhes8U19fAmxwIDE35AcrG7Xw1NzQvFDTyTY8Gix+IN
 envJI81QYHiYiGrU6l6ZDtix/llNpoWoR4zDswXbyjfJ5Ly4Ig5aOEOL2f3DgOdOG7
 +IzV1wFsJCuczj7nweXdvCDq3zeCFx/glt/Yynw31wFeGGt6NSZ0yG5YDeWtlRd6ZD
 v85fFo+za15GQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 08/49] drm/amd/display: FEC check in timing
 validation
Date: Mon, 11 Apr 2022 20:43:26 -0400
Message-Id: <20220412004411.349427-8-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412004411.349427-1-sashal@kernel.org>
References: <20220412004411.349427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: aric.cyr@amd.com, airlied@linux.ie, wenjing.liu@amd.com,
 dri-devel@lists.freedesktop.org, meenakshikumar.somasundaram@amd.com,
 lee.jones@linaro.org, Jimmy.Kizito@amd.com, Sasha Levin <sashal@kernel.org>,
 Anthony Koo <Anthony.Koo@amd.com>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, michael.strauss@amd.com,
 harry.wentland@amd.com, Alex Hung <alex.hung@amd.com>,
 Chiawen Huang <chiawen.huang@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Martin.Leung@amd.com, Eric.Yang2@amd.com, Xinhui.Pan@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, Wayne.Lin@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, roy.chan@amd.com,
 nicholas.kazlauskas@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Chiawen Huang <chiawen.huang@amd.com>

[ Upstream commit 7d56a154e22ffb3613fdebf83ec34d5225a22993 ]

[Why]
disable/enable leads FEC mismatch between hw/sw FEC state.

[How]
check FEC status to fastboot on/off.

Reviewed-by: Anthony Koo <Anthony.Koo@amd.com>
Acked-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chiawen Huang <chiawen.huang@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index ba1aa994db4b..a62711d71d0e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -1493,6 +1493,10 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
 	if (!link->link_enc->funcs->is_dig_enabled(link->link_enc))
 		return false;
 
+	/* Check for FEC status*/
+	if (link->link_enc->funcs->fec_is_active(link->link_enc))
+		return false;
+
 	enc_inst = link->link_enc->funcs->get_dig_frontend(link->link_enc);
 
 	if (enc_inst == ENGINE_ID_UNKNOWN)
-- 
2.35.1

