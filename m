Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C685C6E7DF
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 17:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9DE66E845;
	Fri, 19 Jul 2019 15:17:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA25E6E845
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 15:17:18 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r1so32619177wrl.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 08:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SHHcZewqdxvGna3SYxZMQlH/1yfoCYzljQTW3jaf+tE=;
 b=kLkLDo6RPbkQAu95S07dbmEnPcP9LN2ILBkFN8DPe3O6IKPhEUm0Ee1XWcRvFyE623
 AsVTflkgqtTdDPGY8Gnf5cTIE9lZmqjTljhCWaATr7izBjD8Q8Qzyo/n/AA+GxwnGPcG
 9gkYKpBZziRwRyRQjp/5rkWDra9Lh372Wk0vNYIzataARfocQ27HshxBVEQQr7kwyfva
 5CUCyV/HO9kabao/SZT/QMJ8ypevMM4NnlHUkExFaG1Lr0stRu6epifAIWrMXm6WYuJs
 uJ0QXQ17O+SEl6NwbFmXFtSUnIBD2YCxLR7Br2HjyRAuwaXbz/yVtujk2zLUyWnzZbUi
 WUBg==
X-Gm-Message-State: APjAAAXiqR1nv/vCNobm9qMKsePq9ucqQGAZ7q3mbFrYS8MaxA4/o1GS
 ZEEac+qvRsNv628N/HJLrmbjNxpBa1m3Vw2CELExxA==
X-Google-Smtp-Source: APXvYqz9miRDrY/+RfY8MNuwT3nP5Hm0l0+dt9eTmWPZ3nGALc6HF0tzXqSU1ALIm2PFXYbxRURrj4KRnEmuJlIk6Fo=
X-Received: by 2002:adf:a299:: with SMTP id s25mr49421997wra.74.1563549437342; 
 Fri, 19 Jul 2019 08:17:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190719112232.28485-1-kevin1.wang@amd.com>
