Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2E644E51
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Dec 2022 23:04:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F7B410E15B;
	Tue,  6 Dec 2022 22:04:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920810E120;
 Tue,  6 Dec 2022 10:48:00 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1670323677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dyDdQ0ouK6C8bS9bKimyo6WyQoc/XZnFKa1MkRVBOUU=;
 b=eUZgBGctez7/faDwGHUnXo0cKQutXkFVBBoyVX6M9Qvwybd7AhC7TAbCcDg+bdqNrSYtVs
 6Ca9APE+/edoMT9CpKngwaL8dd6GjVYFKBuy35NnW30qm/U1zrLoFJH7KURuQ8xidTAmeE
 UKmkFX0dnTNI9TPEUU/JCFrrlOgqNhA=
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH] drm/amd/display: Added pointer check
Date: Tue,  6 Dec 2022 13:47:57 +0300
Message-Id: <20221206104757.31512-1-arefev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 06 Dec 2022 22:04:13 +0000
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
Cc: trufanov@swemel.ru, lvc-project@linuxtesting.org,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, vfh@swemel.ru,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Return value of a function 'dc_create_state' is
dereferenced at amdgpu_dm.c:2027 without checking for null

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 0f7749e9424d..529483997154 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1960,7 +1960,9 @@ static int dm_resume(void *handle)
 	dc_release_state(dm_state->context);
 	dm_state->context = dc_create_state(dm->dc);
 	/* TODO: Remove dc_state->dccg, use dc->dccg directly. */
-	dc_resource_state_construct(dm->dc, dm_state->context);
+	if (dm_state->context) {
+		dc_resource_state_construct(dm->dc, dm_state->context);
+	}
 
 	/* Before powering on DC we need to re-initialize DMUB. */
 	r = dm_dmub_hw_init(adev);
-- 
2.25.1

