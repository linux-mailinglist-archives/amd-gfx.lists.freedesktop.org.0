Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4D8BCB71
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2024 12:00:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA169112D23;
	Mon,  6 May 2024 10:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="RbaGjOBB";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2BE991131C4;
 Fri,  3 May 2024 18:15:23 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.8.16])
 by linux.microsoft.com (Postfix) with ESMTPSA id E4C07207DBD3;
 Fri,  3 May 2024 11:15:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E4C07207DBD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714760123;
 bh=GRfclEajWoxq9anjZ8/quZpV/Z3y2+4plsXg8F9UrVY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RbaGjOBBdDpdkReR4G1Vy/PQmVk7kDqLiUu/ZWwLqHH3iZsD3GLww0ZwrbgD3eg6e
 P8CoCikMLUwY0jvmFyD939JMdB60FBBltMTPH5dXcJoMhNDi3+Ff/Am1+J6gq3l6rP
 ArWOYoPFGDHm1xbRHIAeC4dLAjQygket18Gjs7oE=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:IVTV VIDEO4LINUX DRIVER),
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
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER),
 Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v2 08/12] media: ivtv: Make I2C terminology more inclusive
Date: Fri,  3 May 2024 18:13:29 +0000
Message-Id: <20240503181333.2336999-9-eahariha@linux.microsoft.com>
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
 drivers/media/pci/ivtv/ivtv-i2c.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-i2c.c b/drivers/media/pci/ivtv/ivtv-i2c.c
index c052c57c6dce..a22c7caa92f7 100644
--- a/drivers/media/pci/ivtv/ivtv-i2c.c
+++ b/drivers/media/pci/ivtv/ivtv-i2c.c
@@ -33,14 +33,14 @@
     Some more general comments about what we are doing:
 
     The i2c bus is a 2 wire serial bus, with clock (SCL) and data (SDA)
-    lines.  To communicate on the bus (as a master, we don't act as a slave),
+    lines.  To communicate on the bus (as a controller, we don't act as a target),
     we first initiate a start condition (ivtv_start).  We then write the
     address of the device that we want to communicate with, along with a flag
-    that indicates whether this is a read or a write.  The slave then issues
+    that indicates whether this is a read or a write.  The target then issues
     an ACK signal (ivtv_ack), which tells us that it is ready for reading /
     writing.  We then proceed with reading or writing (ivtv_read/ivtv_write),
     and finally issue a stop condition (ivtv_stop) to make the bus available
-    to other masters.
+    to other controllers.
 
     There is an additional form of transaction where a write may be
     immediately followed by a read.  In this case, there is no intervening
@@ -379,7 +379,7 @@ static int ivtv_waitsda(struct ivtv *itv, int val)
 	return 0;
 }
 
-/* Wait for the slave to issue an ACK */
+/* Wait for the target to issue an ACK */
 static int ivtv_ack(struct ivtv *itv)
 {
 	int ret = 0;
@@ -396,7 +396,7 @@ static int ivtv_ack(struct ivtv *itv)
 	ivtv_scldelay(itv);
 	ivtv_setscl(itv, 1);
 	if (!ivtv_waitsda(itv, 0)) {
-		IVTV_DEBUG_I2C("Slave did not ack\n");
+		IVTV_DEBUG_I2C("Target did not ack\n");
 		ret = -EREMOTEIO;
 	}
 	ivtv_setscl(itv, 0);
@@ -407,7 +407,7 @@ static int ivtv_ack(struct ivtv *itv)
 	return ret;
 }
 
-/* Write a single byte to the i2c bus and wait for the slave to ACK */
+/* Write a single byte to the i2c bus and wait for the target to ACK */
 static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 {
 	int i, bit;
@@ -427,7 +427,7 @@ static int ivtv_sendbyte(struct ivtv *itv, unsigned char byte)
 		}
 		ivtv_setscl(itv, 1);
 		if (!ivtv_waitscl(itv, 1)) {
-			IVTV_DEBUG_I2C("Slave not ready for bit\n");
+			IVTV_DEBUG_I2C("Target not ready for bit\n");
 			return -EREMOTEIO;
 		}
 	}
@@ -471,7 +471,7 @@ static int ivtv_readbyte(struct ivtv *itv, unsigned char *byte, int nack)
 	return 0;
 }
 
-/* Issue a start condition on the i2c bus to alert slaves to prepare for
+/* Issue a start condition on the i2c bus to alert targets to prepare for
    an address write */
 static int ivtv_start(struct ivtv *itv)
 {
@@ -534,7 +534,7 @@ static int ivtv_stop(struct ivtv *itv)
 	return 0;
 }
 
-/* Write a message to the given i2c slave.  do_stop may be 0 to prevent
+/* Write a message to the given i2c target.  do_stop may be 0 to prevent
    issuing the i2c stop condition (when following with a read) */
 static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len, int do_stop)
 {
@@ -558,7 +558,7 @@ static int ivtv_write(struct ivtv *itv, unsigned char addr, unsigned char *data,
 	return ret;
 }
 
-/* Read data from the given i2c slave.  A stop condition is always issued. */
+/* Read data from the given i2c target.  A stop condition is always issued. */
 static int ivtv_read(struct ivtv *itv, unsigned char addr, unsigned char *data, u32 len)
 {
 	int retry, ret = -EREMOTEIO;
-- 
2.34.1

