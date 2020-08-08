Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2396123F8CD
	for <lists+amd-gfx@lfdr.de>; Sat,  8 Aug 2020 22:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676866E264;
	Sat,  8 Aug 2020 20:51:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADEE6E265
 for <amd-gfx@lists.freedesktop.org>; Sat,  8 Aug 2020 20:51:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 3A1AA9B1;
 Sat,  8 Aug 2020 16:42:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sat, 08 Aug 2020 16:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=vDDuBk+jZ42MX7qfqherLSlkZP
 hjCEkATJ83Qv7ODtk=; b=LaPhN4oDZovitSrjF8Pp+3xyE78cr55LZfI7KM11RK
 gFekOGmGkGWbBavHOEtEulSWKf0rHdFnG8Z9QkMPwGIlDONyEd6Vn5kNYIvDT30T
 jyy9dBClQ2569HZXZIhgGtjnNRPJlsJXMAlAUz1PPzNeGUksyXIKl2RxzgiWvTrF
 Yv8ntAvXLOBANmz/VvvTOmTmhGUzlaY8w0R/N+pu4zAVLC0tnaNW//PjU/wFLXkH
 zfRh8HYkm67fnmCLOSkfrma55OnL6SINQwiSelszHIy7YCXpUsboEiDO73F3Fjs7
 RpM+K2fElDuZHWyKb3HBzDKwUEH50AYr9SlwOcWXyZEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vDDuBk+jZ42MX7qfq
 herLSlkZPhjCEkATJ83Qv7ODtk=; b=kZ4ftpFo/3JQjqTliOPZNrP+v36fwvbKP
 3l1s24+lVUUftPp7de8b51DNrfvaE0mDYlCwCB2L8Uf52cdpXMP+ql3js+JOYz2R
 RHRzanFG+j1qBeUhojRi2w83bdafcWJA5Xc+prI+K9uAcK3M/BGUk2W6yMIxfRUn
 nGUO1rZKnr/uiQav2k7JX07ELvB3OSE/XrH9Nbdhda8Kij3UBqLD+ExmgJGem2+I
 GbRxgduVHvlptSCqP7kqRbN4Lt5ysy6kE1B8/uQQ0udQCLTWT8uUROGrZWnLNvNO
 44GJZsGuY1J7/DBBp91ylKFk5DJ4acjJhNvNPawiI0H85z2Zk2mKQ==
X-ME-Sender: <xms:Sw4vX_mPjOX6EIkB9tIYOMK1g38cCyQ9N6q48uNQUuaDtnYUQFfGqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkeeggddufedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepffgrnhhivghlucfmohhlvghsrgcuoegurghnihgvlhesohgtthgr
 fhhorhhgvgdrohhrgheqnecuggftrfgrthhtvghrnhepteeffeehfeffueejgffhjeegtd
 elffdvveetudffffelieeggfeuleeilefhleehnecuffhomhgrihhnpehfrhgvvgguvghs
 khhtohhprdhorhhgnecukfhppeelgedrudduvddruddvkedrudekleenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhesohgtthgr
 fhhorhhgvgdrohhrgh
X-ME-Proxy: <xmx:Sw4vXy0ftfV9cc_OmznMvMOkxp7fKDXun3TlSkQMv3LcKqUMEvG39w>
 <xmx:Sw4vX1oM_RJBN8bC4Dk4-ZRaLIcuAHmNXLjiQA0zqlD-dCantzyYmg>
 <xmx:Sw4vX3mKsiLblUXDCooUJJrdM1WlgxA5K8Ii2OVL5hF18WzLTiJiHw>
 <xmx:Sw4vX-Cg1-Y_WPlYDvh-SypRAvdv8H64fGDZO25O0aujpybq1m6qAg>
Received: from localhost.localdomain (ip-94-112-128-189.net.upcbroadband.cz
 [94.112.128.189])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B2A2328005E;
 Sat,  8 Aug 2020 16:42:50 -0400 (EDT)
From: Daniel Kolesa <daniel@octaforge.org>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] drm/amdgpu/display: fix context switch issues in
 dcn20_validate_bandwidth
Date: Sat,  8 Aug 2020 22:42:34 +0200
Message-Id: <20200808204235.12313-1-daniel@octaforge.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
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
Cc: Daniel Kolesa <daniel@octaforge.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is likely the real fix for issues such as
https://gitlab.freedesktop.org/drm/amd/-/issues/1215, or perhaps
https://gitlab.freedesktop.org/drm/amd/-/issues/1191, and should
be probably backported into existing stable trees.

Daniel Kolesa (1):
  drm/amdgpu/display: use GFP_ATOMIC in
    dcn20_validate_bandwidth_internal

 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
