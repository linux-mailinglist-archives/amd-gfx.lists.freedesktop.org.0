Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7D4C909
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 10:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A595B6E528;
	Thu, 20 Jun 2019 08:10:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417C06E528
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 08:10:31 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id w17so2292888qto.10
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 01:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Go4TyLG9kntlQoRY6CS3DzHZo09W5E8ZY1Sn6kBob74=;
 b=snjbmEcYAWYekYoY0OqPyV1617DkhQaUyqAFo/xmvvBqBowEfBAFV56QCEPFCQgK7h
 uk21kW5n+lXKL8JYiFVoydL8K73zwNEjh0dNbjlynGthwjc3BOipjbLKdQ2S0L5KM+WT
 J8TEvKDZ0iAQA5hGudN4w3Rtp/Hok92+f+tGroLX2n/cqoEqgYvTEjmV9BqmfBahEJ0/
 imINjZgrqskD51Vjn8e6vNG/95+UOzl2L/rDj3m4eNH0zMP+L+A4sVPm2IvHrTlVRiFu
 NwdbOS9SXp8CJ5cEMWiZiX4ZjXzVKWN+pm+z3XQFVTJZrqpgG5S0Z69kxWXcFyLiqi6u
 Nofw==
X-Gm-Message-State: APjAAAWHJF4g5DOQCFAy7XPRK8lNCyP8BAdlN6QA6hLavm+1UeOFoJ0S
 tWpa+XDsfvOZOX9bf6QnvUijSPf/6nV1FII6uAtkdQ==
X-Google-Smtp-Source: APXvYqxF0IanqOEfRghysZ9QI1leytIcf0V2QgEMfyNRfFBqGMSdDC44wb+ogFwEqSx8pPT5VGhpFmgUOoL52EVP/Jo=
X-Received: by 2002:a0c:9214:: with SMTP id a20mr38965491qva.195.1561018230068; 
 Thu, 20 Jun 2019 01:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190607151655.7991-1-nicholas.kazlauskas@amd.com>
 <BN8PR12MB32175DF8FD6509F800439BF3EF100@BN8PR12MB3217.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB32175DF8FD6509F800439BF3EF100@BN8PR12MB3217.namprd12.prod.outlook.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Thu, 20 Jun 2019 09:10:18 +0100
