Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62C19D3D
	for <lists+amd-gfx@lfdr.de>; Fri, 10 May 2019 14:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F42189D02;
	Fri, 10 May 2019 12:28:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE65489CD7;
 Fri, 10 May 2019 12:28:24 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d12so7674046wrm.8;
 Fri, 10 May 2019 05:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VyipZYnOqA+ocOrReFp15qI2bA0IF4Q28CKXaKiV9bw=;
 b=tVu2dXzCXjKNDkewqOEgu2do3dtrMQiDCLEx5Qn7R0DSe5Rck69nDC8mS7nxo2HGii
 fATYYOS42q+gf5kmH05KffMq8iWiD1PG7gdCx01e4cdhcugzqVzG9yYEIEm/h1TcN+X/
 /zAp/asEb7gwxP6Wkrot9UNPvzu7xOXPGnLsCj+jfX9AavpcPh0TwakiVEU9eKazz/lJ
 zFU2px1Dl3p9WeDEOFR5ZCpvOIH8ACN9L0FZuteeVszVW0j8ZfAlFmMFijk036H7h4M7
 LyDCBrhNl0H8LfXzNxdzI/w0IRYzbLCl2NWaelXrbBHtKO3LJDPFzC2MvNQHzOpZrl0g
 /7pA==
X-Gm-Message-State: APjAAAWI4lIScum6MIAlRuBySKodoSzn0pEk1P0Av1MRXfWFL+1+jCMt
 b/vyWedogd/8ZHkfFh5xdlN7hKGY
X-Google-Smtp-Source: APXvYqxl+IHhAZInb1TuhRDgyA0G9zyny9u1Oc1xV8vCIhgFFOLjStUtG5L20juHiCwkZMoCyD8qmg==
X-Received: by 2002:adf:e6ce:: with SMTP id y14mr345495wrm.217.1557491303169; 
 Fri, 10 May 2019 05:28:23 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o16sm4112559wro.63.2019.05.10.05.28.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 05:28:21 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
To: Kenny Ho <Kenny.Ho@amd.com>, y2kenny@gmail.com, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 tj@kernel.org, sunnanyong@huawei.com, alexander.deucher@amd.com,
 brian.welty@intel.com
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f63c8d6b-92a4-2977-d062-7e0b7036834e@gmail.com>
Date: Fri, 10 May 2019 14:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509210410.5471-5-Kenny.Ho@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VyipZYnOqA+ocOrReFp15qI2bA0IF4Q28CKXaKiV9bw=;
 b=S8zCLbBEZNhofiFoiPsiqz8teOLbY5wF60cJSC9GcRQuhAtSjBmuluTPbLtLwrh7FV
 WO6esPFHxXhqHnOg5bx+QyNSUF3g9jjApKIF8wmDsacMQ0avt0qkloAXhuu++LEjaIxx
 i4ST3fWY94n9sn5h2BBEhxt/9jFpjZ+fuSp3sCBpDRpfgD7gaK6Sd/yVrgQ8JELqboKg
 VU24OmEZA/StXLZGOJaVYKd3fJcJMfCX8tkGPkMKUlon3BTihD+Vj67gEfljPx3yrKB5
 TPyTfauetwh610rmuV09QmdPvT9HSLnEjtZn/SvHsR74Q9rQtPAptfO4pP6BUwNc6ctF
 npVQ==
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

