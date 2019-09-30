Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD12C1D30
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 10:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABEF6E1CE;
	Mon, 30 Sep 2019 08:31:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007B56E1CE
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 08:31:40 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 5so12333841wmg.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 01:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J91So1zQNoQSomgkW3N6kv2d18V57tOzUDdK7g9oUSI=;
 b=TcdPRUbVqGqgI3Ix+V2IO3W0sgilvPL5iuBv+kGbABBA8MGjqP+FItFSg8rAtmiA1s
 SLq0vrnYrn0F1XS88OSOUiXiZw8su//I1RRe3btV8OXWWkWZbdNGhStUSmhiCHII/GmD
 J9Bid4fSCcZndhTzwNf4bQmL0q9HR0TxBcUhM5Fx2YS3R/JIG/9DRmta54tJzMD5v42Q
 6uAejlJlPRyW225w4MRG5dZyAK+92krtRZDUCSQlTlJHc2c0oTJdhD+MbT5gov06hE7g
 pauMMi1xnXobfgOlm9QXa6dAajLQmsOFr54/J6PWTdcLzaBPiVGodySaG9xdtB0ix19a
 /XwQ==
X-Gm-Message-State: APjAAAU5vBCFPmaw5ZMKahAoUd/wSYS1WfgIdtvwSINlOGwipVXa2ZWy
 47S+TOdZ9+JiPrIMfA/3roE=
X-Google-Smtp-Source: APXvYqyshrEySV7oFlotTsMSjRMT58ET8blxjM1PfZkqYO9NfwLw5tZs9/yO1YFEs0xdGfzYWXs4eQ==
X-Received: by 2002:a1c:2645:: with SMTP id m66mr15532037wmm.33.1569832299625; 
 Mon, 30 Sep 2019 01:31:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x129sm19056518wmg.8.2019.09.30.01.31.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Sep 2019 01:31:38 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: recreate retired page's bo if vram get lost
 in gpu reset
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Chen, Guchun" <Guchun.Chen@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>
References: <20190929063438.10827-1-tao.zhou1@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d02d58e9-b98d-cfd7-40bc-271e0e55616e@gmail.com>
Date: Mon, 30 Sep 2019 10:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190929063438.10827-1-tao.zhou1@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J91So1zQNoQSomgkW3N6kv2d18V57tOzUDdK7g9oUSI=;
 b=aLXCSZejTiEYntMPk1L9ccH5eePYt+kM50bvkVMkUQEnLLnq8+palhO7Nyw8ONi+e6
 VvKoKY191n5yQ0doQb1Z2g1zhyfZQtmvFmlgoS6yov+DKnfOx9eIKD20kvValGfixvek
 npehfBs5TJpsSevqLzWlgE1BGjAdZ4MsCtKQC20dUJUAj2Hxt30aH4QK7sjfPkbrwY6L
 RKLQd3hiHxz6y0p2ZlmpdOo2DK9lJMMpRkPDhFWOy88mu+yeoWKiHPB2lhqK+BGLnFpt
 Ddk7W4NLGNA80i0ZvhitUYSnHYG6qBTAPQ9urNv3nEQbS/4BpYP5arnuzZ/35wasiUaU
 jXww==
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

