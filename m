Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B72262CC8A3
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Dec 2020 22:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFA16EAC1;
	Wed,  2 Dec 2020 21:09:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50FD16EAC1
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Dec 2020 21:09:15 +0000 (UTC)
Date: Wed, 02 Dec 2020 21:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1606943353;
 bh=38h5gjlaSwfQQKnHE+2v5+OrOAGIRWGYcdZxYSziU6c=;
 h=Date:To:From:Reply-To:Subject:From;
 b=NU+Nht58p1sxnWcbr4q888dU9RdmgXPG3YCY+CO0xpsNh9XFOTPXGId/DxDuoE2VM
 xw7+eAG+ybkrZGWsYD6o4JN7tGp2jlSFodgHrjtM+etD9ftiT1OrSh3LER+WW7uJLP
 c01UCatwhaupAog1qFvPk5iiLKIp/SUtNXYh1aH4mpXR9A/fs6EvsvpkmHxIEryml+
 F5OLW3N0Tzt09NXm9L5brStZHo0EmN7BqAY3OmVTETU4x4eJVvV59SjM+ZKOrR9NQ8
 Gp5N5/LwXBHiY+Pk1s81Ry5EDJGo+GBL9b5MEg2J72LyjuKxXyg6TYXdq2Kw6NQPNz
 Sem4QAHGpWXcA==
To: amd-gfx@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH 0/2] drm/amd/display: add cursor pitch check
Message-ID: <I0taFFYbMGqEVV2Q8votdxgboAc8fwuT5InlTl4BHuA@cp4-web-014.plabs.ch>
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

We were checking the FB width/height, but were not checking its pitch.

This has been tested by running Sway.

Simon Ser (2):
  drm/amd/display: use FB pitch to fill dc_cursor_attributes
  drm/amd/display: add cursor pitch check

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

-- 
2.29.2


_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
