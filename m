Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E342C9160
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 23:46:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7E68925F;
	Mon, 30 Nov 2020 22:46:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010698925F;
 Mon, 30 Nov 2020 22:46:29 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id x16so257991oic.3;
 Mon, 30 Nov 2020 14:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pi3SM6JsbvfP6RtMtAXOSB9JCtD13VeOaOmtjrxWoNE=;
 b=dL9e3q/XYScyZt1CTB6FOMhIphcFfhq1C1YAFX/arw1+b5OeQZEUAU8znvkNpTUUAG
 Inrdwdqu9WIn7Y0v/7ad/CDfkuduUa2Xgc+1yZReYfcOc2z5PDlaMdqTf0KUvxZe47cf
 ugzJ1eODfdUs3LxxV5n8ZSI1MvASmqLCF2WmSNzuDZMHU4LNEQS3kygjGTpomrbQDe08
 quXoEqCD1GoPjkftsNlmYlCgOCbJ8ZIo6vzAfJPv9p/gma0RKp47Uq23HYLAKgACR+Y/
 U26IGDdKlS/dK5u8qHL1bOmZ7xWB5vP9L0QHZqS04U/iH9MApzFcvWFS5I+HctjSrB7N
 mLSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pi3SM6JsbvfP6RtMtAXOSB9JCtD13VeOaOmtjrxWoNE=;
 b=bCB3wJI+BG4Ko+PfS2llMRxnsOPzYhFYl33SU3mf3b1W3qr6pxrfAd4SpFUwATJwR2
 9OH/yL+FoLhzJFq4T2Z2w55wJbUDs9oEivAZaHxhwuh9rH9ZlQrih6oiSIwnlCnOJx8F
 TvKLHUbbPTdIKP6lsSc/DCEjKYhnDIaSOOF0Mh/gPMLTFZAm1JqHTxR0DMSaQmJUzO0R
 Ke/2U1EBGLtKLPamaZb7c0iwsVLoRGkgU3Q/8DK3hzYlPGQlXPwDcqZfsecKaJrvoq7q
 rHE1j53fPQiq3Q8e3DES2H2MgSxA7frwHeUSLj0d5KGeiViqJUFz1VVvbqzJtpZVfg7J
 L83g==
X-Gm-Message-State: AOAM53220Id4HDTiWsB9Ato2O8pMwtHMUBmDEO/uvAj4a8ibZeD60wuk
 nx2MCmXf+gTRCRANunx4+KhfTwtakCs2MeEH9cs=
X-Google-Smtp-Source: ABdhPJyVPYvbRlGWhU4027iV9VxnHVIyndLx35nN/54epKccBDgJJjeplJFCEeDXIs3pCTpPAQmUO/UCOr7n82NakZA=
X-Received: by 2002:aca:f50e:: with SMTP id t14mr3064oih.123.1606776389395;
 Mon, 30 Nov 2020 14:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20201124193824.1118741-1-lee.jones@linaro.org>
 <20201124193824.1118741-33-lee.jones@linaro.org>
