Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5D92467BD
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Aug 2020 15:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE216E0DB;
	Mon, 17 Aug 2020 13:53:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DA46E0D6;
 Mon, 17 Aug 2020 13:53:15 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d190so13283500wmd.4;
 Mon, 17 Aug 2020 06:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=PB4lsVzCOSUh8WXQFJcJL2KMW0Ueh1j9kQm3ZMhDPDA=;
 b=ER9qrmKi1FV2XXSczO38aOtcIeJadIEZCOBZF2ZBEB0pK7vN6eFb0HKktqny9YoWuW
 rviEeXwTpukMQuUCT45gDY2c1SATfFshU97O95HXefgaoJC/cbKoKNcI3x4+rrQWzoxe
 m6m6uBmoNhK/iM0OpDEXOjtPY280LPQKw4UYq7N8jjr5F/CbOwX1C5B7JeyQtBEgi5RV
 BXdy6yZxBC8MNLUMKETFTC+Ieuy5ScNfvOvmuCQvNEId7xwQ2rSiHCkGi9qBH3F8bO8Z
 RatgwP3R1iFBoJ+/Y8JJVAdjqiwX5i4f8h5icQAAr5oQyJ5mAWS+0MBOsPirRLVK16pM
 MXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=PB4lsVzCOSUh8WXQFJcJL2KMW0Ueh1j9kQm3ZMhDPDA=;
 b=BM3PazodhwNXoCw1AoCbEK7aVp/4VgnlMf9P1x64bVaK6yxHiJTl+I8GXvYpJ+Am+W
 oUsfGZIvBIMikC7parTvHNibtSZqknjganM4zql84CGz7lsgY4t3ZChfClqYrudP3qky
 jBTTMz5byyaUwSoAmjxAAZyzoQSc6/17JncFvZyey+X7rZQKi1OgGzNLUuvmnVJ6JLkC
 z59aDAVwQSUwwuSmrLOWP8i2qlzfNWc00GOlzV+iL2jFETUtT8/WpdNoIm/sF403fnlO
 CmMfHUSYAIb69hHYuDm/+4Pvsl6fUQZPDLgiVYRptZ/tfq29yMl1nsSekprt8ryHVSyo
 qAHA==
X-Gm-Message-State: AOAM532U9KYtRaNW8U5l3F4PLH3Tf10/nxXFi7SOjN6PIvMtCwuk4H4X
 GuzDgeyyQksCKb+T+1GQ7+U=
X-Google-Smtp-Source: ABdhPJwfNskltmIx3iHrjpVIvVr03XOCtBRbtXG0lhAH/ZVyL4Z5OyrAJaSMUdz0hRzRk6l+1DRHnA==
X-Received: by 2002:a1c:2646:: with SMTP id m67mr15341798wmm.137.1597672394338; 
 Mon, 17 Aug 2020 06:53:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 145sm31690597wma.20.2020.08.17.06.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 06:53:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/scheduler: Scheduler priority fixes (v2)
To: Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200815024852.4355-1-luben.tuikov@amd.com>
 <20200815024852.4355-2-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <07c04016-4415-5dd3-c92a-be81e1b7a5f8@gmail.com>
