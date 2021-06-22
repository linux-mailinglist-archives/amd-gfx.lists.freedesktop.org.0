Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A77063B001A
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Jun 2021 11:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB71A6E45C;
	Tue, 22 Jun 2021 09:20:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A966E450;
 Tue, 22 Jun 2021 09:20:48 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id dm5so21035429ejc.9;
 Tue, 22 Jun 2021 02:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XIUHv+jyCAdN7h4+2hsH7kw9sWonZT0MANkya66oiC8=;
 b=FG8duBaDDF+D3srML8tEAmuqXMyfwniXd1RifYepLhRU3o3FoAEL7RO5Mif/Wr1reE
 AacdmjrV9pI6+3Xlus7X7LwMEzbAedyi+Q1I2VbwyAvli8Y1kTNOHoP6rOA4tBBiz8GA
 lL2TmqTxprmNHTGnNpTZVJkyZWdM6AyT3goH0jQlKvs4zaQCoNgvfouh+tB7L6ugIukS
 TP1RqnEUAZj9eNaJRzyL3vBMANwrJWHlUe4gLdWbQ/ppy9ZQBhvi0v4vAbkgQwlYOokp
 IqFZ5xJoev7BgQ3QKGeYqzuIexkmk2yDvpbCebxNtsVRvm1QwKl+QLW2gHRRkQ97wj7O
 nXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XIUHv+jyCAdN7h4+2hsH7kw9sWonZT0MANkya66oiC8=;
 b=LTqnUIcbYDaJyGioJwYYL8pwR7Hm6tXzhTGw45B0iKLNU9JbMbo57zjd3bk0/NqrBP
 4vzpq36CG0aMqWi7mPSG6kkNXy6GvW22wA4eToGrvhi8EO2Em1ZOTn7FEO3xH6exzeL4
 /pQ4sEkOS9ouxC1VWqRV73Bs352AlM8iJvySpRzj+ZBSKX3n/Vd+deiT6f3tGCVrBt4v
 fU0VUMx3EgWjeCYn6/+jy4rQeNAr57jUJxEyRNaa/BGGO05L3smeNlrbTln9cCydI4ON
 iZq3V+dSO0wtXmbj1VGsv0+r27KFOffB3VUScP65Am/lQos+uohzO1nFokj4q654SSoC
 GqtQ==
X-Gm-Message-State: AOAM533xW89kmPLkXnOCO4TXsFkgILNuHoJItBgpwCGK4RG+tmHcABQ9
 pX9r0f7+k643wsQ6GZkc52adk+G3ZNA=
X-Google-Smtp-Source: ABdhPJwElAo2VK6lg/DCcbk/L8LdxkiVmdcx3Z3CEdO85iacAZvBFtrAsG73f8oWGKnROCtLfDSWUw==
X-Received: by 2002:a17:907:1628:: with SMTP id
 hb40mr3002798ejc.286.1624353647400; 
 Tue, 22 Jun 2021 02:20:47 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id h20sm5569423ejl.7.2021.06.22.02.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:20:46 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: rework dma_resv handling v3
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <20210614174536.5188-2-christian.koenig@amd.com>
 <CADnq5_OMZZomJvpNzpA=kXgvDWAM538kYVUFnrnXhYO4Gne17Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ab1325eb-c9fd-a71b-73b4-01cb37f8bd0e@gmail.com>