In-Reply-To: <20201124193824.1118741-33-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 30 Nov 2020 17:46:18 -0500
Message-ID: <CADnq5_Oh5+4rSVV766LuLjBCFPuJh1xdybFu8jnP=Ywyq9UwFg@mail.gmail.com>
Subject: Re: [PATCH 32/40] drm/amd/amdgpu/vcn_v2_0: Fix a few kernel-doc
 misdemeanours
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjQsIDIwMjAgYXQgMjo0NSBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6NDgz
OiB3YXJuaW5nOiBFeGNlc3MgZnVuY3Rpb24gcGFyYW1ldGVyICdzdycgZGVzY3JpcHRpb24gaW4g
J3Zjbl92Ml8wX2Rpc2FibGVfY2xvY2tfZ2F0aW5nJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92Y25fdjJfMC5jOjY0NDogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAn
c3cnIGRlc2NyaXB0aW9uIGluICd2Y25fdjJfMF9lbmFibGVfY2xvY2tfZ2F0aW5nJwo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jOjE0MDQ6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2NvdW50JyBub3QgZGVzY3JpYmVkIGluICd2Y25fdjJfMF9k
ZWNfcmluZ19pbnNlcnRfbm9wJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
MC5jOjE0MjY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2FkZHInIG5v
dCBkZXNjcmliZWQgaW4gJ3Zjbl92Ml8wX2RlY19yaW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6MTQyNjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnc2VxJyBub3QgZGVzY3JpYmVkIGluICd2Y25fdjJfMF9kZWNfcmlu
Z19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jOjE0
MjY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2ZsYWdzJyBub3QgZGVz
Y3JpYmVkIGluICd2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jOjE0MjY6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBw
YXJhbWV0ZXIgJ2ZlbmNlJyBkZXNjcmlwdGlvbiBpbiAndmNuX3YyXzBfZGVjX3JpbmdfZW1pdF9m
ZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYzoxNDY1OiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdqb2InIG5vdCBkZXNjcmliZWQgaW4g
J3Zjbl92Ml8wX2RlY19yaW5nX2VtaXRfaWInCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92Ml8wLmM6MTQ2NTogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAn
ZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ3Zjbl92Ml8wX2RlY19yaW5nX2VtaXRfaWInCj4gIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6MTYwOTogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYWRkcicgbm90IGRlc2NyaWJlZCBpbiAndmNuX3YyXzBf
ZW5jX3JpbmdfZW1pdF9mZW5jZScKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYzoxNjA5OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdzZXEnIG5v
dCBkZXNjcmliZWQgaW4gJ3Zjbl92Ml8wX2VuY19yaW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6MTYwOTogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIG1lbWJlciAnZmxhZ3MnIG5vdCBkZXNjcmliZWQgaW4gJ3Zjbl92Ml8wX2VuY19y
aW5nX2VtaXRfZmVuY2UnCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmM6
MTYwOTogd2FybmluZzogRXhjZXNzIGZ1bmN0aW9uIHBhcmFtZXRlciAnZmVuY2UnIGRlc2NyaXB0
aW9uIGluICd2Y25fdjJfMF9lbmNfcmluZ19lbWl0X2ZlbmNlJwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jOjE2MzY6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBv
ciBtZW1iZXIgJ2pvYicgbm90IGRlc2NyaWJlZCBpbiAndmNuX3YyXzBfZW5jX3JpbmdfZW1pdF9p
YicKPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYzoxNjM2OiB3YXJuaW5n
OiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyICdmbGFncycgbm90IGRlc2NyaWJlZCBpbiAn
dmNuX3YyXzBfZW5jX3JpbmdfZW1pdF9pYicKPgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRl
ci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgpBcHBsaWVkIHdpdGgg
bWlub3IgZml4ZXMuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS92Y25fdjJfMC5jIHwgMTUgKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS92Y25fdjJfMC5jCj4gaW5kZXggZTI4NWY5YzlkNDYwZS4uNTY4N2M1ZWQwZmI5OSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzAuYwo+IEBAIC00NzUsNyArNDc1LDYg
QEAgc3RhdGljIHZvaWQgdmNuX3YyXzBfbWNfcmVzdW1lX2RwZ19tb2RlKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2LCBib29sIGluZGlyZWMKPiAgICogdmNuX3YyXzBfZGlzYWJsZV9jbG9ja19n
YXRpbmcgLSBkaXNhYmxlIFZDTiBjbG9jayBnYXRpbmcKPiAgICoKPiAgICogQGFkZXY6IGFtZGdw
dV9kZXZpY2UgcG9pbnRlcgo+IC0gKiBAc3c6IGVuYWJsZSBTVyBjbG9jayBnYXRpbmcKPiAgICoK
PiAgICogRGlzYWJsZSBjbG9jayBnYXRpbmcgZm9yIFZDTiBibG9jawo+ICAgKi8KPiBAQCAtNjM2
LDcgKzYzNSw2IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2Nsb2NrX2dhdGluZ19kcGdfbW9kZShz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgICogdmNuX3YyXzBfZW5hYmxlX2Nsb2NrX2dh
dGluZyAtIGVuYWJsZSBWQ04gY2xvY2sgZ2F0aW5nCj4gICAqCj4gICAqIEBhZGV2OiBhbWRncHVf
ZGV2aWNlIHBvaW50ZXIKPiAtICogQHN3OiBlbmFibGUgU1cgY2xvY2sgZ2F0aW5nCj4gICAqCj4g
ICAqIEVuYWJsZSBjbG9jayBnYXRpbmcgZm9yIFZDTiBibG9jawo+ICAgKi8KPiBAQCAtMTM5Nyw2
ICsxMzk1LDcgQEAgdm9pZCB2Y25fdjJfMF9kZWNfcmluZ19pbnNlcnRfZW5kKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZykKPiAgICogdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X25vcCAtIGluc2Vy
dCBhIG5vcCBjb21tYW5kCj4gICAqCj4gICAqIEByaW5nOiBhbWRncHVfcmluZyBwb2ludGVyCj4g
KyAqIEBjb3VudDogdGhlIG51bWJlciBvZiBOT1AgcGFja2V0cyB0byBpbnNlcnQKPiAgICoKPiAg
ICogV3JpdGUgYSBub3AgY29tbWFuZCB0byB0aGUgcmluZy4KPiAgICovCj4gQEAgLTE0MTcsNyAr
MTQxNiw5IEBAIHZvaWQgdmNuX3YyXzBfZGVjX3JpbmdfaW5zZXJ0X25vcChzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVpbnQzMl90IGNvdW50KQo+ICAgKiB2Y25fdjJfMF9kZWNfcmluZ19lbWl0
X2ZlbmNlIC0gZW1pdCBhbiBmZW5jZSAmIHRyYXAgY29tbWFuZAo+ICAgKgo+ICAgKiBAcmluZzog
YW1kZ3B1X3JpbmcgcG9pbnRlcgo+IC0gKiBAZmVuY2U6IGZlbmNlIHRvIGVtaXQKPiArICogQGFk
ZHI6IGFkZHJlc3MKPiArICogQHNlcTogc2VxdWVuY2UgbnVtYmVyCj4gKyAqIEBmbGFnczogZmVu
Y2UgcmVsYXRlZCBmbGFncwo+ICAgKgo+ICAgKiBXcml0ZSBhIGZlbmNlIGFuZCBhIHRyYXAgY29t
bWFuZCB0byB0aGUgcmluZy4KPiAgICovCj4gQEAgLTE0NTQsNyArMTQ1NSw5IEBAIHZvaWQgdmNu
X3YyXzBfZGVjX3JpbmdfZW1pdF9mZW5jZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHU2NCBh
ZGRyLCB1NjQgc2VxLAo+ICAgKiB2Y25fdjJfMF9kZWNfcmluZ19lbWl0X2liIC0gZXhlY3V0ZSBp
bmRpcmVjdCBidWZmZXIKPiAgICoKPiAgICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIKPiAr
ICogQGpvYjogam9iIHRvIHJldHJpdmUgdm1pZCBmcm9tCj4gICAqIEBpYjogaW5kaXJlY3QgYnVm
ZmVyIHRvIGV4ZWN1dGUKPiArICogQGZsYWdzOiB1bnVzZWQKPiAgICoKPiAgICogV3JpdGUgcmlu
ZyBjb21tYW5kcyB0byBleGVjdXRlIHRoZSBpbmRpcmVjdCBidWZmZXIKPiAgICovCj4gQEAgLTE2
MDAsNyArMTYwMyw5IEBAIHN0YXRpYyB2b2lkIHZjbl92Ml8wX2VuY19yaW5nX3NldF93cHRyKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZykKPiAgICogdmNuX3YyXzBfZW5jX3JpbmdfZW1pdF9mZW5j
ZSAtIGVtaXQgYW4gZW5jIGZlbmNlICYgdHJhcCBjb21tYW5kCj4gICAqCj4gICAqIEByaW5nOiBh
bWRncHVfcmluZyBwb2ludGVyCj4gLSAqIEBmZW5jZTogZmVuY2UgdG8gZW1pdAo+ICsgKiBAYWRk
cjogYWRkcmVzcwo+ICsgKiBAc2VxOiBzZXF1ZW5jZSBudW1iZXIKPiArICogQGZsYWdzOiBmZW5j
ZSByZWxhdGVkIGZsYWdzCj4gICAqCj4gICAqIFdyaXRlIGVuYyBhIGZlbmNlIGFuZCBhIHRyYXAg
Y29tbWFuZCB0byB0aGUgcmluZy4KPiAgICovCj4gQEAgLTE2MjUsNyArMTYzMCw5IEBAIHZvaWQg
dmNuX3YyXzBfZW5jX3JpbmdfaW5zZXJ0X2VuZChzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcpCj4g
ICAqIHZjbl92Ml8wX2VuY19yaW5nX2VtaXRfaWIgLSBlbmMgZXhlY3V0ZSBpbmRpcmVjdCBidWZm
ZXIKPiAgICoKPiAgICogQHJpbmc6IGFtZGdwdV9yaW5nIHBvaW50ZXIKPiArICogQGpvYjogam9i
IHRvIHJldHJpdmUgdm1pZCBmcm9tCj4gICAqIEBpYjogaW5kaXJlY3QgYnVmZmVyIHRvIGV4ZWN1
dGUKPiArICogQGZsYWdzOiB1bnVzZWQKPiAgICoKPiAgICogV3JpdGUgZW5jIHJpbmcgY29tbWFu
ZHMgdG8gZXhlY3V0ZSB0aGUgaW5kaXJlY3QgYnVmZmVyCj4gICAqLwo+IC0tCj4gMi4yNS4xCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
