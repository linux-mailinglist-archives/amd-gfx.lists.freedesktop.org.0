Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D18D3734F
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 13:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1439891AC;
	Thu,  6 Jun 2019 11:49:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A4A891AC
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 11:49:58 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p11so2089015wre.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 04:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0NfYIqWZK5ycrIEJwkSoEnI66xC5ONnnIETLEr3NLrM=;
 b=H0tojmhWEa5600LsmaMaNfluDAvpYve+2vCF6mGTZ953Xl7dEvERACk8Mjcg/sIl7s
 9Qo/USACK3j0Yc0T8bVfzA8N16778JylzGY7siSIJfbUh9ga+AtFVeJwwIMtTcOBma6O
 TcDOiMYHSAIdkN9mKzkVuzg9xrlvPj7Jfsos4nVkKn3v4hV/1+AcieOsLCdVpP9u5FVV
 nkSNPghtUCVVWYHKoq2k4sixeeymCZaSmuWqHG7K2W38pWjva4reebkMvJXNbnFdJVt4
 kqNVJis9OpnMhc/zi3M3YbXLcrcgJKXPQuHJa4tKVVMmYvaWoIy5FfQyaj8jUSw/OK/9
 ntEA==
X-Gm-Message-State: APjAAAUsT2fkluzjU+7noYD4S2HWUbqbb+sswnrWKKHXODUYztgM2b/h
 s/JJeYTReWQ20rHUbQS+eQ0E/BLr
X-Google-Smtp-Source: APXvYqyxXaShZxHagD0tQKAQwJwTL0c8H8mnIgVzUyR3VYms0h5W9O36EkuKSseB3q6UwjXRV5STLA==
X-Received: by 2002:adf:ee42:: with SMTP id w2mr15566552wro.253.1559821796852; 
 Thu, 06 Jun 2019 04:49:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k2sm2363608wrg.41.2019.06.06.04.49.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 04:49:56 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v3)
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190606105023.13750-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3fd2e057-0284-2bc7-7b76-8280646aad52@gmail.com>
Date: Thu, 6 Jun 2019 13:49:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606105023.13750-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0NfYIqWZK5ycrIEJwkSoEnI66xC5ONnnIETLEr3NLrM=;
 b=lxM+kKMcu/F+jd5x4tG9xPJPLZMPcOANJSyh+MSTr/DaLOxwSpee6DYd+KoioEA1yC
 YY7rhMJU+EsDNhC+gyvnfv3rRe3Wr+5U7Kn90mby6QmUKzACfbc9VPUkBuawOT2IMQFi
 a87Fi9pYIvNgCpZglqmLppLF+XXVrtsfQtlyCGy0oHJ9iF2TkGJOq7VLL8/BACVF3w76
 whLNVrQY7Qr/bVZS/As1Nlce1SVbR+KDsvoaLjaoCb99MTAQs4qdfR/ZciulfqyRg8QN
 SpSpapcIS5VflBR/8ndFREgHUgFJPiLfDpyrBZwaQVstI2woYnWXlT3w1jNu2YJF1X99
 QRZQ==
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

