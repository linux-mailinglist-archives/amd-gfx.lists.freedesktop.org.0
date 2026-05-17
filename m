Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPUsMe/cCmpV8wQAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:35 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8B4569CB2
	for <lists+amd-gfx@lfdr.de>; Mon, 18 May 2026 11:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E048810E762;
	Mon, 18 May 2026 09:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="SxhRbiF0";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 397 seconds by postgrey-1.36 at gabe;
 Sun, 17 May 2026 03:05:57 UTC
Received: from outbound.mr.icloud.com (mr-2001l-snip4-11.eps.apple.com
 [57.103.68.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EBB10E232
 for <amd-gfx@lists.freedesktop.org>; Sun, 17 May 2026 03:05:57 +0000 (UTC)
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
 by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id
 62D1A1800151; Sun, 17 May 2026 02:59:18 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhKBUMDRQBBCFYBWANLVxQEC0AFBlgARnkRUAFYHlZeWhdeTVEPDwNKEAJeBV1yGVoUXBhTRVEfVFhBDgpaBlBRHV8CCgRHBFsXRgNTRV8CFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxlaFFwYU0VRH1RYXgRTVg5CCUoFXQJaBUALTQteAEUDQQtBAEAGRkEDUUkAXwErWxNVF0YJGQhdHQdYRxRHDg8ZWhRcGFM=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai;
 t=1778986760; x=1781578760; bh=lbmFNnPw4b27+6TTwJDsAGRBV+m0IoJWa8wcjEhbmjo=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=SxhRbiF0dcPzya1TBtjtNklY/whmYf3INvykbekPFcqu9v9ZZXIhyZd7GfMIpxlaSYChaa9NRdDnpjOaeerFcEkl75bFrY94OcDDvTZ/O8rvfGw8fuQOiZHDqVSuXbmy0MX4Mw0WyBSCgaPnWt+uaZK0b8AiB/QDjxhGx7w3Ra1wa/GhjBmRGiQ1zrMpnv78xhQydqUDghIEa+FqEBKDJJ8dDx1HoJf3qs9/0pDoooxUgAnWsyUcV1MPkJ70bmjWCj9pkgKF5XPDAMX5SogUWDmMaoT/GbjBKwDSX05TAaT/T7JJBDDyKOeQjoB73USC6AEGD7PjO0HWaUPJ3BAHjg==
mail-alias-created-date: 1778972301885
Received: from localhost.localdomain (unknown [17.57.152.38])
 by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id
 BE1A518000BF; Sun, 17 May 2026 02:59:14 +0000 (UTC)
From: Sakurai Shun <ssh1326@icloud.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sakurai Shun <ssh1326@icloud.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] Replace "transparant" with "transparent"
Date: Sun, 17 May 2026 11:58:30 +0900
Message-ID: <20260517025837.11293-1-ssh1326@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87se7rmont.fsf@trenco.lwn.net>
References: <87se7rmont.fsf@trenco.lwn.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=F+Vat6hN c=1 sm=1 tr=0 ts=6a092f07
 cx=c_apl:c_pps:t_out a=9OgfyREA4BUYbbCgc0Y0oA==:117
 a=9OgfyREA4BUYbbCgc0Y0oA==:17 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10
 a=ZxuoajvSgW0A:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=wGL9MbAH5B13jT6XI7IA:9 a=IxSG75etxsVYPPdR13TJ:22 a=ZjDq3gu30spcOt8FOK9Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDAyOSBTYWx0ZWRfX2ESVug4rkVZ+
 +/HvSi3VJGT+7jkHl8YmJeymKk97r9g68jswcPEC7tMxQ50wVKrVLA+5UmRa+fqtFa8zvvHOw2E
 zc/T3HMbZqlQ2S0iL252uqJsg2DdGntaQqc+YMNZgZEg2vAvsZdHjif7vYPRSRFwmcYEB6j+iES
 NAu3s8XTuog5Ooa32MHf0KObecuu23CiKlOSZMtkNjyeAR39KTCVrymV+pRMxPEeLtQMQ3/unsQ
 L1ItrSOW3TU8DxLvUMQEfjwtplTepdfgWVQhuOp98okagmJF3iLdRDwwe2dD7e/OMMCAf8d2xap
 PMJBUzdMikaWUcQFYgDDqfONkhkLJbmFemJ1J5v69GNWkzgFm33kq81tzhMC/s=
X-Proofpoint-GUID: LfPKRJHDOC-8twZ-oDtANFH585lXsGr8
X-Proofpoint-ORIG-GUID: LfPKRJHDOC-8twZ-oDtANFH585lXsGr8
X-Apple-Category-Label: MjE0Nzk4NjU5NzY6JGNhdGVnb3J5JF9QZXJzb25hbCw=
X-Mailman-Approved-At: Mon, 18 May 2026 09:33:27 +0000
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
X-Rspamd-Queue-Id: 7F8B4569CB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	DATE_IN_PAST(1.00)[30];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ssh1326@icloud.com,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lwn.net,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ssh1326@icloud.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[icloud.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[icloud.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssh1326@icloud.com,amd-gfx-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[icloud.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[icloud.com:email,icloud.com:mid,icloud.com:dkim,pipe:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Action: no action

Signed-off-by: Sakurai Shun <ssh1326@icloud.com>
---
 Documentation/gpu/amdgpu/display/mpo-overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/display/mpo-overview.rst b/Documentation/gpu/amdgpu/display/mpo-overview.rst
index 59a4f54a3..ed39e53ff 100644
--- a/Documentation/gpu/amdgpu/display/mpo-overview.rst
+++ b/Documentation/gpu/amdgpu/display/mpo-overview.rst
@@ -167,7 +167,7 @@ and interactions with operations such as DPMS and S3:
 - ``kms_plane_multiple@atomic-pipe-*-tiling-``
 - ``kms_plane_scaling@pipe-*-plane-scaling``
 - ``kms_plane_alpha_blend@pipe-*-alpha-basic``
-- ``kms_plane_alpha_blend@pipe-*-alpha-transparant-fb``
+- ``kms_plane_alpha_blend@pipe-*-alpha-transparent-fb``
 - ``kms_plane_alpha_blend@pipe-*-alpha-opaque-fb``
 - ``kms_plane_alpha_blend@pipe-*-constant-alpha-min``
 - ``kms_plane_alpha_blend@pipe-*-constant-alpha-mid``
-- 
2.54.0

