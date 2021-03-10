Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B097334139
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Mar 2021 16:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1756E214;
	Wed, 10 Mar 2021 15:12:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31C6E214
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 15:12:03 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [217.70.183.200])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 96E8E3A7040
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Mar 2021 14:50:45 +0000 (UTC)
X-Originating-IP: 82.65.230.196
Received: from localhost.localdomain (82-65-230-196.subs.proxad.net
 [82.65.230.196]) (Authenticated sender: schroder@emersion.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 7577520003;
 Wed, 10 Mar 2021 14:50:20 +0000 (UTC)
From: Simon Ser <contact@emersion.fr>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/5] amd/display: improve atomic cursor checks
Date: Wed, 10 Mar 2021 15:50:14 +0100
Message-Id: <20210310145019.2877-1-contact@emersion.fr>
X-Mailer: git-send-email 2.30.2
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
Cc: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Changes in v2: drop "amd/display: fail on cursor plane without an
underlying plane". This retains the current behavior instead.

Simon Ser (5):
  amd/display: convert DRM_DEBUG_ATOMIC to drm_dbg_atomic
  amd/display: check cursor plane matches underlying plane
  amd/display: add cursor check for YUV underlying pipe
  amd/display: add cursor alpha and blend mode checks
  amd/display: re-introduce cursor plane rotation prop

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
