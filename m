Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F453F5DA5
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Aug 2021 14:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0351E89D83;
	Tue, 24 Aug 2021 12:08:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E61892E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Aug 2021 09:42:16 +0000 (UTC)
Received: from zn.tnic (p200300ec2f114400a468d03b56e922c9.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:4400:a468:d03b:56e9:22c9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 39E801EC04D1;
 Tue, 24 Aug 2021 11:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1629798130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=2E1gSXv8MWqJQIsGyQjij5fZV9HIeAhgO4SPXE/v7WU=;
 b=SqJD2bOCllPYG8G6d5EWwDh5i0gFbyo1l45RTX9UKh6nyg0dqT6j+fQHu+1+YeRu++kgBI
 nzGPgPkrdtnQgB7bkFj8H6V4HKLScZbvVqUche3sF2gbcjf/f4V0NBMiPh0UydFotArd/9
 GfG82/as2GvIQUi/uXl+IDa9EjOxqPk=
Date: Tue, 24 Aug 2021 11:42:47 +0200
From: Borislav Petkov <bp@alien8.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Lijo Lazar <Lijo.Lazar@amd.com>,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amdgpu: Fix build with missing pm_suspend_target_state
 module export
Message-ID: <YSS/F9kcQcRKlNJ5@zn.tnic>
References: <YSP6Lv53QV0cOAsd@zn.tnic>
 <CADnq5_O3cg+VtyCBGUDEVxb768jHK6m814W8u-q-kSX9jkHAAw@mail.gmail.com>
 <YSQE6fN9uO0CIWeh@zn.tnic>
 <CADnq5_PEOr=bcmLF2x67hx24=EWwH7DAgEsPjYqXgf8i-beEhg@mail.gmail.com>
 <YSQJL0GBzO2ulEpm@zn.tnic>
 <CADnq5_N0q8Rfm++O3jK6wcbePxg_Oj3=Xx9Utw60npKrEsSp8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADnq5_N0q8Rfm++O3jK6wcbePxg_Oj3=Xx9Utw60npKrEsSp8A@mail.gmail.com>
X-Mailman-Approved-At: Tue, 24 Aug 2021 12:08:17 +0000
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

From: Borislav Petkov <bp@suse.de>

Building a randconfig here triggered:

  ERROR: modpost: "pm_suspend_target_state" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

because the module export of that symbol happens in
kernel/power/suspend.c which is enabled with CONFIG_SUSPEND.

The ifdef guards in amdgpu_acpi_is_s0ix_supported(), however, test for
CONFIG_PM_SLEEP which is defined like this:

  config PM_SLEEP
          def_bool y
          depends on SUSPEND || HIBERNATE_CALLBACKS

and that randconfig has:

  # CONFIG_SUSPEND is not set
  CONFIG_HIBERNATE_CALLBACKS=y

leading to the module export missing.

Change the ifdeffery to depend directly on CONFIG_SUSPEND.

Fixes: 5706cb3c910c ("drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled")
Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lkml.kernel.org/r/YSP6Lv53QV0cOAsd@zn.tnic
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 4137e848f6a2..a9ce3b20d371 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1040,7 +1040,7 @@ void amdgpu_acpi_detect(void)
  */
 bool amdgpu_acpi_is_s0ix_supported(struct amdgpu_device *adev)
 {
-#if IS_ENABLED(CONFIG_AMD_PMC) && IS_ENABLED(CONFIG_PM_SLEEP)
+#if IS_ENABLED(CONFIG_AMD_PMC) && IS_ENABLED(CONFIG_SUSPEND)
 	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
 		if (adev->flags & AMD_IS_APU)
 			return pm_suspend_target_state == PM_SUSPEND_TO_IDLE;
-- 
2.29.2


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
