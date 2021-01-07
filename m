Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073552ED2DC
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Jan 2021 15:38:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB5D6E488;
	Thu,  7 Jan 2021 14:38:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512F96E466
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 14:32:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EB3323340;
 Thu,  7 Jan 2021 14:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610029933;
 bh=muR2kQFQILfLiyi2AXgXzFAGkI5+hz4YcTyi8BYH/WM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mGWrzQwVl4+rX4lJJC03Nbbn389HQzx4lWO8bMFpwMeJitMC5kP1Ax+8XRgavHmvn
 3vZRKdx6wB/hHolK4vtQsCWc8D1c/XCHrwNilyGSO1oVh9nmoYkMD9hVT7ViqOykUq
 NLSzU4lJV15JKwI9OIidAZXbueZq3nPr+f/Twsdw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 5.4 01/13] Revert "drm/amd/display: Fix memory leaks in S3
 resume"
Date: Thu,  7 Jan 2021 15:33:20 +0100
Message-Id: <20210107143050.100326268@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107143049.929352526@linuxfoundation.org>
References: <20210107143049.929352526@linuxfoundation.org>
User-Agent: quilt/0.66
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Jan 2021 14:38:47 +0000
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
Cc: Stylon Wang <stylon.wang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, stable@vger.kernel.org,
 Andre Tomt <andre@tomt.net>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Deucher <alexdeucher@gmail.com>

This reverts commit a135a1b4c4db1f3b8cbed9676a40ede39feb3362.

This leads to blank screens on some boards after replugging a
display.  Revert until we understand the root cause and can
fix both the leak and the blank screen after replug.

Cc: Stylon Wang <stylon.wang@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Andre Tomt <andre@tomt.net>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1434,8 +1434,7 @@ amdgpu_dm_update_connector_after_detect(
 
 			drm_connector_update_edid_property(connector,
 							   aconnector->edid);
-			aconnector->num_modes = drm_add_edid_modes(connector, aconnector->edid);
-			drm_connector_list_update(connector);
+			drm_add_edid_modes(connector, aconnector->edid);
 
 			if (aconnector->dc_link->aux_mode)
 				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
