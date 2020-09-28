Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6A27AEFF
	for <lists+amd-gfx@lfdr.de>; Mon, 28 Sep 2020 15:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FDD89E39;
	Mon, 28 Sep 2020 13:23:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3450289F4A
 for <amd-gfx@lists.freedesktop.org>; Mon, 28 Sep 2020 09:10:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E665DAC85;
 Mon, 28 Sep 2020 09:10:38 +0000 (UTC)
Date: Mon, 28 Sep 2020 11:10:37 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Regression in amdgpu driver / kernel v5.8.6
Message-ID: <20200928111037.51ed4aeb@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Sep 2020 13:23:09 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi all,

I have recently experienced a regression in stable kernel series 5.8.
The problem is that my display will randomly turn to black after just a
few seconds of inactivity. I have to switch to text console then back
to X to recover.

I bisected it down to:

commit b86657e328b601a5b98f8c4c21d108d356dbceee
Author: Navid Emamdoost <navid.emamdoost@gmail.com>
Date:   Sun Jun 14 02:09:44 2020 -0500

    drm/amdgpu: fix ref count leak in amdgpu_display_crtc_set_config
    
    [ Upstream commit e008fa6fb41544b63973a529b704ef342f47cc65 ]
    
Reverting this commit on top of 5.8.10 makes the problem go away. My
hardware setup:

01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin [Radeon RX 550 640SP / RX 560/560X] [1002:67ff] (rev ff)
01:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1002:aae0]

This is a Sapphire Pulse Radeon RX550 card, with two Lenovo P27h-10
displays connected (one over DP, one over HDMI). I'm using option dc=0
otherwise the multi-screen setup doesn't work.

Looking at the patch, and at the logic of function
amdgpu_display_crtc_set_config() in general, I suspect that the middle
chunk of the patch is incorrect. Calling pm_runtime_put_autosuspend()
if pm_runtime_get_sync() failed is, albeit surprising, correct due to
how that function is implemented. Calling it right after
"adev->have_disp_power_ref = true" however looks wrong. The comment
right before that line pretty much implies that we *want* to keep the
reference. 

So I think we want to apply a partial revert like the following:

From: Jean Delvare <jdelvare@suse.de>
Subject: drm/amdgpu: restore proper ref count in amdgpu_display_crtc_set_config

A recent attempt to fix a ref count leak in
amdgpu_display_crtc_set_config() turned out to be doing too much and
"fixed" an intended decrease as if it were a leak. Undo that part to
restore the proper balance. This is the very nature of this function
to increase or decrease the power reference count depending on the
situation.

Consequences of this bug is that the power reference would
eventually get down to 0 while the display was still in use,
resulting in that display switching off unexpectedly.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Fixes: e008fa6fb415 ("drm/amdgpu: fix ref count leak in amdgpu_display_crtc_set_config")
Cc: stable@vger.kernel.org
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c	2020-09-28 10:54:12.634245251 +0200
+++ linux/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c	2020-09-28 10:55:40.569906840 +0200
@@ -297,7 +297,7 @@ int amdgpu_display_crtc_set_config(struc
 	   take the current one */
 	if (active && !adev->have_disp_power_ref) {
 		adev->have_disp_power_ref = true;
-		goto out;
+		return ret;
 	}
 	/* if we have no active crtcs, then drop the power ref
 	   we got before */


-- 
Jean Delvare
SUSE L3 Support
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
