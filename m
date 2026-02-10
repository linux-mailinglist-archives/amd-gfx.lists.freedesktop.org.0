Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPtQMk/qimk8OwAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 09:20:31 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1368118324
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Feb 2026 09:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E93C10E4F6;
	Tue, 10 Feb 2026 08:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="TSqGC3j2";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6698210E385
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Feb 2026 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1770708366; x=1770967566;
 bh=DUEQxGnzVTqsxG7XY59PJwUJytlx+BuBDvfcVat/qiU=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=TSqGC3j2KMAK2Rkhf1h0cUIVQfIolKGcUwoWDCkbjKcCCrOxtocwI1HMqExBEtP6r
 mN21CSzCq0TIBeQnyjJGP1Y+TW/ovBiJCfqI4ZZlOsyjikcX25v5nxUT/Ccy1qxS+L
 kDZcOXJbxu7WSb7CF1KqI4rh88//cKCQZXxPtvrC0XkeGEglXweXLhNc91ddNYgJyS
 TTUinOQxajVvJ4bKIbdUF9hiHGKBSsK2QvwVCjkhk0guSCDn6pZYNJezPw6Fp0niLV
 r1xCduWxErY4Mdjze/u11/qCkorE4i3Wh8anC6cFdC6xxpEqjaTJxKK4BNQsyQOnjI
 /ZrlG6wlNQdYQ==
Date: Tue, 10 Feb 2026 07:26:00 +0000
To: amd-gfx@lists.freedesktop.org
From: decce6 <decce6@proton.me>
Cc: decce6 <decce6@proton.me>, Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/radeon: Add HAINAN clock adjustment
Message-ID: <20260210072524.15119-1-decce6@proton.me>
Feedback-ID: 132957244:user:proton
X-Pm-Message-ID: 58cf92cb1645be630600c2e92405036104c3d8c1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 10 Feb 2026 08:20:22 +0000
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[proton.me,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[decce6@proton.me,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[proton.me:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:mid,proton.me:dkim,proton.me:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A1368118324
X-Rspamd-Action: no action

This patch limits the clock speeds of the AMD Radeon R5 M420 GPU from
850/1000MHz (core/memory) to 800/950 MHz, making it work stably. This
patch is for radeon.

Signed-off-by: decce6 <decce6@proton.me>
---
 drivers/gpu/drm/radeon/si_dpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dp=
m.c
index 9deb91970d4d..f12227145ef0 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -2925,6 +2925,11 @@ static void si_apply_state_adjust_rules(struct radeo=
n_device *rdev,
 =09=09=09max_sclk =3D 60000;
 =09=09=09max_mclk =3D 80000;
 =09=09}
+=09=09if ((rdev->pdev->device =3D=3D 0x666f) &&
+=09=09    (rdev->pdev->revision =3D=3D 0x00)) {
+=09=09=09max_sclk =3D 80000;
+=09=09=09max_mclk =3D 95000;
+=09=09}
 =09} else if (rdev->family =3D=3D CHIP_OLAND) {
 =09=09if ((rdev->pdev->revision =3D=3D 0xC7) ||
 =09=09    (rdev->pdev->revision =3D=3D 0x80) ||
--=20
2.43.0


