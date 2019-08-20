Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A45AE96B01
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 23:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864B86E17F;
	Tue, 20 Aug 2019 21:02:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C2D6E17F
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:02:10 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 862F6C00F7E6
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 21:02:09 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id x28so8186713qki.21
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 14:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=BpcG82DZ90rbo8YvuaKArAuPw193AbQLuXyq4rOiM+A=;
 b=RZ/E8IYRlUKx2jAiOu5j6Lcpy39fY6Z9d7HRpPJ1EjkHTEt8f1RMZ83G4+OUacmDWV
 BM60RqnjtOahppE/1A7QjlgDOlAS+O9cjIXTd+OQcoLzCTsL0XPnB/B3WXJEaS29hyvP
 3macCx3NtNDu0o6UeLa7Yo26EILDZqxk+Iu/aHAwcr+3/rmgBii2Xxv1kulrVI7z+hgC
 cYl8oM6uOHcFGAyWac2sMwcQVTJxXV0YZkM9LxloKIrutBqRfW64NypX5DLCqA/VjLuW
 dkalOafISwXiKjDUcx3T01KG36zXHLBJpZVPOMF4DNsJx+X9JHDe3enfNyLxqChd70l1
 Vdlw==
X-Gm-Message-State: APjAAAX5ag8rHjU3F1QB2m1NnAb0C/gyPCLB0fIx6WqjY7pHirMTPLMN
 tDvxTve3wkG5RNir2FgJQPCQk8oc0iGnNZbrcrkyuR47D4OcrHWir2/di/vh71TSa6rUn+VvxTZ
 4IVYYlgTVJGCyNA+YjsuD0fbN4A==
X-Received: by 2002:ac8:661a:: with SMTP id c26mr28623468qtp.106.1566334928872; 
 Tue, 20 Aug 2019 14:02:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnSaS2Gyt0i5iQ5yFDGC2JUvD6UnlDkC9Hwlqj/KGEHOB04H3nb49UNSw2ROLPkXnkk8PT+Q==
X-Received: by 2002:ac8:661a:: with SMTP id c26mr28623453qtp.106.1566334928667; 
 Tue, 20 Aug 2019 14:02:08 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 78sm5435130qki.81.2019.08.20.14.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 14:02:08 -0700 (PDT)
Message-ID: <773c80494087854b72ffb85938f0ea54bd89c121.camel@redhat.com>
Subject: Re: [PATCH v2 09/14] drm/dp-mst: Export symbols for dpcd read/write
From: Lyude Paul <lyude@redhat.com>
To: David Francis <David.Francis@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>
Date: Tue, 20 Aug 2019 17:02:06 -0400
In-Reply-To: <20190820191203.25807-10-David.Francis@amd.com>
References: <20190820191203.25807-1-David.Francis@amd.com>
 <20190820191203.25807-10-David.Francis@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

