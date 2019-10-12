Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3FD4F7B
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 13:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3AE6E489;
	Sat, 12 Oct 2019 11:59:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [IPv6:2a01:37:1000::53df:5f64:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421BC6E489
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 11:59:34 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 6D7DA3000452F;
 Sat, 12 Oct 2019 13:45:27 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 488044058F2; Sat, 12 Oct 2019 13:45:27 +0200 (CEST)
Date: Sat, 12 Oct 2019 13:45:27 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 02/19] drm/amdgpu: add supports_baco callback for soc15
 asics.
Message-ID: <20191012114527.akspejxsm3hvrzil@wunner.de>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
 <20191011014536.10869-3-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011014536.10869-3-alexander.deucher@amd.com>
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDg6NDU6MTlQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+IENoZWNrIHRoZSBCQUNPIGNhcGFiaWxpdGllcyBmcm9tIHRoZSBwb3dlcnBsYXkgdGFi
bGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpbLi4uXQo+IEBAIC05OTcsNiArMTAyMCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YW1kZ3B1X2FzaWNfZnVuY3MgdmVnYTIwX2FzaWNfZnVuY3MgPQo+ICAJLnJlYWRfYmlvc19mcm9t
X3JvbSA9ICZzb2MxNV9yZWFkX2Jpb3NfZnJvbV9yb20sCj4gIAkucmVhZF9yZWdpc3RlciA9ICZz
b2MxNV9yZWFkX3JlZ2lzdGVyLAo+ICAJLnJlc2V0ID0gJnNvYzE1X2FzaWNfcmVzZXQsCj4gKwku
cmVzZXRfbWV0aG9kID0gJnNvYzE1X2FzaWNfcmVzZXRfbWV0aG9kLAo+ICAJLnNldF92Z2Ffc3Rh
dGUgPSAmc29jMTVfdmdhX3NldF9zdGF0ZSwKPiAgCS5nZXRfeGNsayA9ICZzb2MxNV9nZXRfeGNs
aywKPiAgCS5zZXRfdXZkX2Nsb2NrcyA9ICZzb2MxNV9zZXRfdXZkX2Nsb2NrcywKPiBAQCAtMTAw
OSw3ICsxMDMzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfYXNpY19mdW5jcyB2ZWdh
MjBfYXNpY19mdW5jcyA9Cj4gIAkuZ2V0X3BjaWVfdXNhZ2UgPSAmdmVnYTIwX2dldF9wY2llX3Vz
YWdlLAo+ICAJLm5lZWRfcmVzZXRfb25faW5pdCA9ICZzb2MxNV9uZWVkX3Jlc2V0X29uX2luaXQs
Cj4gIAkuZ2V0X3BjaWVfcmVwbGF5X2NvdW50ID0gJnNvYzE1X2dldF9wY2llX3JlcGxheV9jb3Vu
dCwKPiAtCS5yZXNldF9tZXRob2QgPSAmc29jMTVfYXNpY19yZXNldF9tZXRob2QKClNlZW1pbmds
eSB1bnJlbGF0ZWQgY2hhbmdlIHdpdGhvdXQgZXhwbGFuYXRpb24uCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
