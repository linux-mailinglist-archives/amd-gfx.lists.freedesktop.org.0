Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPSCMhVLnGmODAQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:41:57 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863911764AA
	for <lists+amd-gfx@lfdr.de>; Mon, 23 Feb 2026 13:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D4110E38F;
	Mon, 23 Feb 2026 12:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l0eB8UBk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2E10E392
 for <amd-gfx@lists.freedesktop.org>; Mon, 23 Feb 2026 12:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sKm4WJu9gtoDcb8T+mPjalKuzsM0iEUi7NJwb1iufZU=; b=l0eB8UBkxpmen92pZdmDadnBu2
 IZsV0Z0SWJx5OcB8VkT3fAKo9HdUtNLoddWcY9QkXDpxq71ZAncIpliAVKLbDQwzw6hSrsCIATvUw
 /g/sBAhvZcHaOOTnh6YCT4s9qpPLLBO08gSl2lBrvtb+eqa+WheM5e5N1cHVvMYDoDjuTDVN/UN9A
 LK2KbV99XCQxhDYFy5PynG7iCYrwZ+NKqvyxlr/1H9mxapgUDg+XQ/5qVNPM1JXu2iTFbuMiyEBrH
 YCYiuwUtEFnBrb7FHWBlZDc5qJKQLPtXwInKHhJQzPFy724Co4zsqK3kA641zeEVqVP1NAyoP4m8R
 a4ifIDzg==;
Received: from [90.240.106.137] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuVFy-004EK5-UV; Mon, 23 Feb 2026 13:41:47 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: Sunil Khatri <sunil.khatri@amd.com>, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 00/12] Some userq fixes/improvements
Date: Mon, 23 Feb 2026 12:41:29 +0000
Message-ID: <20260223124141.10641-1-tvrtko.ursulin@igalia.com>
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
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.892];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 863911764AA
X-Rspamd-Action: no action

Disclaimer - compile tested and smoke tested with non userq workloads only.

Please see if there are interesting changes in here and let me know how to test
user queues. After that I will probably have some other ideas on what to improve
and/or fix in there. For starters I only looked at this single file while I was
trying to understand how it all works.

v2:
 * Rebase for upstream movement.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>

Tvrtko Ursulin (12):
  drm/amdgpu/userq: Fix reference leak in amdgpu_userq_wait_ioctl
  drm/amdgpu/userq: Do not allow userspace to trivially triger kernel
    warnings
  drm/amdgpu/userq: Consolidate wait ioctl exit path
  drm/amdgpu/userq: Use drm_gem_objects_lookup in
    amdgpu_userq_signal_ioctl
  drm/amdgpu/userq: Use drm_gem_objects_lookup in
    amdgpu_userq_wait_ioctl
  drm/amdgpu/userq: Use memdup_array_user in amdgpu_userq_wait_ioctl
  drm/amdgpu/userq: Use memdup_array_user in amdgpu_userq_signal_ioctl
  drm/amdgpu/userq: Consolidate fence lookup in amdgpu_userq_wait_ioctl
  drm/amdgpu/userq: No need to xa_erase before destroying the xarray
  drm/amdgpu/userq: Use more appropriate lock in
    amdgpu_userq_fence_driver_alloc
  drm/amdgpu/userq: Stop looking after finding ourselves
  drm/amdgpu/userq: Drop redundant conditional from the irq path

 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 597 +++++++-----------
 1 file changed, 245 insertions(+), 352 deletions(-)

-- 
2.52.0

