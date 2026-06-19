Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KneoEVSANWrexwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 19:45:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2766A749A
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jun 2026 19:45:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=pm.me header.s=protonmail3 header.b=R7LweNcN;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=pm.me
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199F410E0EF;
	Fri, 19 Jun 2026 17:45:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-244105.protonmail.ch (mail-244105.protonmail.ch
 [109.224.244.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B167710E0EF
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jun 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
 s=protonmail3; t=1781891146; x=1782150346;
 bh=uzWYDGvl5QCJu1JiUeB5n+ZVeAs7k1CCTJwUsnDENBs=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=R7LweNcN5CHjPlUMRQRUEaFHoe6JAjwqyJCqFbZPCi/mGyHQpUbE/vtGoeEkru55y
 PT/Idednz90Q1Pqfyh1vdZ5aTLw3zF8a+o0qHZYtvZ79SnyItGp6CLeWVCJtyQG7wF
 nKRceLpz/sQdTMhx7kKrbA0X8BRqAEFdkW7AF5tZR0Sy51o3WiwrSaGo+z9s9hZige
 wx21gHKl1VX0bvCXzNiZ+1BGcLMPLBI68dzt+NxdV/Kc3uN2sVPXY777tLHyGkECQU
 Hwuza8tdO8Px0oLadqLtlGS+yemxlGfTUNofGxeUJAiFqWiknScUboi+b7qvTdhJ1g
 qABj6obpgtqXA==
Date: Fri, 19 Jun 2026 17:45:43 +0000
To: Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
From: Matthew Jacob <feralmatt@pm.me>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: support a couple of extra BARCO graphics adapters
Message-ID: <kb82H17fFzuBQ-ZxQz8SJqF6DPycZtYEc7XvSWxR0nww24pZJTnkYUU_d8bbJpqC34uGL7IhIPFznw4nMYtzozBZCxxTWBgjjA3gTdR49Fc=@pm.me>
Feedback-ID: 169730088:user:proton
X-Pm-Message-ID: b63f4754b57befd5ef16e165e8e91e62ce4001fb
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_Ylkd6t4DkZHel5dWPIIGWxp4tCUmRr3cIxxPQku6Q"
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
X-Spamd-Result: default: False [-0.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:alexander.deucher@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[feralmatt@pm.me,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[pm.me:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp,pm.me:dkim,pm.me:mid,pm.me:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8D2766A749A

--b1=_Ylkd6t4DkZHel5dWPIIGWxp4tCUmRr3cIxxPQku6Q
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



BARCO produces its own adapters using AMD chipsets. Mostly they are used on=
 Windows platforms for radiology PACS review workstations. They don't want =
to spend resources to support Linux. Working with them unofficially jointly=
 with Kaiser who is experimenting with Linux as an alternate platform I got=
 some patches to support some of the cards that Kaiser has in its fleets in=
 several regions. Neither Kaiser nor BARCO have any objection to inclusion =
of these changes in Linux.

Changes attached.


--b1=_Ylkd6t4DkZHel5dWPIIGWxp4tCUmRr3cIxxPQku6Q
Content-Type: text/x-patch; name=amdgpu_drv.c.diff
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=amdgpu_drv.c.diff

U3VwcG9ydCBzb21lIEJhcmNvIEFNRCBiYXNlZCBncmFwaGljcyBhZGFwdGVycy4gVGhlc2UgYWRh
cHRlcnMgdHlwaWNhbGx5IGFyZQpvbmx5IHN1cHBvcnRlZCBieSBCYXJjbyBvbiB0aGUgV2luZG93
cyBwbGF0Zm9ybS4gIEhvd2V2ZXIsIHdpdGggdGhlc2UKY2hhbmdlcyBpbiB0aGUgbGludXggZHJp
dmVyLCBtdWx0aXBsZSBtb25pdG9yIHN1cHBvcnQgc2hvdWxkIHdvcmsgY29ycmVjdGx5LgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwppbmRleCA2MGRlYmQ1NDNlNDQuLmUz
YmExNjg3OTVjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwpAQCAt
MTkyNiw2ICsxOTI2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkIHBjaWlk
bGlzdFtdID0gewogCXsweDEwMDIsIDB4NjY0NiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9CT05BSVJFfEFNRF9JU19NT0JJTElUWX0sCiAJezB4MTAwMiwgMHg2NjQ3LCBQQ0lf
QU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0JPTkFJUkV8QU1EX0lTX01PQklMSVRZfSwK
IAl7MHgxMDAyLCAweDY2NDksIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfQk9O
QUlSRX0sCisJezB4MTAwMiwgMHg2NjRELCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBD
SElQX0JPTkFJUkV9LCAvLyBCYXJjbyBNWFJULTU2MDAKIAl7MHgxMDAyLCAweDY2NTAsIFBDSV9B
TllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfQk9OQUlSRX0sCiAJezB4MTAwMiwgMHg2NjUx
LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX0JPTkFJUkV9LAogCXsweDEwMDIs
IDB4NjY1OCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9CT05BSVJFfSwKQEAg
LTE5OTUsNiArMTk5Niw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lp
ZGxpc3RbXSA9IHsKIAl7MHgxMDAyLCAweDY5MzAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAs
IDAsIENISVBfVE9OR0F9LAogCXsweDEwMDIsIDB4NjkzOCwgUENJX0FOWV9JRCwgUENJX0FOWV9J
RCwgMCwgMCwgQ0hJUF9UT05HQX0sCiAJezB4MTAwMiwgMHg2OTM5LCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBDSElQX1RPTkdBfSwKKwl7MHgxMDAyLCAweDY5M0IsIFBDSV9BTllfSUQs
IFBDSV9BTllfSUQsIDAsIDAsIENISVBfVE9OR0F9LCAvLyBCYXJjbyBNWFJULTc2MDAKIAkvKiBm
aWppICovCiAJezB4MTAwMiwgMHg3MzAwLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBD
SElQX0ZJSkl9LAogCXsweDEwMDIsIDB4NzMwRiwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9GSUpJfSwKQEAgLTIwMjMsNiArMjAyNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
cGNpX2RldmljZV9pZCBwY2lpZGxpc3RbXSA9IHsKIAl7MHgxMDAyLCAweDY3QzQsIFBDSV9BTllf
SUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfUE9MQVJJUzEwfSwKIAl7MHgxMDAyLCAweDY3Qzcs
IFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfUE9MQVJJUzEwfSwKIAl7MHgxMDAy
LCAweDY3RDAsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfUE9MQVJJUzEwfSwK
Kwl7MHgxMDAyLCAweDY3RDQsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIENISVBfUE9M
QVJJUzEwfSwgLy8gQmFyY28gTVhSVC04NzUwCiAJezB4MTAwMiwgMHg2N0RGLCBQQ0lfQU5ZX0lE
LCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMH0sCiAJezB4MTAwMiwgMHg2N0M4LCBQ
Q0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMH0sCiAJezB4MTAwMiwg
MHg2N0M5LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMH0sCkBA
IC0yMDM2LDYgKzIwMzksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNp
aWRsaXN0W10gPSB7CiAJezB4MTAwMiwgMHg2OTg1LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAw
LCAwLCBDSElQX1BPTEFSSVMxMn0sCiAJezB4MTAwMiwgMHg2OTg2LCBQQ0lfQU5ZX0lELCBQQ0lf
QU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMn0sCiAJezB4MTAwMiwgMHg2OTg3LCBQQ0lfQU5Z
X0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMn0sCisJezB4MTAwMiwgMHg2OThG
LCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lELCAwLCAwLCBDSElQX1BPTEFSSVMxMn0sIC8vIEJhcmNv
IE1YUlQtNDcwMAogCXsweDEwMDIsIDB4Njk5NSwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgQ0hJUF9QT0xBUklTMTJ9LAogCXsweDEwMDIsIDB4Njk5NywgUENJX0FOWV9JRCwgUENJX0FO
WV9JRCwgMCwgMCwgQ0hJUF9QT0xBUklTMTJ9LAogCXsweDEwMDIsIDB4Njk5RiwgUENJX0FOWV9J
RCwgUENJX0FOWV9JRCwgMCwgMCwgQ0hJUF9QT0xBUklTMTJ9LAo=

--b1=_Ylkd6t4DkZHel5dWPIIGWxp4tCUmRr3cIxxPQku6Q--

