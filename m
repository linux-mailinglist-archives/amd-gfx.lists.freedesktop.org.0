Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJXyHBLdw2lwuQQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 14:03:14 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CDC325627
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Mar 2026 14:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B9410E8BF;
	Wed, 25 Mar 2026 13:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="rvVER+so";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0815210E5F0;
 Tue, 24 Mar 2026 16:39:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B2D8243A93;
 Tue, 24 Mar 2026 16:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E3C19424;
 Tue, 24 Mar 2026 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1774370373;
 bh=SucaKA0NzyZJdhS9+9yt3dqHcXk76x3cifX9yRYxzWQ=;
 h=From:To:Cc:Subject:Date:From;
 b=rvVER+sodacBOuAVjTL/y1npPJvWbZdgWOpXhtIDcutqxMeFL5R6lcHudJBfyydmO
 tX0HuOv5Cl4e8LQ/qJmoBXtjfxY3qGFK/GzvyeCBFDQdfXRynveRdnIp+93u9bBols
 vTHwtEqZ7kEjZdOnZtDVXEM5a7nCHl6RdIrd9tME=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 stable <stable@kernel.org>
Subject: [PATCH] drm/amdkfd: stop speculation on the kfd_ioctl path
Date: Tue, 24 Mar 2026 17:39:09 +0100
Message-ID: <2026032408-divided-racing-fe78@gregkh>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Lines: 39
X-Developer-Signature: v=1; a=openpgp-sha256; l=1479;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=SucaKA0NzyZJdhS9+9yt3dqHcXk76x3cifX9yRYxzWQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDJmH9ulc2zlhS4XwwX6Jm/4aZvueiunxJft5ZK812p7lk
 7rB8uSijlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIQiLDgmudB4Muql3+vZ/1
 mn1p6tuD8VoFExkW7FQ/9WxW7hzryKtPtx3TyD5/U34rFwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Mar 2026 13:03:04 +0000
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,amd.com,gmail.com,ffwll.ch,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,linuxfoundation.org:dkim,linuxfoundation.org:email,ffwll.ch:email]
X-Rspamd-Queue-Id: 24CDC325627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kfd_ioctl takes a user controlled pointer, and then dereferences it
into a table of function pointers, the signature method of spectre
problems.  Fix this up by calling array_index_nospec() on the index to
the function pointer list.

Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_2000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 09dabb3b3297..d2ef693c63da 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -35,6 +35,7 @@
 #include <linux/mman.h>
 #include <linux/ptrace.h>
 #include <linux/dma-buf.h>
+#include <linux/nospec.h>
 #include <linux/processor.h>
 #include "kfd_priv.h"
 #include "kfd_device_queue_manager.h"
@@ -3349,6 +3350,7 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
 		u32 amdkfd_size;
 
+		nr = array_index_nospec(nr, AMDKFD_CORE_IOCTL_COUNT);
 		ioctl = &amdkfd_ioctls[nr];
 
 		amdkfd_size = _IOC_SIZE(ioctl->cmd);
-- 
2.53.0

