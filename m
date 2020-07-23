Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2709922BACB
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Jul 2020 02:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EA86E8A9;
	Fri, 24 Jul 2020 00:11:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 393 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jul 2020 21:16:53 UTC
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BE16E486
 for <amd-gfx@lists.freedesktop.org>; Thu, 23 Jul 2020 21:16:53 +0000 (UTC)
Date: Thu, 23 Jul 2020 21:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595538618;
 bh=/v8hsn4vji93LSAwL+yRiHgNCReHoDDH4axY/SRPmKE=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=PqRfO9+GqZTufIG+oR4srHLcqDGsQQCoyux3C8Vt6Xz6kwNRHtX9CeN989yIimZ9w
 A0+avVpS6Bn8ubJZ1TRxVT39JUxZbt5WngqQXKh1gn25FutDexD3jsLiaYILD0BGsd
 4Tz6V6YIpKZZi6+ZvJ9EqR5blmY+mVmbPEEk6D6s=
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: Mazin Rezk <mnrzk@protonmail.com>
Subject: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.5 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Fri, 24 Jul 2020 00:11:04 +0000
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
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Cc: "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 "1i5t5.duncan@cox.net" <1i5t5.duncan@cox.net>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "mnrzk@protonmail.com" <mnrzk@protonmail.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

When amdgpu_dm_atomic_commit_tail is running in the workqueue,
drm_atomic_state_put will get called while amdgpu_dm_atomic_commit_tail is
running, causing a race condition where state (and then dm_state) is
sometimes freed while amdgpu_dm_atomic_commit_tail is running. This bug has
occurred since 5.7-rc1 and is well documented among polaris11 users [1].

Prior to 5.7, this was not a noticeable issue since the freelist pointer
was stored at the beginning of dm_state (base), which was unused. After
changing the freelist pointer to be stored in the middle of the struct, the
freelist pointer overwrote the context, causing dc_state to become garbage
data and made the call to dm_enable_per_frame_crtc_master_sync dereference
a freelist pointer.

This patch fixes the aforementioned issue by calling drm_atomic_state_get
in amdgpu_dm_atomic_commit before drm_atomic_helper_commit is called and
drm_atomic_state_put after amdgpu_dm_atomic_commit_tail is complete.

According to my testing on 5.8.0-rc6, this should fix bug 207383 on
Bugzilla [1].

[1] https://bugzilla.kernel.org/show_bug.cgi?id=207383

Fixes: 3202fa62f ("slub: relocate freelist pointer to middle of object")
Reported-by: Duncan <1i5t5.duncan@cox.net>
Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 86ffa0c2880f..86d6652872f2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7303,6 +7303,7 @@ static int amdgpu_dm_atomic_commit(struct drm_device *dev,
 	 * unset legacy_cursor_update
 	 */

+	drm_atomic_state_get(state);
 	return drm_atomic_helper_commit(dev, state, nonblock);

 	/*TODO Handle EINTR, reenable IRQ*/
@@ -7628,6 +7629,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)

 	if (dc_state_temp)
 		dc_release_state(dc_state_temp);
+
+	drm_atomic_state_put(state);
 }


--
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