W0FkZGVkIExlbyBMaSBoZXJlLCBzaW5jZSB0aGV5IGRpZCB0aGUgYXV4ZGV2IHdvcmsgdGhhdCBp
bnRyb2R1Y2VkIHRoZXNlCmZ1bmN0aW9uc10KClNpbmNlIGl0IHNlZW1zIHdlJ2xsIGFjdHVhbGx5
IGJlIGRvaW5nIHJlbW90ZSBEUENEIHJlYWQvd3JpdGVzIGluIERSTSBkcml2ZXJzCmFuZCBub3Qg
anVzdCBmcm9tIGF1eGRldiwgbWF5YmUgd2Ugc2hvdWxkIGNvbWJpbmUgZHJtX2RwX2RwY2RfcmVh
ZCgpIHdpdGgKZHJtX2RwX21zdF9kcGNkX3JlYWQoKSBhbmQgZG8gdGhlIHNhbWUgd2l0aCB0aGUg
X3dyaXRlKCkgdmFyaWFudHM/IEJhc2VkIG9uCnByZXZpb3VzIGRpc2N1c3Npb25zIHdpdGggTGVv
IExpIEkgcmVtZW1iZXIgdGhhdCB3ZSBjYW4ndCBqdXN0IGNvbWJpbmUgdGhlCmRwX2F1eF9kZXYt
PnRyYW5zZmVyKCkgY2FsbGJhY2tzIGluIHN0cnVjdCBkcm1fZHBfYXV4X2RldiwgYnV0IEkgZG9u
J3Qgc2VlIGEKcmVhc29uIHdlIGNhbid0IGp1c3QgdGVhY2ggZHJtX2RwX2RwY2RfcmVhZC93cml0
ZSgpIHRvIHdvcmsgd2l0aCBNU1QgYXV4IHNvCnRoYXQgd2UgZG9uJ3QgbmVlZCB0d28gc2VwZXJh
dGUgZnVuY3Rpb25zLiBUaGlzIHNob3VsZCBiZSBwcmV0dHkgZWFzeSB0byBkbywKanVzdDoKCi8q
IEFkZCBhIGNoZWNrIGxpa2UgdGhpcyBhdCB0aGUgc3RhcnQgb2YgZHJtX2RwX2RwY2RfcmVhZCgp
OiAqLwpzc2l6ZV90IGRybV9kcF9kcGNkX3JlYWQoLi4uKSB7CglpZiAoYXV4LT5pc19yZW1vdGUp
CgkJcmV0dXJuIGRybV9kcF9tc3RfZHBjZF9yZWFkKC4uLik7CgoJLyogLi4uICovCn0KCi8qIEFu
ZCBpbiBkcm1fZHBfZHBjZF93cml0ZSgpOiAqLwpzc2l6ZV90IGRybV9kcF9kcGNkX3dyaXRlKC4u
LikgewoJaWYgKGF1eC0+aXNfcmVtb3RlKQoJCXJldHVybiBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUo
Li4uKTsKCgkvKiAuLi4gKi8KfQoKVGhlbiBqdXN0IHJlcGxhY2UgdGhlIG1hbnVhbCBjYWxscyB0
byBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoKSBpbgpkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2F1eF9k
ZXYuYyB3aXRoIG5vcm1hbApkcm1fZHBfZHBjZF9yZWFkKCkvZHJtX2RwX2RwY2Rfd3JpdGUoKSBj
YWxscy4gVGhvdWdodHM/CgpPbiBUdWUsIDIwMTktMDgtMjAgYXQgMTU6MTEgLTA0MDAsIERhdmlk
IEZyYW5jaXMgd3JvdGU6Cj4gVG8gdXNlIHRoZXNlIGZ1bmN0aW9ucyBpbiBkcm0gZHJpdmVyIGRp
cmVjdG9yaWVzLCB0aGV5IG11c3QgYmUKPiBleHBvcnRlZAo+IAo+IFNpZ25lZC1vZmYtYnk6IERh
dmlkIEZyYW5jaXMgPERhdmlkLkZyYW5jaXNAYW1kLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90
b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5k
ZXggYjQwZDk3NWFlYzc2Li41ZDViZDQyZGExN2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
bXN0X3RvcG9sb2d5LmMKPiBAQCAtMTUxMiw2ICsxNTEyLDcgQEAgc3NpemVfdCBkcm1fZHBfbXN0
X2RwY2RfcmVhZChzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAo+ICAJcmV0dXJuIGRybV9kcF9zZW5k
X2RwY2RfcmVhZChwb3J0LT5tZ3IsIHBvcnQsCj4gIAkJCQkgICAgIG9mZnNldCwgc2l6ZSwgYnVm
ZmVyKTsKPiAgfQo+ICtFWFBPUlRfU1lNQk9MKGRybV9kcF9tc3RfZHBjZF9yZWFkKTsKPiAgCj4g
IC8qKgo+ICAgKiBkcm1fZHBfbXN0X2RwY2Rfd3JpdGUoKSAtIHdyaXRlIGEgc2VyaWVzIG9mIGJ5
dGVzIHRvIHRoZSBEUENEIHZpYQo+IHNpZGViYW5kCj4gQEAgLTE1MzUsNiArMTUzNiw3IEBAIHNz
aXplX3QgZHJtX2RwX21zdF9kcGNkX3dyaXRlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCj4gIAly
ZXR1cm4gZHJtX2RwX3NlbmRfZHBjZF93cml0ZShwb3J0LT5tZ3IsIHBvcnQsCj4gIAkJCQkgICAg
ICBvZmZzZXQsIHNpemUsIGJ1ZmZlcik7Cj4gIH0KPiArRVhQT1JUX1NZTUJPTChkcm1fZHBfbXN0
X2RwY2Rfd3JpdGUpOwo+ICAKPiAgc3RhdGljIHZvaWQgZHJtX2RwX2NoZWNrX21zdGJfZ3VpZChz
dHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsIHU4Cj4gKmd1aWQpCj4gIHsKLS0gCkNoZWVy
cywKCUx5dWRlIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
