Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C563089ED
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Jan 2021 16:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072556EB67;
	Fri, 29 Jan 2021 15:37:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518C26EB62;
 Fri, 29 Jan 2021 15:37:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECDC864E21;
 Fri, 29 Jan 2021 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934670;
 bh=oN+BjilV+IP08eYlsu3JkzNWAmIGUjZmGP4JJFAvjSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJP6y4+fK4+o4fyMIg+nns3NNthDLR7eVk44MR0l3fUP4JdClsfWlX5Wkgp3HN5Xm
 R5cnMOdmuUBp1TcFMu0OGDxfe/RS79AciVbuJyeKGRTuXT+DXNECFKbEzcBtO/iv4X
 1XeaZjTuRd5DQ8ukRF3zpgzPjQCUjQqAoVZShhWFYC4wq6QI4tkmphpcomohuny29D
 snYP+roeGB58dULW1ZFgO+nyq9GUGXiXKFFAAG/U2vGIniCBbTtDPdb9QMDGMSod+1
 q1fEAPMDhvtkD3rH5DMbh28hfQkH4vR2S/rW623flajeuXQ79Xz6VcHLXjmOju9ouz
 V8V3zyX/T6DNg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/41] drm/amd/display: Update
 dram_clock_change_latency for DCN2.1
Date: Fri, 29 Jan 2021 10:37:00 -0500
Message-Id: <20210129153713.1592185-29-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153713.1592185-1-sashal@kernel.org>
References: <20210129153713.1592185-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Sung Lee <sung.lee@amd.com>,
 Jake Wang <haonan.wang2@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jake Wang <haonan.wang2@amd.com>

[ Upstream commit 901c1ec05ef277ce9d43cb806a225b28b3efe89a ]

[WHY]
dram clock change latencies get updated using ddr4 latency table, but
does that update does not happen before validation. This value
should not be the default and should be number received from
df for better mode support.
This may cause a PState hang on high refresh panels with short vblanks
such as on 1080p 360hz or 300hz panels.

[HOW]
Update latency from 23.84 to 11.72.

Signed-off-by: Sung Lee <sung.lee@amd.com>
Reviewed-by: Tony Cheng <Tony.Cheng@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index e73785e74cba8..20441127783ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -295,7 +295,7 @@ struct _vcs_dpi_soc_bounding_box_st dcn2_1_soc = {
 	.num_banks = 8,
 	.num_chans = 4,
 	.vmm_page_size_bytes = 4096,
-	.dram_clock_change_latency_us = 23.84,
+	.dram_clock_change_latency_us = 11.72,
 	.return_bus_width_bytes = 64,
 	.dispclk_dppclk_vco_speed_mhz = 3600,
 	.xfc_bus_transport_time_us = 4,
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
