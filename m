Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F612EC1C3
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Jan 2021 18:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003D889C61;
	Wed,  6 Jan 2021 17:08:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42189C19
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 16:57:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCB952313C;
 Wed,  6 Jan 2021 16:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609952235;
 bh=4PX6W2mqUAfXWy3/KbzYQpq3RELQl7lz4i7Y8Q/7+3g=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=nn8CM+aMdDChxCxWIWvU8Xd/l6exkmj8bDUtS4jYp+dfdXuncEeWKagP5xB3CxKh4
 N6P6DKu7wzEjKUGuQQtDudiguAZUkKuzU4KZ0V3wNNSs4MyX09S2DrZwtLz5q4rlmX
 T+NpFOBEAJdNvWl/rhYcuYjA3eeNCCkU1aWzo9OA=
Subject: Patch "Revert "drm/amd/display: Fix memory leaks in S3 resume"" has
 been added to the 5.10-stable tree
To: alexander.deucher@amd.com, alexdeucher@gmail.com,
 amd-gfx@lists.freedesktop.org, andre@tomt.net, gregkh@linuxfoundation.org,
 harry.wentland@amd.com, nicholas.kazlauskas@amd.com, oleksandr@natalenko.name,
 stylon.wang@amd.com
From: <gregkh@linuxfoundation.org>
Date: Wed, 06 Jan 2021 17:58:22 +0100
In-Reply-To: <20210105164545.963036-1-alexander.deucher@amd.com>
Message-ID: <160995230257135@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Mailman-Approved-At: Wed, 06 Jan 2021 17:08:35 +0000
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    Revert "drm/amd/display: Fix memory leaks in S3 resume"

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-drm-amd-display-fix-memory-leaks-in-s3-resume.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From alexdeucher@gmail.com  Wed Jan  6 17:47:17 2021
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue,  5 Jan 2021 11:45:45 -0500
Subject: Revert "drm/amd/display: Fix memory leaks in S3 resume"
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Stylon Wang <stylon.wang@amd.com>, Harry Wentland <harry.wentland@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, Andre Tomt <andre@tomt.net>, Oleksandr Natalenko <oleksandr@natalenko.name>, stable@vger.kernel.org
Message-ID: <20210105164545.963036-1-alexander.deucher@amd.com>

From: Alex Deucher <alexdeucher@gmail.com>

This reverts commit a135a1b4c4db1f3b8cbed9676a40ede39feb3362.

This leads to blank screens on some boards after replugging a
display.  Revert until we understand the root cause and can
fix both the leak and the blank screen after replug.

Cc: Stylon Wang <stylon.wang@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Andre Tomt <andre@tomt.net>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2278,8 +2278,7 @@ void amdgpu_dm_update_connector_after_de
 
 			drm_connector_update_edid_property(connector,
 							   aconnector->edid);
-			aconnector->num_modes = drm_add_edid_modes(connector, aconnector->edid);
-			drm_connector_list_update(connector);
+			drm_add_edid_modes(connector, aconnector->edid);
 
 			if (aconnector->dc_link->aux_mode)
 				drm_dp_cec_set_edid(&aconnector->dm_dp_aux.aux,


Patches currently in stable-queue which might be from alexdeucher@gmail.com are

queue-5.10/revert-drm-amd-display-fix-memory-leaks-in-s3-resume.patch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
