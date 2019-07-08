Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6B620DE
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 16:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF22989D7B;
	Mon,  8 Jul 2019 14:50:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19CAE89D7B
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 14:50:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v15so5752819wml.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 07:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8f9HhUvNGfXW2iWBKyutoBsfvVRbk1Jxhz3MRBZA0nA=;
 b=oMWoSrOAThw5ObRhiE8ZapU8eQt40imppGQswOuYuX1bkuUvmN9oMy9eChOAWiQ6Ub
 wiVr23GtaCqYAP7QfDsnCXjVdWYUuCbtbOp8MDkPBmIRG/1bvypy0ee09ybDsutKbmpP
 p+E+ah2eHJDPpOe3pUVF1K24yWe9U2v/2KIg2DAcu8+1CSTYcveSU1xRn9buqUIRPTYO
 JZitx/K6v9r42bEERnBOp0YpTYDxCPVDie6otA4KMz1GfjlZPbow8/DkpFxsMF3/MPjD
 eqb+vr39khdAn1OnJqj5OKTNHTVCR2aQvUQzSbpm++rqWyG2DcnwKhO0mFHlXz4BAP6D
 H2cA==
X-Gm-Message-State: APjAAAV+ilW2N3/36Rr4je8pA7YrKJVyqnD9Nl1mKqiCxt+c51XSRvEn
 huKFdspYe72klnCHXiyvkLF+WnynpBwXNmuOF2vhVA==
X-Google-Smtp-Source: APXvYqy7l4GdTD+g+jVDCtmT2pDusnO9VbZymICAwwMp/hMrDf9nu0QjMK6NtGOiGDYyJ3u9SDUuOX91Du4hSXHhX5U=
X-Received: by 2002:a7b:c751:: with SMTP id w17mr18019079wmk.127.1562597431625; 
 Mon, 08 Jul 2019 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190703151341.5916-1-alexander.deucher@amd.com>
 <20190703151341.5916-2-alexander.deucher@amd.com>
In-Reply-To: <20190703151341.5916-2-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jul 2019 10:50:20 -0400
Message-ID: <CADnq5_OeyDanLqymu2Y0yuTMVhNWDqFCmMZ34ySFo8fZiSuqeQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8f9HhUvNGfXW2iWBKyutoBsfvVRbk1Jxhz3MRBZA0nA=;
 b=fB76WfnE7AZ+QBmv7Zd4bNr0354eME1uRRIxWIXRYjg/BOpSZR7iGa12bWbNUGRq42
 y5BLQt785nnmJ50Bch4EWvrSByNR2fDiDU2dqBUfkv3jqVVu29053LJN6fseIIRuIB/E
 VH5396lftBgDmG0iyNLQqDXyFaZeOC0+z0Tdhg269nZFYtc6IKMum2XhccRXaMaHFwyB
 ZLrXoi82RGgfaVrAdmL6CCdBztXgwlpmc1T1fA59O+xDI1SQRL2jPxa0RVdpgPCzbrPz
 dum82veN2Tjem53BLKBTB399kUKk04IjGaYVObWffbGOU7Xs2zgwu1szq5ldRiMftfjs
 eAZw==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UGluZyBvbiB0aGlzIHNlcmllcy4KCkFsZXgKCk9uIFdlZCwgSnVsIDMsIDIwMTkgYXQgMTE6MTMg
QU0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVXNlIHRo
ZSBJUCBkaXNjb3ZlcnkgdGFibGUgcmF0aGVyIHRoYW4gaGFyZGNvZGluZyB0aGUKPiBzZXR0aW5n
cyBpbiB0aGUgZHJpdmVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZHJ2LmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4g
aW5kZXggNzk0MWE1MzY4ZmI1Li42Zjc3NzJlZWViNzggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTE0MCw3ICsxNDAsNyBAQCB1aW50IGFtZGdwdV9z
bXVfbWVtb3J5X3Bvb2xfc2l6ZSA9IDA7Cj4gIHVpbnQgYW1kZ3B1X2RjX2ZlYXR1cmVfbWFzayA9
IDA7Cj4gIGludCBhbWRncHVfYXN5bmNfZ2Z4X3JpbmcgPSAxOwo+ICBpbnQgYW1kZ3B1X21jYnAg
PSAwOwo+IC1pbnQgYW1kZ3B1X2Rpc2NvdmVyeSA9IDA7Cj4gK2ludCBhbWRncHVfZGlzY292ZXJ5
ID0gLTE7Cj4gIGludCBhbWRncHVfbWVzID0gMDsKPgo+ICBzdHJ1Y3QgYW1kZ3B1X21ncHVfaW5m
byBtZ3B1X2luZm8gPSB7Cj4gQEAgLTU5Miw2ICs1OTIsNyBAQCBtb2R1bGVfcGFyYW1fbmFtZWQo
bWNicCwgYW1kZ3B1X21jYnAsIGludCwgMDQ0NCk7Cj4gIC8qKgo+ICAgKiBET0M6IGRpc2NvdmVy
eSAoaW50KQo+ICAgKiBBbGxvdyBkcml2ZXIgdG8gZGlzY292ZXIgaGFyZHdhcmUgSVAgaW5mb3Jt
YXRpb24gZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBvZiBWUkFNLgo+ICsgKiAo
LTEgPSBhdXRvIChkZWZhdWx0KSwgMCA9IGRpc2FibGVkLCAxID0gZW5hYmxlZCkKPiAgICovCj4g
IE1PRFVMRV9QQVJNX0RFU0MoZGlzY292ZXJ5LAo+ICAgICAgICAgIkFsbG93IGRyaXZlciB0byBk
aXNjb3ZlciBoYXJkd2FyZSBJUHMgZnJvbSBJUCBEaXNjb3ZlcnkgdGFibGUgYXQgdGhlIHRvcCBv
ZiBWUkFNIik7Cj4gLS0KPiAyLjIwLjEKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZng=
