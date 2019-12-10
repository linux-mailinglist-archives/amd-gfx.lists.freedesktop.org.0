Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0011194A3
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Dec 2019 22:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBCF6E976;
	Tue, 10 Dec 2019 21:17:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787886E97B;
 Tue, 10 Dec 2019 21:17:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7E2624688;
 Tue, 10 Dec 2019 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012069;
 bh=LA4jwc5q3lPFXscqOD5f2qDp4cgi4LzaCbXLHdoRLws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fs8XgcAWKNtXJ7iyIL8R8dVSPwdloZclkp3no5L66TyR32mZX0oziEKCHxYs7p9vs
 WXKeR0YlY0saTaYzN7QU05e9qkzj/FoB6xG2jjMqYt9Qe/YRG46xDJcK3ryH3QWhiC
 f8K0hI1POx1IWOZdIMrfxTvB/7WpM5TaEFAcNRFA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 050/350] drm/amd/display: Set number of pipes to 1
 if the second pipe was disabled
Date: Tue, 10 Dec 2019 16:02:35 -0500
Message-Id: <20191210210735.9077-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nikola Cornij <nikola.cornij@amd.com>

[ Upstream commit 2fef0faa1cdc5d41ce3ef83f7b8f7e7ecb02d700 ]

[why]
Some ODM-related register settings are inconsistently updated by VBIOS, causing
the state in DC to be invalid, which would then end up crashing in certain
use-cases (such as disable/enable device).

[how]
Check the enabled status of the second pipe when determining the number of
OPTC sources. If the second pipe is disabled, set the number of sources to 1
regardless of other settings (that may not be updated correctly).

Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
Reviewed-by: Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
index 2137e2be21404..dda90995ba933 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_optc.c
@@ -287,6 +287,10 @@ void optc2_get_optc_source(struct timing_generator *optc,
 		*num_of_src_opp = 2;
 	else
 		*num_of_src_opp = 1;
+
+	/* Work around VBIOS not updating OPTC_NUM_OF_INPUT_SEGMENT */
+	if (*src_opp_id_1 == 0xf)
+		*num_of_src_opp = 1;
 }
 
 void optc2_set_dwb_source(struct timing_generator *optc,
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
