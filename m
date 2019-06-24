Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344DD50C01
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 15:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9E8997C;
	Mon, 24 Jun 2019 13:29:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.ud03.udmedia.de (ud03.udmedia.de [194.117.254.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C3E8997C
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 13:29:02 +0000 (UTC)
Received: (qmail 20840 invoked from network); 24 Jun 2019 15:29:00 +0200
Received: by mail.ud03.udmedia.de with ESMTPA; 24 Jun 2019 15:29:00 +0200
X-UD-Smtp-Session: ud03?335p7@Re+CyxGMoNjCdf4e
MIME-Version: 1.0
Date: Mon, 24 Jun 2019 15:29:00 +0200
From: =?UTF-8?Q?Dieter_N=C3=BCtzel?= <Dieter@nuetzel-hh.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: [amd-staging-drm-next] broken after Navi merge
Message-ID: <9ec82cfce8a6ee8f24e085e1a423ecaf@nuetzel-hh.de>
X-Sender: Dieter@nuetzel-hh.de
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=nuetzel-hh.de;
 h=
 mime-version:content-type:content-transfer-encoding:date:from:to
 :cc:subject:message-id; s=k1; bh=kW79dZ3z/YQl0WgOosV0+QmArD69QGV
 IJl4IAmCC8Gg=; b=cbQocVEXmLrHeX9WWPQb+t9h1c+e565GC4GYLoO4bUCsjcN
 qQ8VBNj255Cy4w8ysSeUjJLnBfFEPvBKogYbX2dMPm6CKWEXARjP9QZRgpiocQrJ
 4l5fBsfCTiEAAB18M7/R5Vu+T+algOETsq/E3WZPHd557E9tMkKSziyrKm88=
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-devel <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGVsbG8gQWxleCwKCmFmdGVyIHlvdXIgbGF0ZXN0IE5hdmkgbWVyZ2UgJ2FtZC1zdGFnaW5nLWRy
bS1uZXh0JyBpcyBicm9rZW4gd2l0aCAKUG9sYXJpcyAyMC4KCkl0IGhhbmdzIHdpdGggdmVyeSBs
aWdodCBncmF5IChtb3N0bHkgYmxhY2spIHNjcmVlbiBhZnRlciBmaXJzdCBtb2RlIApzd2l0Y2gu
CgpUZXN0ZWQgY29tbWl0OgozMTdkNTAzM2FiNmMgKEhFQUQgLT4gYW1kLXN0YWdpbmctZHJtLW5l
eHQsIG9yaWdpbi9hbWQtc3RhZ2luZy1kcm0tbmV4dCkgCmRybS9hbWRncHU6IGFkZCBqb2ItPnBy
ZWFtYmxlX3N0YXR1cyBiYWNrIHRvIHN0YXR1cyB2YWx1ZQoKRXZlbiBydW4gbW9kZSAzfDEgd2l0
aCBncnViMiBkbyBub3Qgd29ya3MuCgpTZWUgYWxzbzoKaHR0cHM6Ly93d3cucGhvcm9uaXguY29t
L2ZvcnVtcy9mb3J1bS9waG9yb25peC9sYXRlc3QtcGhvcm9uaXgtYXJ0aWNsZXMvMTEwODUwMC1h
bWQtc2VuZHMtaW4tbmF2aS1zdXBwb3J0LW90aGVyLXJlbWFpbmluZy1hbWRncHUtY2hhbmdlcy1m
b3ItbGludXgtNS0zP3A9MTEwODY4NiNwb3N0MTEwODY4NgoKSSBoYXZlIHRvIHJvbGwgYmFjayBi
ZWZvcmUgTmF2aSBjb21taXRzIHRvIGdldCB3b3JraW5nIAonYW1kLXN0YWdpbmctZHJtLW5leHQn
IGtlcm5lbCwgYWdhaW4uCgpNYXliZSB5b3UgaGF2ZSBzb21lICdzcGFyZScgdGltZSBkZXNwaXRl
IGFsbCB5b3VyIE5hdmkgZW5hYmxlbWVudCB3b3JrIAp0byBsaWZ0ICdhbWQtc3RhZ2luZy1kcm0t
bmV4dCcgdG8gYXQgbGVhc3QgNS4yLXJjNiAodGhlIFN0ZWFtIFRDUCAKdGhpbmcpLgoKR3JlZXRp
bmdzLApEaWV0ZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
