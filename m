Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A964CEC1D
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 20:46:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FED6E167;
	Mon,  7 Oct 2019 18:46:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFC86E167
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 18:46:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p14so15599610wro.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 07 Oct 2019 11:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KMZ3rO1MK3MwRRJfOl1vpFi1XEUPU6qKmLNtoXIJLZw=;
 b=JowX3gvAlXU9fpkwl+CDC/ul00obrm+U5GOdJButCOgf1V3z3KtORs+Mmnsxv6vl1O
 ZU/aVE9nn9hiM2qqlkNYuw9+hVeRlY7cLfC9Whsei0O6QVTFyb98i7ZrPbLpv/m04EFv
 U+gyFa7rNs3nOrQKc7YPaILuvWjUciYwQvaqQOG8WdTAN47CWfJXGQzSSdQyEnT1YIDp
 fnc/CMqIPFfOs3l8nmyuZitBcIsZkTt6D2BrQx0XTi0Lmq7y3W78u16FoQcnNgPtWdBi
 Pby70Q928YyiWQCgfJd3Skq58FZDZ24LZskKFteqdigThWvCBsG73jix7r9NRJeR6WY5
 dmHw==
X-Gm-Message-State: APjAAAVETrx3YZKgdTIwapkF4d8kfB6XMvQXte7o5KY+6cvTT17yTSYz
 pO47XA9uvZb60T4Cymw6y95syOKa9D3uO1GgRG/iwQ==
X-Google-Smtp-Source: APXvYqzb9+VxcN2feWsjIl+DUi2uky61DVJTXeBQigX1idXGSYqsgjOdDM0/ac0hA0vqYQfqJPn25wzer1yz9H4zXnM=
X-Received: by 2002:a5d:6052:: with SMTP id j18mr13385796wrt.40.1570474009115; 
 Mon, 07 Oct 2019 11:46:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203502.30996-1-maraeo@gmail.com>
 <CAAxE2A7rOodqyZVWCQYcbx6Xsc=XQ_EsVCF+G_tFOWcB7omMmA@mail.gmail.com>
In-Reply-To: <CAAxE2A7rOodqyZVWCQYcbx6Xsc=XQ_EsVCF+G_tFOWcB7omMmA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Oct 2019 14:46:36 -0400
Message-ID: <CADnq5_OkPmkKttvCbS1jG3dZ0oRdPegJtPhuxFc-j3QVNuVDWA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify gds_compute_max_wave_id computation
To: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KMZ3rO1MK3MwRRJfOl1vpFi1XEUPU6qKmLNtoXIJLZw=;
 b=W4q+Ppd4YkHTbfsePpt2nXp7nTwbBf4b6QZNwPDeDt1XpF7eKZbiO3Ce86SsiJ7B6u
 vUTLgyPuj80N631kE0VemU4ZO+443hZrsKxEUCYka8CcMDu3pC1WVd1nCY2hjnazL888
 a/jn/3M+dZocFPom4g44YmmUG/1aWkmP1XgMeYzMBjiHrC+/HNQjVgRQ6rUauQI5USn8
 i3e/C344BbMa5SHC6RBweXm/qh2nHGThHWrLZuLcW6myoDIPOs4vcII6vKKj7kdkhfNP
 L4DdH5VcGFhvJukUVTQGTXgO3RKNe+nirN4YOk451DeRBCz/lRj2eIOGsFl7MSFXA6ht
 T8Dg==
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCk9u
IE1vbiwgT2N0IDcsIDIwMTkgYXQgMjowNSBQTSBNYXJlayBPbMWhw6FrIDxtYXJhZW9AZ21haWwu
Y29tPiB3cm90ZToKPgo+IHBpbmcKPgo+IE9uIFdlZCwgU2VwIDI1LCAyMDE5IGF0IDQ6MzUgUE0g
TWFyZWsgT2zFocOhayA8bWFyYWVvQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IEZyb206IE1hcmVr
IE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgfCAxMyArKysrKy0tLS0tLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+PiBpbmRleCBjYTAxNjQzZmEwYzguLjczY2QyNTQ0NDli
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3YxMF8wLmMKPj4gQEAgLTUy
NzUsMjkgKzUyNzUsMjYgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9ybGNfZnVuY3Moc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICAgICAgICAgY2FzZSBDSElQX05BVkkxMjoKPj4g
ICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5ybGMuZnVuY3MgPSAmZ2Z4X3YxMF8wX3JsY19mdW5j
czsKPj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+PiAgICAgICAgIGRlZmF1bHQ6Cj4+ICAgICAg
ICAgICAgICAgICBicmVhazsKPj4gICAgICAgICB9Cj4+ICB9Cj4+Cj4+ICBzdGF0aWMgdm9pZCBn
ZnhfdjEwXzBfc2V0X2dkc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAgewo+
PiAtICAgICAgIC8qIGluaXQgYXNpYyBnZHMgaW5mbyAqLwo+PiAtICAgICAgIHN3aXRjaCAoYWRl
di0+YXNpY190eXBlKSB7Cj4+IC0gICAgICAgY2FzZSBDSElQX05BVkkxMDoKPj4gLSAgICAgICBk
ZWZhdWx0Ogo+PiAtICAgICAgICAgICAgICAgYWRldi0+Z2RzLmdkc19zaXplID0gMHgxMDAwMDsK
Pj4gLSAgICAgICAgICAgICAgIGFkZXYtPmdkcy5nZHNfY29tcHV0ZV9tYXhfd2F2ZV9pZCA9IDB4
NGZmOwo+PiAtICAgICAgICAgICAgICAgYnJlYWs7Cj4+IC0gICAgICAgfQo+PiArICAgICAgIHVu
c2lnbmVkIHRvdGFsX2N1ID0gYWRldi0+Z2Z4LmNvbmZpZy5tYXhfY3VfcGVyX3NoICoKPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGFkZXYtPmdmeC5jb25maWcubWF4X3NoX3Blcl9zZSAq
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGV2LT5nZnguY29uZmlnLm1heF9zaGFk
ZXJfZW5naW5lczsKPj4KPj4gKyAgICAgICBhZGV2LT5nZHMuZ2RzX3NpemUgPSAweDEwMDAwOwo+
PiArICAgICAgIGFkZXYtPmdkcy5nZHNfY29tcHV0ZV9tYXhfd2F2ZV9pZCA9IHRvdGFsX2N1ICog
MzIgLSAxOwo+PiAgICAgICAgIGFkZXYtPmdkcy5nd3Nfc2l6ZSA9IDY0Owo+PiAgICAgICAgIGFk
ZXYtPmdkcy5vYV9zaXplID0gMTY7Cj4+ICB9Cj4+Cj4+ICBzdGF0aWMgdm9pZCBnZnhfdjEwXzBf
c2V0X3VzZXJfd2dwX2luYWN0aXZlX2JpdG1hcF9wZXJfc2goc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYsCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1MzIgYml0bWFwKQo+PiAgewo+PiAgICAgICAgIHUzMiBkYXRhOwo+Pgo+PiAg
ICAgICAgIGlmICghYml0bWFwKQo+PiAtLQo+PiAyLjE3LjEKPj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
