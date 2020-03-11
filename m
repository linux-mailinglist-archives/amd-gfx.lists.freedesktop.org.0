Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC061811EA
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Mar 2020 08:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE126E444;
	Wed, 11 Mar 2020 07:29:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B39C6E444
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2020 07:29:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A55F1AD6C;
 Wed, 11 Mar 2020 07:29:07 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/5] drm/amdgpu/pm: Use scnprintf() for avoiding potential
 buffer overflow
Date: Wed, 11 Mar 2020 08:29:04 +0100
Message-Id: <20200311072904.6363-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Cc: David Zhou <David1.Zhou@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Also adjust the size argument passed to scnprintf() so that it really
cuts off at the right remaining buffer length.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
index bc3cf04a1a94..4a737d074f4b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -448,7 +448,7 @@ static ssize_t amdgpu_get_pp_num_states(struct device *dev,
 
 	buf_len = snprintf(buf, PAGE_SIZE, "states: %d\n", data.nums);
 	for (i = 0; i < data.nums; i++)
-		buf_len += snprintf(buf + buf_len, PAGE_SIZE, "%d %s\n", i,
+		buf_len += scnprintf(buf + buf_len, PAGE_SIZE - buf_len, "%d %s\n", i,
 				(data.states[i] == POWER_STATE_TYPE_INTERNAL_BOOT) ? "boot" :
 				(data.states[i] == POWER_STATE_TYPE_BATTERY) ? "battery" :
 				(data.states[i] == POWER_STATE_TYPE_BALANCED) ? "balanced" :
-- 
2.16.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
