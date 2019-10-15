Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C3BD83BC
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 00:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DF96E89F;
	Tue, 15 Oct 2019 22:33:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ADB6E89F
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 22:32:59 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 5so721790wmg.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Oct 2019 15:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r38DxwaFTtwI7kOHz9eJVQXcdqEwEeSQxXh2U4uPKdY=;
 b=DQKNW2US/Vjmk4zx88Zq6LTPL03UNrRQVbTHu0Tb6uN/fHp7toAIBR2oqnJrcT2ZkO
 0G+4JcDUsYF4HGqy0gy1BKukJqfjbLl+OBggX+kH7BiLIhLhqshm85U3BOiNqxnzyu98
 jGDOu+XSMJh2zz/y7OXboFaewus6V+CoK1pUJHZET/sJBrnAT1emUgI+VXLPVL/tMkmd
 FcYAYmWfRJ94ecba2iQaEOtWMOJ7L1UCnEeHmMD6AmVgQyox9FqXXolaQ1gVceH14mtg
 8XStJ3rT+FgpgRIAVOy8MDNAlh6+y+KeCGyV5tmrWlsz+QiFaS44HErgVvtJNSOzntFj
 eLGQ==
X-Gm-Message-State: APjAAAWU7I1ysK9MJgTmwRwPuc97QefhbWBqYF6N3cNrC/VHfk7Ivrju
 HlirDEEHeXODkXmdilSWipcdUkTjKylTRN5468FwiQ==
X-Google-Smtp-Source: APXvYqwNSZUe3LJTNvdLLmHLPi3GCEKYXvG+7/72L+SBFLyCQ/ujHk4kzMD6GHToANAgqFwPrmDlkyygIgXF4Wr+Bd8=
X-Received: by 2002:a1c:d0:: with SMTP id 199mr584690wma.67.1571178777684;
 Tue, 15 Oct 2019 15:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <1571177279-9435-1-git-send-email-James.Zhu@amd.com>
 <1571177279-9435-3-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1571177279-9435-3-git-send-email-James.Zhu@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Oct 2019 18:32:45 -0400
Message-ID: <CADnq5_NY1gYOhiEm5nEBSEJMtC0kqmfD0JezBPvCvXXbm=a8tw@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu/uvd:Allocate enc session bo for uvd6.0
 ring IB test
To: "Zhu, James" <James.Zhu@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r38DxwaFTtwI7kOHz9eJVQXcdqEwEeSQxXh2U4uPKdY=;
 b=sx8ozDhJ5wwFVG1FeFHPQtDk45/j4S/CYIFLn2IVJOYcGYG3RvXBPapvPphB9+i0sj
 12bR2S7jJJJxq3ejpLClPbTQV/5O3FvevcloKM9c68z3LqvZpjktrxNNlbKezmPGsIe8
 ARaAXHZM4M1jiwbxvE+LuoFO6txqagG5kW/kMTstI7Tw9S5ZNTKBxx26cZmbXnCy5qqy
 yjoxjEAxkqUalzPJuTWAaMN9RaYMrcaEyPZXZci5fiakTyh4tVZWZkTgHiBeXO+ndkE4
 AfqaOYvNJy9UKBIZjLm4+VwpjS5Bkcqdj+uCEm4A4+YIrLFPdDS/eZFfipTK9CBkPNwH
 ejig==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMTUsIDIwMTkgYXQgNjowOCBQTSBaaHUsIEphbWVzIDxKYW1lcy5aaHVAYW1k
