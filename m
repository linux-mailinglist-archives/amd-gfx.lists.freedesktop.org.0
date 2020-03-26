Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7274B195293
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Mar 2020 09:08:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A556E9CE;
	Fri, 27 Mar 2020 08:08:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id AC7E06E930
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Mar 2020 21:15:26 +0000 (UTC)
Received: from localhost (p54B3331F.dip0.t-ipconnect.de [84.179.51.31])
 by pokefinder.org (Postfix) with ESMTPSA id BC8592C1F99;
 Thu, 26 Mar 2020 22:10:08 +0100 (CET)
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 6/6] drm/radeon: convert to use i2c_new_client_device()
Date: Thu, 26 Mar 2020 22:10:04 +0100
Message-Id: <20200326211005.13301-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
References: <20200326211005.13301-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Mar 2020 08:08:39 +0000
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Move away from the deprecated API.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/gpu/drm/radeon/radeon_atombios.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_combios.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 848ef68d9086..5d2591725189 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -2111,7 +2111,7 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
 								    ucOverdriveThermalController];
 			info.addr = power_info->info.ucOverdriveControllerAddress >> 1;
 			strlcpy(info.type, name, sizeof(info.type));
-			i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
+			i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 		}
 	}
 	num_modes = power_info->info.ucNumOfPowerModeEntries;
@@ -2351,7 +2351,7 @@ static void radeon_atombios_add_pplib_thermal_controller(struct radeon_device *r
 				const char *name = pp_lib_thermal_controller_names[controller->ucType];
 				info.addr = controller->ucI2cAddress >> 1;
 				strlcpy(info.type, name, sizeof(info.type));
-				i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
+				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 			}
 		} else {
 			DRM_INFO("Unknown thermal controller type %d at 0x%02x %s fan control\n",
diff --git a/drivers/gpu/drm/radeon/radeon_combios.c b/drivers/gpu/drm/radeon/radeon_combios.c
index c3e49c973812..d3c04df7e75d 100644
--- a/drivers/gpu/drm/radeon/radeon_combios.c
+++ b/drivers/gpu/drm/radeon/radeon_combios.c
@@ -2704,7 +2704,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 				const char *name = thermal_controller_names[thermal_controller];
 				info.addr = i2c_addr >> 1;
 				strlcpy(info.type, name, sizeof(info.type));
-				i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
+				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 			}
 		}
 	} else {
@@ -2721,7 +2721,7 @@ void radeon_combios_get_power_modes(struct radeon_device *rdev)
 				const char *name = "f75375";
 				info.addr = 0x28;
 				strlcpy(info.type, name, sizeof(info.type));
-				i2c_new_device(&rdev->pm.i2c_bus->adapter, &info);
+				i2c_new_client_device(&rdev->pm.i2c_bus->adapter, &info);
 				DRM_INFO("Possible %s thermal controller at 0x%02x\n",
 					 name, info.addr);
 			}
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
