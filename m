Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v8hBKjV8ImpDYQEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 09:35:17 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBC64609D
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 09:35:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=zohomail header.b=QvnDAYl0;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF6311A4F5;
	Fri,  5 Jun 2026 07:35:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 904 seconds by postgrey-1.36 at gabe;
 Thu, 04 Jun 2026 20:45:23 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3208D1129C2
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2026 20:45:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1780605019; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CekFGVvzF2nh/YXBp+KV/bQ2jmhVKUkC0aAeX3L6s3i0TI9egcH9sNBkwHcqFAysCr9WP9pVVLSy/Sr+F2c7RtZw/wZjGZ1w0VF0hBG+EORFXqKfxRHdm5EpJm19QmRmm+gAaU0vKctMht8HYvjXBQ7hBbsus2aUHUFKEr+dBfQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1780605019;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=; 
 b=JM8Pc/KHR/l617ADswfNzQG3O7y47G13DMlMRq25EyDdx8n2nXZp07pU4cb9Pzfzcc2vxCvIs5Uw1Lb1dNC4QVOISUH8UX0rtb+UgWyNJExj/QcAb62FrUwDexDnHqzzxvKDVEid2EUwb0g/DeuryjiWjEeeJi3x47osF3DQTkU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780605019; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
 bh=muC6rawBX3CykhRdzS4yBFWa650rEAb1z3ELNMgRXrs=;
 b=QvnDAYl09j17c3rOEa5W4zq4fEY3yAN1/8D5JqxyzZXIroUj3RcR+aBto0MI2Jd5
 g7KWKMHjdZv4RD5GyZT3e70A0Yn664vF+IuIKpq1gWCyRXePR0JRuEP6srSyTAxB4gJ
 VODbSCWX8FT5M8MJiW6oxRk/nTruhAW9T72L6toI=
Received: by mx.zohomail.com with SMTPS id 1780605017273696.9436458254814;
 Thu, 4 Jun 2026 13:30:17 -0700 (PDT)
Message-ID: <da9b5fdab50e4353fe590521da93e90c622d3cbb.camel@collabora.com>
Subject: XDC 2026: Registration & Call for Proposals now open!
From: Mark Filion <mark.filion@collabora.com>
To: amd-gfx@lists.freedesktop.org
Date: Thu, 04 Jun 2026 16:30:16 -0400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44app2) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Approved-At: Fri, 05 Jun 2026 07:35:12 +0000
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	SUBJECT_ENDS_EXCLAIM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,amd-gfx-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,x.org:url,freedesktop.org:url,floss.social:url,collabora.com:mid,collabora.com:from_mime,collabora.com:dkim];
	ALIAS_RESOLVED(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32DBC64609D

Hello!

Registration and Call for Proposals are now open for XDC 2026,
taking place at the Daniels Spectrum in Toronto, Canada,
September 28=E2=80=9330, organized by Arm.

    https://xdc2026.x.org
=20
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

    https://indico.freedesktop.org/event/12/registrations/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2026. While any serious proposal will be carefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

    https://indico.freedesktop.org/event/12/abstracts/

The deadline for submissions Friday, July 3, 2026.

We are looking forward to seeing you in Toronto! If you have any
questions, please email the organizer (charlie.dixon at arm.com), and
CC=20
the X.Org board (board at foundation.x.org).

Don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

    https://floss.social/@XOrgDevConf

Best,

Mark
