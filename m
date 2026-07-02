Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 13uQEY9fR2rnXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F006FF63F
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rere.qmqm.pl header.s=1 header.b=kxGeIi2i;
	dmarc=pass (policy=reject) header.from=rere.qmqm.pl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA0C10F687;
	Fri,  3 Jul 2026 07:06:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC7610F4DD;
 Thu,  2 Jul 2026 16:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1783009480; bh=YuJVkhEfcgaku4wOWS2SXkCc3/Q3CpYqNBhzmDhas60=;
 h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
 b=kxGeIi2i5d+7183oVQFPlU5HR5zElNsysUWUX15VK+2bpHCaVuK5+xqdIOCMQPd/O
 doqppXRegZ3Wz9TiPB/GnC6D2l9mhTCcFJALiMFVdvo9IiDsJK7MDwT9DHlqzoNh4r
 cvSdKk4CXDng/MuCmctHz4jxY3t7mdCTKO/CQ7CkCA4pXwBsulPIr0wtdprmFJaB0G
 nl2BAJlCyNP+2ceOdFlpCYzv0fu2ivJQ8l8q6yCQUfLjsV1E/XYAxEfNlKCiDxBat0
 xyeXkXLGC+7vLCTbLkzpNm1HK5eeP7XtAu67QJjhX+mdxa15HNrFqBVuEWQSZ1hktQ
 8ghJX7fK+c9Dw==
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4grhzr1yCgzKq;
 Thu, 02 Jul 2026 18:24:40 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Thu, 02 Jul 2026 18:24:40 +0200
Message-ID: <df3064b3a250a694e39adedd96b9f2133eb3dcf6.1783009338.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1783009338.git.mirq-linux@rere.qmqm.pl>
References: <cover.1783009338.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/5] drm/amd/pm/smu7: make SMU message reports more readable
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 03 Jul 2026 07:06:48 +0000
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
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.62)[subject];
	DMARC_POLICY_ALLOW(-0.50)[rere.qmqm.pl,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rere.qmqm.pl:s=1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirq-linux@rere.qmqm.pl,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[rere.qmqm.pl:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lists.freedesktop.org:from_smtp,qmqm.pl:email,rere.qmqm.pl:from_mime,rere.qmqm.pl:dkim,rere.qmqm.pl:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 13F006FF63F

Make the lines greppable by removing an extra EOL and report the
status only once - after the reply is detected.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 .../gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c   | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
index 0d4cbe4113a0..ffe3ce87d907 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
@@ -134,14 +134,6 @@ int smu7_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
 
 	PHM_WAIT_FIELD_UNEQUAL(hwmgr, SMC_RESP_0, SMC_RESP, 0);
 
-	ret = PHM_READ_FIELD(hwmgr->device, SMC_RESP_0, SMC_RESP);
-
-	if (ret == 0xFE)
-		dev_dbg(adev->dev, "last message was not supported\n");
-	else if (ret != 1)
-		dev_info(adev->dev,
-			"\nlast message was failed ret is %d\n", ret);
-
 	cgs_write_register(hwmgr->device, mmSMC_RESP_0, 0);
 	cgs_write_register(hwmgr->device, mmSMC_MESSAGE_0, msg);
 
@@ -150,10 +142,9 @@ int smu7_send_msg_to_smc(struct pp_hwmgr *hwmgr, uint16_t msg)
 	ret = PHM_READ_FIELD(hwmgr->device, SMC_RESP_0, SMC_RESP);
 
 	if (ret == 0xFE)
-		dev_dbg(adev->dev, "message %x was not supported\n", msg);
+		dev_dbg(adev->dev, "SMU message %#x was not supported\n", msg);
 	else if (ret != 1)
-		dev_dbg(adev->dev,
-			"failed to send message %x ret is %d \n",  msg, ret);
+		dev_info(adev->dev, "SMU message %#x failed: response is %d\n", msg, ret);
 
 	return 0;
 }
-- 
2.47.3

