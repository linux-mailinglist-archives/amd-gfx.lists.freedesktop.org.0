Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wLBGBatMTmqrKQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:11 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE1726AA0
	for <lists+amd-gfx@lfdr.de>; Wed, 08 Jul 2026 15:12:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D0TQZORo;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B4010E5ED;
	Wed,  8 Jul 2026 13:12:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE6110F0B4
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jul 2026 10:51:25 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-84783bce476so458948b3a.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 08 Jul 2026 03:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783507885; x=1784112685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=4A/oLhgrzmAdBx1StZRZebeEK/bn7LhBiB+cKgJw7kc=;
 b=D0TQZORoBlk89qzg19zwMxMgh0xdXQND72MVGlWP9PtpluhmxqTEJYcdXK8o+4GlJC
 WNzUWa6Xjm2iCtgbZh9FOUu0oIDXeO7+bcVBH/huplLBJbWB2bkI/kijIfnOmmtvjzOf
 Uf+0xKQUiq39GaxevmG++oR05Zrs3KCchwc+3UhqcL5dtctT1h8sV6OVKtf+DZE5voh/
 74x9jOzBApMiaz9UxphQtWWQ6hfL9QQgQ94WeTQj6PaGIN/BET/A4p7zQ43cGUitM6lS
 tKVm9c8/2Fj1ZAOS98FbHxVENrIoL1QWt7zMhUemtnNvA/iPA0Flew9Ec5PipCyvp9En
 03jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783507885; x=1784112685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4A/oLhgrzmAdBx1StZRZebeEK/bn7LhBiB+cKgJw7kc=;
 b=mHI2EBDg2vYyHQZ6vCZ6h400wPpRhmGj0Lk6TzvJl2REoEvZsUTz8WZ2ds+Ut6/DWU
 svydnY+H74YUDkfrp+LxXuBpeupvPbW3qyi0BCuPsOIqo4awRfJKh/8K65L+iou/f46w
 khK077xN5ZZacDHB0Ka7VJwxs2jE9ec0hNC+HDp9jjQ9n/tV+5unoCbBccYRrOnWw3+S
 BWR/vo8ajluUS5IcGPKFqT//VbaYnOMv5lln7otQhqbjp+kE8K14ykiwm5/CqSol3jN7
 Q5tPf1oW3aF8UAM2LJMjuteldCeNUExHo5OlNMDwAY1EVU0stD/x7x51UJSNeEyElVBk
 SWMA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrtKvi29zJOuvk8KAWBY4dh3vB/dEXslJwfZoJDxYq6iOq2tKwx8R2DwShH+/hc72HAz//CVCjp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1AKpatRlIHmY4OhW7ZrgSKbxI8Bbr69fTQpQaA35n9e2Sbg4n
 K8UgIShYcIKMDbnWluM+dtXzlZJM7l53jcSWR+ONBPwWVLPEx/e5lUv/
X-Gm-Gg: AfdE7cmD4PO66UmuKhDExBpgCbnWo6e/p6WIjt246umH6YEeM00ltfa+mDOq4FFxfPC
 uB5WNmb2JKNq7WzDl28MiluKGQb5GpbYckVOgqXn3pjwC2EIRKf7fTxk156BJ+s7xtVRqFNZ2gr
 lalgFGqudCYIzwLpSBs1Wo2CenVR7YxzcZ6lLMGi6nfZnXD2QgagIf0HHeKvwLDJzxlRb2hapuY
 N6zDuwwjDfgwROKSLE8a5wOBWfOS6Jh+oTqMKQr71SyC6M5Z1oCaA1FdAEQR3BzJLpIXqx8jU3H
 DQOIZUY+afNvp8SsdLWlyZE9SZjCf5hxaIsL1I6VeSC0EkVpkV9tovqpEg1TsBA/rMoGVPGK2As
 zbb68pNGJ8Y4K8igN2S99vZgJxBrRZXKjZG0RQC4FZ3lLEGeszUs4pb3bmNig0Hwx7y8k2wstta
 8T0A==
X-Received: by 2002:a05:6a00:1795:b0:845:cb04:9cbf with SMTP id
 d2e1a72fcca58-84842fec8e2mr2316101b3a.39.1783507885324; 
 Wed, 08 Jul 2026 03:51:25 -0700 (PDT)
Received: from lgs.. ([118.193.39.24]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-848429d65fasm862430b3a.51.2026.07.08.03.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 03:51:24 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Oak Zeng <Oak.Zeng@amd.com>, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] drm/amdkfd: free MQD managers on DQM init failures
Date: Wed,  8 Jul 2026 18:51:15 +0800
Message-ID: <20260708105115.746474-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Jul 2026 13:12:03 +0000
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,isrc.iscas.ac.cn,lists.freedesktop.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Felix.Kuehling@amd.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:Oak.Zeng@amd.com,m:lihaoxiang@isrc.iscas.ac.cn,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:lgs201920130244@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[lgs201920130244@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2EE1726AA0

The change referenced by the Fixes tag releases the HIQ SDMA MQD trunk
buffer when device_queue_manager_init() fails after it has been
allocated.

However, the same failure path can also be reached after
init_mqd_managers() has succeeded. At that point dqm->mqd_mgrs[] contains
per-type MQD manager objects owned by the device queue manager. The
normal teardown path frees those objects from uninitialize(), but the
initialization error path only frees dqm itself.

Free the MQD managers from the initialization error path as well. This is
safe for earlier failures because dqm is zeroed when allocated and
init_mqd_managers() clears the entries it rolls back internally.

Fixes: b7cccc8286bb ("drm/amdkfd: fix a memory leak in device_queue_manager_init()")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index 2e010c1f8828..be75fd3a9acc 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -3103,6 +3103,7 @@ static void deallocate_hiq_sdma_mqd(struct kfd_node *dev,
 struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
 {
 	struct device_queue_manager *dqm;
+	int i;
 
 	pr_debug("Loading device queue manager\n");
 
@@ -3231,6 +3232,9 @@ struct device_queue_manager *device_queue_manager_init(struct kfd_node *dev)
 		deallocate_hiq_sdma_mqd(dev, &dqm->hiq_sdma_mqd);
 
 out_free:
+	for (i = 0; i < KFD_MQD_TYPE_MAX; i++)
+		kfree(dqm->mqd_mgrs[i]);
+
 	kfree(dqm);
 	return NULL;
 }
-- 
2.43.0

