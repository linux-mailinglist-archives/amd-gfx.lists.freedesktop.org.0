Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5858BCB70
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2024 12:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BB5112BE3;
	Mon,  6 May 2024 10:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="YZAHRyiJ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1C4DE1131AE;
 Fri,  3 May 2024 18:15:12 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
 by linux.microsoft.com (Postfix) with ESMTPSA id D81E2207DBCB;
 Fri,  3 May 2024 11:15:11 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D81E2207DBCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714760111;
 bh=/A3R6LdZJrExpiEpXl1oiDkbBSQmYdztPra//mlDMZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YZAHRyiJJtKvQIbmQAkEONQGyns54fi6WNNS24AW8WyJNJEmZbe/SKAYgl5kBiSfI
 lARvpAUaEoE0f10tzgZXfeoW9QsoBn8BBV43otedvIY/biLfCmlKVSq1rV9hPx/XfL
 89Cf41VoERmXkm1v46ABdX3qlm7jYVqgnmeREf5k=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)), 
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-media@vger.kernel.org (open list:BTTV VIDEO4LINUX DRIVER),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v2 04/12] media: au0828: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:25 +0000
Message-Id: <20240503181333.2336999-5-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
References: <20240503181333.2336999-1-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 May 2024 09:59:59 +0000
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

I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
with more appropriate terms. Inspired by and following on to Wolfram's
series to fix drivers/i2c/[1], fix the terminology for users of
I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
in the specification.

Compile tested, no functionality changes intended

[1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/media/usb/au0828/au0828-i2c.c   | 4 ++--
 drivers/media/usb/au0828/au0828-input.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/au0828/au0828-i2c.c b/drivers/media/usb/au0828/au0828-i2c.c
index 749f90d73b5b..743cb44f52aa 100644
--- a/drivers/media/usb/au0828/au0828-i2c.c
+++ b/drivers/media/usb/au0828/au0828-i2c.c
@@ -23,7 +23,7 @@ MODULE_PARM_DESC(i2c_scan, "scan i2c bus at insmod time");
 #define I2C_WAIT_DELAY 25
 #define I2C_WAIT_RETRY 1000
 
-static inline int i2c_slave_did_read_ack(struct i2c_adapter *i2c_adap)
+static inline int i2c_target_did_read_ack(struct i2c_adapter *i2c_adap)
 {
 	struct au0828_dev *dev = i2c_adap->algo_data;
 	return au0828_read(dev, AU0828_I2C_STATUS_201) &
@@ -35,7 +35,7 @@ static int i2c_wait_read_ack(struct i2c_adapter *i2c_adap)
 	int count;
 
 	for (count = 0; count < I2C_WAIT_RETRY; count++) {
-		if (!i2c_slave_did_read_ack(i2c_adap))
+		if (!i2c_target_did_read_ack(i2c_adap))
 			break;
 		udelay(I2C_WAIT_DELAY);
 	}
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 3d3368202cd0..6c9e5ea795f2 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -30,7 +30,7 @@ struct au0828_rc {
 	int polling;
 	struct delayed_work work;
 
-	/* i2c slave address of external device (if used) */
+	/* i2c target address of external device (if used) */
 	u16 i2c_dev_addr;
 
 	int  (*get_key_i2c)(struct au0828_rc *ir);
-- 
2.34.1

