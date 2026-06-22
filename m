Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lqj7Eo9IOWqLpwcAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:37:03 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0239A6B05D3
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2026 16:37:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=fxrvVOz5;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027A210E715;
	Mon, 22 Jun 2026 14:37:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3986710E633
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2026 14:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xecKuYiTv9gp4aGB0mWqNh9PxMPm4U8AFGKas9vvFRY=; b=fxrvVOz542duFxNX3MqoChFQ56
 qw1QzVEp2T+CCWRMXzJnZbSsRMrtljWK6Jg9wJTt0EMRTWunTuqVwaZB+/oRduagEyWNT4Axrk2tj
 BBp7ypj3g8uH4yTnJ4M3vCmsI7Q99tgyFE20/LBa16d4R5pwEIPO6Beqod/srTvEFJtpHSb1T4EuC
 bbcCuGr7J7KWa8rfpeKOIYh3Xq0+uVySpk/wZIahyUrGyiHx8QNOAFuzF6VfmKVvw6W6S1RIv57B8
 GPLqHvLuIH/REVbMWBlghBFNNSHJREaFfEROmpklUJcWbXAZKOf2F8gul7SV1DERRi4u/wSn8RGdm
 yqA64mhQ==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wbflc-003mJo-Ll; Mon, 22 Jun 2026 16:36:52 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC 0/2] Store SDMA ring instance and index in the ring
Date: Mon, 22 Jun 2026 15:36:47 +0100
Message-ID: <20260622143649.54632-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,amd.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0239A6B05D3

I am not sure TBH if any workloads end up calling these often enough to matter,
but ages ago I noticed SDMA rings doing runtime lookup of "what instance am I"
by repeatedly searching the device array, and thought to float it to see if
there are any comments. At least the init path consolidation could be worth it,
although that too is not perfect.

Cc: Alex Deucher <alexander.deucher@amd.com>

Tvrtko Ursulin (2):
  drm/amdgpu: Store SDMA instance and index in the ring
  drm/amdgpu: Drop null SDMA instance checks from SDMA vfuncs

 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  6 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c | 51 +++++++++---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h |  6 +--
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c    |  4 +-
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 17 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 17 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 23 ++++-------
 drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 29 ++++++--------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 21 ++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 22 +++++-----
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 24 +++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 23 +++++------
 drivers/gpu/drm/amd/amdgpu/sdma_v7_1.c   | 29 ++++++--------
 13 files changed, 112 insertions(+), 160 deletions(-)

-- 
2.54.0

