Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F153CD09
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 15:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8109C890DD;
	Tue, 11 Jun 2019 13:34:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66438890DD
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 13:34:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s3so3006620wms.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 06:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NyVSNma/SOJq3jWn4eFfl44VO4DEYCVBe06IvFgeSic=;
 b=a1qlGnU6o3r2QwY/rpPrQhipLjQnJ3EkfAnvIMHPkUcUtViy8fW9a+IfnGEtDAqEn+
 KbylmrPLBIOPvreR2e8gUBmnthwQsESaXtBjeyMo0l5IBidkNdhPCkGURnS4I3L8zgdo
 osvBn//R8i1tGo5g//Nisa4HFu9BVoHndQrMz4mvPNR5SGfaCLXheY1mWgJBqOnoMYQH
 JvwLm0+AWCRu1/h0ooiSLG4vGemAhtAJARcRgoh5orvMHQ2UCg6k9/AIWTlNkJaaInBw
 s37uurtXgdxXvvVdtUts86lp42Ag6MGlCdu6r+C7raIoLuodlwvI5lJu8DrDVzdp1IAp
 VPPw==
X-Gm-Message-State: APjAAAX86j35Ikbws05t6PzlE3wY8HS45OWuyljq/Q94/53GFq46SBXw
 tbVJd0lS2+Bm88Wc4Ks6B5/ffmPu
X-Google-Smtp-Source: APXvYqwClW5k3vKCz8VlZyUNy9Br/3nePGE622TiTR+UFQzl3iFMw2zvXzZCSMZlGW0iqJnt4uJ7AQ==
X-Received: by 2002:a1c:8a:: with SMTP id 132mr14426403wma.44.1560260086084;
 Tue, 11 Jun 2019 06:34:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s188sm4145714wmf.40.2019.06.11.06.34.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 06:34:45 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Bail out of BO node creation if not
 enough VRAM
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190610143157.26752-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <91bb2355-949f-43a3-67e6-fb752de86b5c@gmail.com>
Date: Tue, 11 Jun 2019 15:34:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610143157.26752-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NyVSNma/SOJq3jWn4eFfl44VO4DEYCVBe06IvFgeSic=;
 b=jQ3fkpHZ4luZhrsCYlwOK9881ygq1kyiCLYF7dEVSJtSUZuOK0dUPUuD7qaR5tzTzP
 E7QRiKllc1rqlUCNufqNGHVle/dSD7uwsnyqUGb9qEwZhRwskbLVrhsgR3NkSV5XfELR
 8hps6ydjyO8ArHHXU+N0LXRK7VvDNbS53//IVOi1kOuvMWt8JGNGLD2U4lKvJ3c9rRCO
 JAalq9FoQMrkkI+FH4owvFWoLPR4fzPZ7njDwfslbOoJMNC0uyd1xyqjdmxZ6lL3m9ox
 1QLvsPJwR9qWQP7qdm58WSpAQuS/3U03w/BO/0GKNudeXU4BqyR3gpUx62Xc41apUGT8
 mdew==
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

