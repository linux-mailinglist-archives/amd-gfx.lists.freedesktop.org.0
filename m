Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BB827A830
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Sep 2020 09:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 893716E2E1;
	Mon, 28 Sep 2020 07:06:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from services.gouders.net (services.gouders.net [141.101.32.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158F6E059
 for <amd-gfx@lists.freedesktop.org>; Sun, 27 Sep 2020 10:46:40 +0000 (UTC)
Received: from localhost (ltea-047-066-007-142.pools.arcor-ip.net
 [47.66.7.142]) (authenticated bits=0)
 by services.gouders.net (8.14.8/8.14.8) with ESMTP id 08RAiO5n021841
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Sep 2020 12:44:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
 t=1601203466; bh=aemTqKatBtqbMCYYYd/wKTQrYKgZpQbntOAIXHlmPC4=;
 h=From:To:Cc:Subject:Date;
 b=Sd1lid5AcokPfqHVSgfrBXVne/jk/3n4TUcrRkK1sBopIKCWXQlesovQSSkKqy5k0
 wi57oF7MdB/XMt3pFD0fftwnxWM19Z4Rnp2BH5uS8d3NM1FXMF17tSfwo17GQOMZWy
 e9XJ4dcalJlPt2eCI+qb0qSob0n/AOcTlnLfjmfA=
From: Dirk Gouders <dirk@gouders.net>
To: Alex Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6n?=
 =?utf-8?Q?ig?= <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/display: remove duplicate call to
 rn_vbios_smu_get_smu_version()
Date: Sun, 27 Sep 2020 11:39:45 +0200
Message-ID: <ghwo0fzegq.fsf@gouders.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:47 +0000
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
Cc: Sung Lee <sung.lee@amd.com>, Yongqiang Sun <yongqiang.sun@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Commit 78fe9f63947a2b (drm/amd/display: Remove DISPCLK Limit Floor
for Certain SMU Versions) added a call to
rn_vbios_smu_get_smu_version() to set clk_mgr->smu_ver.  That field is
initialized prior to the if-statement, already.

Fixes: 78fe9f63947a2b (drm/amd/display: Remove DISPCLK Limit Floor for Certain SMU Versions)
Signed-off-by: Dirk Gouders <dirk@gouders.net>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Sung Lee <sung.lee@amd.com>
Cc: Yongqiang Sun <yongqiang.sun@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
index 543afa34d87a..21a3073c8929 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
@@ -783,7 +783,6 @@ void rn_clk_mgr_construct(
 	} else {
 		struct clk_log_info log_info = {0};
 
-		clk_mgr->smu_ver = rn_vbios_smu_get_smu_version(clk_mgr);
 		clk_mgr->periodic_retraining_disabled = rn_vbios_smu_is_periodic_retraining_disabled(clk_mgr);
 
 		/* SMU Version 55.51.0 and up no longer have an issue
-- 
2.26.2
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