QW0gMjkuMDkuMTkgdW0gMDg6MzUgc2NocmllYiBaaG91MSwgVGFvOgo+IHRoZSBpbmZvIG9mIHJl
dGlyZWQgcGFnZSdzIGJvIG1heSBiZSBsb3N0IGlmIHZyYW0gbG9zdCBpcyBlbmNvdW50ZXJlZAo+
IGluIGdwdSByZXNldCAoZ3B1IHBhZ2UgdGFibGUgaW4gdnJhbSBtYXkgYmUgbG9zdCksIGZvcmNl
IHRvIHJlY3JlYXRlCj4gYWxsIGJvcwoKTkFLLCB0aGF0IGlzIGNvbXBsZXRlIG5vbnNlbnNlLgoK
V2hlbiBWUkFNIGlzIGxvc3QgdGhlIGNvbnRlbnQgb2YgQk9zIGluIFZSQU0gaXMgbG9zdCwgYnV0
IHRoZSBCT3MgaXRzZWxmIAphcmUgc3RpbGwgdGhlcmUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+
Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgo+IFN1Z2dlc3Rl
ZC1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCAgMSArCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFzLmMgICAgfCA0NCArKysrKysr
KysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmFz
LmggICAgfCAgMSArCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCA2Mjk1NTE1
NjY1M2MuLmE4OWY2ZDA1M2IzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiBAQCAtMzY3NSw2ICszNjc1LDcgQEAgc3RhdGljIGludCBhbWRncHVf
ZG9fYXNpY19yZXNldChzdHJ1Y3QgYW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwKPiAgIAkJCQlpZiAo
dnJhbV9sb3N0KSB7Cj4gICAJCQkJCURSTV9JTkZPKCJWUkFNIGlzIGxvc3QgZHVlIHRvIEdQVSBy
ZXNldCFcbiIpOwo+ICAgCQkJCQlhbWRncHVfaW5jX3ZyYW1fbG9zdCh0bXBfYWRldik7Cj4gKwkJ
CQkJYW1kZ3B1X3Jhc19yZWNvdmVyeV9yZXNldCh0bXBfYWRldik7Cj4gICAJCQkJfQo+ICAgCj4g
ICAJCQkJciA9IGFtZGdwdV9ndHRfbWdyX3JlY292ZXIoCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwo+IGluZGV4IDQ4NjU2OGRlZDZkNi4uMWIzYjU5N2FhOTczIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC0xNTczLDYgKzE1
NzMsNTAgQEAgc3RhdGljIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2Zpbmkoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4gICAKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiArCj4gKy8qCj4gKyAq
IHRoZSBpbmZvIG9mIHJldGlyZWQgcGFnZSdzIGJvIG1heSBiZSBsb3N0IGlmIHZyYW0gbG9zdCBp
cyBlbmNvdW50ZXJlZAo+ICsgKiBpbiBncHUgcmVzZXQgKGdwdSBwYWdlIHRhYmxlIGluIHZyYW0g
bWF5IGJlIGxvc3QpLCBmb3JjZSB0byByZWNyZWF0ZQo+ICsgKiBhbGwgYm9zCj4gKyAqLwo+ICt2
b2lkIGFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
Cj4gK3sKPiArCXN0cnVjdCBhbWRncHVfcmFzICpjb24gPSBhbWRncHVfcmFzX2dldF9jb250ZXh0
KGFkZXYpOwo+ICsJc3RydWN0IHJhc19lcnJfaGFuZGxlcl9kYXRhICpkYXRhOwo+ICsJdWludDY0
X3QgYnA7Cj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IE5VTEw7Cj4gKwlpbnQgaTsKPiArCj4g
KwlpZiAoIWNvbikKPiArCQlyZXR1cm47Cj4gKwo+ICsJZGF0YSA9IGNvbi0+ZWhfZGF0YTsKPiAr
CWlmICghZGF0YSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJLyogZm9yY2UgdG8gcmVzZXJ2ZSBhbGwg
cmV0aXJlZCBwYWdlIGFnYWluICovCj4gKwlkYXRhLT5sYXN0X3Jlc2VydmVkID0gMDsKPiArCj4g
Kwlmb3IgKGkgPSBkYXRhLT5sYXN0X3Jlc2VydmVkOyBpIDwgZGF0YS0+Y291bnQ7IGkrKykgewo+
ICsJCWJwID0gZGF0YS0+YnBzW2ldLnJldGlyZWRfcGFnZTsKPiArCj4gKwkJLyogVGhlcmUgYXJl
IHRocmVlIGNhc2VzIG9mIHJlc2VydmUgZXJyb3Igc2hvdWxkIGJlIGlnbm9yZWQ6Cj4gKwkJICog
MSkgYSByYXMgYmFkIHBhZ2UgaGFzIGJlZW4gYWxsb2NhdGVkICh1c2VkIGJ5IHNvbWVvbmUpOwo+
ICsJCSAqIDIpIGEgcmFzIGJhZCBwYWdlIGhhcyBiZWVuIHJlc2VydmVkIChkdXBsaWNhdGUgZXJy
b3IgaW5qZWN0aW9uCj4gKwkJICogICAgZm9yIG9uZSBwYWdlKTsKPiArCQkgKiAzKSBibyBpbmZv
IGlzbid0IGxvc3QgaW4gZ3B1IHJlc2V0Cj4gKwkJICovCj4gKwkJaWYgKGFtZGdwdV9ib19jcmVh
dGVfa2VybmVsX2F0KGFkZXYsIGJwIDw8IEFNREdQVV9HUFVfUEFHRV9TSElGVCwKPiArCQkJCQkg
ICAgICAgQU1ER1BVX0dQVV9QQUdFX1NJWkUsCj4gKwkJCQkJICAgICAgIEFNREdQVV9HRU1fRE9N
QUlOX1ZSQU0sCj4gKwkJCQkJICAgICAgICZibywgTlVMTCkpCj4gKwkJCURSTV9OT1RFKCJSQVMg
Tk9URTogcmVjcmVhdGUgYm8gZm9yIHJldGlyZWQgcGFnZSAweCVsbHggZmFpbFxuIiwgYnApOwo+
ICsJCWVsc2UKPiArCQkJZGF0YS0+YnBzX2JvW2ldID0gYm87Cj4gKwkJZGF0YS0+bGFzdF9yZXNl
cnZlZCA9IGkgKyAxOwo+ICsJCWJvID0gTlVMTDsKPiArCX0KPiArfQo+ICAgLyogcmVjb3Zlcnkg
ZW5kICovCj4gICAKPiAgIC8qIHJldHVybiAwIGlmIHJhcyB3aWxsIHJlc2V0IGdwdSBhbmQgcmVw
b3N0LiovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+IGluZGV4IGY4
MGZkMzQyOGM5OC4uN2E2MDZkM2JlODA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuaAo+IEBAIC00NzksNiArNDc5LDcgQEAgc3RhdGljIGlubGluZSBpbnQgYW1k
Z3B1X3Jhc19pc19zdXBwb3J0ZWQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICB9Cj4g
ICAKPiAgIGludCBhbWRncHVfcmFzX3JlY292ZXJ5X2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2Ug
KmFkZXYpOwo+ICt2b2lkIGFtZGdwdV9yYXNfcmVjb3ZlcnlfcmVzZXQoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYpOwo+ICAgaW50IGFtZGdwdV9yYXNfcmVxdWVzdF9yZXNldF9vbl9ib290KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAgCQl1bnNpZ25lZCBpbnQgYmxvY2spOwo+ICAg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
