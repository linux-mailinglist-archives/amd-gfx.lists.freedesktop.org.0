Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6371DF9A06
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Nov 2019 20:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60D86E0C5;
	Tue, 12 Nov 2019 19:49:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FB66E0C5
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 19:49:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id i10so19905157wrs.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 11:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F12yNFEj4GyY0CuYrAP7BpOqBlOv9O0llluFfrnGIXo=;
 b=reKkwjOlbibwelG+2Vo+tjBz7vKYJiTMAdwmhjwzyafKG6KBlR5XgOu24+v0Pf4wuE
 bMjm0FYFMmqiwGbtv1e+49OftYG3o+7sBgubY7KGyFnD5/zxK+FASqH+6rsKuRnSvZH8
 6hB0LPLwOg38qLTj7emiwt0oA4lXM3s+ChD40btEPCim8mioADbBH0hgT8YnoPz9YfBu
 XRg+ksbtUWhslj+4j1X8ZSos5SSjWSPRQ15uTDbolbG5b6z8EGYwiB44UNx2+KANCsW4
 m2ZiVv8qrp1EROSFgMNxWALn3S7LP5RGac0VYC1qJeHGQhdGt3FNcqL/oaE2rc+ydsbU
 Wj/A==
X-Gm-Message-State: APjAAAWvFo825QUdvGs0lXxrDKW78BPn0xAn6hMADXe4DyojW47wMvW2
 CCyTne+2crzKF1VDtYI+GBuuzMjN5bYBvj5QSZA=
X-Google-Smtp-Source: APXvYqy031ePGpqL1oAzQkyqT+dIIQRJkQtwmmQRS59Uek2bJs6NRACF1Oyb25LEeusf9JevcP2QLb5k3CKhqNG69Bg=
X-Received: by 2002:adf:f010:: with SMTP id j16mr23045567wro.206.1573588174205; 
 Tue, 12 Nov 2019 11:49:34 -0800 (PST)
MIME-Version: 1.0
References: <20191112180329.3927-1-leo.liu@amd.com>
In-Reply-To: <20191112180329.3927-1-leo.liu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Nov 2019 14:49:22 -0500
Message-ID: <CADnq5_NVBemrfE5OB=NBeb5XM5HPWdnhjaWM0KjdDyb6+pm9zA@mail.gmail.com>
Subject: Re: [PATCH 00/21] Separate JPEG from VCN
To: Leo Liu <leo.liu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=F12yNFEj4GyY0CuYrAP7BpOqBlOv9O0llluFfrnGIXo=;
 b=P0rlRAFKkIpZNcJYOM/37ZECJwXJsiMUuTrWwtIbKTML/zID1em6a30t6sDoNqGxT5
 tzsP9tMGsscYaLmY5QqwsLe86J9xNTa6dmzTE1eepLx6M2Hs//VhnXhYzCFan3NPZ/K5
 qIeQ/AuwoCHm24wH7wf1DBqzzLQ8WO0HB4xTryUCtB3XNDDDfYz2BsYEIwCCJgjtDUA+
 P28YEMMrxtaH1BivEgugkJvqymYSlgCjKW9L6GWtIm0fB9wXTxp7Gnl4SAowVroaw1+6
 HGfS6/MAXv36cHemCnUXHT0lzMLEM+5ZHMz/MEfnSzu1G3HsZ8y0FeWm4XTN2++oNJD9
 /zxQ==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTowMyBQTSBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+