QW0gMTAuMDYuMTkgdW0gMTY6MzIgc2NocmllYiBTdERlbmlzLCBUb206Cj4gU2lnbmVkLW9mZi1i
eTogVG9tIFN0IERlbmlzIDx0b20uc3RkZW5pc0BhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMgfCAxNyArKysrKysrKysrKystLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwo+IGluZGV4
IDhhZWEyZjIxYjIwMi4uNzBiNGE1YTk3ZWQyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMKPiBAQCAtMjc2LDcgKzI3Niw3IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3ZyYW1fbWdyX25ldyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwK
PiAgIAlzdHJ1Y3QgZHJtX21tX25vZGUgKm5vZGVzOwo+ICAgCWVudW0gZHJtX21tX2luc2VydF9t
b2RlIG1vZGU7Cj4gICAJdW5zaWduZWQgbG9uZyBscGZuLCBudW1fbm9kZXMsIHBhZ2VzX3Blcl9u
b2RlLCBwYWdlc19sZWZ0Owo+IC0JdWludDY0X3QgdXNhZ2UgPSAwLCB2aXNfdXNhZ2UgPSAwOwo+
ICsJdWludDY0X3QgdmlzX3VzYWdlID0gMDsKPiAgIAl1bnNpZ25lZCBpOwo+ICAgCWludCByOwo+
ICAgCj4gQEAgLTI4NCw2ICsyODQsMTMgQEAgc3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3
KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCWlmICghbHBmbikKPiAgIAkJ
bHBmbiA9IG1hbi0+c2l6ZTsKPiAgIAo+ICsJLyogYmFpbCBvdXQgcXVpY2tseSBpZiB0aGVyZSdz
IGxpa2VseSBub3QgZW5vdWdoIFZSQU0gZm9yIHRoaXMgQk8gKi8KPiArCWF0b21pYzY0X2FkZCht
ZW0tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZULCAmbWdyLT51c2FnZSk7Cj4gKwlpZiAoYXRvbWlj
NjRfcmVhZCgmbWdyLT51c2FnZSkgPiBhZGV2LT5nbWMubWNfdnJhbV9zaXplKSB7Cj4gKwkJYXRv
bWljNjRfc3ViKG1lbS0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsKPiAr
CQlyZXR1cm4gLUVOT1NQQzsKPiArCX0KClRoYXQncyBub3QgMTAwJSBjb3JyZWN0IElJUkMuIFNl
ZSBUVE0gZXhwZWN0cyBhIHJldHVybiB2YWx1ZSBvZiAwLCBidXQgCm1lbS0+bm9kZSB0byBiZSBO
VUxMIHdoZW4gYWxsb2NhdGlvbiBmYWlscy4KCkNocmlzdGlhbi4KCj4gKwo+ICAgCWlmIChwbGFj
ZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19DT05USUdVT1VTKSB7Cj4gICAJCXBhZ2VzX3Blcl9ub2Rl
ID0gfjB1bDsKPiAgIAkJbnVtX25vZGVzID0gMTsKPiBAQCAtMzAwLDggKzMwNywxMCBAQCBzdGF0
aWMgaW50IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICpt
YW4sCj4gICAKPiAgIAlub2RlcyA9IGt2bWFsbG9jX2FycmF5KCh1aW50MzJfdCludW1fbm9kZXMs
IHNpemVvZigqbm9kZXMpLAo+ICAgCQkJICAgICAgIEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsK
PiAtCWlmICghbm9kZXMpCj4gKwlpZiAoIW5vZGVzKSB7Cj4gKwkJYXRvbWljNjRfc3ViKG1lbS0+
bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZ3ItPnVzYWdlKTsKPiAgIAkJcmV0dXJuIC1FTk9N
RU07Cj4gKwl9Cj4gICAKPiAgIAltb2RlID0gRFJNX01NX0lOU0VSVF9CRVNUOwo+ICAgCWlmIChw
bGFjZS0+ZmxhZ3MgJiBUVE1fUExfRkxBR19UT1BET1dOKQo+IEBAIC0zMjEsNyArMzMwLDYgQEAg
c3RhdGljIGludCBhbWRncHVfdnJhbV9tZ3JfbmV3KHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdl
ciAqbWFuLAo+ICAgCQlpZiAodW5saWtlbHkocikpCj4gICAJCQlicmVhazsKPiAgIAo+IC0JCXVz
YWdlICs9IG5vZGVzW2ldLnNpemUgPDwgUEFHRV9TSElGVDsKPiAgIAkJdmlzX3VzYWdlICs9IGFt
ZGdwdV92cmFtX21ncl92aXNfc2l6ZShhZGV2LCAmbm9kZXNbaV0pOwo+ICAgCQlhbWRncHVfdnJh
bV9tZ3JfdmlydF9zdGFydChtZW0sICZub2Rlc1tpXSk7Cj4gICAJCXBhZ2VzX2xlZnQgLT0gcGFn
ZXM7Cj4gQEAgLTM0MSwxNCArMzQ5LDEyIEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZyYW1fbWdyX25l
dyhzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiwKPiAgIAkJaWYgKHVubGlrZWx5KHIp
KQo+ICAgCQkJZ290byBlcnJvcjsKPiAgIAo+IC0JCXVzYWdlICs9IG5vZGVzW2ldLnNpemUgPDwg
UEFHRV9TSElGVDsKPiAgIAkJdmlzX3VzYWdlICs9IGFtZGdwdV92cmFtX21ncl92aXNfc2l6ZShh
ZGV2LCAmbm9kZXNbaV0pOwo+ICAgCQlhbWRncHVfdnJhbV9tZ3JfdmlydF9zdGFydChtZW0sICZu
b2Rlc1tpXSk7Cj4gICAJCXBhZ2VzX2xlZnQgLT0gcGFnZXM7Cj4gICAJfQo+ICAgCXNwaW5fdW5s
b2NrKCZtZ3ItPmxvY2spOwo+ICAgCj4gLQlhdG9taWM2NF9hZGQodXNhZ2UsICZtZ3ItPnVzYWdl
KTsKPiAgIAlhdG9taWM2NF9hZGQodmlzX3VzYWdlLCAmbWdyLT52aXNfdXNhZ2UpOwo+ICAgCj4g
ICAJbWVtLT5tbV9ub2RlID0gbm9kZXM7Cj4gQEAgLTM1OSw2ICszNjUsNyBAQCBzdGF0aWMgaW50
IGFtZGdwdV92cmFtX21ncl9uZXcoc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCj4g
ICAJd2hpbGUgKGktLSkKPiAgIAkJZHJtX21tX3JlbW92ZV9ub2RlKCZub2Rlc1tpXSk7Cj4gICAJ
c3Bpbl91bmxvY2soJm1nci0+bG9jayk7Cj4gKwlhdG9taWM2NF9zdWIobWVtLT5udW1fcGFnZXMg
PDwgUEFHRV9TSElGVCwgJm1nci0+dXNhZ2UpOwo+ICAgCj4gICAJa3ZmcmVlKG5vZGVzKTsKPiAg
IAlyZXR1cm4gciA9PSAtRU5PU1BDID8gMCA6IHI7CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
