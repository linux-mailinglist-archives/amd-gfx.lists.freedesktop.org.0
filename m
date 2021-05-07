Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A76E43767B2
	for <lists+amd-gfx@lfdr.de>; Fri,  7 May 2021 17:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF3D6EE63;
	Fri,  7 May 2021 15:08:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690CE6EE63;
 Fri,  7 May 2021 15:08:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0CE4AD09;
 Fri,  7 May 2021 15:08:38 +0000 (UTC)
Date: Fri, 07 May 2021 17:08:38 +0200
Message-ID: <s5ho8dmh98p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: [5.12 regression] ttm->pages NULL dereference with radeon driver
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

we've received a regression report showing NULL dereference Oops with
radeon driver on 5.12 kernel:
  https://bugzilla.opensuse.org/show_bug.cgi?id=1185516

It turned out that the recent TTM cleanup / refactoring via commit
0575ff3d33cd ("drm/radeon: stop using pages with
drm_prime_sg_to_page_addr_arrays v2") is the culprit.  On 5.12 kernel,
ttm->pages is no longer allocated / set up, while the radeon driver
still has a few places assuming the valid ttm->pages, and for the
reporter (running the modesettig driver), radeon_gart_bind() hits the
problem.

A hackish patch below was confirmed to work, at least, but obviously
we need a proper fix.

Could you take a look at it?


thanks,

Takashi

--- a/drivers/gpu/drm/radeon/radeon_gart.c
+++ b/drivers/gpu/drm/radeon/radeon_gart.c
@@ -253,7 +253,7 @@ void radeon_gart_unbind(struct radeon_de
 	t = offset / RADEON_GPU_PAGE_SIZE;
 	p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
 	for (i = 0; i < pages; i++, p++) {
-		if (rdev->gart.pages[p]) {
+		if (1 /*rdev->gart.pages[p]*/) {
 			rdev->gart.pages[p] = NULL;
 			for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++, t++) {
 				rdev->gart.pages_entry[t] = rdev->dummy_page.entry;
@@ -301,7 +301,7 @@ int radeon_gart_bind(struct radeon_devic
 	p = t / (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
 
 	for (i = 0; i < pages; i++, p++) {
-		rdev->gart.pages[p] = pagelist[i];
+		/* rdev->gart.pages[p] = pagelist[i]; */
 		page_base = dma_addr[i];
 		for (j = 0; j < (PAGE_SIZE / RADEON_GPU_PAGE_SIZE); j++, t++) {
 			page_entry = radeon_gart_get_page_entry(page_base, flags);
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -360,6 +360,8 @@ static int radeon_ttm_tt_pin_userptr(str
 
 	if (current->mm != gtt->usermm)
 		return -EPERM;
+	if (!ttm->pages)
+		return -EPERM;
 
 	if (gtt->userflags & RADEON_GEM_USERPTR_ANONONLY) {
 		/* check that we only pin down anonymous memory
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
