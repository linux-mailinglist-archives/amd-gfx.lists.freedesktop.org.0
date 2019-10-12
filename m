Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B9D4F6D
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 13:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B846E489;
	Sat, 12 Oct 2019 11:51:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 385 seconds by postgrey-1.36 at gabe;
 Sat, 12 Oct 2019 11:51:57 UTC
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BA06E489
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 11:51:57 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f1c:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id E7BB930001EC4;
 Sat, 12 Oct 2019 13:51:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id BD2F02E7DAE; Sat, 12 Oct 2019 13:51:55 +0200 (CEST)
Date: Sat, 12 Oct 2019 13:51:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 08/19] drm/amdgpu: rename amdgpu_device_is_px to
 amdgpu_device_supports_boco
Message-ID: <20191012115155.4tngjbwxgbehzjdr@wunner.de>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
 <20191011014536.10869-9-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011014536.10869-9-alexander.deucher@amd.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: tiwai@suse.de, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDg6NDU6MjVQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IFRvIGJldHRlciBtYXRjaCB3aGF0IHdlIGFyZSBjaGVja2luZyBmb3IgYW5kIHRvIGFs
aWduIHdpdGgKPiBhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JhY28uCj4gCj4gQkFDTyAtIEJ1cyBB
Y3RpdmUsIENoaXAgT2ZmCj4gQk9DTyAtIEJ1cyBPZmYsIENoaXAgT2ZmCgpJdCB3b3VsZCBiZSB1
c2VmdWwgdG8gc3BlbGwgb3V0IEJBQ08gaW4gdGhlIHByZWNlZGluZyBwYXRjaGVzIGFzIHdlbGwu
CgoKPiAtICogYW1kZ3B1X2RldmljZV9pc19weCAtIElzIHRoZSBkZXZpY2UgaXMgYSBkR1BVIHdp
dGggSEcvUFggcG93ZXIgY29udHJvbAo+ICsgKiBhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JvY28g
LSBJcyB0aGUgZGV2aWNlIGlzIGEgZEdQVSB3aXRoIEhHL1BYIHBvd2VyIGNvbnRyb2wKCkR1cGxp
Y2F0ZSB2ZXJiLgoKTXkgcGVyc29uYWwgc3R5bGUgdG8gZG9jdW1lbnQgYm9vbGVhbiByZXR1cm4g
dmFsdWVzIGlzICJ3aGV0aGVyIC4uLiIsCmkuZS4gIndoZXRoZXIgZGV2aWNlIGlzIGEgZEdQVSB3
aXRoIEhHL1BYIHBvd2VyIGNvbnRyb2wiLgpCdXQgdGhhdCdzIGp1c3QgbWUuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