Date: Tue, 22 Jun 2021 11:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_OMZZomJvpNzpA=kXgvDWAM538kYVUFnrnXhYO4Gne17Q@mail.gmail.com>
Content-Language: en-US
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDYuMjEgdW0gMjM6MDkgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gT24gTW9uLCBKdW4g
MTQsIDIwMjEgYXQgMTo0NSBQTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4gRHJvcCB0aGUgd29ya2Fyb3VuZCBhbmQgaW5zdGVh
ZCBpbXBsZW1lbnQgYSBiZXR0ZXIgc29sdXRpb24uCj4+Cj4+IEJhc2ljYWxseSB3ZSBhcmUgbm93
IGNoYWluaW5nIGFsbCBzdWJtaXNzaW9ucyB1c2luZyBhIGRtYV9mZW5jZV9jaGFpbgo+PiBjb250
YWluZXIgYW5kIGFkZGluZyB0aGVtIGFzIGV4Y2x1c2l2ZSBmZW5jZSB0byB0aGUgZG1hX3Jlc3Yg
b2JqZWN0Lgo+Pgo+PiBUaGlzIHdheSBvdGhlciBkcml2ZXJzIGNhbiBzdGlsbCBzeW5jIHRvIHRo
ZSBzaW5nbGUgZXhjbHVzaXZlIGZlbmNlCj4+IHdoaWxlIGFtZGdwdSBvbmx5IHN5bmMgdG8gZmVu
Y2VzIGZyb20gZGlmZmVyZW50IHByb2Nlc3Nlcy4KPj4KPj4gdjM6IGFkZCB0aGUgc2hhcmVkIGZl
bmNlIGZpcnN0IGJlZm9yZSB0aGUgZXhjbHVzaXZlIG9uZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gU2VyaWVzIGlzOgo+
IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CgpG
WUkgSSd2ZSBwdXNoZWQgdGhpcyB0byBkcm0tbWlzYy1uZXh0IHRvIGF2b2lkIHJlLWJhc2UgcHJv
YmxlbXMuCgpXaWxsIHByb2JhYmx5IG5vdCBnbyB1cHN0cmVhbSBiZWZvcmUgNS4xNSwgc28gd2Ug
aGF2ZSBwbGVudHkgb2YgdGltZSB0byAKdGVzdCB0aGlzLgoKQ2hyaXN0aWFuLgoKPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5oIHwgIDEgKwo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgICAgfCA2MiArKysr
KysrKysrKysrKysrLS0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
bWFfYnVmLmMgfCA2NSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgIHwgIDMgKy0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgIHwgIDIgKy0KPj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggIHwgIDEgLQo+PiAgIDYgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgNzkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuaAo+PiBpbmRleCBhMTMwZTc2NmNiZGIuLmM5MDVh
NGNmYzE3MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2JvX2xpc3QuaAo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9f
bGlzdC5oCj4+IEBAIC0zNCw2ICszNCw3IEBAIHN0cnVjdCBhbWRncHVfZnByaXY7Cj4+ICAgc3Ry
dWN0IGFtZGdwdV9ib19saXN0X2VudHJ5IHsKPj4gICAgICAgICAgc3RydWN0IHR0bV92YWxpZGF0
ZV9idWZmZXIgICAgICB0djsKPj4gICAgICAgICAgc3RydWN0IGFtZGdwdV9ib192YSAgICAgICAg
ICAgICAqYm9fdmE7Cj4+ICsgICAgICAgc3RydWN0IGRtYV9mZW5jZV9jaGFpbiAgICAgICAgICAq
Y2hhaW47Cj4+ICAgICAgICAgIHVpbnQzMl90ICAgICAgICAgICAgICAgICAgICAgICAgcHJpb3Jp
dHk7Cj4+ICAgICAgICAgIHN0cnVjdCBwYWdlICAgICAgICAgICAgICAgICAgICAgKip1c2VyX3Bh
Z2VzOwo+PiAgICAgICAgICBib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVzZXJfaW52
YWxpZGF0ZWQ7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCj4+IGluZGV4
IDljZTY0OWExYThkMy4uMjU2NTU0MTRlOWMwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfY3MuYwo+PiBAQCAtNTcyLDYgKzU3MiwyMCBAQCBzdGF0aWMgaW50IGFtZGdw
dV9jc19wYXJzZXJfYm9zKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+PiAgICAgICAgICAg
ICAgICAgIGdvdG8gb3V0Owo+PiAgICAgICAgICB9Cj4+Cj4+ICsgICAgICAgYW1kZ3B1X2JvX2xp
c3RfZm9yX2VhY2hfZW50cnkoZSwgcC0+Ym9fbGlzdCkgewo+PiArICAgICAgICAgICAgICAgc3Ry
dWN0IGFtZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGUtPnR2LmJvKTsKPj4gKwo+PiAr
ICAgICAgICAgICAgICAgZS0+Ym9fdmEgPSBhbWRncHVfdm1fYm9fZmluZCh2bSwgYm8pOwo+PiAr
Cj4+ICsgICAgICAgICAgICAgICBpZiAoYm8tPnRiby5iYXNlLmRtYV9idWYgJiYgIWFtZGdwdV9i
b19leHBsaWNpdF9zeW5jKGJvKSkgewo+PiArICAgICAgICAgICAgICAgICAgICAgICBlLT5jaGFp
biA9IGRtYV9mZW5jZV9jaGFpbl9hbGxvYygpOwo+PiArICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoIWUtPmNoYWluKSB7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgciA9IC1F
Tk9NRU07Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJvcl92YWxp
ZGF0ZTsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+PiArICAgICAgICAgICAgICAgfQo+
PiArICAgICAgIH0KPj4gKwo+PiAgICAgICAgICBhbWRncHVfY3NfZ2V0X3RocmVzaG9sZF9mb3Jf
bW92ZXMocC0+YWRldiwgJnAtPmJ5dGVzX21vdmVkX3RocmVzaG9sZCwKPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZwLT5ieXRlc19tb3ZlZF92aXNfdGhyZXNo
b2xkKTsKPj4gICAgICAgICAgcC0+Ynl0ZXNfbW92ZWQgPSAwOwo+PiBAQCAtNTk5LDE1ICs2MTMs
NiBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJfYm9zKHN0cnVjdCBhbWRncHVfY3NfcGFy
c2VyICpwLAo+PiAgICAgICAgICBnd3MgPSBwLT5ib19saXN0LT5nd3Nfb2JqOwo+PiAgICAgICAg
ICBvYSA9IHAtPmJvX2xpc3QtPm9hX29iajsKPj4KPj4gLSAgICAgICBhbWRncHVfYm9fbGlzdF9m
b3JfZWFjaF9lbnRyeShlLCBwLT5ib19saXN0KSB7Cj4+IC0gICAgICAgICAgICAgICBzdHJ1Y3Qg
YW1kZ3B1X2JvICpibyA9IHR0bV90b19hbWRncHVfYm8oZS0+dHYuYm8pOwo+PiAtCj4+IC0gICAg
ICAgICAgICAgICAvKiBNYWtlIHN1cmUgd2UgdXNlIHRoZSBleGNsdXNpdmUgc2xvdCBmb3Igc2hh
cmVkIEJPcyAqLwo+PiAtICAgICAgICAgICAgICAgaWYgKGJvLT5wcmltZV9zaGFyZWRfY291bnQp
Cj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGUtPnR2Lm51bV9zaGFyZWQgPSAwOwo+PiAtICAg
ICAgICAgICAgICAgZS0+Ym9fdmEgPSBhbWRncHVfdm1fYm9fZmluZCh2bSwgYm8pOwo+PiAtICAg
ICAgIH0KPj4gLQo+PiAgICAgICAgICBpZiAoZ2RzKSB7Cj4+ICAgICAgICAgICAgICAgICAgcC0+
am9iLT5nZHNfYmFzZSA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KGdkcykgPj4gUEFHRV9TSElGVDsK
Pj4gICAgICAgICAgICAgICAgICBwLT5qb2ItPmdkc19zaXplID0gYW1kZ3B1X2JvX3NpemUoZ2Rz
KSA+PiBQQUdFX1NISUZUOwo+PiBAQCAtNjI5LDggKzYzNCwxMyBAQCBzdGF0aWMgaW50IGFtZGdw
dV9jc19wYXJzZXJfYm9zKHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAo+PiAgICAgICAgICB9
Cj4+Cj4+ICAgZXJyb3JfdmFsaWRhdGU6Cj4+IC0gICAgICAgaWYgKHIpCj4+ICsgICAgICAgaWYg
KHIpIHsKPj4gKyAgICAgICAgICAgICAgIGFtZGdwdV9ib19saXN0X2Zvcl9lYWNoX2VudHJ5KGUs
IHAtPmJvX2xpc3QpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX2NoYWlu
X2ZyZWUoZS0+Y2hhaW4pOwo+PiArICAgICAgICAgICAgICAgICAgICAgICBlLT5jaGFpbiA9IE5V
TEw7Cj4+ICsgICAgICAgICAgICAgICB9Cj4+ICAgICAgICAgICAgICAgICAgdHRtX2V1X2JhY2tv
ZmZfcmVzZXJ2YXRpb24oJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCk7Cj4+ICsgICAgICAgfQo+
PiAgIG91dDoKPj4gICAgICAgICAgcmV0dXJuIHI7Cj4+ICAgfQo+PiBAQCAtNjcwLDkgKzY4MCwx
NyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfY3NfcGFyc2VyX2Zpbmkoc3RydWN0IGFtZGdwdV9jc19w
YXJzZXIgKnBhcnNlciwgaW50IGVycm9yLAo+PiAgIHsKPj4gICAgICAgICAgdW5zaWduZWQgaTsK
Pj4KPj4gLSAgICAgICBpZiAoZXJyb3IgJiYgYmFja29mZikKPj4gKyAgICAgICBpZiAoZXJyb3Ig
JiYgYmFja29mZikgewo+PiArICAgICAgICAgICAgICAgc3RydWN0IGFtZGdwdV9ib19saXN0X2Vu
dHJ5ICplOwo+PiArCj4+ICsgICAgICAgICAgICAgICBhbWRncHVfYm9fbGlzdF9mb3JfZWFjaF9l
bnRyeShlLCBwYXJzZXItPmJvX2xpc3QpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZG1h
X2ZlbmNlX2NoYWluX2ZyZWUoZS0+Y2hhaW4pOwo+PiArICAgICAgICAgICAgICAgICAgICAgICBl
LT5jaGFpbiA9IE5VTEw7Cj4+ICsgICAgICAgICAgICAgICB9Cj4+ICsKPj4gICAgICAgICAgICAg
ICAgICB0dG1fZXVfYmFja29mZl9yZXNlcnZhdGlvbigmcGFyc2VyLT50aWNrZXQsCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBhcnNlci0+dmFsaWRhdGVk
KTsKPj4gKyAgICAgICB9Cj4+Cj4+ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBwYXJzZXItPm51
bV9wb3N0X2RlcHM7IGkrKykgewo+PiAgICAgICAgICAgICAgICAgIGRybV9zeW5jb2JqX3B1dChw
YXJzZXItPnBvc3RfZGVwc1tpXS5zeW5jb2JqKTsKPj4gQEAgLTEyNDUsNiArMTI2MywyOCBAQCBz
dGF0aWMgaW50IGFtZGdwdV9jc19zdWJtaXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCj4+
Cj4+ICAgICAgICAgIGFtZGdwdV92bV9tb3ZlX3RvX2xydV90YWlsKHAtPmFkZXYsICZmcHJpdi0+
dm0pOwo+Pgo+PiArICAgICAgIGFtZGdwdV9ib19saXN0X2Zvcl9lYWNoX2VudHJ5KGUsIHAtPmJv
X2xpc3QpIHsKPj4gKyAgICAgICAgICAgICAgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiA9IGUtPnR2
LmJvLT5iYXNlLnJlc3Y7Cj4+ICsgICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWlu
ICpjaGFpbiA9IGUtPmNoYWluOwo+PiArCj4+ICsgICAgICAgICAgICAgICBpZiAoIWNoYWluKQo+
PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4gKwo+PiArICAgICAgICAgICAg
ICAgLyoKPj4gKyAgICAgICAgICAgICAgICAqIFdvcmsgYXJvdW5kIGRtYV9yZXN2IHNob3J0Y29t
bWluZ3MgYnkgd3JhcHBpbmcgdXAgdGhlCj4+ICsgICAgICAgICAgICAgICAgKiBzdWJtaXNzaW9u
IGluIGEgZG1hX2ZlbmNlX2NoYWluIGFuZCBhZGQgaXQgYXMgZXhjbHVzaXZlCj4+ICsgICAgICAg
ICAgICAgICAgKiBmZW5jZSwgYnV0IGZpcnN0IGFkZCB0aGUgc3VibWlzc2lvbiBhcyBzaGFyZWQg
ZmVuY2UgdG8gbWFrZQo+PiArICAgICAgICAgICAgICAgICogc3VyZSB0aGF0IHNoYXJlZCBmZW5j
ZXMgbmV2ZXIgc2lnbmFsIGJlZm9yZSB0aGUgZXhjbHVzaXZlCj4+ICsgICAgICAgICAgICAgICAg
KiBvbmUuCj4+ICsgICAgICAgICAgICAgICAgKi8KPj4gKyAgICAgICAgICAgICAgIGRtYV9mZW5j
ZV9jaGFpbl9pbml0KGNoYWluLCBkbWFfcmVzdl9leGNsX2ZlbmNlKHJlc3YpLAo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX2dldChwLT5mZW5jZSksIDEp
Owo+PiArCj4+ICsgICAgICAgICAgICAgICBkbWFfcmVzdl9hZGRfc2hhcmVkX2ZlbmNlKHJlc3Ys
IHAtPmZlbmNlKTsKPj4gKyAgICAgICAgICAgICAgIHJjdV9hc3NpZ25fcG9pbnRlcihyZXN2LT5m
ZW5jZV9leGNsLCAmY2hhaW4tPmJhc2UpOwo+PiArICAgICAgICAgICAgICAgZS0+Y2hhaW4gPSBO
VUxMOwo+PiArICAgICAgIH0KPj4gKwo+PiAgICAgICAgICB0dG1fZXVfZmVuY2VfYnVmZmVyX29i
amVjdHMoJnAtPnRpY2tldCwgJnAtPnZhbGlkYXRlZCwgcC0+ZmVuY2UpOwo+PiAgICAgICAgICBt
dXRleF91bmxvY2soJnAtPmFkZXYtPm5vdGlmaWVyX2xvY2spOwo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4gaW5kZXggYzMwNTNiODNiODBjLi4y
MzIxOWZjM2IyOGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RtYV9idWYuYwo+PiBAQCAtNDIsNDggKzQyLDYgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvcGNp
LXAycGRtYS5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+Cj4+IC1zdGF0
aWMgaW50Cj4+IC1fX2RtYV9yZXN2X21ha2VfZXhjbHVzaXZlKHN0cnVjdCBkbWFfcmVzdiAqb2Jq
KQo+PiAtewo+PiAtICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZXM7Cj4+IC0gICAgICAg
dW5zaWduZWQgaW50IGNvdW50Owo+PiAtICAgICAgIGludCByOwo+PiAtCj4+IC0gICAgICAgaWYg
KCFkbWFfcmVzdl9zaGFyZWRfbGlzdChvYmopKSAvKiBubyBzaGFyZWQgZmVuY2VzIHRvIGNvbnZl
cnQgKi8KPj4gLSAgICAgICAgICAgICAgIHJldHVybiAwOwo+PiAtCj4+IC0gICAgICAgciA9IGRt
YV9yZXN2X2dldF9mZW5jZXMob2JqLCBOVUxMLCAmY291bnQsICZmZW5jZXMpOwo+PiAtICAgICAg
IGlmIChyKQo+PiAtICAgICAgICAgICAgICAgcmV0dXJuIHI7Cj4+IC0KPj4gLSAgICAgICBpZiAo
Y291bnQgPT0gMCkgewo+PiAtICAgICAgICAgICAgICAgLyogTm93IHRoYXQgd2FzIHVuZXhwZWN0
ZWQuICovCj4+IC0gICAgICAgfSBlbHNlIGlmIChjb3VudCA9PSAxKSB7Cj4+IC0gICAgICAgICAg
ICAgICBkbWFfcmVzdl9hZGRfZXhjbF9mZW5jZShvYmosIGZlbmNlc1swXSk7Cj4+IC0gICAgICAg
ICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlc1swXSk7Cj4+IC0gICAgICAgICAgICAgICBrZnJl
ZShmZW5jZXMpOwo+PiAtICAgICAgIH0gZWxzZSB7Cj4+IC0gICAgICAgICAgICAgICBzdHJ1Y3Qg
ZG1hX2ZlbmNlX2FycmF5ICphcnJheTsKPj4gLQo+PiAtICAgICAgICAgICAgICAgYXJyYXkgPSBk
bWFfZmVuY2VfYXJyYXlfY3JlYXRlKGNvdW50LCBmZW5jZXMsCj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2MoMSks
IDAsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFs
c2UpOwo+PiAtICAgICAgICAgICAgICAgaWYgKCFhcnJheSkKPj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBlcnJfZmVuY2VzX3B1dDsKPj4gLQo+PiAtICAgICAgICAgICAgICAgZG1hX3Jl
c3ZfYWRkX2V4Y2xfZmVuY2Uob2JqLCAmYXJyYXktPmJhc2UpOwo+PiAtICAgICAgICAgICAgICAg
ZG1hX2ZlbmNlX3B1dCgmYXJyYXktPmJhc2UpOwo+PiAtICAgICAgIH0KPj4gLQo+PiAtICAgICAg
IHJldHVybiAwOwo+PiAtCj4+IC1lcnJfZmVuY2VzX3B1dDoKPj4gLSAgICAgICB3aGlsZSAoY291
bnQtLSkKPj4gLSAgICAgICAgICAgICAgIGRtYV9mZW5jZV9wdXQoZmVuY2VzW2NvdW50XSk7Cj4+
IC0gICAgICAga2ZyZWUoZmVuY2VzKTsKPj4gLSAgICAgICByZXR1cm4gLUVOT01FTTsKPj4gLX0K
Pj4gLQo+PiAgIC8qKgo+PiAgICAqIGFtZGdwdV9kbWFfYnVmX2F0dGFjaCAtICZkbWFfYnVmX29w
cy5hdHRhY2ggaW1wbGVtZW50YXRpb24KPj4gICAgKgo+PiBAQCAtMTEwLDI0ICs2OCw2IEBAIHN0
YXRpYyBpbnQgYW1kZ3B1X2RtYV9idWZfYXR0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+
ICAgICAgICAgIGlmIChyIDwgMCkKPj4gICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPj4KPj4g
LSAgICAgICByID0gYW1kZ3B1X2JvX3Jlc2VydmUoYm8sIGZhbHNlKTsKPj4gLSAgICAgICBpZiAo
dW5saWtlbHkociAhPSAwKSkKPj4gLSAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+PiAtCj4+IC0g
ICAgICAgLyoKPj4gLSAgICAgICAgKiBXZSBvbmx5IGNyZWF0ZSBzaGFyZWQgZmVuY2VzIGZvciBp
bnRlcm5hbCB1c2UsIGJ1dCBpbXBvcnRlcnMKPj4gLSAgICAgICAgKiBvZiB0aGUgZG1hYnVmIHJl
bHkgb24gZXhjbHVzaXZlIGZlbmNlcyBmb3IgaW1wbGljaXRseQo+PiAtICAgICAgICAqIHRyYWNr
aW5nIHdyaXRlIGhhemFyZHMuIEFzIGFueSBvZiB0aGUgY3VycmVudCBmZW5jZXMgbWF5Cj4+IC0g
ICAgICAgICogY29ycmVzcG9uZCB0byBhIHdyaXRlLCB3ZSBuZWVkIHRvIGNvbnZlcnQgYWxsIGV4
aXN0aW5nCj4+IC0gICAgICAgICogZmVuY2VzIG9uIHRoZSByZXNlcnZhdGlvbiBvYmplY3QgaW50
byBhIHNpbmdsZSBleGNsdXNpdmUKPj4gLSAgICAgICAgKiBmZW5jZS4KPj4gLSAgICAgICAgKi8K
Pj4gLSAgICAgICByID0gX19kbWFfcmVzdl9tYWtlX2V4Y2x1c2l2ZShiby0+dGJvLmJhc2UucmVz
dik7Cj4+IC0gICAgICAgaWYgKHIpCj4+IC0gICAgICAgICAgICAgICBnb3RvIG91dDsKPj4gLQo+
PiAtICAgICAgIGJvLT5wcmltZV9zaGFyZWRfY291bnQrKzsKPj4gLSAgICAgICBhbWRncHVfYm9f
dW5yZXNlcnZlKGJvKTsKPj4gICAgICAgICAgcmV0dXJuIDA7Cj4+Cj4+ICAgb3V0Ogo+PiBAQCAt
MTUwLDkgKzkwLDYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2RtYV9idWZfZGV0YWNoKHN0cnVjdCBk
bWFfYnVmICpkbWFidWYsCj4+ICAgICAgICAgIHN0cnVjdCBhbWRncHVfYm8gKmJvID0gZ2VtX3Rv
X2FtZGdwdV9ibyhvYmopOwo+PiAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9
IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+Pgo+PiAtICAgICAgIGlmIChhdHRhY2gt
PmRldi0+ZHJpdmVyICE9IGFkZXYtPmRldi0+ZHJpdmVyICYmIGJvLT5wcmltZV9zaGFyZWRfY291
bnQpCj4+IC0gICAgICAgICAgICAgICBiby0+cHJpbWVfc2hhcmVkX2NvdW50LS07Cj4+IC0KPj4g
ICAgICAgICAgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShhZGV2X3RvX2RybShhZGV2KS0+ZGV2
KTsKPj4gICAgICAgICAgcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYWRldl90b19kcm0oYWRl
diktPmRldik7Cj4+ICAgfQo+PiBAQCAtNDA2LDggKzM0Myw2IEBAIGFtZGdwdV9kbWFfYnVmX2Ny
ZWF0ZV9vYmooc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRtYV9idWYgKmRtYV9idWYp
Cj4+ICAgICAgICAgIGJvID0gZ2VtX3RvX2FtZGdwdV9ibyhnb2JqKTsKPj4gICAgICAgICAgYm8t
PmFsbG93ZWRfZG9tYWlucyA9IEFNREdQVV9HRU1fRE9NQUlOX0dUVDsKPj4gICAgICAgICAgYm8t
PnByZWZlcnJlZF9kb21haW5zID0gQU1ER1BVX0dFTV9ET01BSU5fR1RUOwo+PiAtICAgICAgIGlm
IChkbWFfYnVmLT5vcHMgIT0gJmFtZGdwdV9kbWFidWZfb3BzKQo+PiAtICAgICAgICAgICAgICAg
Ym8tPnByaW1lX3NoYXJlZF9jb3VudCA9IDE7Cj4+Cj4+ICAgICAgICAgIGRtYV9yZXN2X3VubG9j
ayhyZXN2KTsKPj4gICAgICAgICAgcmV0dXJuIGdvYmo7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2VtLmMKPj4gaW5kZXggOWNmNGJlYWY2NDZjLi4wNzgwZThkMTg5OTIgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPj4gQEAgLTgyOSw3
ICs4MjksOCBAQCBpbnQgYW1kZ3B1X2dlbV9vcF9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAo+PiAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgICB9Cj4+
ICAgICAgICAgIGNhc2UgQU1ER1BVX0dFTV9PUF9TRVRfUExBQ0VNRU5UOgo+PiAtICAgICAgICAg
ICAgICAgaWYgKHJvYmotPnByaW1lX3NoYXJlZF9jb3VudCAmJiAoYXJncy0+dmFsdWUgJiBBTURH
UFVfR0VNX0RPTUFJTl9WUkFNKSkgewo+PiArICAgICAgICAgICAgICAgaWYgKHJvYmotPnRiby5i
YXNlLmltcG9ydF9hdHRhY2ggJiYKPj4gKyAgICAgICAgICAgICAgICAgICBhcmdzLT52YWx1ZSAm
IEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHIg
PSAtRUlOVkFMOwo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgYW1kZ3B1X2JvX3VucmVzZXJ2
ZShyb2JqKTsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IGluZGV4IGI3YTIwNzBkOTBhZi4u
ZDEzNDkwOTc1YWMzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5jCj4+IEBAIC04OTIsNyArODkyLDcgQEAgaW50IGFtZGdwdV9ib19waW5fcmVzdHJp
Y3RlZChzdHJ1Y3QgYW1kZ3B1X2JvICpibywgdTMyIGRvbWFpbiwKPj4gICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPj4KPj4gICAgICAgICAgLyogQSBzaGFyZWQgYm8gY2Fubm90IGJl
IG1pZ3JhdGVkIHRvIFZSQU0gKi8KPj4gLSAgICAgICBpZiAoYm8tPnByaW1lX3NoYXJlZF9jb3Vu
dCB8fCBiby0+dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCkgewo+PiArICAgICAgIGlmIChiby0+dGJv
LmJhc2UuaW1wb3J0X2F0dGFjaCkgewo+PiAgICAgICAgICAgICAgICAgIGlmIChkb21haW4gJiBB
TURHUFVfR0VNX0RPTUFJTl9HVFQpCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBkb21haW4g
PSBBTURHUFVfR0VNX0RPTUFJTl9HVFQ7Cj4+ICAgICAgICAgICAgICAgICAgZWxzZQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCj4+IGluZGV4IDEyNmRmMDNh
NzA2Ni4uYzAzZGZkMjk4ZjQ1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5oCj4+IEBAIC05OSw3ICs5OSw2IEBAIHN0cnVjdCBhbWRncHVfYm8gewo+
PiAgICAgICAgICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgICAgICAgIHRibzsKPj4gICAgICAg
ICAgc3RydWN0IHR0bV9ib19rbWFwX29iaiAgICAgICAgICBrbWFwOwo+PiAgICAgICAgICB1NjQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYWdzOwo+PiAtICAgICAgIHVuc2lnbmVkICAg
ICAgICAgICAgICAgICAgICAgICAgcHJpbWVfc2hhcmVkX2NvdW50Owo+PiAgICAgICAgICAvKiBw
ZXIgVk0gc3RydWN0dXJlIGZvciBwYWdlIHRhYmxlcyBhbmQgd2l0aCB2aXJ0dWFsIGFkZHJlc3Nl
cyAqLwo+PiAgICAgICAgICBzdHJ1Y3QgYW1kZ3B1X3ZtX2JvX2Jhc2UgICAgICAgICp2bV9ibzsK
Pj4gICAgICAgICAgLyogQ29uc3RhbnQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24gKi8KPj4gLS0KPj4g
Mi4yNS4xCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
