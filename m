Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98B53C039
	for <lists+amd-gfx@lfdr.de>; Thu,  2 Jun 2022 23:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B9F113239;
	Thu,  2 Jun 2022 21:07:16 +0000 (UTC)
X-Original-To: amd-gfx@freedesktop.org
Delivered-To: amd-gfx@freedesktop.org
X-Greylist: delayed 370 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jun 2022 21:07:15 UTC
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com [66.187.233.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E878511327E
 for <amd-gfx@freedesktop.org>; Thu,  2 Jun 2022 21:07:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B739F3C10142;
 Thu,  2 Jun 2022 21:01:08 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E6821410F36;
 Thu,  2 Jun 2022 21:01:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: amd-gfx@freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu/dm: Drop != NULL check in
 dm_mst_get_pbn_divider()
Date: Thu,  2 Jun 2022 17:00:56 -0400
Message-Id: <20220602210056.73316-4-lyude@redhat.com>
In-Reply-To: <20220602210056.73316-1-lyude@redhat.com>
References: <20220602210056.73316-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Roman Li <Roman.Li@amd.com>, Hersen Wu <hersenwu@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 "open list:AMD DISPLAY CORE" <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

A lot of code in amdgpu seems to sprinkle in

  if (foo != NULL)
    …

Checks pretty much all over the place, many times in locations where it's
clear foo (whatever foo may be) should never be NULL unless we've run into
a programming error. This is definitely one of those places, as
dm_mst_get_pbn_divider() should never be getting called with a NULL dc_link
pointer.

The problem with this code pattern is that many times the places I've seen
it used in amdgpu have no real error handling. This is actually quite bad,
if we try to avoid the NULL pointer and instead simply skip any code that
was expecting a valid pointer - we're already in undefined territory.
Subsequent code we execute may have expected sideaffects from the code we
skipped that are no longer present, which leads to even more unpredictable
behavior then a simple segfault. This could be silent errors or even just
another segfault somewhere else.

If we simply segfault though, that's not good either. But unlike the former
solution, no subsequent code in the kernel thread will execute - and we
will likely even get a clear backtrace from the invalid memory access. Of
course, the preferred approach is to simply handle the possibility of both
NULL and non-NULL pointers with nice error handling code. However, that's
not always desirable or even possible, and in those cases it's likely just
better to fail predictably rather than unpredictably.

This code is a nice example of that - if link is NULL, you'll return a PBN
divisor of 0. And thus, you've simply traded in your potential segfault for
a potential divide by 0 error. This was something I actually managed to hit
while working on the legacy MST removal work.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 1259f2f7a8f9..35c7def8f2bd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -537,9 +537,6 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 
 int dm_mst_get_pbn_divider(struct dc_link *link)
 {
-	if (!link)
-		return 0;
-
 	return dc_link_bandwidth_kbps(link,
 			dc_link_get_link_cap(link)) / (8 * 1000 * 54);
 }
-- 
2.35.3

