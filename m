Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CA6AD9278
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Jun 2025 18:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6909510EA2E;
	Fri, 13 Jun 2025 16:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="rLQ63c4K";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 320 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jun 2025 14:14:17 UTC
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD95510E876
 for <amd-gfx@lists.freedesktop.org>; Thu, 12 Jun 2025 14:14:17 +0000 (UTC)
Received: from [192.168.178.76] (host-212-18-30-247.customer.m-online.net
 [212.18.30.247])
 (Authenticated sender: g.gottleuber@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9E63E2FC01A4;
 Thu, 12 Jun 2025 16:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1749737336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s5RIfBjLWs/xgjxHgpqZTRDMhe9rCAFWtvXm/cCwe04=;
 b=rLQ63c4KFwKsdCLhObDXXmCpVSmdMv9txk1MrlfTzroHr2j2j7QInvwdgbM3YAbgBRZW9C
 cF1KyBivKbPYLLbqxJXEFszUJPKhq3fLaa0zR0IdBSgw/QUD09JGN4iKYyYYraCQl/QpM1
 H4Uu1ols9PKB7cq1dLE0CVo77Gw1LtU=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com
 smtp.mailfrom=ggo@tuxedocomputers.com
Message-ID: <fd10cda4-cd9b-487e-b7c6-83c98c9db3f8@tuxedocomputers.com>
Date: Thu, 12 Jun 2025 16:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: stable@vger.kernel.org, regressions@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: ggo@tuxedocomputers.com
Cc: amd-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Christoffer Sandberg <cs@tuxedocomputers.com>
Subject: [REGRESSION] drm/amd/display: Radeon 840M/860M: bisected suspend crash
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 13 Jun 2025 16:05:52 +0000
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

Hi,

I have discovered that two small form factor desktops with Ryzen AI 7
350 and Ryzen AI 5 340 crash when woken up from suspend. I can see how
the LED on the USB mouse is switched on when I trigger a resume via
keyboard button, but the display remains black. The kernel also no
longer responds to Magic SysRq keys in this state.

The problem affects all kernels after merge b50753547453 (v6.11.0). But
this merge only adds PCI_DEVICE_ID_AMD_1AH_M60H_ROOT with commit
59c34008d (necessary to trigger this bug with Ryzen AI CPU).
I cherry-picked this commit and continued searching. Which finally led
me to commit f6098641d3e - drm/amd/display: fix s2idle entry for DCN3.5+

If I remove the code, which has changed somewhat in the meantime, then
the suspend works without any problems. See the following patch.

Regards,
Georg


diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3100f641ac6..76204ae70acc 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3121,9 +3121,6 @@ static int dm_suspend(struct amdgpu_ip_block
*ip_block)

 	dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);

-	if (dm->dc->caps.ips_support && adev->in_s0ix)
-		dc_allow_idle_optimizations(dm->dc, true);
-
 	dc_dmub_srv_set_power_state(dm->dc->ctx->dmub_srv,
DC_ACPI_CM_POWER_STATE_D3);

 	return 0;

