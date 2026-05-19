Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJeCB+IQDGoZVQUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 09:27:30 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BC5790BD
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 09:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D29B10EAD0;
	Tue, 19 May 2026 07:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="PGzfZMlU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C0810EA35;
 Tue, 19 May 2026 03:16:04 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 250A52744A;
 Tue, 19 May 2026 05:07:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkjozB0zKrzE; Tue, 19 May 2026 05:07:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1779160038; bh=3Tis3fmi1HNGdfTbzRUoTnqezjx0ZMIVE+MHFCSkM4Q=;
 h=From:To:Cc:Subject:Date;
 b=PGzfZMlUIf8KgF3KSIp4QrsXeSdAJ6aVFjIuc8VI4vw6+zfPopMBDusImfTgwFzib
 KIE8yV1CVNfVUFZHrrG/iqMmg1Qmv5fsO3wYm6q80gG73EV92GJbuy4/hBR86koJ35
 TD/T9t7GHKgFgpIv4eUmH3YFDGAaX+2Tz9ark464t7nMB6t/YwvU7WDeGgnpRb9ZKH
 SSElxfuTe8TafxnV3STCagJlq+H1SC0n8rmlcDHOJQOtUmj6fNkrAlMr6/V+SeSgyy
 vWUy+udL5zbj8aUTs+dLLxKTUnfWroSjfTSptjSJ3KL134qU2f3cVte+Jq8S6zq4dm
 amB//GCxqfcUw==
From: Leorize <leorize+oss@disroot.org>
To: linux-kernel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Leorize <leorize+oss@disroot.org>
Subject: [PATCH 0/1] fixing dull colors in HDR for Polaris GPUs
Date: Mon, 18 May 2026 20:06:18 -0700
Message-ID: <20260519030624.51613-1-leorize+oss@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 May 2026 07:27:26 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[disroot.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[disroot.org:s=mail];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[oss];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,lists.freedesktop.org,disroot.org];
	DKIM_TRACE(0.00)[disroot.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leorize@disroot.org,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx,oss];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,disroot.org:mid,disroot.org:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: E76BC5790BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Quite awhile ago I reported
https://gitlab.freedesktop.org/drm/amd/-/work_items/4849 and it appears
that I'm the only unlucky soul to have this particular GPU/Display
combo.

Having some time off I decided to put these new fangled LLMs (GPT-5.5)
into the test, and it found the issue rather quickly: MISC1 bit 6 was
not set, causing the display to prefer MSA colorimetry. In the case
Windows was booted first, the Radeon driver there configured the sink
correctly, and it would keep that state until the link is disconnected.

The hypothesis was tested and verified by using `umr` to modify the
`DP_MSA_MISC` register directly, following with a display power-cycle.
The implementation was copied from the code path used for DCN-based
GPUs, and extra register wiring was assisted by LLM.

This is my very first patch into the kernel, and I don't have a lot of
experience with GPUs, so guidance would be greatly appreciated. If
possible, I would like this fix to go into the stable branch as well, so
I don't have to wait until the next release to use my monitor :D

-- Leorize

Leorize (1):
  drm/amd/display: set MSA MISC1 bit 6 when using VSC SDP for DCE 11.x

 .../drm/amd/display/dc/dce/dce_stream_encoder.c   | 15 ++++++++++++++-
 .../drm/amd/display/dc/dce/dce_stream_encoder.h   |  3 ++-
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.54.0

