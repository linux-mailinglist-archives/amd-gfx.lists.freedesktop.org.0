Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DECA8481E
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Aug 2019 10:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241EB89B45;
	Wed,  7 Aug 2019 08:50:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E5189B45
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Aug 2019 08:50:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n4so90580181wrs.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Aug 2019 01:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=+Q1pqTyDyI14XlbWTWSTBeIIDkphEwLztuqUjM2lLfU=;
 b=aTWITDU/wZV16rz3iNqAMfrPT4EATesKgkRWyCrStzlM+LGf5euRzxI7fu8+2C8Yj9
 k/BuXYQzynyDVT/9dh8RrRQwGNwklLR16zM8Xj0LH6UQx9Xc6r8iO0lm0/F2FBdznH5U
 timz73Fhnuo1cI3GJAy7UnqNPNldUd7CtmDssbF24qscBbL3rZ2FeK87bLjEgzfypvdU
 Z9va0/+KJuFhvJPiWeUhx4u0gF+ZlRPGYMUYamQlBQtfRFBlKGA0x4T1uU6CAS3csSWo
 j0BS6BNIUnA7e/rrTkJQvgj5MgS66dAO3iUvhajAaP9uuwQu3Guff5iQ+hmreBdkLKNS
 cDtg==
X-Gm-Message-State: APjAAAWkeXNiV5vAdKodgwL1et/FenHanxQYybt8n7+0Zn0hRjOvjRXc
 r1ocziisdPpG62dKLannQxDrmjsg
X-Google-Smtp-Source: APXvYqyAZ2lqrfdPKf8dAm2AT369Yuj195lZp4oHFdr6VIVOYeaujzLVJlXAfTgDql9/U+VRfAHzwg==
X-Received: by 2002:adf:f481:: with SMTP id l1mr2910390wro.123.1565167832133; 
 Wed, 07 Aug 2019 01:50:32 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f17sm87759691wmf.27.2019.08.07.01.50.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 01:50:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Export function to flush TLB of specific
 vm hub
To: "Zeng, Oak" <Oak.Zeng@amd.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <1564761834-19210-1-git-send-email-Oak.Zeng@amd.com>
 <855377a1-69ca-891e-1dad-5b93f57671da@gmail.com>
 <BL0PR12MB2580778BFD71E211AC18CFAF80D40@BL0PR12MB2580.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <65784ad0-7693-9c98-82ee-66713c99f49b@gmail.com>
Date: Wed, 7 Aug 2019 10:50:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BL0PR12MB2580778BFD71E211AC18CFAF80D40@BL0PR12MB2580.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+Q1pqTyDyI14XlbWTWSTBeIIDkphEwLztuqUjM2lLfU=;
 b=XNwcuoDX/6i+MPvklPPstvnfVRA+uZfzDWa2PZV5PyncBkHpU8rbMocUmcqzVqA/NO
 RgE0qWZTSnAnedHmyGVbP4xPFJIFsJrjvR12/vmx2X0yIVEMPB9B8yKCpTsKrwblUYqW
 Qt9Wg0JK5V+HekciMC1IdGlwO6GJFe4CkWNQ1p5dTsbaWwlVTQsUs4ybbkfwZTVFMKtF
 AJ6fgxP2rduGbc79Ko8AR5mK1mAZuC+ucKmyJJITY+LpK7hVf0ORTskM5O5/DutTZaxI
 XGURiKWErUblDSBObtXejQbFWKkyPzM/OQLbsCbucpErPtQ4N//kletwPeutj+09ezZm
 Y+sA==
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

