Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C271BE216
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Apr 2020 17:08:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96996EF27;
	Wed, 29 Apr 2020 15:08:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278146E069
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Apr 2020 15:08:49 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 835AD906;
 Wed, 29 Apr 2020 11:03:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 29 Apr 2020 11:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=R3+XHv/jP+/xA9ZbK9P8+A0LI4
 stWJTiqxkB6g7Pvw8=; b=PstCH72cK5PWSPua5saP32LZe+S1NPLzj3mmo/sBq/
 /oBUiXKL9/tSlwECPXn+clHdHkVCiseTA4LtxErpxdxHNK4KX73tqFSe9IdsbJ63
 LFVh3quNTz84sZ+zBIOJwHzeVBhrS7/HXTlOyQWEQIuZa/522pq4PG7r6cE0UrJI
 GHwdn8brQy7rDRs/OFs/PeEXq0gWDoab2alTIUBkjGgvRT2bwgXW9yaHwH5jOhON
 hXl/GPASkCf7DoIIA/qO4qVFVkER1RT+39BdKXJ65vHEBYkTDUYMAGubaMQiMMzk
 xD9HIPQ2N8FDYyAD/4H6l6OOz1klhYRkIRm1Vtw57COQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=R3+XHv/jP+/xA9ZbK
 9P8+A0LI4stWJTiqxkB6g7Pvw8=; b=hGkSkECtVpKeM0ku1st9xXRgsJYGXPZz3
 jA2jeEQ5O7HsB+Zmw+FsjaFLDN2KefsAh2I+Eg/SByVy+SUA5CGPiLk6gyrh3PFo
 RXx+O8O4thsuqk2fbyi+OGzYLzb7BZpZ6R9CS4NFv/gPJeFxh0iVlrNbst6kzQNI
 cm8VXYrgXfLfkVUu1tW/TJsqbWw5hrCeOHhom+62qp5n7AYDXozC+ScB4Lzjrvq8
 Svv7qgw7EKpa+yTJ8IGvkzRhbGQOkoTgI0oYhHHRJwblgmTB3M7jJ0O6ep32qPDw
 /zdYhrRoRM8ZtFBuLKNICIeRpoHSRrZ8oVGEYFhDizm6KouLO6GVA==
X-ME-Sender: <xms:LZepXlMZj_3dKCh-NF1xfwNiGWsZ9JX4oSDcImRdR7863KYvP5YMTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
 dtnecuhfhrohhmpeffrghnihgvlhcumfholhgvshgruceouggrnhhivghlsehotghtrghf
 ohhrghgvrdhorhhgqeenucggtffrrghtthgvrhhnpeeguddtueetffdtheeitdfgheeute
 duvefhheeugeelheehudffudeuveetjeefleenucffohhmrghinhepkhgvrhhnvghlrdho
 rhhgnecukfhppeelgedrudduvddruddvkedrudekleenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghnihgvlhesohgtthgrfhhorhhgvgdr
 ohhrgh
X-ME-Proxy: <xmx:LZepXqT-K3Y-fV6GEoTIlgt2I9ET5G5nswWk7narQBXFWEo4ZdOp-Q>
 <xmx:LZepXi8hhuuYfjJZsR1keU0nQXk6CMqG99oX0jfuuGJzVnvhimmSiA>
 <xmx:LZepXupwbZz3rbbPQsf7sUWwh4JP50luyDrIDFA_M9fnrkJa1rP3og>
 <xmx:MJepXj1mrTnl0bHrelNC9u4b6mFE4NzMwlDnmYXI4MXQEYY5y8aqNg>
Received: from localhost.localdomain (ip-94-112-128-189.net.upcbroadband.cz
 [94.112.128.189])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C85C3280064;
 Wed, 29 Apr 2020 11:03:09 -0400 (EDT)
From: Daniel Kolesa <daniel@octaforge.org>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 0/1] Fix Navi cards crashing with FP exception on 5.6+
Date: Wed, 29 Apr 2020 17:02:35 +0200
Message-Id: <20200429150236.4626-1-daniel@octaforge.org>
X-Mailer: git-send-email 2.26.2
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

This is not a real fix, but rather a workaround that should be applied to the
5.6 tree and newer. The idea here is to work around the compiler emitting FP
instructions outside the DC_FP_START/DC_FP_END blocks, which it currently does,
which causes crashes at least on ppc64le.

A proper solution would be to move all the floating point code into its own
files, then compile those with hard-float and strictly wrap all calls into
those with the DC_FP_START/DC_FP_END blocks, with the rest of the code being
compiled without floating point, but that's too extensive of a change to do,
and would not be possible in a stable tree.

The proper solution is already being discussed, it seems:

https://lore.kernel.org/lkml/CAG48ez2Sx4ELkM94aD_h_J7K7KBOeuGmvZLKRkg3n_f2WoZ_cg@mail.gmail.com/

Daniel Kolesa (1):
  drm/amd/display: work around fp code being emitted outside of
    DC_FP_START/END

 .../drm/amd/display/dc/dcn20/dcn20_resource.c | 31 ++++++++++++++-----
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.26.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
