Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FC74EF095
	for <lists+amd-gfx@lfdr.de>; Fri,  1 Apr 2022 16:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF0310F075;
	Fri,  1 Apr 2022 14:38:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B7310F075
 for <amd-gfx@lists.freedesktop.org>; Fri,  1 Apr 2022 14:37:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id C9811CE2584;
 Fri,  1 Apr 2022 14:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BBDDC36AE2;
 Fri,  1 Apr 2022 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648823873;
 bh=9SwZjN5pei0120WJ30KOigmqHH8xQmOIc1MenG8KrVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VAqyKiexRogIOki6IIvkCo2ttbP9L28UcYkIRDdAdEQxEmpgI7qYT3hhhGEZrVm2e
 UvhIoEROb4LUlw+r+KK3J04L9FpOKJfTMeiJUOfb2K4zKsgK/IuvedjMlch+1FSLLB
 RdmKItjHohul2cp7y1CZ1KPvARQoL3OZDQsRaiAppOoquuMMI02NpnXiSpzYAw/uTP
 2d5t39Y9b3bxraKKhh49/k0qbHf4iDEzYD+JRMNWf97fvJbx5hKdUIui697yz5Gbcb
 gx0UL5JRYgtb1uochR33lnt41GUvzLOEDD/kunQSulgZC42spB3sqMPHnYuzSUd6lV
 bM7xc81jb1w4w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/98] drm/amd/display: Add signal type check
 when verify stream backends same
Date: Fri,  1 Apr 2022 10:36:07 -0400
Message-Id: <20220401143742.1952163-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220401143742.1952163-1-sashal@kernel.org>
References: <20220401143742.1952163-1-sashal@kernel.org>
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
Cc: aric.cyr@amd.com, airlied@linux.ie, Rodrigo.Siqueira@amd.com,
 Dale Zhao <dale.zhao@amd.com>, dri-devel@lists.freedesktop.org,
 meenakshikumar.somasundaram@amd.com, Jun.Lei@amd.com, Jimmy.Kizito@amd.com,
 Sasha Levin <sashal@kernel.org>, mario.kleiner.de@gmail.com,
 wenjing.liu@amd.com, amd-gfx@lists.freedesktop.org, Jerry.Zuo@amd.com,
 eric.bernstein@amd.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 Daniel Wheeler <daniel.wheeler@amd.com>, Martin.Leung@amd.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com, Dmytro.Laktyushkin@amd.com,
 daniel@ffwll.ch, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, nicholas.kazlauskas@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Dale Zhao <dale.zhao@amd.com>

[ Upstream commit 047db281c026de5971cedb5bb486aa29bd16a39d ]

[Why]
For allow eDP hot-plug feature, the stream signal may change to VIRTUAL
when plug-out and back to eDP when plug-in. OS will still setPathMode
with same timing for each plugging, but eDP gets no stream update as we
don't check signal type changing back as keeping it VIRTUAL. It's also
unsafe for future cases that stream signal is switched with same timing.

[How]
Check stream signal type change include previous HDMI signal case.

Reviewed-by: Aric Cyr <Aric.Cyr@amd.com>
Acked-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Dale Zhao <dale.zhao@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index 7ae409f7dcf8..108f3854cd2a 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -1599,6 +1599,9 @@ static bool are_stream_backends_same(
 	if (is_timing_changed(stream_a, stream_b))
 		return false;
 
+	if (stream_a->signal != stream_b->signal)
+		return false;
+
 	if (stream_a->dpms_off != stream_b->dpms_off)
 		return false;
 
-- 
2.34.1

