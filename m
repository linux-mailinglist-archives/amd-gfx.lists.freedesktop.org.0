Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B47982D9104
	for <lists+amd-gfx@lfdr.de>; Sun, 13 Dec 2020 23:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F5A89E15;
	Sun, 13 Dec 2020 22:53:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from spam.moreofthesa.me.uk (moreofthesa.me.uk
 [IPv6:2001:8b0:897:1651::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F08D89E1B
 for <amd-gfx@lists.freedesktop.org>; Sun, 13 Dec 2020 22:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=moreofthesa.me.uk; s=201708; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MGkTG9k7jsrjmXs52rIcWv0/XBKwiVWWxekp47jORaU=; b=qCwuHTiopeVsGEih33dnDN592N
 eRWBuZMN1juMz8pb5eO61xyxXuOQtRVkha+apldmH6A2NMpl0sTK/pOqBCPXuPyQDHokAEGK76f9+
 jYkXDLcJGrEZz6cjQTIQXuf57zwA5CB2SWpk8zDLBD5u1+RA/eCeApztgE14pg8acjV0y700AnSnF
 vH8LRFpjFx5PfPWYPzdvHT4PwNJrgqLB3i1KN+cHr6DM/NjuPXxI1kMbZ2ZwIzme40veaBp2csbZN
 ib+GySXlQ/2rpOjlNnneveTl2DwT9PumNve64PGl8uw79nhih09NatPOCEajAhKOG/CRhqu2nKo89
 jKaHdjtg==;
Received: from [2001:8b0:897:1650::2] (helo=flibble.moreofthesa.me.uk)
 by spam.moreofthesa.me.uk with esmtp (Exim 4.92)
 (envelope-from <devspam@moreofthesa.me.uk>)
 id 1koaF3-0004Qu-1j; Sun, 13 Dec 2020 22:53:25 +0000
From: Darren Salt <devspam@moreofthesa.me.uk>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 8/8] amdgpu: add a BAR size quirk for Sapphire RX 5600 XT
 Pulse.
Date: Sun, 13 Dec 2020 22:53:23 +0000
Message-Id: <20201213225323.6752-9-devspam@moreofthesa.me.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201213225323.6752-1-devspam@moreofthesa.me.uk>
References: <20201213225323.6752-1-devspam@moreofthesa.me.uk>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:8b0:897:1650::2
X-SA-Exim-Mail-From: devspam@moreofthesa.me.uk
X-SA-Exim-Scanned: No (on spam.moreofthesa.me.uk);
 SAEximRunCond expanded to false
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
Cc: Darren Salt <devspam@moreofthesa.me.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 442eca5fc6a4..efd6a1d80da2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -903,6 +903,7 @@ static const struct amdgpu_rebar_quirk {
 	int reported_sizes;	/* 0, or as reported by pci_rebar_get_possible_sizes */
 	int available_sizes;	/* bitmap (-256 for anything >= 256MB, effectively automatic) */
 } amdgpu_rebar_quirk_list[] = {
+	{ 0x1002, 0x731f, 0x1da2, 0xe416,  0x700, -256 },	/* Sapphire RX 5600 XT Pulse */
 	{ 0, 0, 0, 0, 0, 0 }
 };
 
-- 
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
