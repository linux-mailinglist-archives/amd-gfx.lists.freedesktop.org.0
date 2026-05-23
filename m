Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eN+xFfe6EWpVpQYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2026 16:34:31 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D565BF641
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2026 16:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ABB10E303;
	Sat, 23 May 2026 14:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ubuntu.com header.i=@ubuntu.com header.b="IQ+ULTFy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8137610E029
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 May 2026 14:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1779546473;
 bh=Pv8z2J0lRzEt9ebAQ2NCfFAHSKrvsXeJydGM50u+Fq4=;
 b=IQ+ULTFyr4awzLJcMEzICFdjb7r6vPn2q1+t9m2PudZZoWjVk1lu9OKdN2lmo24gA+oHkNlwG
 eNDBk/1VuaDZ9VpxviVLVcb++xXT0o9X+xh9R5u9daGfepLMt5o8WE26cPRf6/VR/0/seE8B67V
 8Xx8u965mR05pZMJCTfPvRG48K8vl1GgZ/N2Hw+OeDfGBeoeCyvz6yk02bVZ3mb4bSBLIObjKks
 hqUJq/EhRg4iFm/L4uy8VFn6llk2a6yZprL4jp55QusRxOgC811RlrHuIzLQpSlpsJy8ng4DW59
 Dz6F89NHZ5aSBEkr56wDf+sofAtA+otwVGKhjaSRUb2g==
X-Forward-Email-ID: 6a11b967a1e1c50b7c2a689a
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH NEXT 0/2] drm/radeon/radeon_connectors: use struct drm_edid
Date: Sat, 23 May 2026 10:27:46 -0400
Message-ID: <20260523142748.50034-1-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spamd-Result: default: False [4.69 / 15.00];
	SEM_URIBL(3.50)[ubuntu.com:dkim];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_ALLOW(0.00)[ubuntu.com:s=fe-953a8a3ca9];
	DMARC_POLICY_ALLOW(0.00)[ubuntu.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[jpeisach@ubuntu.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ubuntu.com:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ubuntu.com:mid,ubuntu.com:dkim]
X-Rspamd-Queue-Id: C7D565BF641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is the equivalent of what was done with amdgpu[1], using struct
drm_edid instead of struct edid.

The radeon_connector_free_edid function can also be removed since we
can call drm_edid_free (unlike last time, I made sure to set the pointer
to NULL afterwards).

[1]: https://lore.kernel.org/amd-gfx/20260303211823.76631-1-jpeisach@ubuntu.com/

Joshua Peisach (2):
  drm/radeon/radeon_connectors: use struct drm_edid instead of struct
    edid
  drm/radeon/radeon_connectors: remove radeon_connector_free_edid

 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
 drivers/gpu/drm/radeon/radeon_combios.c    |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c | 60 +++++++++++-----------
 drivers/gpu/drm/radeon/radeon_mode.h       |  4 +-
 4 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.53.0

