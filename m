Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9273C1D3C
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 10:35:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B746E05C;
	Mon, 30 Sep 2019 08:35:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780836E05C
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 08:35:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so10213521wrs.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 01:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=80rDqksdQseUIRkvNw/R+dzvRN2LyULxk/qZpGApIks=;
 b=KD0Ot/6EUrpr7hEkWwaPOrFKV0nrWGE3EKO1fTBuhJIPv/+JmE1ZSRjnwpUYwVN7ib
 sEpphU2Numjt1D1LVLW520/+s+L21J3jKsj5l7bosFqEUZ2RDmUnNYJ3RcuaboIJxpmm
 tvDMiRfyf4EuaXS3mio9BnVbn70TL2+pETrKRG7uLLXDmz4FaMiZL7zrVPGXJAMFNDbS
 Dsz+OD9y4t8SLv7EiEDNJZenTQ2oZ0hQ1gmhVtY4D9LbB3qa6FSPZegh2VjhHj1q2Q7B
 Qe+slTUacylDsc/Myy2qKobvnif9e9a7PM/jpuY4Ax5LyeEVR+AiHiCHhd7tyJ0gczV2
 +hcA==
X-Gm-Message-State: APjAAAVHSkObWH88YgjPstXFHKO2p1Us/AsGkcxARGaxy2ab3FWLoSSf
 BkUckvGbhr7lWeUD3YM+7W0=
X-Google-Smtp-Source: APXvYqxGgDknt9vFsJUBXXsS+Y3xRY3gm3oH/rtkRi3U5XZ7gCClDFZJhQb6jFRTCpIqLAscg6PVtA==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr13286301wrq.141.1569832529143; 
 Mon, 30 Sep 2019 01:35:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v6sm33266464wma.24.2019.09.30.01.35.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 01:35:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/amdgpu: recreate retired page's bo if vram get
 lost in gpu reset
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
References: <20190930031938.10982-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5baa91ba-73b9-6d49-4a03-51c4acb2505c@gmail.com>
Date: Mon, 30 Sep 2019 10:35:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930031938.10982-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=80rDqksdQseUIRkvNw/R+dzvRN2LyULxk/qZpGApIks=;
 b=E7ajmGrl6+pQ8DIdyWUhzki/gu3X4tWSC0IVSbTGWgAavfOX1nFBxTsCJAlXTWUHd3
 klg3NzooRdMNRUv7IuJGyVXvQPbxtcu6btodpx2kltSSER42dQwLuMZzfSlfphKRcAxg
 +l1u8DPlNmvGKc0Bh+gJhCJFd4lEk+5MWyTfgpuUdjQJXeypmcFGFUClJQgXJdwuV20F
 hpp/mA4U8pAgatw0+Ju1KH4xoZYPLs8PjkYU7Cu6Z6W+hVBdrpTDM96C9tCXGlnD2Y13
 hhfqKuOdOhXINTXrgy0IZh9XdDnJJ2JE2ATxeFSNXGYOuxPvrmGdUr2JOuqWU3teJ+VL
 9PsQ==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMzAuMDkuMTkgdW0gMDU6MTkgc2NocmllYiBaaG91MSwgVGFvOgo+IHRoZSBpbmZvIG9mIHJl
