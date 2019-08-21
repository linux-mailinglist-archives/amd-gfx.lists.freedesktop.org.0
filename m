Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E34697ACC
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Aug 2019 15:30:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E5856E354;
	Wed, 21 Aug 2019 13:30:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADECD6E373
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 13:30:36 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so2031405wru.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Aug 2019 06:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WRDMbJbcHcPo0CW9Y7WsJTji/wYLBJdt4xstJsoHGGU=;
 b=YnB8Uv9Z35AAkNh5F0Le5r48WnPONvL1UYMKpEr69AMJkxHIweMH4zk3Fmy1CDTMdA
 qjSFet31sWk3ztdxFaTnJvkvg29ZzXorZnBrQqzx56jYSKwaF7B+FCb+p1UrA9pcnMrO
 zs+BXIPx5r+98FO39eBFKAL5FsostMZDj3QhQJrT/VO1rApqiV2qqjxvAVLbtnP8MoxP
 P+8OiUDRE/u46qWlyPI8zVRaKqe5iM2NnFvGXyESlHuOUI1iItk+DQEjNADAttgSdztz
 AHrInlaK8QrB90t1sNSMHmE5eXnNNpgGaVi5qkRfr2U+6XNEyCJalgU/pc1nTfqih3fg
 02WA==
X-Gm-Message-State: APjAAAUEhgx5Jf30XM/4/WOPy81zIZhoGA+8fHpQpJ5LcDSrlnAsHyMB
 hnZQloUeNfSizIV2cmtBJRiWvLHUCE28ojftFO2OAg==
X-Google-Smtp-Source: APXvYqzio5F8uD/710op6avHU4QcsG2Zpo00xbelN5mdkij90c0Gno4T34k1sDnj7NiHUtevCzXj/L2lRo9sl+3QuZU=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr34755218wrc.4.1566394235157; 
 Wed, 21 Aug 2019 06:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190821132312.917-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190821132312.917-1-xiaojie.yuan@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2019 09:30:23 -0400
Message-ID: <CADnq5_PgU-L3CmCC6m-R3Tb6EG7-YUB6yS5Miy2_oqW8OngyZA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/sdma5: fix number of sdma5 trap irq types for
 navi1x
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=WRDMbJbcHcPo0CW9Y7WsJTji/wYLBJdt4xstJsoHGGU=;
 b=rdktw8boCIGoaTq5iasUY4OMaxAlqv4KzTgSMDJOTtpwe97pwTydazm2zRoA0g4VGY
 TI6vc4fpEd5hjsFCpCEb1rhAVxM8VYRhZGpiX9X7YFKAC/Jy94Vv5UiVbuULeDHjsphu
 6kvr3sfoaOv6koolyKkzGN5BruchLeFmi8LGE21443DyZuVUlgDZFvnFICdmiGY90/9i
 tR2fh3MRHaHNBpUHpnT+Ha9A+40rCJNLLe0fLJlHELVsqB+1ioqx0Smy2SwiCi1wSiNa
 /HwZieS4PdgGbO9XHg8wSPJABlzaNC4FIVCsXEzuz+sphMOqeVwoCGrxtXkNtn6jV27J
 KBOw==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgOToyMyBBTSBZdWFuLCBYaWFvamllIDxYaWFvamllLll1
YW5AYW1kLmNvbT4gd3JvdGU6Cj4KPiBuYXZpMXggaGFzIDIgc2RtYSBlbmdpbmVzIGJ1dCBjb21t
aXQKPiAiZTdiNThkMDNiNjc4IGRybS9hbWRncHU6IHJlb3JnYW5pemUgc2RtYSB2NCBjb2RlIHRv
IHN1cHBvcnQgbW9yZSBpbnN0YW5jZXMiCj4gY2hhbmdlcyB0aGUgbWF4IG51bWJlciBvZiBzZG1h
IGlycSB0eXBlcyAoQU1ER1BVX1NETUFfSVJRX0xBU1QpIGZyb20gMiB0byA4Cj4gd2hpY2ggY2F1
c2VzIGFtZGdwdV9pcnFfZ3B1X3Jlc2V0X3Jlc3VtZV9oZWxwZXIoKSB0byByZWNvdmVyIGlycSBv
ZiBzZG1hCj4gZW5naW5lcyB3aXRoIGZvbGxvd2luZyBsb2dpYzoKPgo+IChlbmFibGUgaXJxIGZv
ciBzZG1hMCkgKiAxIHRpbWUKPiAoZW5hYmxlIGlycSBmb3Igc2RtYTEpICogMSB0aW1lCj4gKGRp
c2FibGUgaXJxIGZvciBzZG1hMSkgKiA2IHRpbWVzCj4KPiBhcyBhIHJlc3VsdCwgYWZ0ZXIgZ3B1
IHJlc2V0LCBpbnRlcnJ1cHQgZm9yIHNkbWExIGlzIGxvc3QuCj4KPiBmb3IgYXNpY3Mgd2l0aCBt
b3JlIHNkbWE1IGVuZ2luZXMsIHdlIG5lZWQgdG8gc2V0ICdudW1fdHlwZXMnIGRlcGVuZGluZwo+
IG9uIGFzaWMgdHlwZSBqdXN0IGxpa2Ugd2hhdCBzZG1hX3Y0XzBfc2V0X2lycV9mdW5jcygpIGRv
ZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVhbkBhbWQuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYyB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzAuYwo+IGluZGV4IDQxOTMyZDhiODhjMy4uMzJi
Y2UzZWI1ZmMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFf
djVfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8wLmMKPiBA
QCAtMTYyNSw3ICsxNjI1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhbWRncHVfaXJxX3NyY19m
dW5jcyBzZG1hX3Y1XzBfaWxsZWdhbF9pbnN0X2lycV9mdW5jcyA9IHsKPgo+ICBzdGF0aWMgdm9p
ZCBzZG1hX3Y1XzBfc2V0X2lycV9mdW5jcyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAg
ewo+IC0gICAgICAgYWRldi0+c2RtYS50cmFwX2lycS5udW1fdHlwZXMgPSBBTURHUFVfU0RNQV9J
UlFfTEFTVDsKPiArICAgICAgIGFkZXYtPnNkbWEudHJhcF9pcnEubnVtX3R5cGVzID0gQU1ER1BV
X1NETUFfSVJRX0lOU1RBTkNFMjsKCkl0IHdvdWxkIGJlIG1vcmUgZnV0dXJlIHByb29mIHRvIHNl
dCB0aGUgbnVtX3R5cGVzIGJhc2VkIG9uIHRoZSBudW0gaW5zdGFuY2VzLgoKQWxleAoKPiAgICAg
ICAgIGFkZXYtPnNkbWEudHJhcF9pcnEuZnVuY3MgPSAmc2RtYV92NV8wX3RyYXBfaXJxX2Z1bmNz
Owo+ICAgICAgICAgYWRldi0+c2RtYS5pbGxlZ2FsX2luc3RfaXJxLmZ1bmNzID0gJnNkbWFfdjVf
MF9pbGxlZ2FsX2luc3RfaXJxX2Z1bmNzOwo+ICB9Cj4gLS0KPiAyLjIwLjEKPgo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