QW0gMDYuMDYuMTkgdW0gMTI6NTAgc2NocmllYiBTdERlbmlzLCBUb206Cj4gVGhpcyBvcHRpb24g
aXMgbm8gbG9uZ2VyIG5lZWRlZC4gIFRoZSBkZWZhdWx0IGNvZGUgcGF0aHMKPiBhcmUgbm93IHRo
ZSBvbmx5IG9wdGlvbi4KPgo+IHYyOiBBZGQgSFBBR0Ugc3VwcG9ydCBhbmQgYSBkZWZhdWx0IGZv
ciBub24gY29udGlndW91cyBtYXBzCj4gdjM6IE1pc3JlYWQgNTEyIHBhZ2VzIGFzIE1pQiAuLi4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgIHwgIDEg
LQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICAgfCAgNyAt
LS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICAgICB8
ICA4IC0tLS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9t
Z3IuYyB8IDE0ICsrKysrKysrKy0tLS0tCj4gICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMjEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+
IGluZGV4IDE5YTAwMjgyZTM0Yy4uZTU0ZjMxODY1ZjYwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1LmgKPiBAQCAtMTQyLDcgKzE0Miw2IEBAIGV4dGVybiB1aW50IGFtZGdwdV9z
ZG1hX3BoYXNlX3F1YW50dW07Cj4gICBleHRlcm4gY2hhciAqYW1kZ3B1X2Rpc2FibGVfY3U7Cj4g
ICBleHRlcm4gY2hhciAqYW1kZ3B1X3ZpcnR1YWxfZGlzcGxheTsKPiAgIGV4dGVybiB1aW50IGFt
ZGdwdV9wcF9mZWF0dXJlX21hc2s7Cj4gLWV4dGVybiBpbnQgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxp
dDsKPiAgIGV4dGVybiBpbnQgYW1kZ3B1X25nZzsKPiAgIGV4dGVybiBpbnQgYW1kZ3B1X3ByaW1f
YnVmX3Blcl9zZTsKPiAgIGV4dGVybiBpbnQgYW1kZ3B1X3Bvc19idWZfcGVyX3NlOwo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPiBpbmRleCAwMjEyYzllZTMx
N2MuLjJlMTNiOGVmNjY4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMKPiBAQCAtOTczLDEzICs5NzMsNiBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZp
Y2VfY2hlY2tfYXJndW1lbnRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCj4gICAJ
YW1kZ3B1X2RldmljZV9jaGVja19ibG9ja19zaXplKGFkZXYpOwo+ICAgCj4gLQlpZiAoYW1kZ3B1
X3ZyYW1fcGFnZV9zcGxpdCAhPSAtMSAmJiAoYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCA8IDE2IHx8
Cj4gLQkgICAgIWlzX3Bvd2VyX29mXzIoYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCkpKSB7Cj4gLQkJ
ZGV2X3dhcm4oYWRldi0+ZGV2LCAiaW52YWxpZCBWUkFNIHBhZ2Ugc3BsaXQgKCVkKVxuIiwKPiAt
CQkJIGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQpOwo+IC0JCWFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQg
PSAxMDI0Owo+IC0JfQo+IC0KPiAgIAlyZXQgPSBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91
dF9zZXR0aW5ncyhhZGV2KTsKPiAgIAlpZiAocmV0KSB7Cj4gICAJCWRldl9lcnIoYWRldi0+ZGV2
LCAiaW52YWxpZCBsb2NrdXBfdGltZW91dCBwYXJhbWV0ZXIgc3ludGF4XG4iKTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gaW5kZXggMWYzOGQ2ZmMxZmUzLi5lZjIy
YTJhMjU0NDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4g
QEAgLTEwOCw3ICsxMDgsNiBAQCBpbnQgYW1kZ3B1X3ZtX2ZyYWdtZW50X3NpemUgPSAtMTsKPiAg
IGludCBhbWRncHVfdm1fYmxvY2tfc2l6ZSA9IC0xOwo+ICAgaW50IGFtZGdwdV92bV9mYXVsdF9z
dG9wID0gMDsKPiAgIGludCBhbWRncHVfdm1fZGVidWcgPSAwOwo+IC1pbnQgYW1kZ3B1X3ZyYW1f
cGFnZV9zcGxpdCA9IDUxMjsKPiAgIGludCBhbWRncHVfdm1fdXBkYXRlX21vZGUgPSAtMTsKPiAg
IGludCBhbWRncHVfZXhwX2h3X3N1cHBvcnQgPSAwOwo+ICAgaW50IGFtZGdwdV9kYyA9IC0xOwo+
IEBAIC0zNDIsMTMgKzM0MSw2IEBAIG1vZHVsZV9wYXJhbV9uYW1lZCh2bV9kZWJ1ZywgYW1kZ3B1
X3ZtX2RlYnVnLCBpbnQsIDA2NDQpOwo+ICAgTU9EVUxFX1BBUk1fREVTQyh2bV91cGRhdGVfbW9k
ZSwgIlZNIHVwZGF0ZSB1c2luZyBDUFUgKDAgPSBuZXZlciAoZGVmYXVsdCBleGNlcHQgZm9yIGxh
cmdlIEJBUihMQikpLCAxID0gR3JhcGhpY3Mgb25seSwgMiA9IENvbXB1dGUgb25seSAoZGVmYXVs
dCBmb3IgTEIpLCAzID0gQm90aCIpOwo+ICAgbW9kdWxlX3BhcmFtX25hbWVkKHZtX3VwZGF0ZV9t
b2RlLCBhbWRncHVfdm1fdXBkYXRlX21vZGUsIGludCwgMDQ0NCk7Cj4gICAKPiAtLyoqCj4gLSAq
IERPQzogdnJhbV9wYWdlX3NwbGl0IChpbnQpCj4gLSAqIE92ZXJyaWRlIHRoZSBudW1iZXIgb2Yg
cGFnZXMgYWZ0ZXIgd2Ugc3BsaXQgVlJBTSBhbGxvY2F0aW9ucyAoZGVmYXVsdCA1MTIsIC0xID0g
ZGlzYWJsZSkuIFRoZSBkZWZhdWx0IGlzIDUxMi4KPiAtICovCj4gLU1PRFVMRV9QQVJNX0RFU0Mo
dnJhbV9wYWdlX3NwbGl0LCAiTnVtYmVyIG9mIHBhZ2VzIGFmdGVyIHdlIHNwbGl0IFZSQU0gYWxs
b2NhdGlvbnMgKGRlZmF1bHQgNTEyLCAtMSA9IGRpc2FibGUpIik7Cj4gLW1vZHVsZV9wYXJhbV9u
YW1lZCh2cmFtX3BhZ2Vfc3BsaXQsIGFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQsIGludCwgMDQ0NCk7
Cj4gLQo+ICAgLyoqCj4gICAgKiBET0M6IGV4cF9od19zdXBwb3J0IChpbnQpCj4gICAgKiBFbmFi
bGUgZXhwZXJpbWVudGFsIGh3IHN1cHBvcnQgKDEgPSBlbmFibGUpLiBUaGUgZGVmYXVsdCBpcyAw
IChkaXNhYmxlZCkuCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92cmFtX21nci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1f
bWdyLmMKPiBpbmRleCBlYzllYTNmZGJiNGEuLjhhZWEyZjIxYjIwMiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gQEAgLTI4NCwxNyArMjg0
LDIxIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBl
X21hbmFnZXIgKm1hbiwKPiAgIAlpZiAoIWxwZm4pCj4gICAJCWxwZm4gPSBtYW4tPnNpemU7Cj4g
ICAKPiAtCWlmIChwbGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTIHx8Cj4gLQkg
ICAgYW1kZ3B1X3ZyYW1fcGFnZV9zcGxpdCA9PSAtMSkgewo+ICsJaWYgKHBsYWNlLT5mbGFncyAm
IFRUTV9QTF9GTEFHX0NPTlRJR1VPVVMpIHsKPiAgIAkJcGFnZXNfcGVyX25vZGUgPSB+MHVsOwo+
ICAgCQludW1fbm9kZXMgPSAxOwo+ICAgCX0gZWxzZSB7Cj4gLQkJcGFnZXNfcGVyX25vZGUgPSBt
YXgoKHVpbnQzMl90KWFtZGdwdV92cmFtX3BhZ2Vfc3BsaXQsCj4gLQkJCQkgICAgIG1lbS0+cGFn
ZV9hbGlnbm1lbnQpOwo+ICsjaWZkZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCj4gKwkJ
cGFnZXNfcGVyX25vZGUgPSBIUEFHRV9QTURfTlI7Cj4gKyNlbHNlCj4gKwkJLyogZGVmYXVsdCB0
byAyTUIgKi8KPiArCQlwYWdlc19wZXJfbm9kZSA9ICgyVUwgPDwgKDIwVUwgLSBQQUdFX1NISUZU
KSk7Cj4gKyNlbmRpZgo+ICsJCXBhZ2VzX3Blcl9ub2RlID0gbWF4KCh1aW50MzJfdClwYWdlc19w
ZXJfbm9kZSwgbWVtLT5wYWdlX2FsaWdubWVudCk7Cj4gICAJCW51bV9ub2RlcyA9IERJVl9ST1VO
RF9VUChtZW0tPm51bV9wYWdlcywgcGFnZXNfcGVyX25vZGUpOwo+ICAgCX0KPiAgIAo+IC0Jbm9k
ZXMgPSBrdm1hbGxvY19hcnJheShudW1fbm9kZXMsIHNpemVvZigqbm9kZXMpLAo+ICsJbm9kZXMg
PSBrdm1hbGxvY19hcnJheSgodWludDMyX3QpbnVtX25vZGVzLCBzaXplb2YoKm5vZGVzKSwKCllv
dSBjYW4gcHJvYmFibHkgZHJvcCB0aGF0IGNhc3QgaGVyZSwgYXBhcnQgZnJvbSB0aGF0IHRoZSBw
YXRjaCBpcyAKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4uCgpEbyB5b3Ugd2FudCB0byBsb29rIGludG8gdGVzdC9iZW5jaG1hcmsgYXMgd2Vs
bD8KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAgIAkJCSAgICAgICBHRlBfS0VSTkVMIHwgX19HRlBf
WkVSTyk7Cj4gICAJaWYgKCFub2RlcykKPiAgIAkJcmV0dXJuIC1FTk9NRU07CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlz
dAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
