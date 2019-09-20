Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CA7B91F4
	for <lists+amd-gfx@lfdr.de>; Fri, 20 Sep 2019 16:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FE36FD0E;
	Fri, 20 Sep 2019 14:29:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDA76FD0E
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 14:29:14 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l3so6977458wru.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 Sep 2019 07:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=XQ9CXAbzgkEN7g/7lSaArOmb+K9TD+HxvJhHAwPBHqg=;
 b=Dupy3sx6HfV/P/NFy/nG6PJUncAbYa9Ntt0F84YoQNmcDuidwF1ncFaCKwA131+bQU
 1wi1wrhjTfno2szN5ycwuJBawNUh8HvtmAcgwsMHXBJsmatOEKMN5BMJdO/kX7Eb7sl9
 X3jiPOmd8hDtKP0EjV43s0lrgipuWbcd8ASnkrZU9PbdDyZRGzhY0lflxD6r432h7utC
 pEPoQwgeuWusp82FRO/hQEZE/LFkKQgY3pCCKaRiIfoBAQFmQkaC66ytpFcUpcJK9xgf
 CLqGZEk+CMKqPjSUk0UYjloraZttticyUu7GUbSIjCBsYM1m7y7b8zDzP7n6od70GvNM
 sRaA==
X-Gm-Message-State: APjAAAU+y+0X7Hn5s+WeckL/T+rC4crZ7NSsKNj4Q1536NSvNOC5JD7Y
 r+uu688bpc2MOZhESYtTkaX8LDq/
X-Google-Smtp-Source: APXvYqxmNM8tjPAqaC2SSlCPyU5xHQ0eZFXrBotI45xA70j9XwgtcS1x4iKpIXNfBc6VWHhQvm7HUQ==
X-Received: by 2002:a5d:6844:: with SMTP id o4mr12897070wrw.188.1568989752659; 
 Fri, 20 Sep 2019 07:29:12 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id i73sm2262401wmg.33.2019.09.20.07.29.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 07:29:12 -0700 (PDT)
Subject: Re: [PATCH v8] drm/amd/amdgpu:Fix compute ring unable to detect hang.
To: Jesse Zhang <zhexi.zhang@amd.com>, amd-gfx@lists.freedesktop.org
References: <1568947109-5924-1-git-send-email-zhexi.zhang@amd.com>
 <1568962637-26150-1-git-send-email-zhexi.zhang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <303126ed-f4f6-1a1d-4217-f7fc4c802c6c@gmail.com>
Date: Fri, 20 Sep 2019 16:29:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568962637-26150-1-git-send-email-zhexi.zhang@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XQ9CXAbzgkEN7g/7lSaArOmb+K9TD+HxvJhHAwPBHqg=;
 b=LLzpeZjtZPt7bFUMxZxtT8AhC71prHWCX0X/izWhCXWfRFtPkUWa3Bd9Bl+oUyRxzO
 7JTUjMf+GBbF2dxXCddGKu3z6K36Z5u8P7I5xNZg+95rNvdQzq/Vj9iWqlLRR/Znf7Fo
 Qi8svc8QgvAiB5/H7dIqpiAIPGPJ7DYKdD9hXf5r2hqYnQ2flythouCt7kwlM+Ekw7z0
 zhgUJZKVQG+aD9Wt3BST3Rv7rW5xJTuObbyLP7Jv9qdwCQZt5gs10qFaHh14czwo5dL4
 4+7XMBslDkOTv/ef/yMUwZ5J/dFGJ5Hj+JD4wTUYyQVCFsadmzP1SH8uqsSeijjW6L83
 1Rlg==
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