Message-ID: <CAHbf0-He4Ff-u_EOU5ZbmcCxgZ+XyCAo+80tnjD5tfH6KNcJDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true
To: "Francis, David" <David.Francis@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Go4TyLG9kntlQoRY6CS3DzHZo09W5E8ZY1Sn6kBob74=;
 b=EabCXwlGsCz6vhCZqSwzzIQ8czM9aHxx1h3rThk2Lf1WuxB2nwaQNB7rhZsId5Koj2
 pBTZCpqn4phGfi7lZKfaWsg68a6P6NKTAD4Tql2p1sCzD5DB8icdBuE/+4R8twzeq19R
 XcF/D86oSFzYV1tGQx/pOMYRDWVzv5Ebr6cwB/+JKpaDLLiHUOh2aktCiZ6gGknMZJvs
 YUnYk8O/C3hXcmdzLT6wQuFOq03WRwujdmotYvCMUvpfBGA4bCyJBA3cRWcI1iYivaUJ
 r+uvfBvhP/9XRrIqCOO1qIUNAfHAE0QEOQL6uUxqXwS7+JGgEAxs+C02MmwRXDHLfcYB
 lDgQ==
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkKClRoaXMgcGF0Y2ggY2F1c2VzIHdhcm5pbmdzIGZvciBtZSBpbiBhIGNvbnRpbnVvdXMgbG9v
cAoKaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTEwOTQ5CgpM
ZXQgbWUga25vdyBpZiB5b3UnZCBsaWtlIGFueSBtb3JlIGRldGFpbAoKQ2hlZXJzCgpNaWtlCgpP
biBGcmksIDcgSnVuIDIwMTkgYXQgMTY6NDIsIEZyYW5jaXMsIERhdmlkIDxEYXZpZC5GcmFuY2lz
QGFtZC5jb20+IHdyb3RlOgo+Cj4gUGF0Y2ggaXMKPgo+IFJldmlld2VkLWJ5OiBEYXZpZCBGcmFu
Y2lzIDxEYXZpZC5GcmFuY2lzQGFtZC5jb20+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IEZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+IG9uIGJlaGFsZiBvZiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVz
a2FzQGFtZC5jb20+Cj4gU2VudDogSnVuZSA3LCAyMDE5IDExOjE2OjU1IEFNCj4gVG86IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IEZyYW5jaXMsIERhdmlkOyBXZW50bGFuZCwg
SGFycnk7IEthemxhdXNrYXMsIE5pY2hvbGFzCj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kL2Rp
c3BsYXk6IEVuYWJsZSBmYXN0IHBsYW5lIHVwZGF0ZXMgd2hlbiBzdGF0ZS0+YWxsb3dfbW9kZXNl
dCA9IHRydWUKPgo+IFtXaHldCj4gV2hlbmV2ZXIgdGhlIGEgbW9kZXNldCBpcyBhbGxvd2VkIChi
dXQgbm90IG5lY2Nlc3NhcmlseSByZXF1aXJlZCkgd2UKPiBjdXJyZW50bHkgcmVjcmVhdGUgYWxs
IHRoZSBwbGFuZXMgaW4gdGhlIHN0YXRlLiBNb3N0IElHVCB0ZXN0cyBhbmQKPiBsZWdhY3kgSU9D
VExzIGNyZWF0ZSBhdG9taWMgY29tbWl0cyB3aXRoIHRoaXMgZmxhZyBzZXQsIHNvIHRoZSBwaXBl
cwo+IGFyZSBvZnRlbiB1bm5lY2Vzc2FyaWx5IHJlcHJvZ3JhbW1lZC4KPgo+IFBvb3IgcGVyZm9y
bWFuY2UgYW5kIHN0dXR0ZXJpbmcgY2FuIG9jY3VyIHdoZW4gbWFueSBvZiB0aGVzZSBjb21taXRz
Cj4gYXJlIGZyZXF1ZW50bHkgaXNzdWVkLgo+Cj4gVGhpcyBmbGFnIHdhcyBuZWVkZWQgd2hlbiB0
aGUgYXBwcm9wcmlhdGUgY29uZGl0aW9ucyBmb3IgY2hlY2tpbmcKPiB3aGV0aGVyIHRoZSBwbGFu
ZXMgbmVlZGVkIGEgcmVzZXQgd2VyZSBub3QgaW4gcGxhY2UsIGJ1dAo+IHNob3VsZF9yZXNldF9w
bGFuZSBzaG91bGQgY292ZXIgZXZlcnl0aGluZyBuZWVkZWQgbm93Lgo+Cj4gW0hvd10KPiBEcm9w
IHRoZSBjaGVjayBmb3Igc3RhdGUtPmFsbG93X21vZGVzZXQgaW4gc2hvdWxkX3Jlc2V0X3BsYW5l
Lgo+Cj4gQWxsIHBsYW5lcyBvbiBhIENSVEMgc2hvdWxkIHJlc2V0IGluIHRoZSBmb2xsb3dpbmcg
Y29uZGl0aW9uczoKPiAtIFRoZSBDUlRDIG5lZWRzIGEgbW9kZXNldAo+IC0gVGhlIENSVEMgZGVn
YW1tYSBjaGFuZ2VzCj4gLSBQbGFuZXMgYXJlIGFkZGVkIG9yIHJlbW92ZWQgdG8gdGhlIENSVEMK
Pgo+IFRoZXNlIGNvbmRpdGlvbnMgYXJlIGFsbCBjb3ZlcmVkIGluIHNob3VsZF9yZXNldF9wbGFu
ZS4KPgo+IFdlIHN0aWxsIGNhbid0IGRyb3AgdGhlIGZvcm1hdCBjaGFuZ2UgY2hlY2sgaW4gc2hv
dWxkX3Jlc2V0X3BsYW5lIHNpbmNlCj4gZmlsbF9kY19wbGFuZV9pbmZvX2FuZF9hZGRyIGlzbid0
IGNhbGxlZCB3aGVuIHZhbGlkYXRpbmcgdGhlIHN0YXRlLCBzbwo+IHdlIGNhbid0IHRlbGwgaWYg
YSBGVUxMIHVwZGF0ZSBpcyBuZWVkZWQgb3Igbm90Lgo+Cj4gQ2M6IERhdmlkIEZyYW5jaXMgPGRh
dmlkLmZyYW5jaXNAYW1kLmNvbT4KPiBDYzogSGFycnkgV2VudGxhbmQgPGhhcnJ5LndlbnRsYW5k
QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMu
a2F6bGF1c2thc0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgOCAtLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYwo+IGluZGV4IGE2OThjOGYyNzJlZC4uNDVmMGQ1YjZjNDY4IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCj4gQEAgLTY0NDYsMTQgKzY0NDYsNiBAQCBzdGF0aWMgYm9vbCBzaG91bGRfcmVzZXRfcGxh
bmUoc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLAo+ICAgICAgICAgIHN0cnVjdCBkcm1f
Y3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7Cj4gICAgICAgICAgaW50IGk7Cj4KPiAtICAgICAg
IC8qCj4gLSAgICAgICAgKiBUT0RPOiBSZW1vdmUgdGhpcyBoYWNrIG9uY2UgdGhlIGNoZWNrcyBi
ZWxvdyBhcmUgc3VmZmljaWVudAo+IC0gICAgICAgICogZW5vdWdoIHRvIGRldGVybWluZSB3aGVu
IHdlIG5lZWQgdG8gcmVzZXQgYWxsIHRoZSBwbGFuZXMgb24KPiAtICAgICAgICAqIHRoZSBzdHJl
YW0uCj4gLSAgICAgICAgKi8KPiAtICAgICAgIGlmIChzdGF0ZS0+YWxsb3dfbW9kZXNldCkKPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gLQo+ICAgICAgICAgIC8qIEV4aXQgZWFybHkg
aWYgd2Uga25vdyB0aGF0IHdlJ3JlIGFkZGluZyBvciByZW1vdmluZyB0aGUgcGxhbmUuICovCj4g
ICAgICAgICAgaWYgKG9sZF9wbGFuZV9zdGF0ZS0+Y3J0YyAhPSBuZXdfcGxhbmVfc3RhdGUtPmNy
dGMpCj4gICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiAtLQo+IDIuMTcuMQo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlz
dAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
