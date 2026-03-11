Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BBuCMBvsml9MgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 08:48:16 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B17826E6F0
	for <lists+amd-gfx@lfdr.de>; Thu, 12 Mar 2026 08:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F7F10E985;
	Thu, 12 Mar 2026 07:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="ZEskC8tv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1311 seconds by postgrey-1.36 at gabe;
 Wed, 11 Mar 2026 14:43:38 UTC
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk
 [188.40.203.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FE910E92B
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Mar 2026 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=zoopHjIT5W4j178u0z5GQnK5VFOmQdcXXviuFKle2iA=; b=ZEskC8tvVD5jWr
 pN0P4k2/ZrCiKlUUtQvWzacaygFSzu4YGFmigLeTBzhKA6XpR18/kdmR8Of3DCUXbPfp0D3XqDQ5a
 2hZyNucXvwVrqUUwGaTF0kLZvmXN53N/84RyDkkcOAtObKxYKiX9pSIyIAvyqUjkvhJA1614rJmet
 txzgmCFtiQboa/Ymejxb6GvGYoQIXUJkd1h/n5O+8UBY8d+Ns1+MUkRDu7bNJq5vuWgk1aIO4QRba
 9CDyU+4d3M8L5fwpL67gRuuXsasKgrIlvtSKz5eDzYHqwv0iaFkwJ4ejXnLGjy1Z8X9steonmMD3m
 wis1DruFY0oHwzY83EvA==;
Received: from [63.135.74.212] (helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1w0KRR-008K8m-P3; Wed, 11 Mar 2026 14:21:42 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1w0KRR-00000002Dsh-1wGn;
 Wed, 11 Mar 2026 14:21:41 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Cc: linux-kernel@vger.kernel.org, airlied@gmail.com, simona@ffwll.ch,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/radeon: fix __user annotation in radeon_info_ioctl()
Date: Wed, 11 Mar 2026 14:21:38 +0000
Message-Id: <20260311142138.530006-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 12 Mar 2026 07:48:09 +0000
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
X-Spamd-Result: default: False [3.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[codethink.co.uk : SPF not aligned (relaxed),reject];
	R_DKIM_REJECT(1.00)[codethink.co.uk:s=imap4-20230908];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,ffwll.ch,codethink.co.uk];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:linux-kernel@vger.kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:ben.dooks@codethink.co.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[codethink.co.uk:-];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7B17826E6F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The radeon_info_ioctl() is obviously called from an ioctl()
entry for this device, and uses copy_{to,from)_user() on
the value_ptr variable.

This is generating sparse warnings due to use lack of __user
annotation on the value_ptr, so add this to remove the
following warnings:

drivers/gpu/drm/radeon/radeon_kms.c:262:43: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:262:43:    expected void const [noderef] __user *from
drivers/gpu/drm/radeon/radeon_kms.c:262:43:    got unsigned int [usertype] *[assigned] value_ptr
drivers/gpu/drm/radeon/radeon_kms.c:319:43: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:319:43:    expected void const [noderef] __user *from
drivers/gpu/drm/radeon/radeon_kms.c:319:43:    got unsigned int [usertype] *[assigned] value_ptr
drivers/gpu/drm/radeon/radeon_kms.c:331:43: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:331:43:    expected void const [noderef] __user *from
drivers/gpu/drm/radeon/radeon_kms.c:331:43:    got unsigned int [usertype] *[assigned] value_ptr
drivers/gpu/drm/radeon/radeon_kms.c:467:43: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:467:43:    expected void const [noderef] __user *from
drivers/gpu/drm/radeon/radeon_kms.c:467:43:    got unsigned int [usertype] *[assigned] value_ptr
drivers/gpu/drm/radeon/radeon_kms.c:592:43: warning: incorrect type in argument 2 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:592:43:    expected void const [noderef] __user *from
drivers/gpu/drm/radeon/radeon_kms.c:592:43:    got unsigned int [usertype] *[assigned] value_ptr
drivers/gpu/drm/radeon/radeon_kms.c:609:26: warning: incorrect type in argument 1 (different address spaces)
drivers/gpu/drm/radeon/radeon_kms.c:609:26:    expected void [noderef] __user *to
drivers/gpu/drm/radeon/radeon_kms.c:609:26:    got unsigned int [usertype] *[assigned] value_ptr

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/radeon/radeon_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index dc43fd790a9c..57bc60c33937 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -231,13 +231,14 @@ int radeon_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 	struct radeon_device *rdev = dev->dev_private;
 	struct drm_radeon_info *info = data;
 	struct radeon_mode_info *minfo = &rdev->mode_info;
-	uint32_t *value, value_tmp, *value_ptr, value_size;
+	uint32_t *value, value_tmp, value_size;
+	uint32_t __user *value_ptr;
 	struct ttm_resource_manager *man;
 	uint64_t value64;
 	struct drm_crtc *crtc;
 	int i, found;
 
-	value_ptr = (uint32_t *)((unsigned long)info->value);
+	value_ptr = (uint32_t __user *)((unsigned long)info->value);
 	value = &value_tmp;
 	value_size = sizeof(uint32_t);
 
-- 
2.37.2.352.g3c44437643

