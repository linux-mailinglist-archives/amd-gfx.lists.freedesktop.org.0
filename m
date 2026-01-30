Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD7PBZAwf2k8lQIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Sun, 01 Feb 2026 11:53:04 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7AC5ACC
	for <lists+amd-gfx@lfdr.de>; Sun, 01 Feb 2026 11:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372DD10E189;
	Sun,  1 Feb 2026 10:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="BWO6UpGU";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E9C10E1A2
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Jan 2026 22:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1769811487; x=1770070687;
 bh=lNnh0UbunnXKoDpoXH7VKWwccvtBrHyBFHtWKOmkxc8=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=BWO6UpGUzX7Wwf2PLRnYaxHLBptm7pJWrE4YQEFeD6J9itkUxnEwBYBFYksyWG2Jw
 +0R7Hln0eXQ5FLVZQNMI2UZmrZAQ7qThNd7EzIhabIApZOhAH6A+f3N6KACTpg0wUy
 UcYgLiYcj/mZXr3FIZWJu/CFFAVuUnEwvJJFPuFIwcHQ6tg5LQrS74s+dTXjzNdTDV
 4W9CscIBYMAZasXlrpAxMHvE/bOUB/grDaxR5e7QaZRiccwVPr3zOnwruzy+/Nc4Af
 exh8zmqmN+EQ04jIkVESuVYD1Vj4wsYhaDFqpXRQfOBh0pnIOsR4C4h53gIKv1NbAl
 o+Wx/C5B/GVsQ==
Date: Fri, 30 Jan 2026 22:18:05 +0000
To: amd-gfx@lists.freedesktop.org
From: decce6 <decce6@proton.me>
Subject: [PATCH] drm/[radeon|amdgpu]: Add HAINAN clock adjustment
Message-ID: <20260130221743.8667-1-decce6@proton.me>
In-Reply-To: <CADnq5_Nrp6xsEOgs8PVy5cmO3rV9QhdoyBDB6DdTdOtXpmnZ6Q@mail.gmail.com>
References: <20260117095421.12700-1-decce6@proton.me>
 <CADnq5_Nrp6xsEOgs8PVy5cmO3rV9QhdoyBDB6DdTdOtXpmnZ6Q@mail.gmail.com>
Feedback-ID: 132957244:user:proton
X-Pm-Message-ID: 247ae4cc075a5ba06586a4b5ccaccf2cd71a9607
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 01 Feb 2026 10:52:53 +0000
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
X-Spamd-Result: default: False [0.69 / 15.00];
	DATE_IN_PAST(1.00)[36];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[decce6@proton.me,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[proton.me:+];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[amd-gfx];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 86B7AC5ACC
X-Rspamd-Action: no action

Thank you for the instructions. I can split the patches later. The revision=
 is 0x00, is that correct? I did not check the revision seeing the adjustme=
nt for other cards only checked either the device or the revision. Should I=
 change it to apply only when both device and revision match mine?

