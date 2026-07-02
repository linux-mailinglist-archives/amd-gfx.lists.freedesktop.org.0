Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0q+0M45fR2rmXAAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A766FF63A
	for <lists+amd-gfx@lfdr.de>; Fri, 03 Jul 2026 09:06:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rere.qmqm.pl header.s=1 header.b=Z4I2NWrM;
	dmarc=pass (policy=reject) header.from=rere.qmqm.pl;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655F910F685;
	Fri,  3 Jul 2026 07:06:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 314 seconds by postgrey-1.36 at gabe;
 Thu, 02 Jul 2026 16:29:55 UTC
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F355C10F496;
 Thu,  2 Jul 2026 16:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1783009479; bh=IY5C6F1/QEO/Tb6bgJrWUfZwUAuddxbrXqk1mvKaQME=;
 h=Date:Subject:From:To:Cc:From;
 b=Z4I2NWrMuK7o6dkdA3eom/gnVJMtzM+pHTiA+poVFlYWJRbtobsG4Xv4rZx79uHxi
 yCC2zVVXuHk3djLK1MOBT1AsabhBlDHL1d1H3vGz76lKp8B4AN+8gvodq44Bf7jK7x
 IZDm3svpa4fuBFJW7XUC3nqcpFBE777f4RwKZopIQawIIgxf4+6v+TFpgaqVKVVrDq
 fZgIj44mMOMkyH6OxHuW/lq+AaBUuG7IcFMEda7wgP9a6sshAHk4pn26+q8SKlTJUJ
 HKd97VMEV/a5PcniZobXzDEISnH7QGuO2gOoURezeYSW9EUGV0JRrwMfoLQjhMtIpQ
 iXnDd0VEzjyaQ==
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4grhzp0HGWzBL;
 Thu, 02 Jul 2026 18:24:37 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Thu, 02 Jul 2026 18:24:37 +0200
Message-ID: <cover.1783009338.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 0/5] Random debugging quality-of-life improvements
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
X-Spamd-Result: default: False [0.52 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.83)[subject];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,rere.qmqm.pl:from_mime,rere.qmqm.pl:dkim,rere.qmqm.pl:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0A766FF63A

This is a set of small improvements to debugging and error handling in
amdgpu driver. Please consider each patch independently.

Michał Mirosław (5):
  drm/amd/display/amdgpu_dm: show error names
  drm/amd/pm/smu7: make SMU message reports more readable
  drm/amd/pm/smu7: return error on message send failure
  drm/amd/amdgpu/cgs: Avoid redundant copying of firmware filename
  drm/amdgpu: debugfs: avoid extra EOLs in amdgpu_gem_info

 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c       | 54 +++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |  3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 40 +++++++-------
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 20 +++----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  | 12 +++--
 .../drm/amd/pm/powerplay/smumgr/smu7_smumgr.c | 25 ++++-----
 6 files changed, 76 insertions(+), 78 deletions(-)

-- 
2.47.3

