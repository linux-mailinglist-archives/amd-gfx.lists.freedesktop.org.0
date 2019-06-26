Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6657260
	for <lists+amd-gfx@lfdr.de>; Wed, 26 Jun 2019 22:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F26E6E504;
	Wed, 26 Jun 2019 20:12:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743D6E501
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 20:12:46 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w79so88221oif.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 Jun 2019 13:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Tdf+fLcwGtXw/pR+VztI7GnuPqHyZkqUUhbwkDx/+Q=;
 b=FBu8TkhJ5clbx1bi6+ZMwoPmO0m++nQdjH53SKQWxvRjrpQBORJn5COUxmQd5ldwh8
 dgvx7r+Mhy4VhZ+fJRQJajMx99JGaOK9KG/bWeQG/0TJP/bZKV/dF3vS7xrQ+2GR8vlC
 KnKGSpmSP89jdEsFF5XIZbVN1kN3NarIE6DXT1D0P0oAOrvVtIuaP9wy5MzJuaeYKgf0
 j3FT0S63uZwNKvYIq9wsaEbh17FSnbK33M/Xoe9qabzDX2Zyjw4ryFlgIJyCUE9g0qth
 smJTs4fNspBA+V5tRP1u0cfqe+3MycyLzz3G9NL/WHVi8ke7VRSboK0cIQ+aA0Rc81RA
 wx3A==
X-Gm-Message-State: APjAAAXp4lv9SSSiAclRqrR2NQkLXaJOb1LPqqfV3J+isU6oJPr+Z1NB
 44b2fTUJwOlJc/eYD27B+lY4ynyLtgSV9IYeYlCNrg==
X-Google-Smtp-Source: APXvYqxuKEUl7mQ4aRONGVPnVlpEBgKCK1RTN9RtN03ZPBRixfIqEZ3fWzSrhKyttyGimchD/szuveKezD/aUmDDhKA=
X-Received: by 2002:a05:6808:118:: with SMTP id
 b24mr138245oie.128.1561579965393; 
 Wed, 26 Jun 2019 13:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190626150522.11618-1-Kenny.Ho@amd.com>
 <20190626150522.11618-2-Kenny.Ho@amd.com>
 <20190626154929.GP12905@phenom.ffwll.local>
 <CAOWid-dyGwf=e0ikBEQ=bnVM_bC8-FeTOD8fJVMJKUgPv6vtyw@mail.gmail.com>
In-Reply-To: <CAOWid-dyGwf=e0ikBEQ=bnVM_bC8-FeTOD8fJVMJKUgPv6vtyw@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 Jun 2019 22:12:34 +0200
Message-ID: <CAKMK7uEpxbu-mACYxrskvCoktDeJ6+ckZvPkSAsXFtdz_h_8EA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 01/11] cgroup: Introduce cgroup for drm subsystem
To: Kenny Ho <y2kenny@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1Tdf+fLcwGtXw/pR+VztI7GnuPqHyZkqUUhbwkDx/+Q=;
 b=gJyA30Ula6v92KNUAW91AK4cD/ciKwyoXJ7oztHBTYS+ivR6VN2hajT9THs4YOcvcO
 ytpiKnO2h6oFuVgxTViEk2DIpTZo0W5GDjG+0MSIPMihN5NVqRDsiVIxYJWzVmtcvHsd
 BumB0KOcnqua9BZxG9qOpc6T7/DMf/8YCiYB8=
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
Cc: Kenny Ho <Kenny.Ho@amd.com>, jsparks@cray.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, lkaplan@cray.com,
 Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, joseph.greathouse@amd.com,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgOTozNSBQTSBLZW5ueSBIbyA8eTJrZW5ueUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTE6NDkgQU0gRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToKPiA+Cj4gPiBCdW5jaCBvZiBuYW1pbmcgYmlr