QW0gMDkuMDUuMTkgdW0gMjM6MDQgc2NocmllYiBLZW5ueSBIbzoKPiBUaGUgZHJtIHJlc291cmNl
IGJlaW5nIG1lYXN1cmVkIGFuZCBsaW1pdGVkIGhlcmUgaXMgdGhlIEdFTSBidWZmZXIKPiBvYmpl
Y3RzLiAgVXNlciBhcHBsaWNhdGlvbnMgYWxsb2NhdGUgYW5kIGZyZWUgdGhlc2UgYnVmZmVycy4g
IEluCj4gYWRkaXRpb24sIGEgcHJvY2VzcyBjYW4gYWxsb2NhdGUgYSBidWZmZXIgYW5kIHNoYXJl
IGl0IHdpdGggYW5vdGhlcgo+IHByb2Nlc3MuICBUaGUgY29uc3VtZXIgb2YgYSBzaGFyZWQgYnVm
ZmVyIGNhbiBhbHNvIG91dGxpdmUgdGhlCj4gYWxsb2NhdG9yIG9mIHRoZSBidWZmZXIuCj4KPiBG
b3IgdGhlIHB1cnBvc2Ugb2YgY2dyb3VwIGFjY291bnRpbmcgYW5kIGxpbWl0aW5nLCBvd25lcnNo
aXAgb2YgdGhlCj4gYnVmZmVyIGlzIGRlZW1lZCB0byBiZSB0aGUgY2dyb3VwIGZvciB3aGljaCB0
aGUgYWxsb2NhdGluZyBwcm9jZXNzCj4gYmVsb25ncyB0by4gIFRoZXJlIGlzIG9uZSBsaW1pdCBw
ZXIgZHJtIGRldmljZS4KPgo+IEluIG9yZGVyIHRvIHByZXZlbnQgdGhlIGJ1ZmZlciBvdXRsaXZp
bmcgdGhlIGNncm91cCB0aGF0IG93bnMgaXQsIGEKPiBwcm9jZXNzIGlzIHByZXZlbnRlZCBmcm9t
IGltcG9ydGluZyBidWZmZXJzIHRoYXQgYXJlIG5vdCBvd24gYnkgdGhlCj4gcHJvY2VzcycgY2dy
b3VwIG9yIHRoZSBhbmNlc3RvcnMgb2YgdGhlIHByb2Nlc3MnIGNncm91cC4KPgo+IEZvciB0aGlz
IHJlc291cmNlLCB0aGUgY29udHJvbCBmaWxlcyBhcmUgcHJlZml4ZWQgd2l0aCBkcm0uYnVmZmVy
LnRvdGFsLgo+Cj4gVGhlcmUgYXJlIGZvdXIgY29udHJvbCBmaWxlIHR5cGVzLAo+IHN0YXRzIChy
bykgLSBkaXNwbGF5IGN1cnJlbnQgbWVhc3VyZWQgdmFsdWVzIGZvciBhIHJlc291cmNlCj4gbWF4
IChydykgLSBsaW1pdHMgZm9yIGEgcmVzb3VyY2UKPiBkZWZhdWx0IChybywgcm9vdCBjZ3JvdXAg
b25seSkgLSBkZWZhdWx0IHZhbHVlcyBmb3IgYSByZXNvdXJjZQo+IGhlbHAgKHJvLCByb290IGNn
cm91cCBvbmx5KSAtIGhlbHAgc3RyaW5nIGZvciBhIHJlc291cmNlCj4KPiBFYWNoIGZpbGUgaXMg
bXVsdGktbGluZWQgd2l0aCBvbmUgZW50cnkvbGluZSBwZXIgZHJtIGRldmljZS4KPgo+IFVzYWdl
IGV4YW1wbGVzOgo+IC8vIHNldCBsaW1pdCBmb3IgY2FyZDEgdG8gMUdCCj4gc2VkIC1pICcycy8u
Ki8xMDczNzQxODI0LycgL3N5cy9mcy9jZ3JvdXAvPGNncm91cD4vZHJtLmJ1ZmZlci50b3RhbC5t
YXgKPgo+IC8vIHNldCBsaW1pdCBmb3IgY2FyZDAgdG8gNTEyTUIKPiBzZWQgLWkgJzFzLy4qLzUz
Njg3MDkxMi8nIC9zeXMvZnMvY2dyb3VwLzxjZ3JvdXA+L2RybS5idWZmZXIudG90YWwubWF4Cj4K
PiBDaGFuZ2UtSWQ6IEk0YzI0OWQwNmQ0NWVjNzA5ZDY0ODFkNGNiZTg3YzUxNjg1NDVjNWQwCj4g
U2lnbmVkLW9mZi1ieTogS2VubnkgSG8gPEtlbm55LkhvQGFtZC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgfCAgIDQgKwo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYyAgICAgICAgICAgICAgICAgIHwgICA3ICsKPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYyAgICAgICAgICAgICAgICB8ICAgOSArCj4gICBpbmNsdWRlL2Ry
bS9kcm1fY2dyb3VwLmggICAgICAgICAgICAgICAgICAgfCAgMzQgKystCj4gICBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmggICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKwo+ICAgaW5jbHVkZS9saW51
eC9jZ3JvdXBfZHJtLmggICAgICAgICAgICAgICAgIHwgICAzICsKPiAgIGtlcm5lbC9jZ3JvdXAv
ZHJtLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDI4MCArKysrKysrKysrKysrKysrKysrKysK
PiAgIDcgZmlsZXMgY2hhbmdlZCwgMzQ2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gaW5kZXggOTNi
MmM1YTQ4YTcxLi5iNGMwNzhiN2FkNjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X29iamVjdC5jCj4gQEAgLTM0LDYgKzM0LDcgQEAKPiAgICNpbmNsdWRlIDxkcm0v
ZHJtUC5oPgo+ICAgI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+Cj4gICAjaW5jbHVkZSA8ZHJt
L2RybV9jYWNoZS5oPgo+ICsjaW5jbHVkZSA8ZHJtL2RybV9jZ3JvdXAuaD4KPiAgICNpbmNsdWRl
ICJhbWRncHUuaCIKPiAgICNpbmNsdWRlICJhbWRncHVfdHJhY2UuaCIKPiAgICNpbmNsdWRlICJh
bWRncHVfYW1ka2ZkLmgiCj4gQEAgLTQ0Niw2ICs0NDcsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9i
b19kb19jcmVhdGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gICAJaWYgKCFhbWRncHVf
Ym9fdmFsaWRhdGVfc2l6ZShhZGV2LCBzaXplLCBicC0+ZG9tYWluKSkKPiAgIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gICAKPiArCWlmICghZHJtY2dycF9ib19jYW5fYWxsb2NhdGUoY3VycmVudCwgYWRl
di0+ZGRldiwgc2l6ZSkpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICAgCSpib19wdHIgPSBO
VUxMOwo+ICAgCj4gICAJYWNjX3NpemUgPSB0dG1fYm9fZG1hX2FjY19zaXplKCZhZGV2LT5tbWFu
LmJkZXYsIHNpemUsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCj4gaW5kZXggNmE4MGRiMDc3ZGM2Li5jYmQ0OWJmMzRk
Y2YgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtLmMKPiBAQCAtMzcsMTAgKzM3LDEyIEBACj4gICAjaW5jbHVkZSA8
bGludXgvc2htZW1fZnMuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+Cj4gICAjaW5j
bHVkZSA8bGludXgvbWVtX2VuY3J5cHQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2Nncm91cF9kcm0u
aD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtUC5oPgo+ICAgI2luY2x1ZGUgPGRybS9kcm1fdm1hX21h
bmFnZXIuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+ICAgI2luY2x1ZGUgPGRybS9k
cm1fcHJpbnQuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fY2dyb3VwLmg+Cj4gICAjaW5jbHVkZSAi
ZHJtX2ludGVybmFsLmgiCj4gICAKPiAgIC8qKiBAZmlsZSBkcm1fZ2VtLmMKPiBAQCAtMTU0LDYg
KzE1Niw5IEBAIHZvaWQgZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gICAJb2JqLT5oYW5kbGVfY291bnQgPSAwOwo+ICAgCW9iai0+c2l6ZSA9IHNp
emU7Cj4gICAJZHJtX3ZtYV9ub2RlX3Jlc2V0KCZvYmotPnZtYV9ub2RlKTsKPiArCj4gKwlvYmot
PmRybWNncnAgPSBnZXRfZHJtY2dycChjdXJyZW50KTsKPiArCWRybWNncnBfY2hnX2JvX2FsbG9j
KG9iai0+ZHJtY2dycCwgZGV2LCBzaXplKTsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2dl
bV9wcml2YXRlX29iamVjdF9pbml0KTsKPiAgIAo+IEBAIC04MDQsNiArODA5LDggQEAgZHJtX2dl
bV9vYmplY3RfcmVsZWFzZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAgIAlpZiAob2Jq
LT5maWxwKQo+ICAgCQlmcHV0KG9iai0+ZmlscCk7Cj4gICAKPiArCWRybWNncnBfdW5jaGdfYm9f
YWxsb2Mob2JqLT5kcm1jZ3JwLCBvYmotPmRldiwgb2JqLT5zaXplKTsKPiArCj4gICAJZHJtX2dl
bV9mcmVlX21tYXBfb2Zmc2V0KG9iaik7Cj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MKGRybV9nZW1f
b2JqZWN0X3JlbGVhc2UpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBpbmRleCAyMzFlM2Y2ZDVmNDEuLmZh
ZWQ1NjExYTFjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPiBAQCAtMzIsNiArMzIsNyBAQAo+ICAg
I2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5oPgo+
ICAgI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Nncm91cC5oPgo+
ICAgCj4gICAjaW5jbHVkZSAiZHJtX2ludGVybmFsLmgiCj4gICAKPiBAQCAtNzk0LDYgKzc5NSw3
IEBAIGludCBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAo+ICAgewo+ICAgCXN0cnVjdCBkbWFfYnVmICpkbWFfYnVmOwo+ICAgCXN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqOwo+ICsJc3RydWN0IGRybWNncnAgKmRybWNncnAgPSBnZXRfZHJtY2dycChj
dXJyZW50KTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gICAJZG1hX2J1ZiA9IGRtYV9idWZfZ2V0KHBy
aW1lX2ZkKTsKPiBAQCAtODE4LDYgKzgyMCwxMyBAQCBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19o
YW5kbGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgIAkJZ290byBvdXRfdW5sb2NrOwo+ICAg
CX0KPiAgIAo+ICsJLyogb25seSBhbGxvdyBibyBmcm9tIHRoZSBzYW1lIGNncm91cCBvciBpdHMg
YW5jZXN0b3IgdG8gYmUgaW1wb3J0ZWQgKi8KPiArCWlmIChkcm1jZ3JwICE9IE5VTEwgJiYKPiAr
CQkJIWRybWNncnBfaXNfc2VsZl9vcl9hbmNlc3Rvcihkcm1jZ3JwLCBvYmotPmRybWNncnApKSB7
Cj4gKwkJcmV0ID0gLUVBQ0NFUzsKPiArCQlnb3RvIG91dF91bmxvY2s7Cj4gKwl9Cj4gKwoKVGhp
cyB3aWxsIG1vc3QgbGlrZWx5IGdvIHVwIGluIGZsYW1lcy4KCklmIEknbSBub3QgY29tcGxldGVs
eSBtaXN0YWtlbiB3ZSBhbHJlYWR5IHVzZSAKZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoKSB0
byBleGNoYW5nZSBoYW5kbGVzIGJldHdlZW4gZGlmZmVyZW50IApjZ3JvdXBzIGluIGN1cnJlbnQg
Y29udGFpbmVyIHVzYWdlcy4KCkNocmlzdGlhbi4KCj4gICAJaWYgKG9iai0+ZG1hX2J1Zikgewo+
ICAgCQlXQVJOX09OKG9iai0+ZG1hX2J1ZiAhPSBkbWFfYnVmKTsKPiAgIAl9IGVsc2Ugewo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmggYi9pbmNsdWRlL2RybS9kcm1fY2dy
b3VwLmgKPiBpbmRleCBkZGI5ZWFiNjQzNjAuLjg3MTFiN2M1ZjdiZiAxMDA2NDQKPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fY2dyb3VwLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fY2dyb3VwLmgK
PiBAQCAtNCwxMiArNCwyMCBAQAo+ICAgI2lmbmRlZiBfX0RSTV9DR1JPVVBfSF9fCj4gICAjZGVm
aW5lIF9fRFJNX0NHUk9VUF9IX18KPiAgIAo+ICsjaW5jbHVkZSA8bGludXgvY2dyb3VwX2RybS5o
Pgo+ICsKPiAgICNpZmRlZiBDT05GSUdfQ0dST1VQX0RSTQo+ICAgCj4gICBpbnQgZHJtY2dycF9y
ZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSk7Cj4gLQo+ICAgaW50IGRy
bWNncnBfdW5yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSk7Cj4gLQo+
ICtib29sIGRybWNncnBfaXNfc2VsZl9vcl9hbmNlc3RvcihzdHJ1Y3QgZHJtY2dycCAqc2VsZiwK
PiArCQlzdHJ1Y3QgZHJtY2dycCAqcmVsYXRpdmUpOwo+ICt2b2lkIGRybWNncnBfY2hnX2JvX2Fs
bG9jKHN0cnVjdCBkcm1jZ3JwICpkcm1jZ3JwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICsJ
CXNpemVfdCBzaXplKTsKPiArdm9pZCBkcm1jZ3JwX3VuY2hnX2JvX2FsbG9jKHN0cnVjdCBkcm1j
Z3JwICpkcm1jZ3JwLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICsJCXNpemVfdCBzaXplKTsK
PiArYm9vbCBkcm1jZ3JwX2JvX2Nhbl9hbGxvY2F0ZShzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRhc2ss
IHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJc2l6ZV90IHNpemUpOwo+ICAgI2Vsc2UKPiAg
IHN0YXRpYyBpbmxpbmUgaW50IGRybWNncnBfcmVnaXN0ZXJfZGV2aWNlKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXZpY2UpCj4gICB7Cj4gQEAgLTIwLDUgKzI4LDI3IEBAIHN0YXRpYyBpbmxpbmUgaW50
IGRybWNncnBfdW5yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldmljZSkKPiAg
IHsKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiArCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBkcm1jZ3Jw
X2lzX3NlbGZfb3JfYW5jZXN0b3Ioc3RydWN0IGRybWNncnAgKnNlbGYsCj4gKwkJc3RydWN0IGRy
bWNncnAgKnJlbGF0aXZlKQo+ICt7Cj4gKwlyZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBkcm1jZ3JwX2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2dycCAqZHJtY2dy
cCwKPiArCQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAlzaXplX3Qgc2l6ZSkKPiArewo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dycF91bmNoZ19ib19hbGxvYyhzdHJ1Y3QgZHJt
Y2dycCAqZHJtY2dycCwKPiArCQlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAlzaXplX3Qgc2l6ZSkK
PiArewo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgZHJtY2dycF9ib19jYW5fYWxsb2Nh
dGUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+ICsJCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CXNpemVfdCBzaXplKQo+ICt7Cj4gKwlyZXR1cm4gdHJ1ZTsKPiArfQo+ICAgI2VuZGlmIC8qIENP
TkZJR19DR1JPVVBfRFJNICovCj4gICAjZW5kaWYgLyogX19EUk1fQ0dST1VQX0hfXyAqLwo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgK
PiBpbmRleCBjOTU3Mjc0MjUyODQuLjAyODU0YzY3NGI1YyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fZ2VtLmgKPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPiBAQCAtMjcyLDYg
KzI3MiwxNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qgewo+ICAgCSAqCj4gICAJICovCj4gICAJ
Y29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzICpmdW5jczsKPiArCj4gKwkvKioKPiAr
CSAqIEBkcm1jZ3JwOgo+ICsJICoKPiArCSAqIERSTSBjZ3JvdXAgdGhpcyBHRU0gb2JqZWN0IGJl
bG9uZ3MgdG8uCj4gKyAgICAgICAgICoKPiArICAgICAgICAgKiBUaGlzIGlzIHVzZWQgdG8gdHJh
Y2sgYW5kIGxpbWl0IHRoZSBhbW91bnQgb2YgR0VNIG9iamVjdHMgYSB1c2VyCj4gKyAgICAgICAg
ICogY2FuIGFsbG9jYXRlLiAgU2luY2UgR0VNIG9iamVjdHMgY2FuIGJlIHNoYXJlZCwgdGhpcyBp
cyBhbHNvIHVzZWQKPiArICAgICAgICAgKiB0byBlbnN1cmUgR0VNIG9iamVjdHMgYXJlIG9ubHkg
c2hhcmVkIHdpdGhpbiB0aGUgc2FtZSBjZ3JvdXAuCj4gKwkgKi8KPiArCXN0cnVjdCBkcm1jZ3Jw
ICpkcm1jZ3JwOwo+ICAgfTsKPiAgIAo+ICAgLyoqCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvY2dyb3VwX2RybS5oIGIvaW5jbHVkZS9saW51eC9jZ3JvdXBfZHJtLmgKPiBpbmRleCBkN2Nj
ZjQzNGNhNmIuLmZlMTRiYTdiYjFjZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2Nncm91
cF9kcm0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvY2dyb3VwX2RybS5oCj4gQEAgLTE1LDYgKzE1
LDkgQEAKPiAgIAo+ICAgc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlIHsKPiAgIAkvKiBm
b3IgcGVyIGRldmljZSBzdGF0cyAqLwo+ICsJczY0CQkJYm9fc3RhdHNfdG90YWxfYWxsb2NhdGVk
Owo+ICsKPiArCXM2NAkJCWJvX2xpbWl0c190b3RhbF9hbGxvY2F0ZWQ7Cj4gICB9Owo+ICAgCj4g
ICBzdHJ1Y3QgZHJtY2dycCB7Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9jZ3JvdXAvZHJtLmMgYi9r
ZXJuZWwvY2dyb3VwL2RybS5jCj4gaW5kZXggZjllZjRiZjA0MmQ4Li5iYzNhYmZmMDkxMTMgMTAw
NjQ0Cj4gLS0tIGEva2VybmVsL2Nncm91cC9kcm0uYwo+ICsrKyBiL2tlcm5lbC9jZ3JvdXAvZHJt
LmMKPiBAQCAtMTUsNiArMTUsMjIgQEAgc3RhdGljIERFRklORV9NVVRFWChkcm1jZ3JwX211dGV4
KTsKPiAgIHN0cnVjdCBkcm1jZ3JwX2RldmljZSB7Cj4gICAJc3RydWN0IGRybV9kZXZpY2UJKmRl
djsKPiAgIAlzdHJ1Y3QgbXV0ZXgJCW11dGV4Owo+ICsKPiArCXM2NAkJCWJvX2xpbWl0c190b3Rh
bF9hbGxvY2F0ZWRfZGVmYXVsdDsKPiArfTsKPiArCj4gKyNkZWZpbmUgRFJNQ0dfQ1RGX1BSSVZf
U0laRSAzCj4gKyNkZWZpbmUgRFJNQ0dfQ1RGX1BSSVZfTUFTSyBHRU5NQVNLKChEUk1DR19DVEZf
UFJJVl9TSVpFIC0gMSksIDApCj4gKwo+ICtlbnVtIGRybWNncnBfcmVzX3R5cGUgewo+ICsJRFJN
Q0dSUF9UWVBFX0JPX1RPVEFMLAo+ICt9Owo+ICsKPiArZW51bSBkcm1jZ3JwX2ZpbGVfdHlwZSB7
Cj4gKwlEUk1DR1JQX0ZUWVBFX1NUQVRTLAo+ICsJRFJNQ0dSUF9GVFlQRV9NQVgsCj4gKwlEUk1D
R1JQX0ZUWVBFX0RFRkFVTFQsCj4gKwlEUk1DR1JQX0ZUWVBFX0hFTFAsCj4gICB9Owo+ICAgCj4g
ICAvKiBpbmRleGVkIGJ5IGRybV9taW5vciBmb3IgYWNjZXNzIHNwZWVkICovCj4gQEAgLTUzLDYg
KzY5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGluaXRfZHJtY2dycF9zaW5nbGUoc3RydWN0IGRy
bWNncnAgKmRybWNncnAsIGludCBpKQo+ICAgCX0KPiAgIAo+ICAgCS8qIHNldCBkZWZhdWx0cyBo
ZXJlICovCj4gKwlpZiAoa25vd25fZHJtY2dycF9kZXZzW2ldICE9IE5VTEwpIHsKPiArCQlkZHIt
PmJvX2xpbWl0c190b3RhbF9hbGxvY2F0ZWQgPQo+ICsJCSAga25vd25fZHJtY2dycF9kZXZzW2ld
LT5ib19saW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQ7Cj4gKwl9Cj4gICAKPiAgIAlyZXR1
cm4gMDsKPiAgIH0KPiBAQCAtOTksNyArMTE5LDE4NyBAQCBkcm1jZ3JwX2Nzc19hbGxvYyhzdHJ1
Y3QgY2dyb3VwX3N1YnN5c19zdGF0ZSAqcGFyZW50X2NzcykKPiAgIAlyZXR1cm4gJmRybWNncnAt
PmNzczsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHJtY2dycF9wcmludF9zdGF0
cyhzdHJ1Y3QgZHJtY2dycF9kZXZpY2VfcmVzb3VyY2UgKmRkciwKPiArCQlzdHJ1Y3Qgc2VxX2Zp
bGUgKnNmLCBlbnVtIGRybWNncnBfcmVzX3R5cGUgdHlwZSkKPiArewo+ICsJaWYgKGRkciA9PSBO
VUxMKSB7Cj4gKwkJc2VxX3B1dHMoc2YsICJcbiIpOwo+ICsJCXJldHVybjsKPiArCX0KPiArCj4g
Kwlzd2l0Y2ggKHR5cGUpIHsKPiArCWNhc2UgRFJNQ0dSUF9UWVBFX0JPX1RPVEFMOgo+ICsJCXNl
cV9wcmludGYoc2YsICIlbGxkXG4iLCBkZHItPmJvX3N0YXRzX3RvdGFsX2FsbG9jYXRlZCk7Cj4g
KwkJYnJlYWs7Cj4gKwlkZWZhdWx0Ogo+ICsJCXNlcV9wdXRzKHNmLCAiXG4iKTsKPiArCQlicmVh
azsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGRybWNncnBfcHJpbnRfbGlt
aXRzKHN0cnVjdCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZSAqZGRyLAo+ICsJCXN0cnVjdCBzZXFf
ZmlsZSAqc2YsIGVudW0gZHJtY2dycF9yZXNfdHlwZSB0eXBlKQo+ICt7Cj4gKwlpZiAoZGRyID09
IE5VTEwpIHsKPiArCQlzZXFfcHV0cyhzZiwgIlxuIik7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsK
PiArCXN3aXRjaCAodHlwZSkgewo+ICsJY2FzZSBEUk1DR1JQX1RZUEVfQk9fVE9UQUw6Cj4gKwkJ
c2VxX3ByaW50ZihzZiwgIiVsbGRcbiIsIGRkci0+Ym9fbGltaXRzX3RvdGFsX2FsbG9jYXRlZCk7
Cj4gKwkJYnJlYWs7Cj4gKwlkZWZhdWx0Ogo+ICsJCXNlcV9wdXRzKHNmLCAiXG4iKTsKPiArCQli
cmVhazsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGRybWNncnBfcHJpbnRf
ZGVmYXVsdChzdHJ1Y3QgZHJtY2dycF9kZXZpY2UgKmRkZXYsCj4gKwkJc3RydWN0IHNlcV9maWxl
ICpzZiwgZW51bSBkcm1jZ3JwX3Jlc190eXBlIHR5cGUpCj4gK3sKPiArCWlmIChkZGV2ID09IE5V
TEwpIHsKPiArCQlzZXFfcHV0cyhzZiwgIlxuIik7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+ICsKPiAr
CXN3aXRjaCAodHlwZSkgewo+ICsJY2FzZSBEUk1DR1JQX1RZUEVfQk9fVE9UQUw6Cj4gKwkJc2Vx
X3ByaW50ZihzZiwgIiVsbGRcbiIsIGRkZXYtPmJvX2xpbWl0c190b3RhbF9hbGxvY2F0ZWRfZGVm
YXVsdCk7Cj4gKwkJYnJlYWs7Cj4gKwlkZWZhdWx0Ogo+ICsJCXNlcV9wdXRzKHNmLCAiXG4iKTsK
PiArCQlicmVhazsKPiArCX0KPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIGRybWNncnBf
cHJpbnRfaGVscChpbnQgY2FyZE51bSwgc3RydWN0IHNlcV9maWxlICpzZiwKPiArCQllbnVtIGRy
bWNncnBfcmVzX3R5cGUgdHlwZSkKPiArewo+ICsJc3dpdGNoICh0eXBlKSB7Cj4gKwljYXNlIERS
TUNHUlBfVFlQRV9CT19UT1RBTDoKPiArCQlzZXFfcHJpbnRmKHNmLAo+ICsJCSJUb3RhbCBhbW91
bnQgb2YgYnVmZmVyIGFsbG9jYXRpb24gaW4gYnl0ZXMgZm9yIGNhcmQlZFxuIiwKPiArCQljYXJk
TnVtKTsKPiArCQlicmVhazsKPiArCWRlZmF1bHQ6Cj4gKwkJc2VxX3B1dHMoc2YsICJcbiIpOwo+
ICsJCWJyZWFrOwo+ICsJfQo+ICt9Cj4gKwo+ICtpbnQgZHJtY2dycF9ib19zaG93KHN0cnVjdCBz
ZXFfZmlsZSAqc2YsIHZvaWQgKnYpCj4gK3sKPiArCXN0cnVjdCBkcm1jZ3JwICpkcm1jZ3JwID0g
Y3NzX2RybWNncnAoc2VxX2NzcyhzZikpOwo+ICsJc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291
cmNlICpkZHIgPSBOVUxMOwo+ICsJZW51bSBkcm1jZ3JwX2ZpbGVfdHlwZSBmX3R5cGUgPSBzZXFf
Y2Z0KHNmKS0+Cj4gKwkJcHJpdmF0ZSAmIERSTUNHX0NURl9QUklWX01BU0s7Cj4gKwllbnVtIGRy
bWNncnBfcmVzX3R5cGUgdHlwZSA9IHNlcV9jZnQoc2YpLT4KPiArCQlwcml2YXRlID4+IERSTUNH
X0NURl9QUklWX1NJWkU7Cj4gKwlzdHJ1Y3QgZHJtY2dycF9kZXZpY2UgKmRkZXY7Cj4gKwlpbnQg
aTsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDw9IG1heF9taW5vcjsgaSsrKSB7Cj4gKwkJZGRyID0g
ZHJtY2dycC0+ZGV2X3Jlc291cmNlc1tpXTsKPiArCQlkZGV2ID0ga25vd25fZHJtY2dycF9kZXZz
W2ldOwo+ICsKPiArCQlzd2l0Y2ggKGZfdHlwZSkgewo+ICsJCWNhc2UgRFJNQ0dSUF9GVFlQRV9T
VEFUUzoKPiArCQkJZHJtY2dycF9wcmludF9zdGF0cyhkZHIsIHNmLCB0eXBlKTsKPiArCQkJYnJl
YWs7Cj4gKwkJY2FzZSBEUk1DR1JQX0ZUWVBFX01BWDoKPiArCQkJZHJtY2dycF9wcmludF9saW1p
dHMoZGRyLCBzZiwgdHlwZSk7Cj4gKwkJCWJyZWFrOwo+ICsJCWNhc2UgRFJNQ0dSUF9GVFlQRV9E
RUZBVUxUOgo+ICsJCQlkcm1jZ3JwX3ByaW50X2RlZmF1bHQoZGRldiwgc2YsIHR5cGUpOwo+ICsJ
CQlicmVhazsKPiArCQljYXNlIERSTUNHUlBfRlRZUEVfSEVMUDoKPiArCQkJZHJtY2dycF9wcmlu
dF9oZWxwKGksIHNmLCB0eXBlKTsKPiArCQkJYnJlYWs7Cj4gKwkJZGVmYXVsdDoKPiArCQkJc2Vx
X3B1dHMoc2YsICJcbiIpOwo+ICsJCQlicmVhazsKPiArCQl9Cj4gKwl9Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gK3NzaXplX3QgZHJtY2dycF9ib19saW1pdF93cml0ZShzdHJ1Y3Qga2Vy
bmZzX29wZW5fZmlsZSAqb2YsIGNoYXIgKmJ1ZiwKPiArCQlzaXplX3QgbmJ5dGVzLCBsb2ZmX3Qg
b2ZmKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCA9IGNzc19kcm1jZ3JwKG9mX2Nz
cyhvZikpOwo+ICsJZW51bSBkcm1jZ3JwX3Jlc190eXBlIHR5cGUgPSBvZl9jZnQob2YpLT5wcml2
YXRlID4+IERSTUNHX0NURl9QUklWX1NJWkU7Cj4gKwljaGFyICpjZnRfbmFtZSA9IG9mX2NmdChv
ZiktPm5hbWU7Cj4gKwljaGFyICpsaW1pdHMgPSBzdHJzdHJpcChidWYpOwo+ICsJc3RydWN0IGRy
bWNncnBfZGV2aWNlX3Jlc291cmNlICpkZHI7Cj4gKwljaGFyICpzdmFsOwo+ICsJczY0IHZhbDsK
PiArCWludCBpID0gMDsKPiArCWludCByYzsKPiArCj4gKwl3aGlsZSAoaSA8PSBtYXhfbWlub3Ig
JiYgbGltaXRzICE9IE5VTEwpIHsKPiArCQlzdmFsID0gIHN0cnNlcCgmbGltaXRzLCAiXG4iKTsK
PiArCQlyYyA9IGtzdHJ0b2xsKHN2YWwsIDAsICZ2YWwpOwo+ICsKPiArCQlpZiAocmMpIHsKPiAr
CQkJcHJfZXJyKCJkcm1jZ3JwOiAlczogbWlub3IgJWQsIGVyciAlZC4gIiwKPiArCQkJCWNmdF9u
YW1lLCBpLCByYyk7Cj4gKwkJCXByX2NvbnRfY2dyb3VwX25hbWUoZHJtY2dycC0+Y3NzLmNncm91
cCk7Cj4gKwkJCXByX2NvbnQoIlxuIik7Cj4gKwkJfSBlbHNlIHsKPiArCQkJZGRyID0gZHJtY2dy
cC0+ZGV2X3Jlc291cmNlc1tpXTsKPiArCQkJc3dpdGNoICh0eXBlKSB7Cj4gKwkJCWNhc2UgRFJN
Q0dSUF9UWVBFX0JPX1RPVEFMOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlm
ICh2YWwgPCAwKSBjb250aW51ZTsKPiArCQkJCWRkci0+Ym9fbGltaXRzX3RvdGFsX2FsbG9jYXRl
ZCA9IHZhbDsKPiArCQkJCWJyZWFrOwo+ICsJCQlkZWZhdWx0Ogo+ICsJCQkJYnJlYWs7Cj4gKwkJ
CX0KPiArCQl9Cj4gKwo+ICsJCWkrKzsKPiArCX0KPiArCj4gKwlpZiAoaSA8PSBtYXhfbWlub3Ip
IHsKPiArCQlwcl9lcnIoImRybWNncnA6ICVzOiBsZXNzIGVudHJpZXMgdGhhbiAjIG9mIGRybSBk
ZXZpY2VzLiAiLAo+ICsJCQkJY2Z0X25hbWUpOwo+ICsJCXByX2NvbnRfY2dyb3VwX25hbWUoZHJt
Y2dycC0+Y3NzLmNncm91cCk7Cj4gKwkJcHJfY29udCgiXG4iKTsKPiArCX0KPiArCj4gKwlyZXR1
cm4gbmJ5dGVzOwo+ICt9Cj4gKwo+ICAgc3RydWN0IGNmdHlwZSBmaWxlc1tdID0gewo+ICsJewo+
ICsJCS5uYW1lID0gImJ1ZmZlci50b3RhbC5zdGF0cyIsCj4gKwkJLnNlcV9zaG93ID0gZHJtY2dy
cF9ib19zaG93LAo+ICsJCS5wcml2YXRlID0gKERSTUNHUlBfVFlQRV9CT19UT1RBTCA8PCBEUk1D
R19DVEZfUFJJVl9TSVpFKSB8Cj4gKwkJCURSTUNHUlBfRlRZUEVfU1RBVFMsCj4gKwl9LAo+ICsJ
ewo+ICsJCS5uYW1lID0gImJ1ZmZlci50b3RhbC5kZWZhdWx0IiwKPiArCQkuc2VxX3Nob3cgPSBk
cm1jZ3JwX2JvX3Nob3csCj4gKwkJLmZsYWdzID0gQ0ZUWVBFX09OTFlfT05fUk9PVCwKPiArCQku
cHJpdmF0ZSA9IChEUk1DR1JQX1RZUEVfQk9fVE9UQUwgPDwgRFJNQ0dfQ1RGX1BSSVZfU0laRSkg
fAo+ICsJCQlEUk1DR1JQX0ZUWVBFX0RFRkFVTFQsCj4gKwl9LAo+ICsJewo+ICsJCS5uYW1lID0g
ImJ1ZmZlci50b3RhbC5oZWxwIiwKPiArCQkuc2VxX3Nob3cgPSBkcm1jZ3JwX2JvX3Nob3csCj4g
KwkJLmZsYWdzID0gQ0ZUWVBFX09OTFlfT05fUk9PVCwKPiArCQkucHJpdmF0ZSA9IChEUk1DR1JQ
X1RZUEVfQk9fVE9UQUwgPDwgRFJNQ0dfQ1RGX1BSSVZfU0laRSkgfAo+ICsJCQlEUk1DR1JQX0ZU
WVBFX0hFTFAsCj4gKwl9LAo+ICsJewo+ICsJCS5uYW1lID0gImJ1ZmZlci50b3RhbC5tYXgiLAo+
ICsJCS53cml0ZSA9IGRybWNncnBfYm9fbGltaXRfd3JpdGUsCj4gKwkJLnNlcV9zaG93ID0gZHJt
Y2dycF9ib19zaG93LAo+ICsJCS5wcml2YXRlID0gKERSTUNHUlBfVFlQRV9CT19UT1RBTCA8PCBE
Uk1DR19DVEZfUFJJVl9TSVpFKSB8Cj4gKwkJCURSTUNHUlBfRlRZUEVfTUFYLAo+ICsJfSwKPiAg
IAl7IH0JLyogdGVybWluYXRlICovCj4gICB9Owo+ICAgCj4gQEAgLTEyMiw2ICszMjIsOCBAQCBp
bnQgZHJtY2dycF9yZWdpc3Rlcl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKPiAgIAkJ
cmV0dXJuIC1FTk9NRU07Cj4gICAKPiAgIAlkZGV2LT5kZXYgPSBkZXY7Cj4gKwlkZGV2LT5ib19s
aW1pdHNfdG90YWxfYWxsb2NhdGVkX2RlZmF1bHQgPSBTNjRfTUFYOwo+ICsKPiAgIAltdXRleF9p
bml0KCZkZGV2LT5tdXRleCk7Cj4gICAKPiAgIAltdXRleF9sb2NrKCZkcm1jZ3JwX211dGV4KTsK
PiBAQCAtMTU2LDMgKzM1OCw4MSBAQCBpbnQgZHJtY2dycF91bnJlZ2lzdGVyX2RldmljZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgRVhQT1JUX1NZTUJP
TChkcm1jZ3JwX3VucmVnaXN0ZXJfZGV2aWNlKTsKPiArCj4gK2Jvb2wgZHJtY2dycF9pc19zZWxm
X29yX2FuY2VzdG9yKHN0cnVjdCBkcm1jZ3JwICpzZWxmLCBzdHJ1Y3QgZHJtY2dycCAqcmVsYXRp
dmUpCj4gK3sKPiArCWZvciAoOyBzZWxmICE9IE5VTEw7IHNlbGYgPSBwYXJlbnRfZHJtY2dycChz
ZWxmKSkKPiArCQlpZiAoc2VsZiA9PSByZWxhdGl2ZSkKPiArCQkJcmV0dXJuIHRydWU7Cj4gKwo+
ICsJcmV0dXJuIGZhbHNlOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtY2dycF9pc19zZWxmX29y
X2FuY2VzdG9yKTsKPiArCj4gK2Jvb2wgZHJtY2dycF9ib19jYW5fYWxsb2NhdGUoc3RydWN0IHRh
c2tfc3RydWN0ICp0YXNrLCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICsJCXNpemVfdCBzaXpl
KQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtY2dycCAqZHJtY2dycCA9IGdldF9kcm1jZ3JwKHRhc2spOwo+
ICsJc3RydWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlICpkZHI7Cj4gKwlzdHJ1Y3QgZHJtY2dy
cF9kZXZpY2VfcmVzb3VyY2UgKmQ7Cj4gKwlpbnQgZGV2SWR4ID0gZGV2LT5wcmltYXJ5LT5pbmRl
eDsKPiArCWJvb2wgcmVzdWx0ID0gdHJ1ZTsKPiArCXM2NCBkZWx0YSA9IDA7Cj4gKwo+ICsJaWYg
KGRybWNncnAgPT0gTlVMTCB8fCBkcm1jZ3JwID09IHJvb3RfZHJtY2dycCkKPiArCQlyZXR1cm4g
dHJ1ZTsKPiArCj4gKwlkZHIgPSBkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW2RldklkeF07Cj4gKwlt
dXRleF9sb2NrKCZrbm93bl9kcm1jZ3JwX2RldnNbZGV2SWR4XS0+bXV0ZXgpOwo+ICsJZm9yICgg
OyBkcm1jZ3JwICE9IHJvb3RfZHJtY2dycDsgZHJtY2dycCA9IHBhcmVudF9kcm1jZ3JwKGRybWNn
cnApKSB7Cj4gKwkJZCA9IGRybWNncnAtPmRldl9yZXNvdXJjZXNbZGV2SWR4XTsKPiArCQlkZWx0
YSA9IGQtPmJvX2xpbWl0c190b3RhbF9hbGxvY2F0ZWQgLQo+ICsJCQkJZC0+Ym9fc3RhdHNfdG90
YWxfYWxsb2NhdGVkOwo+ICsKPiArCQlpZiAoZGVsdGEgPD0gMCB8fCBzaXplID4gZGVsdGEpIHsK
PiArCQkJcmVzdWx0ID0gZmFsc2U7Cj4gKwkJCWJyZWFrOwo+ICsJCX0KPiArCX0KPiArCW11dGV4
X3VubG9jaygma25vd25fZHJtY2dycF9kZXZzW2RldklkeF0tPm11dGV4KTsKPiArCj4gKwlyZXR1
cm4gcmVzdWx0Owo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtY2dycF9ib19jYW5fYWxsb2NhdGUp
Owo+ICsKPiArdm9pZCBkcm1jZ3JwX2NoZ19ib19hbGxvYyhzdHJ1Y3QgZHJtY2dycCAqZHJtY2dy
cCwgc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiArCQlzaXplX3Qgc2l6ZSkKPiArewo+ICsJc3Ry
dWN0IGRybWNncnBfZGV2aWNlX3Jlc291cmNlICpkZHI7Cj4gKwlpbnQgZGV2SWR4ID0gZGV2LT5w
cmltYXJ5LT5pbmRleDsKPiArCj4gKwlpZiAoZHJtY2dycCA9PSBOVUxMIHx8IGtub3duX2RybWNn
cnBfZGV2c1tkZXZJZHhdID09IE5VTEwpCj4gKwkJcmV0dXJuOwo+ICsKPiArCW11dGV4X2xvY2so
Jmtub3duX2RybWNncnBfZGV2c1tkZXZJZHhdLT5tdXRleCk7Cj4gKwlmb3IgKCA7IGRybWNncnAg
IT0gTlVMTDsgZHJtY2dycCA9IHBhcmVudF9kcm1jZ3JwKGRybWNncnApKSB7Cj4gKwkJZGRyID0g
ZHJtY2dycC0+ZGV2X3Jlc291cmNlc1tkZXZJZHhdOwo+ICsKPiArCQlkZHItPmJvX3N0YXRzX3Rv
dGFsX2FsbG9jYXRlZCArPSAoczY0KXNpemU7Cj4gKwl9Cj4gKwltdXRleF91bmxvY2soJmtub3du
X2RybWNncnBfZGV2c1tkZXZJZHhdLT5tdXRleCk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1j
Z3JwX2NoZ19ib19hbGxvYyk7Cj4gKwo+ICt2b2lkIGRybWNncnBfdW5jaGdfYm9fYWxsb2Moc3Ry
dWN0IGRybWNncnAgKmRybWNncnAsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gKwkJc2l6ZV90
IHNpemUpCj4gK3sKPiArCXN0cnVjdCBkcm1jZ3JwX2RldmljZV9yZXNvdXJjZSAqZGRyOwo+ICsJ
aW50IGRldklkeCA9IGRldi0+cHJpbWFyeS0+aW5kZXg7Cj4gKwo+ICsJaWYgKGRybWNncnAgPT0g
TlVMTCB8fCBrbm93bl9kcm1jZ3JwX2RldnNbZGV2SWR4XSA9PSBOVUxMKQo+ICsJCXJldHVybjsK
PiArCj4gKwlkZHIgPSBkcm1jZ3JwLT5kZXZfcmVzb3VyY2VzW2RldklkeF07Cj4gKwltdXRleF9s
b2NrKCZrbm93bl9kcm1jZ3JwX2RldnNbZGV2SWR4XS0+bXV0ZXgpOwo+ICsJZm9yICggOyBkcm1j
Z3JwICE9IE5VTEw7IGRybWNncnAgPSBwYXJlbnRfZHJtY2dycChkcm1jZ3JwKSkKPiArCQlkcm1j
Z3JwLT5kZXZfcmVzb3VyY2VzW2RldklkeF0tPmJvX3N0YXRzX3RvdGFsX2FsbG9jYXRlZAo+ICsJ
CQktPSAoczY0KXNpemU7Cj4gKwltdXRleF91bmxvY2soJmtub3duX2RybWNncnBfZGV2c1tkZXZJ
ZHhdLT5tdXRleCk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChkcm1jZ3JwX3VuY2hnX2JvX2FsbG9j
KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
