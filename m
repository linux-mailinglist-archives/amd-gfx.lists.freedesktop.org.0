Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7F8BF0F1
	for <lists+amd-gfx@lfdr.de>; Wed,  8 May 2024 01:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D71112FCA;
	Tue,  7 May 2024 23:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q3f7bK/+";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B9112FCA;
 Tue,  7 May 2024 23:13:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF88E61A01;
 Tue,  7 May 2024 23:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628E4C3277B;
 Tue,  7 May 2024 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715123634;
 bh=7XUdhYBuP3PUPxg1+fCt2aEcoCZ3e46AEM3flJ/HOJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q3f7bK/+YcEhTQauWzSdJhpq5cBRLZAiQEFZZ7XOV8lbU65UdJjklVq2wf63GgJwY
 HT5VhmwKeR6Ho0+wBDXSvYxoY4+SVKaoE4WZR3T1FHHThSVNb6rL+RLshy7Gw6gJHI
 1KtVplMExwx4X7BRaERCDnfQH1npB4WcQBf85Mj61AsX8UxVF9Bh0PZTujxzYMHyJD
 bBgWfbVkzOWnLxsWRvEWqQmPtjkIzDY04wGxEpw07SEbFwMRwflk397reKa+d9wkFt
 CJyDHnBxJqUHYmgTnRBej5zorE6xHrE06fWp2ptmwV+yoSILKFtIAGg+3zNtO7DhsI
 b3DBA6HDab7ZA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Gabe Teeger <gabe.teeger@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, wayne.lin@amd.com, alvin.lee2@amd.com,
 sohaib.nadeem@amd.com, charlene.liu@amd.com, sunran001@208suo.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.15 11/15] drm/amd/display: Atom Integrated System
 Info v2_2 for DCN35
Date: Tue,  7 May 2024 19:13:20 -0400
Message-ID: <20240507231333.394765-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507231333.394765-1-sashal@kernel.org>
References: <20240507231333.394765-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.158
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

From: Gabe Teeger <gabe.teeger@amd.com>

[ Upstream commit 9a35d205f466501dcfe5625ca313d944d0ac2d60 ]

New request from KMD/VBIOS in order to support new UMA carveout
model. This fixes a null dereference from accessing
Ctx->dc_bios->integrated_info while it was NULL.

DAL parses through the BIOS and extracts the necessary
integrated_info but was missing a case for the new BIOS
version 2.3.

Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Acked-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Gabe Teeger <gabe.teeger@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 228f098e5d88f..6bc8c6bee411e 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -2303,6 +2303,7 @@ static enum bp_result construct_integrated_info(
 				result = get_integrated_info_v2_1(bp, info);
 				break;
 			case 2:
+			case 3:
 				result = get_integrated_info_v2_2(bp, info);
 				break;
 			default:
-- 
2.43.0

