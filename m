Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377773DEC86
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Aug 2021 13:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96996E827;
	Tue,  3 Aug 2021 11:44:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD266E827;
 Tue,  3 Aug 2021 11:44:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BF3661037;
 Tue,  3 Aug 2021 11:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627991060;
 bh=rQLv/S40genFcCp8j35vE+84x7LAi+HS53vlIythEyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jiTXeTeljQ2VW+NA9sDe474Y71QNthxwiw9jYh18tABuhTU7K4j52o+tXQrIcooqe
 3C/ZcvcE7o7eQU4ivNrCzRfrPqdZF8We/joSPKGhoDUuZFnM03FQpCdmrAhqv09TN1
 8fymwl6Fd6irw7lxMA9zcAWe03prCqHxMh8xK3dz6DJaEazBKSoZKIOZcuFcACZi4j
 LdU0VQGtiN5w/7KSjfG7w/G1kz74mG8qtoQmOocP5Hh2721u6pIQ22SPGQdGHzm7lC
 WQtnOWp6YvoJL3LrbxrnlpxrOKQPbAeBLIFk3vAFt2S2qb+fHKST9YZPjOAg5EBFVx
 If+hnnanfZRbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <Roman.Li@amd.com>,
 Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 9/9] drm/amdgpu/display: only enable aux
 backlight control for OLED panels
Date: Tue,  3 Aug 2021 07:44:08 -0400
Message-Id: <20210803114408.2252713-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803114408.2252713-1-sashal@kernel.org>
References: <20210803114408.2252713-1-sashal@kernel.org>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit f2ad3accefc63e72e9932e141c21875cc04beec8 ]

We've gotten a number of reports about backlight control not
working on panels which indicate that they use aux backlight
control.  A recent patch:

commit 2d73eabe2984a435737498ab39bb1500a9ffe9a9
Author: Camille Cho <Camille.Cho@amd.com>
Date:   Thu Jul 8 18:28:37 2021 +0800

    drm/amd/display: Only set default brightness for OLED

    [Why]
    We used to unconditionally set backlight path as AUX for panels capable
    of backlight adjustment via DPCD in set default brightness.

    [How]
    This should be limited to OLED panel only since we control backlight via
    PWM path for SDR mode in LCD HDR panel.

    Reviewed-by: Krunoslav Kovac <krunoslav.kovac@amd.com>
    Acked-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
    Signed-off-by: Camille Cho <Camille.Cho@amd.com>
    Signed-off-by: Alex Deucher <alexander.deucher@amd.com>

Changes some other code to only use aux for backlight control on
OLED panels.  The commit message seems to indicate that PWM should
be used for SDR mode on HDR panels.  Do something similar for
backlight control in general.  This may need to be revisited if and
when HDR started to get used.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1438
Bug: https://bugzilla.kernel.org/show_bug.cgi?id=213715
Reviewed-by: Roman Li <Roman.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 6eb308670f48..8d537123e4ad 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2162,9 +2162,9 @@ static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
 	max_cll = conn_base->hdr_sink_metadata.hdmi_type1.max_cll;
 	min_cll = conn_base->hdr_sink_metadata.hdmi_type1.min_cll;
 
-	if (caps->ext_caps->bits.oled == 1 ||
+	if (caps->ext_caps->bits.oled == 1 /*||
 	    caps->ext_caps->bits.sdr_aux_backlight_control == 1 ||
-	    caps->ext_caps->bits.hdr_aux_backlight_control == 1)
+	    caps->ext_caps->bits.hdr_aux_backlight_control == 1*/)
 		caps->aux_support = true;
 
 	if (amdgpu_backlight == 0)
-- 
2.30.2