LmNvbT4gd3JvdGU6Cj4KPiBBbGxvY2F0ZSAyNTZLIGVuYyBzZXNzaW9uIGJvIGZvciB1dmQ2LjAg
cmluZyBJQiB0ZXN0IHRvIGZpeCBTMyByZXN1bWUKPiBjb3JydXB0aW9uIGlzc3VlLgo+Cj4gU2ln
bmVkLW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyB8IDE2ICsrKysrKysrKysrKysrLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y2XzAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKPiBpbmRleCA2NzA3ODRhLi5jNzljZTczIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjZfMC5jCj4gQEAgLTIyMCw3ICsyMjAs
NyBAQCBzdGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfY3JlYXRlX21zZyhzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVpbnQzMl90IGhhbmRsZQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcjsK
Pgo+ICAgICAgICAgaWIgPSAmam9iLT5pYnNbMF07Cj4gLSAgICAgICBkdW1teSA9IGliLT5ncHVf
YWRkciArIDEwMjQ7Cj4gKyAgICAgICBkdW1teSA9IHJpbmctPmFkZXYtPnZjbi5lbmNfc2Vzc2lv
bl9ncHVfYWRkcjsKPgo+ICAgICAgICAgaWItPmxlbmd0aF9kdyA9IDA7Cj4gICAgICAgICBpYi0+
cHRyW2liLT5sZW5ndGhfZHcrK10gPSAweDAwMDAwMDE4Owo+IEBAIC0yODIsNyArMjgyLDcgQEAg
c3RhdGljIGludCB1dmRfdjZfMF9lbmNfZ2V0X2Rlc3Ryb3lfbXNnKHN0cnVjdCBhbWRncHVfcmlu
ZyAqcmluZywKPiAgICAgICAgICAgICAgICAgcmV0dXJuIHI7Cj4KPiAgICAgICAgIGliID0gJmpv
Yi0+aWJzWzBdOwo+IC0gICAgICAgZHVtbXkgPSBpYi0+Z3B1X2FkZHIgKyAxMDI0Owo+ICsgICAg
ICAgZHVtbXkgPSByaW5nLT5hZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIgKyAxMjggKiBQ
QUdFX1NJWkU7Cj4KPiAgICAgICAgIGliLT5sZW5ndGhfZHcgPSAwOwo+ICAgICAgICAgaWItPnB0
cltpYi0+bGVuZ3RoX2R3KytdID0gMHgwMDAwMDAxODsKPiBAQCAtMzI2LDkgKzMyNiwxNiBAQCBz
dGF0aWMgaW50IHV2ZF92Nl8wX2VuY19nZXRfZGVzdHJveV9tc2coc3RydWN0IGFtZGdwdV9yaW5n
ICpyaW5nLAo+ICAgKi8KPiAgc3RhdGljIGludCB1dmRfdjZfMF9lbmNfcmluZ190ZXN0X2liKHN0
cnVjdCBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0KQo+ICB7Cj4gKyAgICAgICBzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHJpbmctPmFkZXY7Cj4gICAgICAgICBzdHJ1Y3QgZG1h
X2ZlbmNlICpmZW5jZSA9IE5VTEw7Cj4gICAgICAgICBsb25nIHI7Cj4KPiArICAgICAgIHIgPSBh
bWRncHVfYm9fY3JlYXRlX2tlcm5lbChhZGV2LCAyICogMTI4LCBQQUdFX1NJWkUsCgpJIGp1c3Qg
c2VudCBhIHNpbWlsYXIgcGF0Y2ggc2V0LiAgTm90ZSB0aGF0IHRoZSBhbWRncHVfYm8gZnVuY3Rp
b25zCnRha2VzIHRoZSBzaXplIGluIGJ5dGVzLCBzbyB0aGlzIGlzIG9ubHkgMjU2IGJ5dGVzICh3
ZWxsLCBwcm9iYWJseSA0SwpkdWUgdG8gcGFnZSBhbGlnbm1lbnQpLiAgSSB0aGluayBWQ04gYWxz
byBuZWVkcyB0aGlzIGZpeC4gIERvIHRoZQpjcmVhdGUgYW5kIGRlc3Ryb3kgbmVlZCB0byByZWZl
cmVuY2UgdGhlIHNhbWUgc2Vzc2lvbiBpbmZvPwoKQWxleAoKPiArICAgICAgICAgICAgICAgICAg
ICAgICBBTURHUFVfR0VNX0RPTUFJTl9WUkFNLCAmYWRldi0+dmNuLmVuY19zZXNzaW9uX2JvLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICZhZGV2LT52Y24uZW5jX3Nlc3Npb25fZ3B1X2FkZHIs
ICZhZGV2LT52Y24uZW5jX3Nlc3Npb25fY3B1X2FkZHIpOwo+ICsgICAgICAgaWYgKHIpCj4gKyAg
ICAgICAgICAgICAgIHJldHVybiByOwo+ICsKPiAgICAgICAgIHIgPSB1dmRfdjZfMF9lbmNfZ2V0
X2NyZWF0ZV9tc2cocmluZywgMSwgTlVMTCk7Cj4gICAgICAgICBpZiAocikKPiAgICAgICAgICAg
ICAgICAgZ290byBlcnJvcjsKPiBAQCAtMzQ1LDYgKzM1MiwxMSBAQCBzdGF0aWMgaW50IHV2ZF92
Nl8wX2VuY19yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBsb25nIHRpbWVv
dXQpCj4KPiAgZXJyb3I6Cj4gICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiArCj4gKyAg
ICAgICBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9ibywKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmFkZXYtPnZjbi5lbmNfc2Vzc2lvbl9n
cHVfYWRkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZvaWQgKiopJmFk
ZXYtPnZjbi5lbmNfc2Vzc2lvbl9jcHVfYWRkcik7Cj4gKwo+ICAgICAgICAgcmV0dXJuIHI7Cj4g
IH0KPgo+IC0tCj4gMi43LjQKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
