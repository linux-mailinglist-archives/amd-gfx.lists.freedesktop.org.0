Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACE42BB65F
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Nov 2020 21:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872816E915;
	Fri, 20 Nov 2020 20:19:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40136.protonmail.ch (mail-40136.protonmail.ch
 [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8CE6E913
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Nov 2020 20:19:03 +0000 (UTC)
Date: Fri, 20 Nov 2020 20:18:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605903542;
 bh=b/JHT+GrLKB0z9S5MzzS+imQ0u3mjJzf11Y4O3k4Dvo=;
 h=Date:To:From:Reply-To:Subject:From;
 b=Zp9RYyfwX25WyOgL1ZlAeoDKBSXZGMDBAE+sIJSsoMga/HjEDG7sFHTWQvzH6JiA8
 YYFgiC3i/QvStndzsNJ/ZVdrRQuJpBZEAYQxU83EgT9k2ru3E09MN3g1NFILtNUI1D
 QPdq+4pWPU9uxX/IytlDkLMuQQvkhduK5s8DtcVvqJAu9m4PWDk01F+BX4Uay2uyyH
 rer6cGA6AzeCt3/FCRvWQExmCa2OIR9zUhLRFQJ61Y27VnkFMT9orTbnsZujycx8n5
 XpUN1sl/TRM/TrYB7JzL+46gcsgBDgnAAwOPoyrigFVSo/He3nAFL/wv4ztvFUsmTB
 0tl5zoWezFI5Q==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 0/4] drm/amd/display: add cursor plane checks
Message-ID: <WTGdykXJRzSbZ9WqH7JBxEOBb6zx3t3iR1ujC8S8DmY@cp3-web-020.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This series adds checks for all cursor plane properties. This avoids
accepting configurations that we won't be able to display.

I've tested this series against various scenarios using a hacked up
wlroots [1].

[1]: https://github.com/emersion/wlroots/commits/amdgpu-cursor-invalid

Simon Ser (4):
  drm/amd/display: add cursor FB size check
  drm/amd/display: disallow cropping for cursor plane
  drm/amd/display: check cursor scaling
  drm/amd/display: don't expose rotation prop for cursor plane

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 81 +++++++++++++++++--
 1 file changed, 75 insertions(+), 6 deletions(-)

-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