IHdyb3RlOgo+Cj4gRnJvbSBKUEVHMi4wLCBKUEVHIGlzIGEgc2VwYXJhdGVkIElQIGJsb2NrLCBh
bmQgaGFzIGl0IG93biBQRy9DRywKPiBhbmQgcG93ZXIgbWFuYWdlbWVudC4gSXQgZG9lc24ndCBy
ZXF1aXJlIEZXLCBzbyBpbmRlcGVkZW50IGZyb20gRlcKPiBsb2FkaW5nIGFzIHdlbGwuCj4KPiBQ
YXRjaCAxLTQ6IFNlcGFyYXRlIEpQRUcxLjAgZnJvbSBTVyB3aXNlLCBzaW5jZSBKUEVHMS4wIGlz
IHN0aWxsCj4gY29tYmluZWQgd2l0aCBWQ04xLjAgZXNwLiBpbiBwb3dlciBtYW5hZ2VtZW50Owo+
IFBhdGNoIDUtMTA6IFNlcGFyYXRlIEpQRUcyLjAgYXMgYW4gaW5kZXBlbmRlbnQgSVAgd2l0aCBQ
Ry9DRzsKPiBQYXRjaCAxMS0xNTogQWRkIHBvd2VyIG1hbmFnZW1lbnQgZm9yIEpQRUcgb2YgTmF2
aTF4IGFuZCBSZW5vaXI7Cj4gUGF0Y2ggMTY6IEVuYWJsZSBKUEVHMi4wOwo+IFBhdGNoIDE3LTIw
OiBTZXBhcmF0ZSBKUEVHMi41IGZyb20gVkNOMi41Owo+IFBhdGNoIDIxOiBFbmFibGUgSlBFRzIu
NQo+CgpJcyB0aGUganBlZyBwb3dlcmdhdGluZyBkeW5hbWljIG9yIGRvIHdlIG5lZWQgYSBpZGxl
IHdvcmsgdGhyZWFkIHRvCnR1cm4gaXQgb2ZmIGxpa2Ugd2UgZG8gZm9yIHZjbj8KCkFsZXgKCj4g
TGVvIExpdSAoMjEpOgo+ICAgZHJtL2FtZGdwdTogYWRkIEpQRUcgSFcgSVAgYW5kIFNXIHN0cnVj
dHVyZXMKPiAgIGRybS9hbWRncHU6IGFkZCBhbWRncHVfanBlZyBhbmQgSlBFRyB0ZXN0cwo+ICAg
ZHJtL2FtZGdwdTogc2VwYXJhdGUgSlBFRzEuMCBjb2RlIG91dCBmcm9tIFZDTjEuMAo+ICAgZHJt
L2FtZGdwdTogdXNlIHRoZSBKUEVHIHN0cnVjdHVyZSBmb3IgZ2VuZXJhbCBkcml2ZXIgc3VwcG9y
dAo+ICAgZHJtL2FtZGdwdTogYWRkIEpQRUcgSVAgYmxvY2sgdHlwZQo+ICAgZHJtL2FtZGdwdTog
YWRkIEpQRUcgY29tbW9uIGZ1bmN0aW9ucyB0byBhbWRncHVfanBlZwo+ICAgZHJtL2FtZGdwdTog
YWRkIEpQRUcgdjIuMCBmdW5jdGlvbiBzdXBwb3J0cwo+ICAgZHJtL2FtZGdwdTogcmVtb3ZlIHVu
bmVjZXNzYXJ5IEpQRUcyLjAgY29kZSBmcm9tIFZDTjIuMAo+ICAgZHJtL2FtZGdwdTogYWRkIEpQ
RUcgUEcgYW5kIENHIGludGVyZmFjZQo+ICAgZHJtL2FtZGdwdTogYWRkIFBHIGFuZCBDRyBmb3Ig
SlBFRzIuMAo+ICAgZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBKUEVHIFBvd2VycGxheSBpbnRlcmZh
Y2UKPiAgIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgSlBFRyBwb3dlciBjb250cm9sIGZvciBOYXZp
MXgKPiAgIGRybS9hbWQvcG93ZXJwbGF5OiBhZGQgUG93ZXJnYXRlIEpQRUcgZm9yIFJlbm9pcgo+
ICAgZHJtL2FtZC9wb3dlcnBsYXk6IGFkZCBKUEVHIHBvd2VyIGNvbnRyb2wgZm9yIFJlbm9pcgo+
ICAgZHJtL2FtZC9wb3dlcnBsYXk6IHNldCBKUEVHIHRvIFNNVSBkcG0KPiAgIGRybS9hbWRncHU6
IGVuYWJsZSBKUEVHMi4wIGRwbQo+ICAgZHJtL2FtZGdwdTogYWRkIGRyaXZlciBzdXBwb3J0IGZv
ciBKUEVHMi4wIGFuZCBhYm92ZQo+ICAgZHJtL2FtZGdwdTogZW5hYmxlIEpQRUcyLjAgZm9yIE5h
dmkxeCBhbmQgUmVub2lyCj4gICBkcm0vYW1kZ3B1OiBtb3ZlIEpQRUcyLjUgb3V0IGZyb20gVkNO
Mi41Cj4gICBkcm0vYW1kZ3B1OiBlbmFibGUgQXJjdHVydXMgQ0cgZm9yIFZDTiBhbmQgSlBFRyBi
bG9ja3MKPiAgIGRybS9hbWRncHU6IGVuYWJsZSBBcmN0dXJ1cyBKUEVHMi41IGJsb2NrCj4KPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvTWFrZWZpbGUgICAgICAgICAgIHwgICA4ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICB8ICAgNSArCj4g
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jdHguYyAgICAgICB8ICAgNCArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgICAgfCAgIDIgKwo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfanBlZy5jICAgICAgfCAyMTUgKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pwZWcuaCAgICAgIHwgIDYy
ICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYyAgICAgICB8ICAx
NSArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYyAgICAgICAgfCAg
IDggKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uaCAgICAgICAgfCAg
IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmMgICAgICAgfCAx
MTMgKy0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uaCAgICAgICB8
ICAgNSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFfMC5jICAgICAgICB8
IDU4NCArKysrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjFf
MC5oICAgICAgICB8ICAzMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJf
MC5jICAgICAgICB8IDgyNyArKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvanBlZ192Ml8wLmggICAgICAgIHwgIDQyICsKPiAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvanBlZ192Ml81LmMgICAgICAgIHwgNjQxICsrKysrKysrKysrKysrCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfNS5oICAgICAgICB8ICAyOSArCj4gIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L252LmMgICAgICAgICAgICAgICB8ICAxMSArLQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgICAgfCAgMTAgKy0KPiAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYyAgICAgICAgIHwgNDgxICstLS0tLS0t
LS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYyAgICAgICAgIHwgNDk2
ICstLS0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmggICAg
ICAgICB8ICAxMyAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMgICAg
ICAgICB8IDI0NiArLS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9pbmNsdWRlL2FtZF9zaGFy
ZWQuaCAgICAgIHwgICA1ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdw
dV9zbXUuYyAgICB8ICAgNSArCj4gIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaW5jL2FtZGdw
dV9zbXUuaCAgICB8ICAgMyArCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2luYy9z
bXVfdjEyXzAuaCB8ICAgMiArCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYyAgICB8ICAzMiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9yZW5v
aXJfcHB0LmMgICAgfCAgMjcgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
aW50ZXJuYWwuaCAgfCAgIDQgKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9zbXVf
djEyXzAuYyAgICAgfCAgMTEgKwo+ICAzMSBmaWxlcyBjaGFuZ2VkLCAyNTkzIGluc2VydGlvbnMo
KyksIDEzNDYgZGVsZXRpb25zKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfanBlZy5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfanBlZy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3YxXzAuYwo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192MV8wLmgKPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfMC5jCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9qcGVnX3YyXzAuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvanBlZ192Ml81LmMKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2pwZWdfdjJfNS5o
Cj4KPiAtLQo+IDIuMTcuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
