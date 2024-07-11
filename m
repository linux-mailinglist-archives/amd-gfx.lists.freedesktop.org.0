Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C720A92E0B5
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2024 09:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4F310E97E;
	Thu, 11 Jul 2024 07:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="FgqA5hE1";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3CEBA10E8D7;
 Thu, 11 Jul 2024 05:29:07 +0000 (UTC)
Received: from rrs24-12-35.corp.microsoft.com (unknown [131.107.159.213])
 by linux.microsoft.com (Postfix) with ESMTPSA id E6E4C20B7177;
 Wed, 10 Jul 2024 22:29:06 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E6E4C20B7177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1720675747;
 bh=GrgZD0Hkzoqg2er45AV4orVx3uv9DRAW9Ig4kQ3bnBw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FgqA5hE1sXB4iOkQPdDG5oG9oTeIMjYhZ5UIYE3JRiwap/WtMWEgaO891wM+JZ6Sv
 s2E9Dz+xi/D2+eauPa8a8ZHf3itnSOfI1uKgEfPTRnjWkkbZ28GKFirbWcoCmruE1X
 X8hwgXpltyxj3N8GgmZDjnahP5QfC/z6V4/402Ik=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 netdev@vger.kernel.org (open list:SFC NETWORK DRIVER),
 linux-net-drivers@amd.com (open list:SFC NETWORK DRIVER),
 linux-kernel@vger.kernel.org (open list)
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 intel-xe@lists.freedesktop.org (open list:INTEL DRM DISPLAY FOR XE AND I915
 DRIVERS), 
 linux-i2c@vger.kernel.org (open list:I2C SUBSYSTEM HOST DRIVERS),
 linux-fbdev@vger.kernel.org (open list:FRAMEBUFFER LAYER)
Subject: [PATCH v4 4/6] sfc: falcon: Make I2C terminology more inclusive
Date: Thu, 11 Jul 2024 05:27:32 +0000
Message-Id: <20240711052734.1273652-5-eahariha@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 11 Jul 2024 07:18:56 +0000
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
with more appropriate terms. Inspired by Wolfram's series to fix drivers/i2c/,
fix the terminology for users of I2C_ALGOBIT bitbanging interface, now that
the approved verbiage exists in the specification.

Reviewed-by: Martin Habets <habetsm.xilinx@gmail.com>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 drivers/net/ethernet/sfc/falcon/falcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/falcon/falcon.c b/drivers/net/ethernet/sfc/falcon/falcon.c
index 7a1c9337081b5..36114ce88034c 100644
--- a/drivers/net/ethernet/sfc/falcon/falcon.c
+++ b/drivers/net/ethernet/sfc/falcon/falcon.c
@@ -367,7 +367,7 @@ static const struct i2c_algo_bit_data falcon_i2c_bit_operations = {
 	.getsda		= falcon_getsda,
 	.getscl		= falcon_getscl,
 	.udelay		= 5,
-	/* Wait up to 50 ms for slave to let us pull SCL high */
+	/* Wait up to 50 ms for target to let us pull SCL high */
 	.timeout	= DIV_ROUND_UP(HZ, 20),
 };
 
-- 
2.34.1

