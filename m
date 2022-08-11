Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EF458FFCC
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Aug 2022 17:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED85B4466;
	Thu, 11 Aug 2022 15:34:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E74B4460;
 Thu, 11 Aug 2022 15:33:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 40EFFB82160;
 Thu, 11 Aug 2022 15:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653D8C433D6;
 Thu, 11 Aug 2022 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660232037;
 bh=5a6JKAPIP/NPYa4mszrb2oiMFWfWaHHnGEaPVUo9KuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gFs6DybYjs9/QcjNa9amqoWkb4Qa0K9Kpr6eLVNefoAB8tiL+u7RLkc4hGp8Rny51
 pyIqVgRdNz0KvURUDOBH6BaUWwV6iSfkOw/0i2RrD1U+ISkCM2VINQUsCqdp/xQH62
 iDzNF19QCyXbKPGsGMwh/0Lqoyn68yA/G20S9vQkdxSGj82YBm+C2ZBa7jAx+qv+VV
 gfX6GGOD+N7RGnDo/v0jwSwtvWYwpDgGivRJw7JJBut6LtuzsNeyWBUF0NOt8wZ/OD
 P5hry6sXIdZgHUFvi04DLgw0SP8TldoqpIDTKLuFDp7SpnJuETATsBVLxe2ALr15OV
 Ut/+6zo1OhEtw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 052/105] drm/amdgpu/display/dc: Fix null pointer
 exception
Date: Thu, 11 Aug 2022 11:27:36 -0400
Message-Id: <20220811152851.1520029-52-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811152851.1520029-1-sashal@kernel.org>
References: <20220811152851.1520029-1-sashal@kernel.org>
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
Cc: Aric.Cyr@amd.com, airlied@linux.ie, dale.zhao@amd.com,
 dri-devel@lists.freedesktop.org, Yi-Ling.Chen2@amd.com, isabbasso@riseup.net,
 Anthony.Koo@amd.com, Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 alex.hung@amd.com, Jerry.Zuo@amd.com, Harry Wentland <harry.wentland@amd.com>,
 sunpeng.li@amd.com, mwen@igalia.com, hanghong.ma@amd.com,
 agustin.gutierrez@amd.com, Sungjoon.Kim@amd.com, Xinhui.Pan@amd.com,
 Roman.Li@amd.com, Rahul Kumar <rahul.kumar1@amd.com>, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Rahul Kumar <rahul.kumar1@amd.com>

[ Upstream commit 1c4dae3e4639540fb567e570cc56a3c292afb6fe ]

We observed hard hang due to NULL derefrence This issue is seen after
running system all the time after two or three days

struct dc *dc = plane_state->ctx->dc; Randomly in long run we found
plane_state or plane_state->ctx is found NULL which causes exception.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PF: supervisor read access in kernel mode
PF: error_code(0x0000) - not-present page
PGD 1dc7f2067 P4D 1dc7f2067 PUD 222c75067 PMD 0
Oops: 0000 [#1] SMP NOPTI
CPU: 5 PID: 29855 Comm: kworker/u16:4 ...
...
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dcn10_update_pending_status+0x1f/0xee [amdgpu]
Code: 41 5f c3 0f 1f 44 00 00 b0 01 c3 0f 1f 44 00 00 41 55 41 54 55 53 48 8b 1f 4c 8b af f8 00 00 00 48 8b 83 88 03 00 00 48 85 db <4c> 8b 20 0f 84 bf 00 00 00 48 89 fd 48 8b bf b8 00 00 00 48 8b 07
RSP: 0018:ffff942941997ab8 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8d7fd98d2000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffff8d7e3e87c708 RDI: ffff8d7f2d8c0690
RBP: ffff8d7f2d8c0000 R08: ffff942941997a34 R09: 00000000ffffffff
R10: 0000000000005000 R11: 00000000000000f0 R12: ffff8d7f2d8c0690
R13: ffff8d8035a41680 R14: 00000000000186a0 R15: ffff8d7f2d8c1dd8
FS:  0000000000000000(0000) GS:ffff8d8037340000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000148030000 CR4: 00000000003406e0
Call Trace:
 dc_commit_state+0x6a2/0x7f0 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0x460/0x19bb [amdgpu]

Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Rahul Kumar <rahul.kumar1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
index e3a62873c0e7..ffe496131635 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
@@ -3242,7 +3242,7 @@ void dcn10_update_pending_status(struct pipe_ctx *pipe_ctx)
 	struct dc_plane_state *plane_state = pipe_ctx->plane_state;
 	struct timing_generator *tg = pipe_ctx->stream_res.tg;
 	bool flip_pending;
-	struct dc *dc = plane_state->ctx->dc;
+	struct dc *dc = pipe_ctx->stream->ctx->dc;
 
 	if (plane_state == NULL)
 		return;
-- 
2.35.1

