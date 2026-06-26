Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OlV/N6w+Pmo1CAkAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 10:56:12 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF66CB81E
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jun 2026 10:56:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=igalia.com header.s=20170329 header.b=myPsRFpl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=igalia.com (policy=none)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4438610E341;
	Fri, 26 Jun 2026 08:56:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5222310E33E
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jun 2026 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1KhjT3UxB+UIZ+vh0fRk2xJWGdUyBmX8ovqJwlu+EDA=; b=myPsRFplqXehJjVzvXE0DzqQ3i
 +1gM9EzMTCy+u0wCsKm96USW9ImsbfxJaEnAL6LuoacSdlQ9p6C3aMxyznNasxR7z3dyoUz6gfwrN
 icihCUlFrV/Rq0k7bkxf6/mE1weJzqOQduykVmlPX2k0UqPJ/dey34MKx9Ru+df9d6RVFJPmcuDYn
 S+xnhjnpnxyF8+Hjn0x/KICev+HU/cgNEAqhpqFgPNjz+9cnIBhIumRwVI/m1uf9hkBhAn7e0oNuA
 rm+x2lOrQLool7t2Y6zweDLGBHYolBjA1X4yMiowQViL9Ex/iTsHw2j5cuOw3wgcWbTH98S6iMbUw
 cR31SU1w==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wd2Ly-005PwW-TH; Fri, 26 Jun 2026 10:56:03 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>
Subject: [PATCH 0/3] Job submission optimisation
Date: Fri, 26 Jun 2026 09:55:55 +0100
Message-ID: <20260626085558.97923-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.54.0
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tvrtko.ursulin@igalia.com,amd-gfx-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[igalia.com,amd.com,gmail.com];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CDF66CB81E

I accidentally noticed some inefficiencies on the job submit path which seemed
easy to address. CPU usage of the DRM scheduler submission thread:

			before	after
UnigineHeaven		2.3%	1.3%
vkgears vsync off 	15%	12%

Gains are mostly due reduced hammering on the delayed worker rescheduling. Stock
profile of the scheduler thread otherwise looks like this:

 20.25%  [kernel]  [k] __mod_timer
  2.87%  [kernel]  [k] enqueue_timer 
  2.16%  [kernel]  [k] amdgpu_gfx_profile_ring_end_use

More pairs of eyes would be welcome to check I did not break something.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Timur Kristóf <timur.kristof@gmail.com>

Tvrtko Ursulin (3):
  drm/amdgpu: Remove unused amdgpu_device_ip_is_hw
  drm/amdgpu: Save some cycles on the job submission path
  drm/amdgpu: Do not fiddle with the idle workers too much

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c       | 11 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c        | 21 -------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.h        |  2 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c      |  9 ++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       | 12 +++++------
 drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c         | 12 +++++------
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c     | 14 +++++--------
 drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h |  8 ++++++-
 10 files changed, 36 insertions(+), 57 deletions(-)

-- 
2.54.0

