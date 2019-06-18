Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9449BBD
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2019 10:10:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11546E10E;
	Tue, 18 Jun 2019 08:10:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B1E86E10E
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 08:10:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id c2so12837140wrm.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 18 Jun 2019 01:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7YqehQTDIrlbmRgTp/X92WfINMVnbeiPgtWvXSI8HLE=;
 b=cNo+uqxKvAeOnQrEVVvQNfve38NThaEKAW9YBX7M20ht2/zg/iafoXoANL7k1GukBE
 9Bq4O4grhCoEcfFcH9pQyFbhfBaGT8ej4zcDGe6U8SILubA0NRHCl1MoPNMnH+zPiuTL
 Cg21tm4UeRzkv9SY+xHsC5/Yi9Mwbwjqrm+XzzG8XB+DrSpvdHcuBnmkaPhNQUmra/qI
 Eh4zQHT5Uf4yxkqBlbSJpqZ+VKNMXVcKVCIH4bCgHwnF1zgZZUfPAWJJruX+CbUzwIjr
 Cv9VSBJtgafB4k/eWp4Xh4F+QMN9t+bh9HZwyEzRX3siE52G/k6uU8/KdCitMh35oXnx
 JQxg==
X-Gm-Message-State: APjAAAV9mlNouTYvN+2dSMGDZFNKj4upXlybopBUcnb/H7vSeazhfS9C
 v6J5cWSS4AtKVjdceYr8ca8=
X-Google-Smtp-Source: APXvYqwG4yT8eOp6TMHNQ7ZZurFAWCJweJ7B5WGkfK3RnFCBVhid7+SQJy3R2kpyYXjQu/rvabFm3w==
X-Received: by 2002:a5d:4ac1:: with SMTP id y1mr2855632wrs.183.1560845415142; 
 Tue, 18 Jun 2019 01:10:15 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l8sm39082802wrg.40.2019.06.18.01.10.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 01:10:14 -0700 (PDT)
Subject: Re: [PATCH 268/459] drm/amdgpu/gfx10: remove static GDS, GWS and OA
 allcoation
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20190617193106.18231-1-alexander.deucher@amd.com>
 <20190617193106.18231-69-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e08035ef-6764-729f-c065-5ca4d5a81c9f@gmail.com>
Date: Tue, 18 Jun 2019 10:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617193106.18231-69-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7YqehQTDIrlbmRgTp/X92WfINMVnbeiPgtWvXSI8HLE=;
 b=c7i5u3mw+b3vocJ3Mzqz25rYPSHKolenIlgFd17t8zrIRz0uF4y/nay33ozvXjI2BB
 BP5WgaEpc/dpb+5gTNECYCIwUW3u5TTVOlPDJq0Rqwuq1Q/QNkZGmr7xBospq5kjJtfz
 /Da9HdiJI5L1qkJ+m+UrZecTnzk7QEOfZ3H+bmWCddPKR1PZz/Bo9KEDrYR4cCcr2FHK
 bgclOANReU1EPcbmZVWx9r7sCOD5qoD9rC5USS2DM4i3txdwOEjcE1yqibsY9xczjVWy
 +xWnhqym+ufWqpIy0cPd7NEWX15UC+Q17wtp5HdBt9oirzXSDFLqg2sOBsBlqpdjCqK9
 P2vA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTcuMDYuMTkgdW0gMjE6MzAgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gRnJvbTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogSGF3a2lu
ZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KClNpbmNlIHRoZSBmaWVsZHMgd2hlcmUg
cmVtb3ZlZCB0aGlzIHNob3VsZCBtb3N0IGxpa2VseSBiZSBzcXVhc2hlZCBpbnRvIAp0aGUgb3Jp
Z2luYWwgY29tbWl0IGFkZGluZyB0aGUgY29kZSwgb3Igb3RoZXJ3aXNlIGV2ZXJ5dGhpbmcgaW4g
YmV0d2VlbiAKd29uJ3QgY29tcGlsZSBhbnkgbW9yZS4KCkNocmlzdGlhbi4KCj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyB8IDU3ICsrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNDYgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4
X3YxMF8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+IGluZGV4
IGY2ZWE2OWE0MjMwNi4uOTU5NTA2NWUyZDNlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3YxMF8wLmMKPiBAQCAtMTIzMiwyNSArMTIzMiw2IEBAIHN0YXRpYyBpbnQgZ2Z4X3Yx
MF8wX3N3X2luaXQodm9pZCAqaGFuZGxlKQo+ICAgCWlmIChyKQo+ICAgCQlyZXR1cm4gcjsKPiAg
IAo+IC0JLyogcmVzZXJ2ZSBHRFMsIEdXUyBhbmQgT0EgcmVzb3VyY2UgZm9yIGdmeCAqLwo+IC0J
ciA9IGFtZGdwdV9ib19jcmVhdGVfa2VybmVsKGFkZXYsIGFkZXYtPmdkcy5tZW0uZ2Z4X3BhcnRp
dGlvbl9zaXplLAo+IC0JCQkJICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01BSU5fR0RTLAo+
IC0JCQkJICAgICZhZGV2LT5nZHMuZ2RzX2dmeF9ibywgTlVMTCwgTlVMTCk7Cj4gLQlpZiAocikK
PiAtCQlyZXR1cm4gcjsKPiAtCj4gLQlyID0gYW1kZ3B1X2JvX2NyZWF0ZV9rZXJuZWwoYWRldiwg
YWRldi0+Z2RzLmd3cy5nZnhfcGFydGl0aW9uX3NpemUsCj4gLQkJCQkgICAgUEFHRV9TSVpFLCBB
TURHUFVfR0VNX0RPTUFJTl9HV1MsCj4gLQkJCQkgICAgJmFkZXYtPmdkcy5nd3NfZ2Z4X2JvLCBO
VUxMLCBOVUxMKTsKPiAtCWlmIChyKQo+IC0JCXJldHVybiByOwo+IC0KPiAtCXIgPSBhbWRncHVf
Ym9fY3JlYXRlX2tlcm5lbChhZGV2LCBhZGV2LT5nZHMub2EuZ2Z4X3BhcnRpdGlvbl9zaXplLAo+
IC0JCQkJICAgIFBBR0VfU0laRSwgQU1ER1BVX0dFTV9ET01BSU5fT0EsCj4gLQkJCQkgICAgJmFk
ZXYtPmdkcy5vYV9nZnhfYm8sIE5VTEwsIE5VTEwpOwo+IC0JaWYgKHIpCj4gLQkJcmV0dXJuIHI7
Cj4gLQo+ICAgCS8qIGFsbG9jYXRlIHZpc2libGUgRkIgZm9yIHJsYyBhdXRvLWxvYWRpbmcgZncg
Ki8KPiAgIAlpZiAoYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1JM
Q19CQUNLRE9PUl9BVVRPKSB7Cj4gICAJCXIgPSBnZnhfdjEwXzBfcmxjX2JhY2tkb29yX2F1dG9s
b2FkX2J1ZmZlcl9pbml0KGFkZXYpOwo+IEBAIC0xMjkxLDEwICsxMjcyLDYgQEAgc3RhdGljIGlu
dCBnZnhfdjEwXzBfc3dfZmluaSh2b2lkICpoYW5kbGUpCj4gICAJaW50IGk7Cj4gICAJc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFtZGdwdV9kZXZpY2UgKiloYW5kbGU7Cj4g
ICAKPiAtCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z2RzLm9hX2dmeF9ibywgTlVMTCwg
TlVMTCk7Cj4gLQlhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmFkZXYtPmdkcy5nd3NfZ2Z4X2JvLCBO
VUxMLCBOVUxMKTsKPiAtCWFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+Z2RzLmdkc19nZnhf
Ym8sIE5VTEwsIE5VTEwpOwo+IC0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9n
ZnhfcmluZ3M7IGkrKykKPiAgIAkJYW1kZ3B1X3JpbmdfZmluaSgmYWRldi0+Z2Z4LmdmeF9yaW5n
W2ldKTsKPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+Z2Z4Lm51bV9jb21wdXRlX3JpbmdzOyBp
KyspCj4gQEAgLTQ1MjYsNyArNDUwMyw3IEBAIHN0YXRpYyB2b2lkIGdmeF92MTBfMF9yaW5nX2Vt
aXRfZGVfbWV0YShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGJvb2wgcmVzdW1lKQo+ICAgCWlu
dCBjbnQ7Cj4gICAKPiAgIAljc2FfYWRkciA9IGFtZGdwdV9jc2FfdmFkZHIocmluZy0+YWRldik7
Cj4gLQlnZHNfYWRkciA9IEFMSUdOKGNzYV9hZGRyICsgQU1ER1BVX0NTQV9TSVpFIC0gYWRldi0+
Z2RzLm1lbS50b3RhbF9zaXplLAo+ICsJZ2RzX2FkZHIgPSBBTElHTihjc2FfYWRkciArIEFNREdQ
VV9DU0FfU0laRSAtIGFkZXYtPmdkcy5nZHNfc2l6ZSwKPiAgIAkJCSBQQUdFX1NJWkUpOwo+ICAg
CWRlX3BheWxvYWQuZ2RzX2JhY2t1cF9hZGRybG8gPSBsb3dlcl8zMl9iaXRzKGdkc19hZGRyKTsK
PiAgIAlkZV9wYXlsb2FkLmdkc19iYWNrdXBfYWRkcmhpID0gdXBwZXJfMzJfYml0cyhnZHNfYWRk
cik7Cj4gQEAgLTUxMTksMjkgKzUwOTYsMTcgQEAgc3RhdGljIHZvaWQgZ2Z4X3YxMF8wX3NldF9y
bGNfZnVuY3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gICBzdGF0aWMgdm9pZCBnZnhf
djEwXzBfc2V0X2dkc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgewo+ICAg
CS8qIGluaXQgYXNpYyBnZHMgaW5mbyAqLwo+IC0JYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplID0g
UlJFRzMyX1NPQzE1KEdDLCAwLCBtbUdEU19WTUlEMF9TSVpFKTsKPiAtCWFkZXYtPmdkcy5nd3Mu
dG90YWxfc2l6ZSA9IDY0Owo+IC0JYWRldi0+Z2RzLm9hLnRvdGFsX3NpemUgPSAxNjsKPiAtCj4g
LQlpZiAoYWRldi0+Z2RzLm1lbS50b3RhbF9zaXplID09IDY0ICogMTAyNCkgewo+IC0JCWFkZXYt
Pmdkcy5tZW0uZ2Z4X3BhcnRpdGlvbl9zaXplID0gNDA5NjsKPiAtCQlhZGV2LT5nZHMubWVtLmNz
X3BhcnRpdGlvbl9zaXplID0gNDA5NjsKPiAtCj4gLQkJYWRldi0+Z2RzLmd3cy5nZnhfcGFydGl0
aW9uX3NpemUgPSA0Owo+IC0JCWFkZXYtPmdkcy5nd3MuY3NfcGFydGl0aW9uX3NpemUgPSA0Owo+
IC0KPiAtCQlhZGV2LT5nZHMub2EuZ2Z4X3BhcnRpdGlvbl9zaXplID0gNDsKPiAtCQlhZGV2LT5n
ZHMub2EuY3NfcGFydGl0aW9uX3NpemUgPSAxOwo+IC0JfSBlbHNlIHsKPiAtCQlhZGV2LT5nZHMu
bWVtLmdmeF9wYXJ0aXRpb25fc2l6ZSA9IDEwMjQ7Cj4gLQkJYWRldi0+Z2RzLm1lbS5jc19wYXJ0
aXRpb25fc2l6ZSA9IDEwMjQ7Cj4gLQo+IC0JCWFkZXYtPmdkcy5nd3MuZ2Z4X3BhcnRpdGlvbl9z
aXplID0gMTY7Cj4gLQkJYWRldi0+Z2RzLmd3cy5jc19wYXJ0aXRpb25fc2l6ZSA9IDE2Owo+IC0K
PiAtCQlhZGV2LT5nZHMub2EuZ2Z4X3BhcnRpdGlvbl9zaXplID0gNDsKPiAtCQlhZGV2LT5nZHMu
b2EuY3NfcGFydGl0aW9uX3NpemUgPSA0Owo+ICsJc3dpdGNoIChhZGV2LT5hc2ljX3R5cGUpIHsK
PiArCWNhc2UgQ0hJUF9OQVZJMTA6Cj4gKwkJYWRldi0+Z2RzLmdkc19zaXplID0gMHgxMDAwMDsK
PiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJYWRldi0+Z2RzLmdkc19zaXplID0gMHgxMDAw
MDsKPiArCQlicmVhazsKPiAgIAl9Cj4gKwo+ICsJYWRldi0+Z2RzLmd3c19zaXplID0gNjQ7Cj4g
KwlhZGV2LT5nZHMub2Ffc2l6ZSA9IDE2Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCBnZnhf
djEwXzBfc2V0X3VzZXJfd2dwX2luYWN0aXZlX2JpdG1hcF9wZXJfc2goc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
