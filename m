Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DF8B86B8
	for <lists+amd-gfx@lfdr.de>; Wed,  1 May 2024 10:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C976311226F;
	Wed,  1 May 2024 08:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="gjFawLTz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 26524112DA8;
 Tue, 30 Apr 2024 17:39:42 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.174.176])
 by linux.microsoft.com (Postfix) with ESMTPSA id B4ED5210FBDF;
 Tue, 30 Apr 2024 10:39:41 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B4ED5210FBDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714498781;
 bh=GHAW6qW4WA/oAJKIMASrtOuwS0xGaRgm050S/InKhew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gjFawLTzzT5n5hByLvy0ba4Yuv8dNzde2XdQac1V0hUeFwKIEaitOgrGU69boxUon
 6xbLJKwhhb1SGsG6HR1byAPO7Ljs+RVaXaFJXdrLqa+uJo3s/Ms9Z8xjIUHSDlqAjv
 69TnBshGeuEEGUTWIq95dEnFX6hkDNKUQugqyWZA=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org (open list:COBALT MEDIA DRIVER),
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
Subject: [PATCH v1 05/12] media: cobalt: Make I2C terminology more inclusive
Date: Tue, 30 Apr 2024 17:38:04 +0000
Message-Id: <20240430173812.1423757-6-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 01 May 2024 08:03:27 +0000
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
 drivers/media/pci/cobalt/cobalt-i2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/cobalt/cobalt-i2c.c b/drivers/media/pci/cobalt/cobalt-i2c.c
index 10c9ee33f73e..d2963370f949 100644
--- a/drivers/media/pci/cobalt/cobalt-i2c.c
+++ b/drivers/media/pci/cobalt/cobalt-i2c.c
@@ -45,10 +45,10 @@ struct cobalt_i2c_regs {
 /* I2C stop condition */
 #define M00018_CR_BITMAP_STO_MSK	(1 << 6)
 
-/* I2C read from slave */
+/* I2C read from client */
 #define M00018_CR_BITMAP_RD_MSK		(1 << 5)
 
-/* I2C write to slave */
+/* I2C write to client */
 #define M00018_CR_BITMAP_WR_MSK		(1 << 4)
 
 /* I2C ack */
@@ -59,7 +59,7 @@ struct cobalt_i2c_regs {
 
 /* SR[7:0] - Status register */
 
-/* Receive acknowledge from slave */
+/* Receive acknowledge from client */
 #define M00018_SR_BITMAP_RXACK_MSK	(1 << 7)
 
 /* Busy, I2C bus busy (as defined by start / stop bits) */
-- 
2.34.1

