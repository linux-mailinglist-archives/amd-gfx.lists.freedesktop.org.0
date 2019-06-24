Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8835505E0
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 11:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16289916;
	Mon, 24 Jun 2019 09:36:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C2B289916
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 09:36:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h19so13812727wme.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 02:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YsphbXcfl1RHS0sC0dgrcNmoJSelrz3Ej5i6SEimMqc=;
 b=UC1sEqgi3uDXdK42b0A9i28ByF6jaBUK7iGxNWPKSLI7tD+jBAZe6usZ+0caBNBvrd
 eyh7OBCGSLSRm+BALWbDGIdAHetGN64MeWTalVx3N7pQNPqR3ktDiGIXY60zMwMGtwkp
 6ZP9v3ibabzoy8fu1VmyOXuS8HNVxbRrB2sKAV8nmxIvyh4WnXNu/62rE2OzLR/iH4B1
 3G352H0mKDfISPh1npg7Hd7Lzujx2cMBXF3LZC++4F2Q8QYHJZ0GbqF0m85szPENZwa/
 Yy6z3WgSwOSOb9jaPzuZb3HbsqYNLPFyWeKDHcU7j+1MKJKyoaggo0jUS73vi4g9hYeB
 Je2A==
X-Gm-Message-State: APjAAAXWZ8khq20QDgu2hnTAWSEbAh80dsP7GqAxuTWIZtwx4TVCu6Dh
 lYdK5Mje4FnmXkVMHYAh4lFfvJfz
X-Google-Smtp-Source: APXvYqwrtdEAXgN1ynWnHJK0bLR4aEPn5uEwdErvDFyj4GCzzwKHDvdmeBhCSUsozO6hx57yenlNmw==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr15793884wmi.78.1561368984166; 
 Mon, 24 Jun 2019 02:36:24 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t198sm15817166wmt.2.2019.06.24.02.36.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 02:36:22 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix scheduler timeout calc
To: "Cui, Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1561366217-13261-1-git-send-email-flora.cui@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <44e2f73b-2102-8361-034d-6176eb952ce3@gmail.com>
Date: Mon, 24 Jun 2019 11:36:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561366217-13261-1-git-send-email-flora.cui@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YsphbXcfl1RHS0sC0dgrcNmoJSelrz3Ej5i6SEimMqc=;
 b=RSsWozLS26RdOmr8w/kjCF2dBY1RRkVgt50nuJo6bnhqO3htfOlmm9DOVuY+/LVrDK
 bnOpLuKIsp7ti4IFltQngPXIsd5L4iZSY7OJv4ZJwEI/Y6MwpsWAeLKPC36O/iqmVRRG
 4/t0L4zBIDNJT4/66h6gK3hFRLkEeVUQP/lW21BB8rps9epQ05OjItHlAdW4S0jDVS64
 yRGvp2r0xtbG5+nXT6uOGw8nbfogzt3+YYsIr9FNFBDrQ/73G/prtdgng2IxK6kPrPj9
 +qe47SewM2MFeAUiWJpTn0iZlKCBox+jGy2/HhIMJ88oIAOsXtuafdj+4JccsITC2O4l
 0qjQ==
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

QW0gMjQuMDYuMTkgdW0gMTA6NTAgc2NocmllYiBDdWksIEZsb3JhOgo+IHNjaGVkdWxlciB0aW1l
b3V0IGlzIGluIGppZmZpZXMKPgo+IENoYW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4ZDkzMGRk
ODFiY2FiNGI0YjlkODRlYjIKPiBTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBh
bWQuY29tPgoKSSBhY3R1YWxseSBzdWdnZXN0ZWQgdG8gZG8gdGhpcyBjb25zaXN0ZW50bHkgaW4g
CmFtZGdwdV9kZXZpY2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzIGFmdGVyIHBhcnNpbmcgdGhl
IHZhbHVlLgoKQlRXOiBUaGUgdGVzdCBmb3IgbmVnYXRpdmUgdmFsdWVzIHRoZXJlIGlzIHN0aWxs
IG5vdCBjb3JyZWN0IGVpdGhlci4KCkNhbiB5b3UgZml4IHVwIGJvdGg/IENhdXNlIG90aGVyd2lz
ZSB3ZSBhcmUgbm90IGFibGUgdG8gY29tcGxldGVseSAKZGlzYWJsZSB0aGUgdGltZW91dCBmb3Ig
dGVzdGluZy4KCkNocmlzdGlhbi4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZmVuY2UuYyB8IDMgKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Zl
bmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IGluZGV4
IGNiY2FhN2MuLjJlZGFhNmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZmVuY2UuYwo+IEBAIC00ODEsNiArNDgxLDkgQEAgaW50IGFtZGdwdV9mZW5jZV9kcml2ZXJf
aW5pdF9yaW5nKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPiAgIAkJCWJyZWFrOwo+ICAgCQl9
Cj4gICAKPiArCQlpZiAodGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCkKPiArCQkJdGlt
ZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7Cj4gKwo+ICAgCQlyID0gZHJtX3NjaGVk
X2luaXQoJnJpbmctPnNjaGVkLCAmYW1kZ3B1X3NjaGVkX29wcywoKQo+ICAgCQkJCSAgIG51bV9o
d19zdWJtaXNzaW9uLCBhbWRncHVfam9iX2hhbmdfbGltaXQsCj4gICAJCQkJICAgdGltZW91dCwg
cmluZy0+bmFtZSk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