QW0gMjAuMDkuMTkgdW0gMDg6NTcgc2NocmllYiBKZXNzZSBaaGFuZzoKPiBXaGVuIGNvbXB1dGUg
ZmVuY2UgZGlkIG5vdCBzaWduYWwsIGNvbXB1dGUgcmluZyBjYW5ub3QgZGV0ZWN0IGhhcmR3YXJl
IGhhbmcKPiBiZWNhdXNlIGl0cyB0aW1lb3V0IHZhbHVlIGlzIHNldCB0byBiZSBpbmZpbml0ZSBi
eSBkZWZhdWx0Lgo+Cj4gSW4gU1ItSU9WIGFuZCBwYXNzdGhyb3VnaCBtb2RlLCBpZiB1c2VyIGRv
ZXMgbm90IGRlY2xhcmUgY3VzdG9tZSB0aW1lb3V0Cj4gdmFsdWUgZm9yIGNvbXB1dGUgcmluZywg
dGhlbiB1c2UgZ2Z4IHJpbmcgdGltZW91dCB2YWx1ZSBhcyBkZWZhdWx0LiBTbwo+IHRoYXQgd2hl
biB0aGVyZSBpcyBhIHR1cmUgaGFyZHdhcmUgaGFuZywgY29tcHV0ZSByaW5nIGNhbiBkZXRlY3Qg
aXQuCj4KPiBDaGFuZ2UtSWQ6IEk3OTRlYzA4NjhjNmMwYWFkNDA3NzQ5NDU3MjYwZWNmZWUwNjE3
YzEwCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgWmhhbmcgPHpoZXhpLnpoYW5nQGFtZC5jb20+CgpS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
PiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyB8IDEy
ICsrKysrKy0tLS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
ICAgIHwgIDcgKysrKysrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Zl
bmNlLmMgIHwgMTMgKy0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCAxOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGV2aWNlLmMKPiBpbmRleCAzYjUyODJiLi4wM2FjNWExZGEgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4gQEAgLTEwMjQsMTIgKzEwMjQs
NiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJndW1lbnRzKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KQo+ICAgCj4gICAJYW1kZ3B1X2RldmljZV9jaGVja19ibG9ja19zaXpl
KGFkZXYpOwo+ICAgCj4gLQlyZXQgPSBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0
aW5ncyhhZGV2KTsKPiAtCWlmIChyZXQpIHsKPiAtCQlkZXZfZXJyKGFkZXYtPmRldiwgImludmFs
aWQgbG9ja3VwX3RpbWVvdXQgcGFyYW1ldGVyIHN5bnRheFxuIik7Cj4gLQkJcmV0dXJuIHJldDsK
PiAtCX0KPiAtCj4gICAJYWRldi0+ZmlybXdhcmUubG9hZF90eXBlID0gYW1kZ3B1X3Vjb2RlX2dl
dF9sb2FkX3R5cGUoYWRldiwgYW1kZ3B1X2Z3X2xvYWRfdHlwZSk7Cj4gICAKPiAgIAlyZXR1cm4g
cmV0Owo+IEBAIC0yNzMyLDYgKzI3MjYsMTIgQEAgaW50IGFtZGdwdV9kZXZpY2VfaW5pdChzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAgIAlpZiAocikKPiAgIAkJcmV0dXJuIHI7Cj4gICAK
PiArCXIgPSBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhhZGV2KTsKPiAr
CWlmIChyKSB7Cj4gKwkJZGV2X2VycihhZGV2LT5kZXYsICJpbnZhbGlkIGxvY2t1cF90aW1lb3V0
IHBhcmFtZXRlciBzeW50YXhcbiIpOwo+ICsJCXJldHVybiByOwo+ICsJfQo+ICsKPiAgIAkvKiBk
b29yYmVsbCBiYXIgbWFwcGluZyBhbmQgZG9vcmJlbGwgaW5kZXggaW5pdCovCj4gICAJYW1kZ3B1
X2RldmljZV9kb29yYmVsbF9pbml0KGFkZXYpOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IDQyMDg4OGUuLjk4YmU0OWIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTEzMzgsMTAgKzEzMzgsMTUgQEAg
aW50IGFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzKHN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2KQo+ICAgCS8qCj4gICAJICogQnkgZGVmYXVsdCB0aW1lb3V0IGZvciBub24g
Y29tcHV0ZSBqb2JzIGlzIDEwMDAwLgo+ICAgCSAqIEFuZCB0aGVyZSBpcyBubyB0aW1lb3V0IGVu
Zm9yY2VkIG9uIGNvbXB1dGUgam9icy4KPiArCSAqIEluIFNSLUlPViBvciBwYXNzdGhyb3VnaCBt
b2RlLCB0aW1lb3V0IGZvciBjb21wdXRlCj4gKwkgKiBqb2JzIGFyZSAxMDAwMCBieSBkZWZhdWx0
Lgo+ICAgCSAqLwo+ICAgCWFkZXYtPmdmeF90aW1lb3V0ID0gbXNlY3NfdG9famlmZmllcygxMDAw
MCk7Cj4gICAJYWRldi0+c2RtYV90aW1lb3V0ID0gYWRldi0+dmlkZW9fdGltZW91dCA9IGFkZXYt
PmdmeF90aW1lb3V0Owo+IC0JYWRldi0+Y29tcHV0ZV90aW1lb3V0ID0gTUFYX1NDSEVEVUxFX1RJ
TUVPVVQ7Cj4gKwlpZiAoYW1kZ3B1X3NyaW92X3ZmKGFkZXYpIHx8IGFtZGdwdV9wYXNzdGhyb3Vn
aChhZGV2KSkKPiArCQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsK
PiArCWVsc2UKPiArCQlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9V
VDsKPiAgIAo+ICAgCWlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1f
TEVOVEgpKSB7Cj4gICAJCXdoaWxlICgodGltZW91dF9zZXR0aW5nID0gc3Ryc2VwKCZpbnB1dCwg
IiwiKSkgJiYKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IGlu
ZGV4IGNiY2FhN2MuLjllZjUzY2EgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZmVuY2UuYwo+IEBAIC00NjAsMTggKzQ2MCw3IEBAIGludCBhbWRncHVfZmVuY2VfZHJp
dmVyX2luaXRfcmluZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4gICAJCQl0aW1lb3V0ID0g
YWRldi0+Z2Z4X3RpbWVvdXQ7Cj4gICAJCQlicmVhazsKPiAgIAkJY2FzZSBBTURHUFVfUklOR19U
WVBFX0NPTVBVVEU6Cj4gLQkJCS8qCj4gLQkJCSAqIEZvciBub24tc3Jpb3YgY2FzZSwgbm8gdGlt
ZW91dCBlbmZvcmNlCj4gLQkJCSAqIG9uIGNvbXB1dGUgcmluZyBieSBkZWZhdWx0LiBVbmxlc3Mg
dXNlcgo+IC0JCQkgKiBzcGVjaWZpZXMgYSB0aW1lb3V0IGZvciBjb21wdXRlIHJpbmcuCj4gLQkJ
CSAqCj4gLQkJCSAqIEZvciBzcmlvdiBjYXNlLCBhbHdheXMgdXNlIHRoZSB0aW1lb3V0Cj4gLQkJ
CSAqIGFzIGdmeCByaW5nCj4gLQkJCSAqLwo+IC0JCQlpZiAoIWFtZGdwdV9zcmlvdl92ZihyaW5n
LT5hZGV2KSkKPiAtCQkJCXRpbWVvdXQgPSBhZGV2LT5jb21wdXRlX3RpbWVvdXQ7Cj4gLQkJCWVs
c2UKPiAtCQkJCXRpbWVvdXQgPSBhZGV2LT5nZnhfdGltZW91dDsKPiArCQkJdGltZW91dCA9IGFk
ZXYtPmNvbXB1dGVfdGltZW91dDsKPiAgIAkJCWJyZWFrOwo+ICAgCQljYXNlIEFNREdQVV9SSU5H
X1RZUEVfU0RNQToKPiAgIAkJCXRpbWVvdXQgPSBhZGV2LT5zZG1hX3RpbWVvdXQ7CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcg
bGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
