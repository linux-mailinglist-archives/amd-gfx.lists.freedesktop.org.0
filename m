Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCF0985962
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2024 13:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEB610E98E;
	Wed, 25 Sep 2024 11:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="djfsNcuZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6010710E98B;
 Wed, 25 Sep 2024 11:52:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E29C35C5B02;
 Wed, 25 Sep 2024 11:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B178C4CEC7;
 Wed, 25 Sep 2024 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265171;
 bh=I9htJGahdm5FhRjP/YpLeFy/I0Nbf95X9HivKlsU7f0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=djfsNcuZ/awWJcmasxx/W9yp0YBqbxVd4Wbq264a5ij7pRn4EhiiqD34uYyo4+4fh
 fgLAVljnImdTwXq3V2ZIfmnIHXvpGIalpRgawHBT4ppIRy1VHUZMpFgR56XlqZg8vp
 TkFWth/5BebuHm+gLQQpCF0lpp6y2z5gnIY10hn3IODhyL4fkwpWdzNdBMZ508kld3
 DqDVZQzkUXml5iIXH+q7fkpUKTYeyt+5hV11QVSo76419pdB5iu5Cmh3LuNRRqm8Ve
 r+1WxUBpPeW5ePM8X8q4euXY7jp+Ys+bXNMVGYO7nhC1P1jvGVxGiQpuhoyNtO0jET
 n1M+MHihnklag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Likun.Gao@amd.com, Hawking.Zhang@amd.com,
 kenneth.feng@amd.com, sunil.khatri@amd.com, Jack.Xiao@amd.com,
 marek.olsak@amd.com, Frank.Min@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 223/244] drm/amdgpu/gfx12: use rlc safe mode for
 soft recovery
Date: Wed, 25 Sep 2024 07:27:24 -0400
Message-ID: <20240925113641.1297102-223-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

[ Upstream commit 21818f39beda2e843199e5d8d9e3f9e43c8080a3 ]

Protect the MMIO access with safe mode.

Acked-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
index 1a84163182689..f0f30cfcf0d76 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c
@@ -4605,7 +4605,9 @@ static void gfx_v12_0_ring_soft_recovery(struct amdgpu_ring *ring,
 	value = REG_SET_FIELD(value, SQ_CMD, MODE, 0x01);
 	value = REG_SET_FIELD(value, SQ_CMD, CHECK_VMID, 1);
 	value = REG_SET_FIELD(value, SQ_CMD, VM_ID, vmid);
+	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
 	WREG32_SOC15(GC, 0, regSQ_CMD, value);
+	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
 }
 
 static void
-- 
2.43.0

