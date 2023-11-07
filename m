Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C373C7E3DF3
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Nov 2023 13:32:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC98E10E5D4;
	Tue,  7 Nov 2023 12:32:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0861310E5D4;
 Tue,  7 Nov 2023 12:32:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 83B236117F;
 Tue,  7 Nov 2023 12:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58B0C433CA;
 Tue,  7 Nov 2023 12:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360319;
 bh=wvaUSrY3S8godRYePLky/TPd8j7ygIKj7p7gRhB3l/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MDMfjiNtsbpO+iZnYPtfVe4qHz6YR/7mxZ0qYuL7sj/1ZRjU1nfz6YA9D+CNkpa0L
 4MQrgmSnc+7S3noe7XccD0N3tvviizFOUk+1btstdk1O9HgEvYXtmDRYyU4i6e/ogG
 3+Jr3JzwqV9GgvbaHXyDnFULkDkPeSsCPVKM8V7B4ftRT2MyS8oPECugJa4qoTiBgY
 mXZ8DE09DAoRX6VN/PStXuwT6BNWlSdLTRCpWJJBGJ4CPbm0TpJ5g0eTSt9XGLtzzn
 b5zZ3BT4Gsow3ADI4jKLFmHYeFZ9ts0kjEIjBEDDCJyUF4BX+aZQX5omOstWQXzJq/
 OWQAURrvddaSg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 3/6] drm/radeon: Fix UBSAN
 array-index-out-of-bounds for Radeon HD 5430
Date: Tue,  7 Nov 2023 07:31:34 -0500
Message-ID: <20231107123148.3763062-3-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107123148.3763062-1-sashal@kernel.org>
References: <20231107123148.3763062-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.259
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
Cc: Felix Held <felix.held@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>, airlied@gmail.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit c63079c61177ba1b17fa05c6875699a36924fe39 ]

For pptable structs that use flexible array sizes, use flexible arrays.

Suggested-by: Felix Held <felix.held@amd.com>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2894
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/pptable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/pptable.h b/drivers/gpu/drm/radeon/pptable.h
index 4c2eec49dadc9..94947229888ba 100644
--- a/drivers/gpu/drm/radeon/pptable.h
+++ b/drivers/gpu/drm/radeon/pptable.h
@@ -74,7 +74,7 @@ typedef struct _ATOM_PPLIB_THERMALCONTROLLER
 typedef struct _ATOM_PPLIB_STATE
 {
     UCHAR ucNonClockStateIndex;
-    UCHAR ucClockStateIndices[1]; // variable-sized
+    UCHAR ucClockStateIndices[]; // variable-sized
 } ATOM_PPLIB_STATE;
 
 
-- 
2.42.0