Date: Mon, 17 Aug 2020 15:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815024852.4355-2-luben.tuikov@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTUuMDguMjAgdW0gMDQ6NDggc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gUmVtb3ZlIERSTV9T
Q0hFRF9QUklPUklUWV9MT1csIGFzIGl0IHdhcyB1c2VkCj4gaW4gb25seSBvbmUgcGxhY2UuCj4K
PiBSZW5hbWUgYW5kIHNlcGFyYXRlIGJ5IGEgbGluZQo+IERSTV9TQ0hFRF9QUklPUklUWV9NQVgg
dG8gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UCj4gYXMgaXQgcmVwcmVzZW50cyBhICh0b3RhbCkg
Y291bnQgb2Ygc2FpZAo+IHByaW9yaXRpZXMgYW5kIGl0IGlzIHVzZWQgYXMgc3VjaCBpbiBsb29w
cwo+IHRocm91Z2hvdXQgdGhlIGNvZGUuICgwLWJhc2VkIGluZGV4aW5nIGlzIHRoZQo+IHRoZSBj
b3VudCBudW1iZXIuKQo+Cj4gUmVtb3ZlIHJlZHVuZGFudCB3b3JkIEhJR0ggaW4gcHJpb3JpdHkg
bmFtZXMsCj4gYW5kIHJlbmFtZSAqS0VSTkVMKiB0byAqSElHSCosIGFzIGl0IHJlYWxseQo+IG1l
YW5zIHRoYXQsIGhpZ2guCj4KPiB2MjogQWRkIGJhY2sgS0VSTkVMIGFuZCByZW1vdmUgU1cgYW5k
IEhXLAo+ICAgICAgaW4gbGlldSBvZiBhIHNpbmdsZSBISUdIIGJldHdlZW4gTk9STUFMIGFuZCBL
RVJORUwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQu
Y29tPgoKSSBjYW4ndCByZWFsbHkganVkZ2UgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBNQVggYW5k
IENPVU5ULCBidXQgdGhlIHdlIApyZW5hbWUgdGhlIHZhbHVlcyBhbmQgZ2V0IHJpZCBvZiB0aGUg
aW52YWxpZCBvbmUgc291bmRzIGxpa2UgYSBnb29kIGlkZWEgCnRvIG1lLgoKUmV2aWV3ZWQtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gZm9yIHRoZSBzZXJp
ZXMuCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2N0eC5jICAg
fCAgNCArKy0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgICB8
ICAyICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jICB8ICAy
ICstCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5oICB8ICAyICst
Cj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYyB8ICA2ICsrKy0t
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgfCAgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgICAgfCAgNCArKy0tCj4g
ICBpbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggICAgICAgICAgICAgICB8IDEyICsrKysrKyst
LS0tLQo+ICAgOCBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3R4LmMKPiBpbmRleCBkODVk
MTNmN2EwNDMuLjY4ZWFhNGY2ODdhNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfY3R4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3R4LmMKPiBAQCAtNDYsNyArNDYsNyBAQCBjb25zdCB1bnNpZ25lZCBpbnQgYW1kZ3B1
X2N0eF9udW1fZW50aXRpZXNbQU1ER1BVX0hXX0lQX05VTV0gPSB7Cj4gICBzdGF0aWMgaW50IGFt
ZGdwdV9jdHhfcHJpb3JpdHlfcGVybWl0KHN0cnVjdCBkcm1fZmlsZSAqZmlscCwKPiAgIAkJCQkg
ICAgICBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSBwcmlvcml0eSkKPiAgIHsKPiAtCWlmIChwcmlv
cml0eSA8IDAgfHwgcHJpb3JpdHkgPj0gRFJNX1NDSEVEX1BSSU9SSVRZX01BWCkKPiArCWlmIChw
cmlvcml0eSA8IDAgfHwgcHJpb3JpdHkgPj0gRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UKQo+ICAg
CQlyZXR1cm4gLUVJTlZBTDsKPiAgIAo+ICAgCS8qIE5PUk1BTCBhbmQgYmVsb3cgYXJlIGFjY2Vz
c2libGUgYnkgZXZlcnlvbmUgKi8KPiBAQCAtNjUsNyArNjUsNyBAQCBzdGF0aWMgaW50IGFtZGdw
dV9jdHhfcHJpb3JpdHlfcGVybWl0KHN0cnVjdCBkcm1fZmlsZSAqZmlscCwKPiAgIHN0YXRpYyBl
bnVtIGdmeF9waXBlX3ByaW9yaXR5IGFtZGdwdV9jdHhfc2NoZWRfcHJpb190b19jb21wdXRlX3By
aW8oZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgcHJpbykKPiAgIHsKPiAgIAlzd2l0Y2ggKHByaW8p
IHsKPiAtCWNhc2UgRFJNX1NDSEVEX1BSSU9SSVRZX0hJR0hfSFc6Cj4gKwljYXNlIERSTV9TQ0hF
RF9QUklPUklUWV9ISUdIOgo+ICAgCWNhc2UgRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTDoKPiAg
IAkJcmV0dXJuIEFNREdQVV9HRlhfUElQRV9QUklPX0hJR0g7Cj4gICAJZGVmYXVsdDoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gaW5kZXggNzVkMzdkZmI1MWFhLi5i
YjllNTQ4MWZmM2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2pvYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5j
Cj4gQEAgLTI1MSw3ICsyNTEsNyBAQCB2b2lkIGFtZGdwdV9qb2Jfc3RvcF9hbGxfam9ic19vbl9z
Y2hlZChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+ICAgCWludCBpOwo+ICAgCj4g
ICAJLyogU2lnbmFsIGFsbCBqb2JzIG5vdCB5ZXQgc2NoZWR1bGVkICovCj4gLQlmb3IgKGkgPSBE
Uk1fU0NIRURfUFJJT1JJVFlfTUFYIC0gMTsgaSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBp
LS0pIHsKPiArCWZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gRFJN
X1NDSEVEX1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4gICAJCXN0cnVjdCBkcm1fc2NoZWRfcnEgKnJx
ID0gJnNjaGVkLT5zY2hlZF9ycVtpXTsKPiAgIAo+ICAgCQlpZiAoIXJxKQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYwo+IGluZGV4IDEzZWE4ZWJjNDIxYy4uNmQ0ZmM3
OWJmODRhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
aW5nLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcmluZy5jCj4g
QEAgLTI2Nyw3ICsyNjcsNyBAQCBpbnQgYW1kZ3B1X3JpbmdfaW5pdChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLAo+ICAgCQkJJnJpbmctPnNjaGVk
Owo+ICAgCX0KPiAgIAo+IC0JZm9yIChpID0gMDsgaSA8IERSTV9TQ0hFRF9QUklPUklUWV9NQVg7
ICsraSkKPiArCWZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGkgPCBEUk1fU0NIRURf
UFJJT1JJVFlfQ09VTlQ7ICsraSkKPiAgIAkJYXRvbWljX3NldCgmcmluZy0+bnVtX2pvYnNbaV0s
IDApOwo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5oCj4gaW5kZXggZGE4NzFkODRiNzQyLi43MTEyMTM3Njg5ZGIgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuaAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmgKPiBAQCAtMjQzLDcgKzI0Myw3IEBA
IHN0cnVjdCBhbWRncHVfcmluZyB7Cj4gICAJYm9vbAkJCWhhc19jb21wdXRlX3ZtX2J1ZzsKPiAg
IAlib29sCQkJbm9fc2NoZWR1bGVyOwo+ICAgCj4gLQlhdG9taWNfdAkJbnVtX2pvYnNbRFJNX1ND
SEVEX1BSSU9SSVRZX01BWF07Cj4gKwlhdG9taWNfdAkJbnVtX2pvYnNbRFJNX1NDSEVEX1BSSU9S
SVRZX0NPVU5UXTsKPiAgIAlzdHJ1Y3QgbXV0ZXgJCXByaW9yaXR5X211dGV4Owo+ICAgCS8qIHBy
b3RlY3RlZCBieSBwcmlvcml0eV9tdXRleCAqLwo+ICAgCWludAkJCXByaW9yaXR5Owo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfc2NoZWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9zY2hlZC5jCj4gaW5kZXggYzc5OTY5MWRmYTg0
Li4xNzY2MWVkZTk0ODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3NjaGVkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
c2NoZWQuYwo+IEBAIC0zNiwxNCArMzYsMTQgQEAgZW51bSBkcm1fc2NoZWRfcHJpb3JpdHkgYW1k
Z3B1X3RvX3NjaGVkX3ByaW9yaXR5KGludCBhbWRncHVfcHJpb3JpdHkpCj4gICB7Cj4gICAJc3dp
dGNoIChhbWRncHVfcHJpb3JpdHkpIHsKPiAgIAljYXNlIEFNREdQVV9DVFhfUFJJT1JJVFlfVkVS
WV9ISUdIOgo+IC0JCXJldHVybiBEUk1fU0NIRURfUFJJT1JJVFlfSElHSF9IVzsKPiArCQlyZXR1
cm4gRFJNX1NDSEVEX1BSSU9SSVRZX0hJR0g7Cj4gICAJY2FzZSBBTURHUFVfQ1RYX1BSSU9SSVRZ
X0hJR0g6Cj4gLQkJcmV0dXJuIERSTV9TQ0hFRF9QUklPUklUWV9ISUdIX1NXOwo+ICsJCXJldHVy
biBEUk1fU0NIRURfUFJJT1JJVFlfSElHSDsKPiAgIAljYXNlIEFNREdQVV9DVFhfUFJJT1JJVFlf
Tk9STUFMOgo+ICAgCQlyZXR1cm4gRFJNX1NDSEVEX1BSSU9SSVRZX05PUk1BTDsKPiAgIAljYXNl
IEFNREdQVV9DVFhfUFJJT1JJVFlfTE9XOgo+ICAgCWNhc2UgQU1ER1BVX0NUWF9QUklPUklUWV9W
RVJZX0xPVzoKPiAtCQlyZXR1cm4gRFJNX1NDSEVEX1BSSU9SSVRZX0xPVzsKPiArCQlyZXR1cm4g
RFJNX1NDSEVEX1BSSU9SSVRZX01JTjsKPiAgIAljYXNlIEFNREdQVV9DVFhfUFJJT1JJVFlfVU5T
RVQ6Cj4gICAJCXJldHVybiBEUk1fU0NIRURfUFJJT1JJVFlfVU5TRVQ7Cj4gICAJZGVmYXVsdDoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4gaW5kZXggMjBmYTA0OTdh
YWE0Li42MGUyZDMyNjdhZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5jCj4gQEAgLTIxMTQsNyArMjExNCw3IEBAIHZvaWQgYW1kZ3B1X3R0bV9zZXRfYnVmZmVy
X2Z1bmNzX3N0YXR1cyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgYm9vbCBlbmFibGUpCj4g
ICAJCXJpbmcgPSBhZGV2LT5tbWFuLmJ1ZmZlcl9mdW5jc19yaW5nOwo+ICAgCQlzY2hlZCA9ICZy
aW5nLT5zY2hlZDsKPiAgIAkJciA9IGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmYWRldi0+bW1hbi5l
bnRpdHksCj4gLQkJCQkgICAgICAgICAgRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTCwgJnNjaGVk
LAo+ICsJCQkJCSAgRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTCwgJnNjaGVkLAo+ICAgCQkJCQkg
IDEsIE5VTEwpOwo+ICAgCQlpZiAocikgewo+ICAgCQkJRFJNX0VSUk9SKCJGYWlsZWQgc2V0dGlu
ZyB1cCBUVE0gQk8gbW92ZSBlbnRpdHkgKCVkKVxuIiwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVy
L3NjaGVkX21haW4uYwo+IGluZGV4IDJmMzE5MTAyYWU5Zi4uMTlmMzgxZTVlNjYxIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBAQCAtNjIzLDcgKzYyMyw3IEBA
IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQp
Cj4gICAJCXJldHVybiBOVUxMOwo+ICAgCj4gICAJLyogS2VybmVsIHJ1biBxdWV1ZSBoYXMgaGln
aGVyIHByaW9yaXR5IHRoYW4gbm9ybWFsIHJ1biBxdWV1ZSovCj4gLQlmb3IgKGkgPSBEUk1fU0NI
RURfUFJJT1JJVFlfTUFYIC0gMTsgaSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpLS0pIHsK
PiArCWZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gRFJNX1NDSEVE
X1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4gICAJCWVudGl0eSA9IGRybV9zY2hlZF9ycV9zZWxlY3Rf
ZW50aXR5KCZzY2hlZC0+c2NoZWRfcnFbaV0pOwo+ICAgCQlpZiAoZW50aXR5KQo+ICAgCQkJYnJl
YWs7Cj4gQEAgLTg1MSw3ICs4NTEsNyBAQCBpbnQgZHJtX3NjaGVkX2luaXQoc3RydWN0IGRybV9n
cHVfc2NoZWR1bGVyICpzY2hlZCwKPiAgIAlzY2hlZC0+bmFtZSA9IG5hbWU7Cj4gICAJc2NoZWQt
PnRpbWVvdXQgPSB0aW1lb3V0Owo+ICAgCXNjaGVkLT5oYW5nX2xpbWl0ID0gaGFuZ19saW1pdDsK
PiAtCWZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGkgPCBEUk1fU0NIRURfUFJJT1JJ
VFlfTUFYOyBpKyspCj4gKwlmb3IgKGkgPSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyBpIDwgRFJN
X1NDSEVEX1BSSU9SSVRZX0NPVU5UOyBpKyspCj4gICAJCWRybV9zY2hlZF9ycV9pbml0KHNjaGVk
LCAmc2NoZWQtPnNjaGVkX3JxW2ldKTsKPiAgIAo+ICAgCWluaXRfd2FpdHF1ZXVlX2hlYWQoJnNj
aGVkLT53YWtlX3VwX3dvcmtlcik7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2dwdV9zY2hl
ZHVsZXIuaCBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+IGluZGV4IDI2YjA0ZmY2MjY3
Ni4uZWQ5OTg0NjRkZWQ0IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIu
aAo+ICsrKyBiL2luY2x1ZGUvZHJtL2dwdV9zY2hlZHVsZXIuaAo+IEBAIC0zMywxNCArMzMsMTYg
QEAKPiAgIHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlcjsKPiAgIHN0cnVjdCBkcm1fc2NoZWRfcnE7
Cj4gICAKPiArLyogVGhlc2UgYXJlIG9mdGVuIHVzZWQgYXMgYW4gKGluaXRpYWwpIGluZGV4Cj4g
KyAqIHRvIGFuIGFycmF5LCBhbmQgYXMgc3VjaCBzaG91bGQgc3RhcnQgYXQgMC4KPiArICovCj4g
ICBlbnVtIGRybV9zY2hlZF9wcmlvcml0eSB7Cj4gICAJRFJNX1NDSEVEX1BSSU9SSVRZX01JTiwK
PiAtCURSTV9TQ0hFRF9QUklPUklUWV9MT1cgPSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOLAo+ICAg
CURSTV9TQ0hFRF9QUklPUklUWV9OT1JNQUwsCj4gLQlEUk1fU0NIRURfUFJJT1JJVFlfSElHSF9T
VywKPiAtCURSTV9TQ0hFRF9QUklPUklUWV9ISUdIX0hXLAo+ICsJRFJNX1NDSEVEX1BSSU9SSVRZ
X0hJR0gsCj4gICAJRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTCwKPiAtCURSTV9TQ0hFRF9QUklP
UklUWV9NQVgsCj4gKwo+ICsJRFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5ULAo+ICAgCURSTV9TQ0hF
RF9QUklPUklUWV9JTlZBTElEID0gLTEsCj4gICAJRFJNX1NDSEVEX1BSSU9SSVRZX1VOU0VUID0g
LTIKPiAgIH07Cj4gQEAgLTI3Myw3ICsyNzUsNyBAQCBzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIg
ewo+ICAgCXVpbnQzMl90CQkJaHdfc3VibWlzc2lvbl9saW1pdDsKPiAgIAlsb25nCQkJCXRpbWVv
dXQ7Cj4gICAJY29uc3QgY2hhcgkJCSpuYW1lOwo+IC0Jc3RydWN0IGRybV9zY2hlZF9ycQkJc2No
ZWRfcnFbRFJNX1NDSEVEX1BSSU9SSVRZX01BWF07Cj4gKwlzdHJ1Y3QgZHJtX3NjaGVkX3JxCQlz
Y2hlZF9ycVtEUk1fU0NIRURfUFJJT1JJVFlfQ09VTlRdOwo+ICAgCXdhaXRfcXVldWVfaGVhZF90
CQl3YWtlX3VwX3dvcmtlcjsKPiAgIAl3YWl0X3F1ZXVlX2hlYWRfdAkJam9iX3NjaGVkdWxlZDsK
PiAgIAlhdG9taWNfdAkJCWh3X3JxX2NvdW50OwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
