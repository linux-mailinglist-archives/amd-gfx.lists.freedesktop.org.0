Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CC25A09D3
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Aug 2022 09:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3942D8F4A;
	Thu, 25 Aug 2022 07:19:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252608D419
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Aug 2022 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661343424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YqEqzSG53aD58AoTXBk3s3SN9cZL717VoO9W1oD9K+k=;
 b=BVnk+pGs1e0vLoN8W0wYjPV0WLvlziOPVvR9Q3+iuXLPdAYavbAON2iRUj64VBw27a4ooe
 GXufEz7aUAKsOcE/D4rMnO54jJjezqjn7cGf6kiU58TGFXSZzx9BqdTWI9MJo17D/ockVL
 /VcwUBslohzsEIgZRcl8ZxORBVrN9uM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-1EUQoD2pPy24E-E89QBTrw-1; Wed, 24 Aug 2022 08:16:59 -0400
X-MC-Unique: 1EUQoD2pPy24E-E89QBTrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B50885A585;
 Wed, 24 Aug 2022 12:16:58 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BA8DC15BB3;
 Wed, 24 Aug 2022 12:16:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v4 20/31] platform/x86: apple-gmux: Stop calling acpi/video.h
 functions
Date: Wed, 24 Aug 2022 14:15:12 +0200
Message-Id: <20220824121523.1291269-21-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mailman-Approved-At: Thu, 25 Aug 2022 07:18:48 +0000
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Len Brown <lenb@kernel.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Now that acpi_video_get_backlight_type() has apple-gmux detection (using
apple_gmux_present()), it is no longer necessary for the apple-gmux code
to manually remove possibly conflicting drivers.

So remove the handling for this from the apple-gmux driver.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/apple-gmux.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index ffe98a18440b..ca33df7ea550 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -21,7 +21,6 @@
 #include <linux/delay.h>
 #include <linux/pci.h>
 #include <linux/vga_switcheroo.h>
-#include <acpi/video.h>
 #include <asm/io.h>
 
 /**
@@ -694,7 +693,6 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	 * backlight control and supports more levels than other options.
 	 * Disable the other backlight choices.
 	 */
-	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
 	apple_bl_unregister();
 
 	gmux_data->power_state = VGA_SWITCHEROO_ON;
@@ -804,7 +802,6 @@ static void gmux_remove(struct pnp_dev *pnp)
 	apple_gmux_data = NULL;
 	kfree(gmux_data);
 
-	acpi_video_register();
 	apple_bl_register();
 }
 
-- 
2.37.2