dGlyZWQgcGFnZSdzIGJvIG1heSBiZSBsb3N0IGlmIHZyYW0gbG9zdCBpcyBlbmNvdW50ZXJlZAo+
IGluIGdwdSByZXNldCAoZ3B1IHBhZ2UgdGFibGUgaW4gdnJhbSBtYXkgYmUgbG9zdCksIGZvcmNl
IHRvIHJlY3JlYXRlCj4gYWxsIGJvcwo+Cj4gdjI6IHNpbXBsaWZ5IE5VTEwgcG9pbnRlciBjaGVj
awo+ICAgICAgYWRkIG1vcmUgY29tbWVudHMKClJlcGVhdGluZyBvbiB0aGUgdjIgb2YgdGhlIHBh
dGNoIHNldCwgdGhpcyBpcyBjb21wbGV0ZSBub25zZW5zZS4KCldoZW4gVlJBTSBpcyBsb3N0IHRo
ZSBCT3MgYW5kIHRoZWlyIHJlc2VydmF0aW9uIHN0aWxsIGV4aXRzLCBvbmx5IHRoZSAKY29udGVu
dCBpcyBsb3N0IGJlY2F1c2UgdGhlIE1DIGlzIGhhcyBiZWVuIHJlc2V0dGVkLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPgo+IFNpZ25lZC1vZmYtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNv
bT4KPiBTdWdnZXN0ZWQtYnk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBh
bWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIHwgIDEgKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jICAg
IHwgNDggKysrKysrKysrKysrKysrKysrKysrKwo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3Jhcy5oICAgIHwgIDEgKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4g
aW5kZXggNjI5NTUxNTY2NTNjLi5hODlmNmQwNTNiM2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTM2NzUsNiArMzY3NSw3IEBAIHN0YXRp
YyBpbnQgYW1kZ3B1X2RvX2FzaWNfcmVzZXQoc3RydWN0IGFtZGdwdV9oaXZlX2luZm8gKmhpdmUs
Cj4gICAJCQkJaWYgKHZyYW1fbG9zdCkgewo+ICAgCQkJCQlEUk1fSU5GTygiVlJBTSBpcyBsb3N0
IGR1ZSB0byBHUFUgcmVzZXQhXG4iKTsKPiAgIAkJCQkJYW1kZ3B1X2luY192cmFtX2xvc3QodG1w
X2FkZXYpOwo+ICsJCQkJCWFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQodG1wX2FkZXYpOwo+ICAg
CQkJCX0KPiAgIAo+ICAgCQkJCXIgPSBhbWRncHVfZ3R0X21ncl9yZWNvdmVyKAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBpbmRleCA0ODY1NjhkZWQ2ZDYuLjNmMmEy
ZjEzZTRjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
cmFzLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMKPiBA
QCAtMTU3Myw2ICsxNTczLDU0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Jhc19yZWNvdmVyeV9maW5p
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4g
Kwo+ICsvKgo+ICsgKiB0aGUgaW5mbyBvZiByZXRpcmVkIHBhZ2UncyBibyBtYXkgYmUgbG9zdCBp
ZiB2cmFtIGxvc3QgaXMgZW5jb3VudGVyZWQKPiArICogaW4gZ3B1IHJlc2V0IChncHUgcGFnZSB0
YWJsZSBpbiB2cmFtIG1heSBiZSBsb3N0KSwgZm9yY2UgdG8gcmVjcmVhdGUKPiArICogYWxsIGJv
cwo+ICsgKi8KPiArdm9pZCBhbWRncHVfcmFzX3JlY292ZXJ5X3Jlc2V0KHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICt7Cj4gKwlzdHJ1Y3QgYW1kZ3B1X3JhcyAqY29uID0gYW1kZ3B1X3Jh
c19nZXRfY29udGV4dChhZGV2KTsKPiArCXN0cnVjdCByYXNfZXJyX2hhbmRsZXJfZGF0YSAqZGF0
YTsKPiArCXVpbnQ2NF90IGJwOwo+ICsJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBOVUxMOwo+ICsJ
aW50IGk7Cj4gKwo+ICsJaWYgKCFjb24gfHwgIWNvbi0+ZWhfZGF0YSkKPiArCQlyZXR1cm47Cj4g
Kwo+ICsJLyogTm90ZTogSXQncyBjYWxsZWQgaW4gZ3B1IHJlc2V0LCByZWNvdmVyeV9sb2NrIG1h
eSBiZSBhY3F1aXJlZCBiZWZvcmUKPiArCSAqIGdwdSByZXNldC4gVGhlIGZvbGxvd2luZyBjb2Rl
IGlzIG91dCBvZiBwcm90ZWN0IG9mIGNvbi0+cmVjb3ZlcnlfbG9jawo+ICsJICogaW4gY2FzZSBv
ZiBkZWFkbG9jayBhbmQgYnBzX2JvIHNob3VsZCBiZSByZWNyZWF0ZWQgKGlmIHN1Y2Nlc3NmdWxs
eSkKPiArCSAqIHdoZXRoZXIgcmVjb3ZlcnlfbG9jayBpcyBsb2NrZWQgb3Igbm90Lgo+ICsJICog
V2UgYXNzdW1lIHRoZXJlIGlzIG5vIG90aGVyIHJhcyByZWNvdmVyeSBvcGVyYXRpb24gc2ltdWx0
YW5lb3VzIGR1cmluZwo+ICsJICogZ3B1IHJlc2V0Lgo+ICsJICovCj4gKwlkYXRhID0gY29uLT5l
aF9kYXRhOwo+ICsJLyogZm9yY2UgdG8gcmVzZXJ2ZSBhbGwgcmV0aXJlZCBwYWdlIGFnYWluICov
Cj4gKwlkYXRhLT5sYXN0X3Jlc2VydmVkID0gMDsKPiArCj4gKwlmb3IgKGkgPSBkYXRhLT5sYXN0
X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewo+ICsJCWJwID0gZGF0YS0+YnBzW2ld
LnJldGlyZWRfcGFnZTsKPiArCj4gKwkJLyogVGhlcmUgYXJlIHRocmVlIGNhc2VzIG9mIHJlc2Vy
dmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9yZWQ6Cj4gKwkJICogMSkgYSByYXMgYmFkIHBhZ2UgaGFz
IGJlZW4gYWxsb2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOwo+ICsJCSAqIDIpIGEgcmFzIGJhZCBw
YWdlIGhhcyBiZWVuIHJlc2VydmVkIChkdXBsaWNhdGUgZXJyb3IgaW5qZWN0aW9uCj4gKwkJICog
ICAgZm9yIG9uZSBwYWdlKTsKPiArCQkgKiAzKSBibyBpbmZvIGlzbid0IGxvc3QgaW4gZ3B1IHJl
c2V0Cj4gKwkJICovCj4gKwkJaWYgKGFtZGdwdV9ib19jcmVhdGVfa2VybmVsX2F0KGFkZXYsIGJw
IDw8IEFNREdQVV9HUFVfUEFHRV9TSElGVCwKPiArCQkJCQkgICAgICAgQU1ER1BVX0dQVV9QQUdF
X1NJWkUsCj4gKwkJCQkJICAgICAgIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0sCj4gKwkJCQkJICAg
ICAgICZibywgTlVMTCkpCj4gKwkJCURSTV9OT1RFKCJSQVMgTk9URTogcmVjcmVhdGUgYm8gZm9y
IHJldGlyZWQgcGFnZSAweCVsbHggZmFpbFxuIiwgYnApOwo+ICsJCWVsc2UKPiArCQkJZGF0YS0+
YnBzX2JvW2ldID0gYm87Cj4gKwkJZGF0YS0+bGFzdF9yZXNlcnZlZCA9IGkgKyAxOwo+ICsJCWJv
ID0gTlVMTDsKPiArCX0KPiArfQo+ICAgLyogcmVjb3ZlcnkgZW5kICovCj4gICAKPiAgIC8qIHJl
dHVybiAwIGlmIHJhcyB3aWxsIHJlc2V0IGdwdSBhbmQgcmVwb3N0LiovCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+IGluZGV4IGY4MGZkMzQyOGM5OC4uN2E2MDZkM2Jl
ODA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+IEBAIC00
NzksNiArNDc5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1kZ3B1X3Jhc19pc19zdXBwb3J0ZWQo
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICB9Cj4gICAKPiAgIGludCBhbWRncHVfcmFz
X3JlY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICt2b2lkIGFtZGdw
dV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpOwo+ICAgaW50
IGFtZGdwdV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAo+ICAgCQl1bnNpZ25lZCBpbnQgYmxvY2spOwo+ICAgCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
