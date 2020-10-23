Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5230296A85
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Oct 2020 09:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2196E4B5;
	Fri, 23 Oct 2020 07:47:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306D6E4B5;
 Fri, 23 Oct 2020 07:47:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5236EABF4;
 Fri, 23 Oct 2020 07:47:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/amd/display: Fix kernel panic by breakpoint
Date: Fri, 23 Oct 2020 09:46:53 +0200
Message-Id: <20201023074656.11855-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

the amdgpu driver's ASSERT_CRITICAL() macro calls the
kgdb_breakpoing() even if no debug option is set, and this leads to a
kernel panic on distro kernels.  The first two patches are the
oneliner fixes for those, while the last one is the cleanup of those
debug macros.


Takashi

===

Takashi Iwai (3):
  drm/amd/display: Fix kernel panic by dal_gpio_open() error
  drm/amd/display: Don't invoke kgdb_breakpoint() unconditionally
  drm/amd/display: Clean up debug macros

 drivers/gpu/drm/amd/display/Kconfig             |  1 +
 drivers/gpu/drm/amd/display/dc/gpio/gpio_base.c |  4 +--
 drivers/gpu/drm/amd/display/dc/os_types.h       | 33 +++++++++----------------
 3 files changed, 15 insertions(+), 23 deletions(-)

-- 
2.16.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
