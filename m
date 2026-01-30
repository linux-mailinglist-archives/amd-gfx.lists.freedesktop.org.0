Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKxhEhKCfGlwNgIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 11:04:02 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C0B9239
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Jan 2026 11:04:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8273A10E972;
	Fri, 30 Jan 2026 10:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="R2w1YU9m";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1395E10E941
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Jan 2026 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F8EVit+zYqieCwlk9TxrFZFxJgg82je3TyM/TJamYRY=; b=R2w1YU9mz7YIjcizefy7VddKgH
 +CxGl4hrRxHO7nKGqpSK0+vUrVBkcGlAMhKnNnpkjSXMtjKbcNtWoj+BarP7eZqdoqzT1uPEKCsuD
 TJ6/psJxQos1aHA6wWaWVkhTbyeJD9esVVL225pg9jBLtw6m957+md82bGpwrXQJzKMwF8gxkmxp2
 ov0r6nVX4x9px4VWm4rY11EyQO/TBOaQRGM0BpStHeiwOXuHpEhI9adHrLrFPQZ3e2U+N5LkqdlKW
 M5dKq6LfZQbe0y8ntEOIJRJfqIvOHrAfqBFSOvDVr8RAc5RNesKJvBID5fhR4KX72C723PF2DnsNU
 IW5/jRow==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vllM1-00BhEb-8n; Fri, 30 Jan 2026 11:03:53 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [RFC 0/2] RLC register access diet
Date: Fri, 30 Jan 2026 10:03:48 +0000
Message-ID: <20260130100350.2883-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1B3C0B9239
X-Rspamd-Action: no action

I have sent this before but maybe it was lost in the sea of other patches. So
this time round with explicit cc to hopefully get a definitive decision whether
to pursue or drop.

Basically replacing the runtime conditionals in RLC15 register access with a
function table set at device probe time:

    add/remove: 9/31 grow/shrink: 74/1012 up/down: 39784/-381724 (-341940)
    ...
    Total: Before=9421643, After=9079703, chg -3.63%

More or less, but probably a little bit more, since I collected that before
the gfx12.1 support landed.

Unless I missed some gotcha it looks like the approach could work (it doesn't
crash and burn on the Steam Deck at least) and as the saving is quite
significant so why not? Let me know of the verdict.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>

Tvrtko Ursulin (2):
  drm/amdgpu: Choose SOC15 RLC register read write functions at init
    time
  drm/amdgpu: Only calculate register offset once in SOC15 RLC

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.c    | 39 +++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_rlc.h    | 10 ++++
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c     |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c     |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c     |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v12_1.c     |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c      |  2 +
 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c    |  2 +
 drivers/gpu/drm/amd/amdgpu/soc15_common.h  | 55 ++++++++++++----------
 10 files changed, 91 insertions(+), 26 deletions(-)

-- 
2.52.0

