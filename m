Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kxVaNG5JMmqYyAUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 09:14:54 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7438D69718D
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jun 2026 09:14:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=post.cz header.s=szn1 header.b=To3mGY8g;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=post.cz
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE90B10EE4A;
	Wed, 17 Jun 2026 07:14:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1119 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jun 2026 22:20:33 UTC
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.78.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ECE10E0B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jun 2026 22:20:33 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxe-844b97bc4b-29p4c
 (smtpc-mxe-844b97bc4b-29p4c [2a02:598:64:8a00::1000:a8b])
 id 183de2480821a33b1895101e; Wed, 17 Jun 2026 00:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=post.cz; s=szn1;
 t=1781648432; bh=NW7VllBvdlma7tFCVfLBkPR1+y0RgKDAZXIoK35DFQA=;
 h=From:To:Subject:Date:Message-Id:Mime-Version:Content-Type;
 b=To3mGY8gQr12Ru8fhgkSRBFwkNsfBt4tApuDl3MEvMBG2XXQxB29h+t2XRk7MlzlZ
 f+aoqxn6ZdXiNo6p//fMjpHWBJ4wJAdNjSG0oL6Af2u4luwdK2cWZ+ucKS6tpbiBpF
 ffTTyJd57zv7bfrNpwurWTbSEggiPgq8dc+WRLenNau1ddOHj/VJbcgAyyDLyNxoRv
 snwrxIXq931CpRy04BpX/4Cgxj0ykMAmZYATTEkc1iM8P0VaB9K3hnX9zTXqQvh634
 qBhKLZ6gdtg8kOQ3EQ0qAqfhlaAvyqbTEMRgyYpZeLx9wm6w8Pxyh91duvR2damEVP
 jMN9Zr50iFpfA==
Received: from unknown ([2a0b:9280:a52:0:9e7c:2ab9:aa5:90e6])
 by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
 Wed, 17 Jun 2026 00:01:32 +0200 (CEST)
From: =?utf-8?q?Zden=C4=9Bk_Kop=C5=99iv=C3=ADk?= <zdenek.koprivik@post.cz>
To: <amd-gfx@lists.freedesktop.org>
Subject: =?utf-8?q?=5BBUG=5D_Zero-fill_formatting_error_for_GPU_power_metr?=
 =?utf-8?q?ics_in_amdgpu=5Fpm=5Finfo?=
Date: Wed, 17 Jun 2026 00:01:32 +0200 (CEST)
Message-Id: <3o8.g4Jl.34rkhuHwbax.1gCSUy@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.2.5)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: multipart/alternative;
 boundary="=_5bf85124248b4b4226b4c4c4=8cb4469b-1aea-57de-805f-dacd03b8f9c3_="
X-Mailman-Approved-At: Wed, 17 Jun 2026 07:14:49 +0000
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
X-Spamd-Result: default: False [1.47 / 15.00];
	SUBJ_EXCESS_QP(1.20)[];
	R_MIXED_CHARSET(1.07)[subject];
	DMARC_POLICY_ALLOW(-0.50)[post.cz,none];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[post.cz:s=szn1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FREEMAIL_FROM(0.00)[post.cz];
	FROM_NEQ_ENVFROM(0.00)[zdenek.koprivik@post.cz,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[post.cz:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,seznam.cz:mid,post.cz:dkim,post.cz:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7438D69718D


--=_5bf85124248b4b4226b4c4c4=8cb4469b-1aea-57de-805f-dacd03b8f9c3_=
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
I noticed a minor string-formatting issue in the 'amdgpu_pm_info' debugfs =

output when reading power consumption of my Radeon 780M.

The output fails to zero-fill the fractional portion of the Wattage readou=
t 
to 3 decimal places. For example, when the hardware returns a value 
corresponding to 3.084 W (3084 mW), the driver seems to format it as "3.84=
 
W" instead of "3.084 W".

System Info:
- GPU: AMD Radeon 780M (gfx1103)

- Kernel Version: 7.0


Kind regards,

Zdenek

--=_5bf85124248b4b4226b4c4c4=8cb4469b-1aea-57de-805f-dacd03b8f9c3_=
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body>Hello,<br>I noticed a minor string-formatting issue in the 'am=
dgpu_pm_info' debugfs output when reading power consumption of my Radeon 7=
80M.<br><br>The output fails to zero-fill the fractional portion of the Wa=
ttage readout to 3 decimal places. For example, when the hardware returns =
a value corresponding to 3.084 W (3084 mW), the driver seems to format it =
as "3.84 W" instead of "3.084 W".<br><br>System Info:<br>- GPU: AMD Radeon=
 780M (gfx1103)<br><div>- Kernel Version: 7.0</div><br><div>Kind regards,<=
/div><div>Zdenek</div></body></html>
--=_5bf85124248b4b4226b4c4c4=8cb4469b-1aea-57de-805f-dacd03b8f9c3_=--