ZXNoZWRzCj4KPiBJIGFwcHJlY2lhdGUgdGhlIHN1Z2dlc3Rpb25zLCBuYW1pbmcgaXMgaGFyZCA6
KS4KPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2Nncm91cC5oPgo+ID4gPiArCj4gPiA+ICtzdHJ1
Y3QgZHJtY2dycCB7Cj4gPgo+ID4gZHJtX2Nncm91cCBmb3IgbW9yZSBjb25zaXN0ZW5jeSBob3cg
d2UgdXN1YWxseSBjYWxsIHRoZXNlIHRoaW5ncy4KPgo+IEkgd2FzIGhvcGluZyB0byBrZWVwIHRo
ZSBzeW1ib2wgc2hvcnQgaWYgcG9zc2libGUuICBJIHN0YXJ0ZWQgd2l0aAo+IGRybWNnIChmb2xs
b3dpbmcgYmxrY2cpLCAgYnV0IEkgYmVsaWV2ZSB0aGF0IGNhdXNlcyBjb25mdXNpb24gd2l0aAo+
IG90aGVyIGFzcGVjdCBvZiB0aGUgZHJtIHN1YnN5c3RlbS4gIEkgZG9uJ3QgaGF2ZSB0b28gc3Ry
b25nIG9mIGFuCj4gb3BpbmlvbiBvbiB0aGlzIGJ1dCBJJ2QgcHJlZmVyIG5vdCBuZWVkaW5nIHRv
IGtlZXAgcmVmYWN0b3JpbmcuICBTbyBpZgo+IHRoZXJlIGFyZSBvdGhlciBvcGluaW9ucyBvbiB0
aGlzLCBwbGVhc2Ugc3BlYWsgdXAuCgpJIHRoaW5rIGRybWNnIHNvdW5kcyBnb29kIHRvIG1lLiBU
aGF0IGFsaWducyBhdCBsZWFzdCB3aXRoIG1lbWNnLApibGtjZyBpbiBjZ3JvdXBzLCBzbyBhcyBn
b29kIHJlYXNvbiBhcyBhbnkuIGRybWNncnAganVzdCBmZWx0IGtpbmRhCmF3a3dhcmQgaW4tYmV0
d2VlbiBzb2x1dGlvbiwgbm90IGFzIGVhc3kgdG8gcmVhZCBhcyBkcm1fY2dyb3VwLCBidXQKYWxz
byBub3QgYXMgc2hvcnQgYXMgZHJtY2cgYW5kIGNncnAgaXMganVzdCBsZXR0ZXIganVtYm8gSSBj
YW4gbmV2ZXIKcmVtZW1iZXIgYW55d2F5IHdoYXQgaXQgbWVhbnMgOi0pCi1EYW5pZWwKCj4gPiA+
ICsKPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwdXRfZHJtY2dycChzdHJ1Y3QgZHJtY2dycCAq
ZHJtY2dycCkKPiA+Cj4gPiBJbiBkcm0gd2UgZ2VuZXJhbGx5IHB1dCBfZ2V0L19wdXQgYXQgdGhl
IGVuZCwgY2dyb3VwIHNlZW1zIHRvIGRvIHRoZSBzYW1lLgo+Cj4gb2ssIEkgd2lsbCByZWZhY3Rv
ci4KPgo+ID4gPiArewo+ID4gPiArICAgICBpZiAoZHJtY2dycCkKPiA+ID4gKyAgICAgICAgICAg
ICBjc3NfcHV0KCZkcm1jZ3JwLT5jc3MpOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMg
aW5saW5lIHN0cnVjdCBkcm1jZ3JwICpwYXJlbnRfZHJtY2dycChzdHJ1Y3QgZHJtY2dycCAqY2cp
Cj4gPgo+ID4gSSdkIGFsc28gY2FsbCB0aGlzIGRybV9jZ3JvdXBfcGFyZW50IG9yIHNvLgo+ID4K
PiA+IEFsc28gYWxsIHRoZSBhYm92ZSBuZWVkcyBhIGJpdCBvZiBuaWNlIGtlcm5lbGRvYyBmb3Ig
dGhlIGZpbmFsIHZlcnNpb24uCj4gPiAtRGFuaWVsCj4KPiBOb3RlZCwgd2lsbCBkbywgdGhhbmtz
Lgo+Cj4gUmVnYXJkcywKPiBLZW5ueQoKCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdp
bmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