PiBEb2VzIHRoZSBjb2RlZCBiZWxvdyBpbnZhbGlkYXRlIFRMQiBvbiBib3RoIG1tIGFuZCBnZngg
aHViPwpObywganVzdCB0aGUgZ2Z4IGh1Yi4gVGhlIFZNSFVCcyBvbiBOYXZpIGFyZSB1bmZvcnR1
bmF0ZWx5IHJlYWxseSBidWdneSwgCnNvIHdlIGhhZCB0byBkbyBhIGxvdCBvZiB3b3JrYXJvdW5k
cyB0byBnZXQgdGhlbSBpbnRvIGEgc3RhdGUgd2hlcmUgdGhleSAKYWN0dWFsbHkgZGlkIHdoYXQg
d2FzIGV4cGVjdGVkIGZyb20gdGhlbS4KCk9uZSBtYWpvciBpc3N1ZSBmb3IgZXhhbXBsZSBpcyB0
aGF0IHlvdSBjYW4ndCBkbyBNTUlPIGJhc2VkIFZNIAppbnZhbGlkYXRpb24gd2hlbiB0aGUgZW5n
aW5lIGlzIGJ1c3kuIFRvIHdvcmsgYXJvdW5kIHRoaXMgd2UgZG8gdGhlIAppbnZhbGlkYXRpb24g
d2l0aCB0aGUgKElJUkMpIFNETUEgZW5naW5lIGFzIHNvb24gYXMgdGhhdCBvbmUgaXMgd29ya2lu
Zy4KClRoZSBpcyB0aGUgY29kZSB5b3UgYXJlIG5vdGluZyBiZWxvdy4KClJlZ2FyZHMsCkNocmlz
dGlhbi4KCkFtIDA3LjA4LjE5IHVtIDA0OjQwIHNjaHJpZWIgWmVuZywgT2FrOgo+IE9rLCB3aWxs
IGRvIGl0Lgo+Cj4gQlRXLCBkb2VzIHRob3NlIGNvZGVzIGJlbG93IHJlYWxseSBuZWVkZWQsIGlu
IGZ1bmN0aW9uIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiLiBJIHRoaW5rIGlmIHdlIGhhdmUgdGhl
IGJ1ZywgdGhlbiBiZWZvcmUgYmVsb3cgY29kZXMsIHdoZW4gd2UgZmx1c2ggVExCIG9mIGdmeGh1
YiB0aHJvdWdoIG1taW8sIGl0IGhhcyBhbHJlYWR5IHRyaWdnZXJlZCB0aGUgYnVnLiBBbHNvIGFz
IHdlIGFscmVhZHkgaW52YWxpZGF0ZWQgdGxiIG9uIGJvdGggbW0gYW5kIGdmeCBodWIgKGluIHRo
ZSBzYW1lIGZ1bmN0aW9uIGdtY192MTBfMF9mbHVzaF9ncHVfdGxiKSwgd2hhdCBpcyB0aGUgcG9p
bnQgb2YgYmVsb3cgY29kZXM/IERvZXMgdGhlIGNvZGVkIGJlbG93IGludmFsaWRhdGUgVExCIG9u
IGJvdGggbW0gYW5kIGdmeCBodWI/IEFsc28gQFpoYW5nLCBIYXdraW5nQERldWNoZXIsIEFsZXhh
bmRlcgo+Cj4gCS8qIFRoZSBTRE1BIG9uIE5hdmkgaGFzIGEgYnVnIHdoaWNoIGNhbiB0aGVvcmV0
aWNhbGx5IHJlc3VsdCBpbiBtZW1vcnkKPiAJICogY29ycnVwdGlvbiBpZiBhbiBpbnZhbGlkYXRp
b24gaGFwcGVucyBhdCB0aGUgc2FtZSB0aW1lIGFzIGFuIFZBCj4gCSAqIHRyYW5zbGF0aW9uLiBB
dm9pZCB0aGlzIGJ5IGRvaW5nIHRoZSBpbnZhbGlkYXRpb24gZnJvbSB0aGUgU0RNQQo+IAkgKiBp
dHNlbGYuCj4gCSAqLwo+IAlyID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKGFkZXYsIDE2ICog
NCwgJmpvYik7Cj4gCWlmIChyKQo+IAkJZ290byBlcnJvcl9hbGxvYzsKPgo+IAlqb2ItPnZtX3Bk
X2FkZHIgPSBhbWRncHVfZ21jX3BkX2FkZHIoYWRldi0+Z2FydC5ibyk7Cj4gCWpvYi0+dm1fbmVl
ZHNfZmx1c2ggPSB0cnVlOwo+IAlhbWRncHVfcmluZ19wYWRfaWIocmluZywgJmpvYi0+aWJzWzBd
KTsKPiAJciA9IGFtZGdwdV9qb2Jfc3VibWl0KGpvYiwgJmFkZXYtPm1tYW4uZW50aXR5LAo+IAkJ
CSAgICAgIEFNREdQVV9GRU5DRV9PV05FUl9VTkRFRklORUQsICZmZW5jZSk7Cj4KPiBSZWdhcmRz
LAo+IE9hawo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBDaHJpc3RpYW4g
S8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiBNb25kYXks
IEF1Z3VzdCA1LCAyMDE5IDU6MzcgQU0KPiBUbzogWmVuZywgT2FrIDxPYWsuWmVuZ0BhbWQuY29t
PjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogS3VlaGxpbmcsIEZlbGl4IDxG
ZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBM
aXUsIFNoYW95dW4gPFNoYW95dW4uTGl1QGFtZC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCAx
LzJdIGRybS9hbWRncHU6IEV4cG9ydCBmdW5jdGlvbiB0byBmbHVzaCBUTEIgb2Ygc3BlY2lmaWMg
dm0gaHViCj4KPiBBbSAwMi4wOC4xOSB1bSAxODowNCBzY2hyaWViIFplbmcsIE9hazoKPj4gVGhp
cyBpcyBmb3Iga2ZkIHRvIHJldXNlIGFtZGdwdSBUTEIgaW52YWxpZGF0aW9uIGZ1bmN0aW9uLiBU
aGVyZSBpcwo+PiBhbHJlYWR5IGEgZ21jIGZ1bmN0aW9uIGZsdXNoX2dwdV90bGIgdG8gZmx1c2gg
VExCIG9uIGFsbCB2bSBodWIuIE9uCj4+IGdmeDEwLCBrZmQgb25seSBuZWVkcyB0byBmbHVzaCBU
TEIgb24gZ2Z4IGh1YiBidXQgbm90IG9uIG1tIGh1Yi4gU28KPj4gZXhwb3J0IGEgZnVuY3Rpb24g
Zm9yIEtGRCBmbHVzaCBUTEIgb25seSBvbiBnZnggaHViLgo+IEkgd291bGQgcmF0aGVyIGdvIGFo
ZWFkIGFuZCBhZGQgYW5vdGhlciBwYXJhbWV0ZXIgdG8gZmx1c2hfZ3B1X3RsYiB0byBub3RlIHdo
aWNoIGh1YiBuZWVkcyBmbHVzaGluZy4KPgo+IFdlIGNhbiBwcm9iYWJseSBlYXNpbHkgZXh0ZW5k
IHRoZSBmZXcgY2FsbGVycyB0byBmbHVzaCBhbGwgaHVicyBuZWVkZWQuCj4KPiBDaHJpc3RpYW4u
Cj4KPj4gQ2hhbmdlLUlkOiBJNThmZjAwOTY5Zjg4NDM4Y2ZkM2RjN2U5ZGViN2JmZjBjMWJiNDEz
Mwo+PiBTaWduZWQtb2ZmLWJ5OiBPYWsgWmVuZyA8T2FrLlplbmdAYW1kLmNvbT4KPj4gLS0tCj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaCB8IDQgKysrKwo+PiAg
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjEwXzAuYyAgfCAxICsKPj4gICAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nbWMuaAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nbWMuaAo+PiBpbmRleCAwNzExNDVhLi4wYmQ0YTRmIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ21jLmgKPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dtYy5oCj4+IEBAIC04OCw2ICs4OCw5IEBA
IHN0cnVjdCBhbWRncHVfdm1odWIgewo+PiAgICAgKiBHUFUgTUMgc3RydWN0dXJlcywgZnVuY3Rp
b25zICYgaGVscGVycwo+PiAgICAgKi8KPj4gICAgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3Mgewo+
PiArCS8qIGZsdXNoIHZtIHRsYiBvZiBzcGVjaWZpYyBodWIgKi8KPj4gKwl2b2lkICgqZmx1c2hf
dm1faHViKShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdWludDMyX3Qgdm1pZCwKPj4gKwkJ
CQkgICB1bnNpZ25lZCBpbnQgdm1odWIsIHVpbnQzMl90IGZsdXNoX3R5cGUpOwo+PiAgICAJLyog
Zmx1c2ggdGhlIHZtIHRsYiB2aWEgbW1pbyAqLwo+PiAgICAJdm9pZCAoKmZsdXNoX2dwdV90bGIp
KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+PiAgICAJCQkgICAgICB1aW50MzJfdCB2bWlk
LCB1aW50MzJfdCBmbHVzaF90eXBlKTsgQEAgLTE4MCw2ICsxODMsNyBAQAo+PiBzdHJ1Y3QgYW1k
Z3B1X2dtYyB7Cj4+ICAgIAlzdHJ1Y3QgcmFzX2NvbW1vbl9pZiAgICAqcmFzX2lmOwo+PiAgICB9
Owo+PiAgICAKPj4gKyNkZWZpbmUgYW1kZ3B1X2dtY19mbHVzaF92bV9odWIoYWRldiwgdm1pZCwg
dm1odWIsIHR5cGUpCj4+ICsoKGFkZXYpLT5nbWMuZ21jX2Z1bmNzLT5mbHVzaF92bV9odWIoKGFk
ZXYpLCAodm1pZCksICh2bWh1YiksCj4+ICsodHlwZSkpKQo+PiAgICAjZGVmaW5lIGFtZGdwdV9n
bWNfZmx1c2hfZ3B1X3RsYihhZGV2LCB2bWlkLCB0eXBlKSAoYWRldiktPmdtYy5nbWNfZnVuY3Mt
PmZsdXNoX2dwdV90bGIoKGFkZXYpLCAodm1pZCksICh0eXBlKSkKPj4gICAgI2RlZmluZSBhbWRn
cHVfZ21jX2VtaXRfZmx1c2hfZ3B1X3RsYihyLCB2bWlkLCBhZGRyKSAociktPmFkZXYtPmdtYy5n
bWNfZnVuY3MtPmVtaXRfZmx1c2hfZ3B1X3RsYigociksICh2bWlkKSwgKGFkZHIpKQo+PiAgICAj
ZGVmaW5lIGFtZGdwdV9nbWNfZW1pdF9wYXNpZF9tYXBwaW5nKHIsIHZtaWQsIHBhc2lkKQo+PiAo
ciktPmFkZXYtPmdtYy5nbWNfZnVuY3MtPmVtaXRfcGFzaWRfbWFwcGluZygociksICh2bWlkKSwg
KHBhc2lkKSkKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dtY192
MTBfMC5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21jX3YxMF8wLmMKPj4gaW5k
ZXggNGUzYWMxMC4uMjQ3NTE1ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ21jX3YxMF8wLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ21j
X3YxMF8wLmMKPj4gQEAgLTQxNiw2ICs0MTYsNyBAQCBzdGF0aWMgdm9pZCBnbWNfdjEwXzBfZ2V0
X3ZtX3BkZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgaW50IGxldmVsLAo+PiAgICB9Cj4+
ICAgIAo+PiAgICBzdGF0aWMgY29uc3Qgc3RydWN0IGFtZGdwdV9nbWNfZnVuY3MgZ21jX3YxMF8w
X2dtY19mdW5jcyA9IHsKPj4gKwkuZmx1c2hfdm1faHViID0gZ21jX3YxMF8wX2ZsdXNoX3ZtX2h1
YiwKPj4gICAgCS5mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2ZsdXNoX2dwdV90bGIsCj4+ICAg
IAkuZW1pdF9mbHVzaF9ncHVfdGxiID0gZ21jX3YxMF8wX2VtaXRfZmx1c2hfZ3B1X3RsYiwKPj4g
ICAgCS5lbWl0X3Bhc2lkX21hcHBpbmcgPSBnbWNfdjEwXzBfZW1pdF9wYXNpZF9tYXBwaW5nLAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
