Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E331DC18B
	for <lists+amd-gfx@lfdr.de>; Wed, 20 May 2020 23:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455E86E8BA;
	Wed, 20 May 2020 21:46:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Wed, 20 May 2020 21:44:56 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
 by gabe.freedesktop.org (Postfix) with ESMTP id E93956E8B8
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 May 2020 21:44:56 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.188.10.168])
 by mail.ispras.ru (Postfix) with ESMTPSA id D3179CD463;
 Thu, 21 May 2020 00:39:43 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: amd-gfx@lists.freedesktop.org
Subject: Flaky brightness on Renoir
Date: Thu, 21 May 2020 00:36:38 +0300
Message-Id: <20200520213638.1896-1-amonakov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 May 2020 21:46:55 +0000
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Alexander Monakov <amonakov@ispras.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hello,

I have a laptop with the recent Renoir SoC. Screen brightness is
controlled via the amdgpu driver. Unfortunately it doesn't work
properly: brightness doesn't go below a certain threshold. In one
experiment I've found the threshold to be about 95 (of 255), which is
quite high.

There's a bugreport on the tracker from a person with the same laptop
model as mine that says that the threshold may vary from boot to boot.

So far I was able to find a workaround: avoiding
dmcu_set_backlight_level like in the patch below gives more reliable
backlight control (but at the expense of breaking "actual_brightness"
sysfs file, because it reads from DMCU registers).

What might be the problem and can I help investigate this further? Would
really like to see this work properly.

Alexander

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.c
index b8a3fc505c9b..3274b0d15893 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_abm.c
@@ -428,7 +428,7 @@ static bool dce_abm_set_backlight_level_pwm(
 			backlight_pwm_u16_16, backlight_pwm_u16_16);
 
 	/* If DMCU is in reset state, DMCU is uninitialized */
-	if (use_smooth_brightness)
+	if (0 && use_smooth_brightness)
 		dmcu_set_backlight_level(abm_dce,
 				backlight_pwm_u16_16,
 				frame_ramp,
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
