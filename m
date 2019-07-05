Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B062660C10
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Jul 2019 22:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A816E52F;
	Fri,  5 Jul 2019 20:10:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C846E52F
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jul 2019 20:10:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f9so10977302wre.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Jul 2019 13:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r4hix6rvn1mElFpISW1FAABhQQHtoVUtX8hpEyycDf8=;
 b=coK27Xm4PLIsbtJgcVM8k+YAQQsZTda1IfDcykcrOyrjMGbe/DSIHO2veYl1tsRxP8
 H75VHhcYHuW0Y2ZGtvzhhrHLlQpAGCHSVqpZhWwYJInsR9iNNolhWb5dymFxeqLF8zuk
 0WQ6bbEjmy1PNXJn5EaPm92dL7/9RsKPUUJmVIKzQbFQL/FnLLI/wujiCPT4HCIK8ci8
 WRNSKUcekEYnbe3eB0mx59+B7o/3SF+GK3+Ldtrj/gSShVMkePEEQXlqFGUbRcbjGiZv
 wAVewwnmpi7jPlyf3BpJclxb9gIXxfVax6tPHB9ZyFrtyp2Yu5XYhkzybxQRZHPB+sP1
 0k5w==
X-Gm-Message-State: APjAAAXa6Vj7+Blxa0jqk0FigJJUADiT6UJEY0s9La6zbt/StHJgroQn
 vzrDpWvYzlXlN3aClxd8IIVSVJcmkDdHO/QMgu0=
X-Google-Smtp-Source: APXvYqwLfcV/8OSWW8dN8kB4cUe+Egv/oWKcr2yIfKzncmG/DSbnpezLK5Fzkit56buXPXd8zAXQQH1pv1z/aDIaCLs=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr5551274wrn.142.1562357405496; 
 Fri, 05 Jul 2019 13:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190704030151.6934-1-kevin1.wang@amd.com>
In-Reply-To: <20190704030151.6934-1-kevin1.wang@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 5 Jul 2019 16:09:53 -0400
Message-ID: <CADnq5_OCKGHmT4dNSWcvPLd9bRi2iKT2hxj4cXQJeE0UqGvj-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: add temperature sensor support for
 navi10
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r4hix6rvn1mElFpISW1FAABhQQHtoVUtX8hpEyycDf8=;
 b=uVUj1T4kwd33LupxRLQ+z18dK/8GouBy83QNv8LjTvgREBRq4DQ/HamfE5yRhxZiYM
 Hu63GA6P/VHeDc1qZUKBAK3Mf65hXI0btlvIDvdp3qzBUWJrTtcqd2mXPH3rHVS5Epkz
 EfDqmkDeGSj2vSuTgQ9/56Bq8Pva010GAOqfjrogyFB+l1hyOCLU/IRZDJSfzlEM7mXr
 WeZOTeV0OEQXiwdxa7b//slcFD+UuwELdFm4b5SOwA1lFBx5UbwEqR7PHOem+JxXwvs4
 29CUfTIK6BldlGYCfwloY5BB7+CqJEdw0K2YCflqJiZB/6qcNpkLBaCyZW73PJG6O+1T
 rSAQ==
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
 "Kenenth.Feng@amd.com" <Kenenth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMywgMjAxOSBhdCAxMTowMiBQTSBXYW5nLCBLZXZpbihZYW5nKSA8S2V2aW4x
LldhbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiB0aGUgaHdtb24gaW50ZXJmYWNlIG5lZWQgdGVtcGVy
YXR1cmUgc2Vuc29yIHR5cGUgc3VwcG9ydC4KPiAxLiBTRU5TT1JfSE9UU1BPVF9URU1QCj4gMi4g
U0VOU09SX0VER0VfVEVNUChTRU5TT1JfR1BVX1RFTVApCj4gMy4gU0VOU09SX01FTV9URU1QCj4K
PiBDaGFuZ2UtSWQ6IEkzZGI3NjJlNDAzMjA3MmZhZTY3Yzk1YjdiYTZkNjJlMjBhZTViZWFkCj4g
U2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KClJldmlld2Vk
LWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMgfCA0MiArKysrKysrKysr
KysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCj4gaW5kZXggNzU3NGEwMjM1
MGM2Li5kNTg3NmMyMzkzZTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvbmF2aTEwX3BwdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkv
bmF2aTEwX3BwdC5jCj4gQEAgLTEyNTUsNiArMTI1NSw0MiBAQCBzdGF0aWMgaW50IG5hdmkxMF9z
ZXRfd2F0ZXJtYXJrc190YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAgICAgICAgIHJl
dHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBuYXZpMTBfdGhlcm1hbF9nZXRfdGVtcGVyYXR1
cmUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgKnZhbHVlKQo+ICt7
Cj4gKyAgICAgICBTbXVNZXRyaWNzX3QgbWV0cmljczsKPiArICAgICAgIGludCByZXQgPSAwOwo+
ICsKPiArICAgICAgIGlmICghdmFsdWUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ICsKPiArICAgICAgIHJldCA9IHNtdV91cGRhdGVfdGFibGUoc211LCBTTVVfVEFCTEVfU01V
X01FVFJJQ1MsICh2b2lkICopJm1ldHJpY3MsIGZhbHNlKTsKPiArICAgICAgIGlmIChyZXQpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKwo+ICsgICAgICAgc3dpdGNoIChzZW5zb3Ip
IHsKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9IT1RTUE9UX1RFTVA6Cj4gKyAgICAg
ICAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3MuVGVtcGVyYXR1cmVIb3RzcG90ICoKPiArICAgICAg
ICAgICAgICAgICAgICAgICBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOwo+
ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9H
UFVfVEVNUDoKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9FREdFX1RFTVA6Cj4gKyAg
ICAgICAgICAgICAgICp2YWx1ZSA9IG1ldHJpY3MuVGVtcGVyYXR1cmVFZGdlICoKPiArICAgICAg
ICAgICAgICAgICAgICAgICBTTVVfVEVNUEVSQVRVUkVfVU5JVFNfUEVSX0NFTlRJR1JBREVTOwo+
ICsgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9N
RU1fVEVNUDoKPiArICAgICAgICAgICAgICAgKnZhbHVlID0gbWV0cmljcy5UZW1wZXJhdHVyZVZy
TWVtMCAqCj4gKyAgICAgICAgICAgICAgICAgICAgICAgU01VX1RFTVBFUkFUVVJFX1VOSVRTX1BF
Ul9DRU5USUdSQURFUzsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBkZWZhdWx0
Ogo+ICsgICAgICAgICAgICAgICBwcl9lcnIoIkludmFsaWQgc2Vuc29yIGZvciByZXRyaWV2aW5n
IHRlbXBcbiIpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIH0K
PiArCj4gKyAgICAgICByZXR1cm4gMDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBuYXZpMTBfcmVh
ZF9zZW5zb3Ioc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZW51bSBhbWRfcHBfc2Vuc29ycyBzZW5zb3IsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSwgdWludDMyX3QgKnNpemUpCj4gQEAgLTEyNzYs
NiArMTMxMiwxMiBAQCBzdGF0aWMgaW50IG5hdmkxMF9yZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKPiAgICAgICAgICAgICAgICAgcmV0ID0gbmF2aTEwX2dldF9ncHVfcG93ZXIo
c211LCAodWludDMyX3QgKilkYXRhKTsKPiAgICAgICAgICAgICAgICAgKnNpemUgPSA0Owo+ICAg
ICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgQU1ER1BVX1BQX1NFTlNPUl9IT1RT
UE9UX1RFTVA6Cj4gKyAgICAgICBjYXNlIEFNREdQVV9QUF9TRU5TT1JfRURHRV9URU1QOgo+ICsg
ICAgICAgY2FzZSBBTURHUFVfUFBfU0VOU09SX01FTV9URU1QOgo+ICsgICAgICAgICAgICAgICBy
ZXQgPSBuYXZpMTBfdGhlcm1hbF9nZXRfdGVtcGVyYXR1cmUoc211LCBzZW5zb3IsICh1aW50MzJf
dCAqKWRhdGEpOwo+ICsgICAgICAgICAgICAgICAqc2l6ZSA9IDQ7Cj4gKyAgICAgICAgICAgICAg
IGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjIyLjAKPgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