In-Reply-To: <20190719112232.28485-1-kevin1.wang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Jul 2019 11:17:05 -0400
Message-ID: <CADnq5_P2UVmm4P1myih0UOQ2nvLDB01zdaFN9v7p423QeLASKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: change smu_read_sensor sequence in smu
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SHHcZewqdxvGna3SYxZMQlH/1yfoCYzljQTW3jaf+tE=;
 b=MVKUWUgCPugtn8ZBLfbqvNyAfCV76WUcQQ5TjU/qy8byc5gWD5o09hHgbZTzpJONcw
 zZIq9Y24ebkRgTUseplLxh/EKHe8sj9vLr9jHNOCVL9i+lHs9dQdIJJ6SZGG/XRHDaWj
 JyocHlyBjFFtvN/jq6K46wd1IZ5heqSudl2CscX4narnB0SPq/pXJ48dvDoGDOmNLMWX
 CcqG0mWXvWYA0ETfZ7wxNaTb/eFWKXxKC/Hx3tc6ukS9tJXIpQrRG5iUdDXAire60eVx
 GJJ43bHGbaJQa1lX/6kUpLTlNau1uKduoNQPrpzJpNaY5mARouxJvM69prn9t08+BkwG
 1HdQ==
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgNzoyMyBBTSBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4x
LldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBlYWNoIGFzaWMgbWF5YmUgaGFzIGRpZmZlcmVudCBy
ZWFkIHNlbnNvciBtZXRob2QuCj4gc28gY2hhbmdlIHJlYWQgc2Vuc29yIHNlcXVlbmNlIGluIHNt
dS4KPgo+IHJlYWQgc2Vuc29yIHNlcXVlbmNlOgo+IGFzaWMgc2Vuc29yIC0tPiBzbWMgc2Vuc29y
IChzbXUgMTEuLi4pIC0tPiBkZWZhdWx0X3NlbnNvciAoY29tbW9uKQoKSSB0aGluayB0aGlzIG1h
a2VzIHNlbnNlLiAgVGhhdCBzYWlkLCB0aGUgY3VycmVudCBzd1NNVSBjYWxsYmFjawpzdHJ1Y3R1
cmVzIGFyZSByZWFsbHkgY29uZnVzaW5nLiAgSSB0aGluayB3ZSBzaG91bGQgc3dpdGNoIHRvIGEg
c2luZ2xlCnNldCBvZiBwZXIgYXNpYyBjYWxsYmFja3MgYW5kIHRoZW4gYWRkIGNvbW1vbiBoZWxw
ZXJzLiAgVGhlbiBmb3IgYXNpY3MKd2hlcmUgaXQgbWFrZXMgc2Vuc2Ugd2UgY2FuIGp1c3QgdXNl
IHRoZSBoZWxwZXIgYXMgdGhlIGNhbGxiYWNrIGZvcgphbGwgcmVsZXZhbnQgYXNpY3MuICBJZiB0
aGV5IG5lZWQgc29tZXRoaW5nIGFzaWMgc3BlY2lmaWMsIHVzZSB0aGUKYXNpYyBzcGVjaWZpYyBm
dW5jdGlvbi4gIFRoYXQgc2hvdWxkIGF2b2lkIHRoZSBjdXJyZW50IG1peCBvZgpjYWxsYmFja3Mg
YW5kIG1ha2UgaXQgY2xlYXJlciB3aGF0IGNvZGUgZ2V0cyB1c2VkIHdoZW4uCgpBbGV4Cgo+Cj4g
U2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jICAgIHwgMjYgKysrKysr
KysrKysrKysrKystLQo+ICAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9hbWRncHVfc211
LmggICAgfCAgOSArKysrLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyAgICB8ICAzICsrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djExXzAuYyAgICAgfCAxMCArKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3ZlZ2EyMF9wcHQuYyAgICB8ICAzICsrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2FtZGdwdV9zbXUuYwo+IGluZGV4IDA1YjkxYmM1MDU0Yy4uODUyNjlmODZjYWUyIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9zbXUuYwo+IEBAIC0yODQsMTEg
KzI4NCwxNCBAQCBpbnQgc211X2dldF9wb3dlcl9udW1fc3RhdGVzKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LAo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1pbnQgc211X2NvbW1vbl9yZWFk
X3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5z
b3IsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgdWludDMyX3QgKnNp
emUpCj4gK2ludCBzbXVfZGVmYXVsdF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSwgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQo+ICB7Cj4gICAgICAgICBpbnQgcmV0ID0g
MDsKPgo+ICsgICAgICAgaWYgKCFkYXRhIHx8ICFzaXplKQo+ICsgICAgICAgICAgICAgICByZXR1
cm4gLUVJTlZBTDsKPiArCj4gICAgICAgICBzd2l0Y2ggKHNlbnNvcikgewo+ICAgICAgICAgY2Fz
ZSBBTURHUFVfUFBfU0VOU09SX1NUQUJMRV9QU1RBVEVfU0NMSzoKPiAgICAgICAgICAgICAgICAg
KigodWludDMyX3QgKilkYXRhKSA9IHNtdS0+cHN0YXRlX3NjbGs7Cj4gQEAgLTMyMSw2ICszMjQs
MjUgQEAgaW50IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUs
IGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29yLAo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+
Cj4gK2ludCBzbXVfcmVhZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gYW1k
X3BwX3NlbnNvcnMgc2Vuc29yLAo+ICsgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgdWlu
dDMyX3QgKnNpemUpCj4gK3sKPiArICAgICAgIGludCByZXQgPSAwOwo+ICsKPiArICAgICAgIGlm
ICghZGF0YSB8fCAhc2l6ZSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+
ICsgICAgICAgLyogaGFuZGxlIHNlbnNvciBzZXF1ZW5jZTogYXNpYyAtLT4gaXAgbGV2ZWwgLS0+
ICBkZWZhdWx0ICovCj4gKyAgICAgICByZXQgPSBzbXVfYXNpY19yZWFkX3NlbnNvcihzbXUsIHNl
bnNvciwgZGF0YSwgc2l6ZSk7Cj4gKyAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAg
IHJldCA9IHNtdV9zbWNfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpOwo+ICsg
ICAgICAgICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNt
dV9kZWZhdWx0X3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKTsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICBpbnQgc211X3VwZGF0ZV90
YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBzbXVfdGFibGVfaWQgdGFibGVfaW5k
ZXgsIGludCBhcmd1bWVudCwKPiAgICAgICAgICAgICAgICAgICAgICB2b2lkICp0YWJsZV9kYXRh
LCBib29sIGRydjJzbXUpCj4gIHsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9w
b3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L2luYy9hbWRncHVfc211LmgKPiBpbmRleCAzNDA5M2RkY2ExMDUuLjQ2MmJhZThkNjJhYSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9pbmMvYW1kZ3B1X3NtdS5o
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdwdV9zbXUuaAo+
IEBAIC04MjAsMTAgKzgyMCwxMCBAQCBzdHJ1Y3Qgc211X2Z1bmNzCj4gICAgICAgICAoKHNtdSkt
PnBwdF9mdW5jcy0+c2V0X3RoZXJtYWxfZmFuX3RhYmxlID8gKHNtdSktPnBwdF9mdW5jcy0+c2V0
X3RoZXJtYWxfZmFuX3RhYmxlKChzbXUpKSA6IDApCj4gICNkZWZpbmUgc211X3N0YXJ0X3RoZXJt
YWxfY29udHJvbChzbXUpIFwKPiAgICAgICAgICgoc211KS0+ZnVuY3MtPnN0YXJ0X3RoZXJtYWxf
Y29udHJvbD8gKHNtdSktPmZ1bmNzLT5zdGFydF90aGVybWFsX2NvbnRyb2woKHNtdSkpIDogMCkK
PiAtI2RlZmluZSBzbXVfcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpIFwKPiAt
ICAgICAgICgoc211KS0+ZnVuY3MtPnJlYWRfc2Vuc29yPyAoc211KS0+ZnVuY3MtPnJlYWRfc2Vu
c29yKChzbXUpLCAoc2Vuc29yKSwgKGRhdGEpLCAoc2l6ZSkpIDogMCkKPiArI2RlZmluZSBzbXVf
c21jX3JlYWRfc2Vuc29yKHNtdSwgc2Vuc29yLCBkYXRhLCBzaXplKSBcCj4gKyAgICAgICAoKHNt
dSktPmZ1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPmZ1bmNzLT5yZWFkX3NlbnNvcigoc211KSwg
KHNlbnNvciksIChkYXRhKSwgKHNpemUpKSA6IC1FSU5WQUwpCj4gICNkZWZpbmUgc211X2FzaWNf
cmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEsIHNpemUpIFwKPiAtICAgICAgICgoc211KS0+
cHB0X2Z1bmNzLT5yZWFkX3NlbnNvcj8gKHNtdSktPnBwdF9mdW5jcy0+cmVhZF9zZW5zb3IoKHNt
dSksIChzZW5zb3IpLCAoZGF0YSksIChzaXplKSkgOiAwKQo+ICsgICAgICAgKChzbXUpLT5wcHRf
ZnVuY3MtPnJlYWRfc2Vuc29yPyAoc211KS0+cHB0X2Z1bmNzLT5yZWFkX3NlbnNvcigoc211KSwg
KHNlbnNvciksIChkYXRhKSwgKHNpemUpKSA6IC1FSU5WQUwpCj4gICNkZWZpbmUgc211X2dldF9w
b3dlcl9wcm9maWxlX21vZGUoc211LCBidWYpIFwKPiAgICAgICAgICgoc211KS0+cHB0X2Z1bmNz
LT5nZXRfcG93ZXJfcHJvZmlsZV9tb2RlID8gKHNtdSktPnBwdF9mdW5jcy0+Z2V0X3Bvd2VyX3By
b2ZpbGVfbW9kZSgoc211KSwgYnVmKSA6IDApCj4gICNkZWZpbmUgc211X3NldF9wb3dlcl9wcm9m
aWxlX21vZGUoc211LCBwYXJhbSwgcGFyYW1fc2l6ZSkgXAo+IEBAIC05ODksNSArOTg5LDYgQEAg
ZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBzbXVfZ2V0X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVj
dCBzbXVfY29udGV4dCAqc211KTsKPiAgaW50IHNtdV9mb3JjZV9wZXJmb3JtYW5jZV9sZXZlbChz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBhbWRfZHBtX2ZvcmNlZF9sZXZlbCBsZXZlbCk7
Cj4gIGludCBzbXVfc2V0X2Rpc3BsYXlfY291bnQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIHVp
bnQzMl90IGNvdW50KTsKPiAgYm9vbCBzbXVfY2xrX2RwbV9pc19lbmFibGVkKHN0cnVjdCBzbXVf
Y29udGV4dCAqc211LCBlbnVtIHNtdV9jbGtfdHlwZSBjbGtfdHlwZSk7Cj4gLQo+ICtpbnQgc211
X3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9wcF9zZW5zb3Jz
IHNlbnNvciwKPiArICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXpl
KTsKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQu
Ywo+IGluZGV4IDQ2ZTI5MTNlNGFmNC4uMGE1MzY5NTc4NWI2IDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYwo+IEBAIC0xMzY1LDYgKzEzNjUsOSBAQCBz
dGF0aWMgaW50IG5hdmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAg
ICAgICAgIHN0cnVjdCBzbXVfdGFibGVfY29udGV4dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNt
dV90YWJsZTsKPiAgICAgICAgIFBQVGFibGVfdCAqcHB0YWJsZSA9IHRhYmxlX2NvbnRleHQtPmRy
aXZlcl9wcHRhYmxlOwo+Cj4gKyAgICAgICBpZiAoIWRhdGEgfHwgIXNpemUpCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4g
ICAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfTUFYX0ZBTl9SUE06Cj4gICAgICAgICAgICAg
ICAgICoodWludDMyX3QgKilkYXRhID0gcHB0YWJsZS0+RmFuTWF4aW11bVJwbTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3YxMV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVfdjExXzAuYwo+IGluZGV4IDc2YmMxNTc1MjVkMC4u
MjY3OWI2ZmY2Y2EzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5
L3NtdV92MTFfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211X3Yx
MV8wLmMKPiBAQCAtMTI2Nyw2ICsxMjY3LDEwIEBAIHN0YXRpYyBpbnQgc211X3YxMV8wX3JlYWRf
c2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZvaWQgKmRhdGEsIHVpbnQzMl90ICpzaXplKQo+ICB7Cj4gICAgICAgICBpbnQg
cmV0ID0gMDsKPiArCj4gKyAgICAgICBpZiAoIWRhdGEgfHwgIXNpemUpCj4gKyAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAgICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4gICAg
ICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfR0ZYX01DTEs6Cj4gICAgICAgICAgICAgICAgIHJl
dCA9IHNtdV9nZXRfY3VycmVudF9jbGtfZnJlcShzbXUsIFNNVV9VQ0xLLCAodWludDMyX3QgKilk
YXRhKTsKPiBAQCAtMTI4NSwxNCArMTI4OSwxMCBAQCBzdGF0aWMgaW50IHNtdV92MTFfMF9yZWFk
X3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgICAgICAgICAgKnNpemUg
PSA0Owo+ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGRlZmF1bHQ6Cj4gLSAgICAg
ICAgICAgICAgIHJldCA9IHNtdV9jb21tb25fcmVhZF9zZW5zb3Ioc211LCBzZW5zb3IsIGRhdGEs
IHNpemUpOwo+ICsgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICAg
ICBicmVhazsKPiAgICAgICAgIH0KPgo+IC0gICAgICAgLyogdHJ5IGdldCBzZW5zb3IgZGF0YSBi
eSBhc2ljICovCj4gLSAgICAgICBpZiAocmV0KQo+IC0gICAgICAgICAgICAgICByZXQgPSBzbXVf
YXNpY19yZWFkX3NlbnNvcihzbXUsIHNlbnNvciwgZGF0YSwgc2l6ZSk7Cj4gLQo+ICAgICAgICAg
aWYgKHJldCkKPiAgICAgICAgICAgICAgICAgKnNpemUgPSAwOwo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQuYwo+IGluZGV4IGJjZDBlZmFmN2JiZC4uYjQ0ZWM3
YzY3MGM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2Ey
MF9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3ZlZ2EyMF9wcHQu
Ywo+IEBAIC0zMTQ2LDYgKzMxNDYsOSBAQCBzdGF0aWMgaW50IHZlZ2EyMF9yZWFkX3NlbnNvcihz
dHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgIHN0cnVjdCBzbXVfdGFibGVfY29udGV4
dCAqdGFibGVfY29udGV4dCA9ICZzbXUtPnNtdV90YWJsZTsKPiAgICAgICAgIFBQVGFibGVfdCAq
cHB0YWJsZSA9IHRhYmxlX2NvbnRleHQtPmRyaXZlcl9wcHRhYmxlOwo+Cj4gKyAgICAgICBpZiAo
IWRhdGEgfHwgIXNpemUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAg
ICAgICAgIHN3aXRjaCAoc2Vuc29yKSB7Cj4gICAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1Jf
TUFYX0ZBTl9SUE06Cj4gICAgICAgICAgICAgICAgICoodWludDMyX3QgKilkYXRhID0gcHB0YWJs
ZS0+RmFuTWF4aW11bVJwbTsKPiAtLQo+IDIuMjIuMAo+Cj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1n
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
