Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B165D4F80
	for <lists+amd-gfx@lfdr.de>; Sat, 12 Oct 2019 14:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A0B8905A;
	Sat, 12 Oct 2019 12:05:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 566 seconds by postgrey-1.36 at gabe;
 Sat, 12 Oct 2019 12:04:59 UTC
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D10C8905A
 for <amd-gfx@lists.freedesktop.org>; Sat, 12 Oct 2019 12:04:59 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id 932282800B48B;
 Sat, 12 Oct 2019 13:55:31 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 5684240591A; Sat, 12 Oct 2019 13:55:31 +0200 (CEST)
Date: Sat, 12 Oct 2019 13:55:31 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 09/19] drm/amdgpu: add additional boco checks to runtime
 suspend/resume
Message-ID: <20191012115531.7bcdwqoltr2ajp3z@wunner.de>
References: <20191011014536.10869-1-alexander.deucher@amd.com>
 <20191011014536.10869-10-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011014536.10869-10-alexander.deucher@amd.com>
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

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDg6NDU6MjZQTSAtMDUwMCwgQWxleCBEZXVjaGVyIHdy
b3RlOgo+ICsJaWYgKGFtZGdwdV9kZXZpY2Vfc3VwcG9ydHNfYm9jbyhkcm1fZGV2KSkKPiArCQlk
cm1fZGV2LT5zd2l0Y2hfcG93ZXJfc3RhdGUgPSBEUk1fU1dJVENIX1BPV0VSX0NIQU5HSU5HOwo+
ICAKPiArCWlmIChhbWRncHVfZGV2aWNlX3N1cHBvcnRzX2JvY28oZHJtX2RldikpIHsKPiArCQlp
ZiAoYW1kZ3B1X2lzX2F0cHhfaHlicmlkKCkgfHwKPiArCQkgICAgIWFtZGdwdV9oYXNfYXRweF9k
Z3B1X3Bvd2VyX2NudGwoKSkKPiArCQkJcGNpX3NldF9wb3dlcl9zdGF0ZShwZGV2LCBQQ0lfRDAp
Owo+ICsJCXBjaV9yZXN0b3JlX3N0YXRlKHBkZXYpOwo+ICsJCXJldCA9IHBjaV9lbmFibGVfZGV2
aWNlKHBkZXYpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwkJcGNpX3NldF9t
YXN0ZXIocGRldik7Cj4gKwl9CgpUd28gY29uc2VjdXRpdmUgaWYtY2xhdXNlcyB3aXRoIHNhbWUg
Y29uZGl0aW9uLCBjYW4gYmUgZm9sZGVkIGludG8gb25lLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
