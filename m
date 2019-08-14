Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 319688DE3B
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F8C6E825;
	Wed, 14 Aug 2019 20:04:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BE26E825
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:04:00 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 10so312284wmp.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 13:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M41eMzKEjLH2GlCmXiyqgJFpSp/tBVe7FANCUjACkNg=;
 b=U8sh3nBr0n8PfWX5pKw31PYN8ISaNsrhWr62lz9t+iHXvEvbNgHe6Qr8LwVregTf/D
 2VhLnygIGEE9gBRdCBDQAXyTExIw8Wp/peK7sEnJIO5KmozEAw6R8PrG9NLB6OMmwPxY
 wF9FWu64rdTWw5p087Cqzb8teRGpusLtQfGwMsIrgI+XExEddk9sv8NPYzytIwEzXJfi
 cQj2+F/zVpKIQJnsKnqYhv3g7KiwjzO32VpASUUomtPsTVY8j3+0Y/bj7Nc6KZSoZ1fA
 VfozkVuE/cFJtocGSCMMksAy5MaDJov4SqXNBkfuCPpzg4DWdo2Ms+8sWB2qOaayTwwJ
 51GA==
X-Gm-Message-State: APjAAAVnudyGjsiFYDmRzK4Yda5qTEq4SqJ2kutRvf68cMQffgw48wqv
 VwDu1UGfN6W8Lbcc0shN478is2iPtkJWxSyF97w=
X-Google-Smtp-Source: APXvYqybyIuFCXtl0fQLZzTohvf8QXGgZWCnFqiTWulGLixGuFyUYh5VHrXawRAOPzBMX4uAW80rBfzWyP/OkqqAfAI=
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr727749wmd.34.1565813038756;
 Wed, 14 Aug 2019 13:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <1565812414-26117-1-git-send-email-andrey.grodzovsky@amd.com>
 <1565812414-26117-4-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1565812414-26117-4-git-send-email-andrey.grodzovsky@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Aug 2019 16:03:47 -0400
Message-ID: <CADnq5_PUt2=-fvU2CwaKVVP0kr_qyp+9oA3ZkwuTzNeTMKNhQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Use new mode2 reset interface for RV.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=M41eMzKEjLH2GlCmXiyqgJFpSp/tBVe7FANCUjACkNg=;
 b=CJJX/nXTxqRVpHRhEFZdZElK5Aexqpzg4XbTsWDVGfVOwFb+B5oztcKB3nofefPu55
 UXzS+lV67HNkRHMlo3zb0j/mtoHZ2JlzukkxhRwweOItsi1hFVieOMIX7ID89m86gk9D
 pBtHxZFtPkMbKopdDMVNvFL+S8TZ61DZVlOkRYiN/oj8aKn+hf7bnzwIkRA9Ew0kgn+m
 VjguTYSLXzm3v4ncst5+0r50YvUSmcPZrxJPfzmX6U+XMtpIjYMYnboAklUmuoFnfAL4
 6JpThbN4ExSEB4qOmmU9MAHYUS6t1n6aGOEO43yh2yfycN3NPL7SybrcX1EsQF6U5pLh
 8maA==
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <evan.quan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, "S,
 Shirish" <Shirish.S@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMzo1NCBQTSBBbmRyZXkgR3JvZHpvdnNreQo8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3Jv
ZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIHwgIDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9zb2MxNS5jICAgICAgICAgfCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDI3NTI3NzMu
LjAyYjNlN2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jCj4gQEAgLTM1MjQsNiArMzUyNCw3IEBAIGJvb2wgYW1kZ3B1X2RldmljZV9zaG91bGRfcmVj
b3Zlcl9ncHUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICAgICAgICAgICAgICAgIGNh
c2UgQ0hJUF9WRUdBMjA6Cj4gICAgICAgICAgICAgICAgIGNhc2UgQ0hJUF9WRUdBMTA6Cj4gICAg
ICAgICAgICAgICAgIGNhc2UgQ0hJUF9WRUdBMTI6Cj4gKyAgICAgICAgICAgICAgIGNhc2UgQ0hJ
UF9SQVZFTjoKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAg
ICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRpc2FibGVkOwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zb2MxNS5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+IGluZGV4IGMyZDMyNGQuLjdhOWI4OWQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc29jMTUuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NvYzE1LmMKPiBAQCAtNTA4LDYgKzUwOCwxMSBAQCBzdGF0
aWMgaW50IHNvYzE1X2FzaWNfYmFjb19yZXNldChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
PiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGludCBzb2MxNV9tb2RlMl9yZXNl
dChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiArewoKUGxlYXNlIGNoZWNrIHRoZSBwcGZ1
bmNzIHBvaW50ZXJzIGhlcmUgc2ltaWxhciB0byBzb2MxNV9hc2ljX2JhY29fcmVzZXQoKQoKQWxl
eAoKPiArICAgICAgIHJldHVybiBhZGV2LT5wb3dlcnBsYXkucHBfZnVuY3MtPmFzaWNfcmVzZXRf
bW9kXzIoYWRldi0+cG93ZXJwbGF5LnBwX2hhbmRsZSk7Cj4gK30KPiArCj4gIHN0YXRpYyBlbnVt
IGFtZF9yZXNldF9tZXRob2QKPiAgc29jMTVfYXNpY19yZXNldF9tZXRob2Qoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gIHsKPiBAQCAtNTQ2LDE0ICs1NTEsMTQgQEAgc29jMTVfYXNpY19y
ZXNldF9tZXRob2Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4KPiAgc3RhdGljIGludCBz
b2MxNV9hc2ljX3Jlc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICB7Cj4gLSAgICAg
ICBpbnQgcmV0Owo+IC0KPiAtICAgICAgIGlmIChzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2
KSA9PSBBTURfUkVTRVRfTUVUSE9EX0JBQ08pCj4gLSAgICAgICAgICAgICAgIHJldCA9IHNvYzE1
X2FzaWNfYmFjb19yZXNldChhZGV2KTsKPiAtICAgICAgIGVsc2UKPiAtICAgICAgICAgICAgICAg
cmV0ID0gc29jMTVfYXNpY19tb2RlMV9yZXNldChhZGV2KTsKPiAtCj4gLSAgICAgICByZXR1cm4g
cmV0Owo+ICsgICAgICAgc3dpdGNoIChzb2MxNV9hc2ljX3Jlc2V0X21ldGhvZChhZGV2KSkgewo+
ICsgICAgICAgICAgICAgICBjYXNlIEFNRF9SRVNFVF9NRVRIT0RfQkFDTzoKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gc29jMTVfYXNpY19iYWNvX3Jlc2V0KGFkZXYpOwo+ICsgICAg
ICAgICAgICAgICBjYXNlIEFNRF9SRVNFVF9NRVRIT0RfTU9ERTI6Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHNvYzE1X21vZGUyX3Jlc2V0KGFkZXYpOwo+ICsgICAgICAgICAgICAg
ICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBzb2MxNV9hc2ljX21v
ZGUxX3Jlc2V0KGFkZXYpOwo+ICsgICAgICAgfQo+ICB9Cj4KPiAgLypzdGF0aWMgaW50IHNvYzE1
X3NldF91dmRfY2xvY2soc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHUzMiBjbG9jaywKPiAt
LQo+IDIuNy40Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
