Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722997E29F
	for <lists+amd-gfx@lfdr.de>; Thu,  1 Aug 2019 20:48:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024B16E779;
	Thu,  1 Aug 2019 18:48:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1E56E779
 for <amd-gfx@lists.freedesktop.org>; Thu,  1 Aug 2019 18:48:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r1so74643543wrl.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 01 Aug 2019 11:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/1PThvG6HlNQK6DZeGkXSIrzDFc8NG/LOsqd0jFoLTs=;
 b=Tc29zgzZnXPCN/XEH3L5FHa8GMnsJiCeb8NS1QTq2tgPv+Q5FGA0G4zaqV3r6yH10L
 FMAj2yrJ8BOXfbxF9cLMZQpuQ1qliXYq5x6H7S4EedF8hI35hdimWC8J30+4X6TjVVn+
 UBj0k8V5rKSfLA4jXujqgdepXk83L40vBrk/ZxQKIza/LovpZiHmrRGOpMYu/z47A+qE
 7nGQjQErDWMysuy0SN2R7Qyvwb11p6VuSPI8pElUF4eXldFBJ5bxTsRXwqonS9I5FZ16
 0zTht+mwchMzXuAo0vLWZI0PeyM8ncF4xnPF/0H5+pR8bS4gX6tOYPM9sELp1LyvhD7I
 JdJA==
X-Gm-Message-State: APjAAAWgURNUwo5NxHbhHqg+f2YyPIoj4PuW25cj9iRb5SwJm3H3FP6n
 9bF3KiZF+COjk5Ya5+6Edipnur8ecEEKxQO34i8=
X-Google-Smtp-Source: APXvYqzyjPOP/M4nzCf9frNXULtHsd9YACMerhFOzyQLIozgb7vZo9gEuVEGQRrsvi54xWC3bANM0N2tA2yc1YF+UPo=
X-Received: by 2002:adf:a299:: with SMTP id s25mr134433701wra.74.1564685332159; 
 Thu, 01 Aug 2019 11:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <1564611032-10016-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
In-Reply-To: <1564611032-10016-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 14:48:39 -0400
Message-ID: <CADnq5_P6Hm-zQmfgpmY3MF4h7C9jVAnXmW5NvMGQkmzMyHF53Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon: Fix EEH during kexec
To: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=/1PThvG6HlNQK6DZeGkXSIrzDFc8NG/LOsqd0jFoLTs=;
 b=OhpNoJrVXXDwaXFnI8nQSCARSV1633spNLaslFPex/U5plfzLdkVjbnISss8H7DW6X
 RZtSdHvsNyoP3KKjd7aoWnfE9hTkvd8TE0cO3Vh14XhFooLXJwQLR9qaM+e+aW1tvJFf
 x3ShfhY/WYqfcGGuX7ntSoq4YwASuE332J/qFxWMWka/fMbIk6YTT6hp8aOmSZEnG5ir
 fLhdHbiqlGxo+qOKdyVWpo9Ju0/1iLazPNY8nobyt2CJUokt3iDcN7UaYzx2EF4NQJeP
 ft2TlMAGGhJoG+rgELk6GwvmNwOjn5dNZi7ostTmBeg2AJf3NmxYMYjNT6ItXfSw4173
 Z7/w==
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Chunming Zhou <David1.Zhou@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCAyOjAxIFBNIEt5bGVNYWhsa3VjaCA8a21haGxrdWNAbGlu
dXgudm5ldC5pYm0uY29tPiB3cm90ZToKPgo+IER1cmluZyBrZXhlYyBzb21lIGFkYXB0ZXJzIGhp
dCBhbiBFRUggc2luY2UgdGhleSBhcmUgbm90IHByb3Blcmx5Cj4gc2h1dCBkb3duIGluIHRoZSBy
YWRlb25fcGNpX3NodXRkb3duKCkgZnVuY3Rpb24uIEFkZGluZwo+IHJhZGVvbl9zdXNwZW5kX2tt
cygpIGZpeGVzIHRoaXMgaXNzdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLeWxlIE1haGxrdWNoIDxL
eWxlLk1haGxrdWNoIGF0IGlibS5jb20+CgpBcHBsaWVkLiAgdGhhbmtzIQoKQWxleAoKPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCA4ICsrKysrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Rydi5jCj4gaW5kZXggYTZjYmUxMS4uMTVkN2JlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2Rydi5jCj4gQEAgLTM0OSwxMSArMzQ5LDE5IEBAIHN0YXRpYyBpbnQgcmFkZW9uX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgc3RhdGljIHZvaWQKPiAgcmFkZW9uX3Bj
aV9zaHV0ZG93bihzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAgewo+ICsgICAgICAgc3RydWN0IGRy
bV9kZXZpY2UgKmRkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4gKwo+ICAgICAgICAgLyog
aWYgd2UgYXJlIHJ1bm5pbmcgaW4gYSBWTSwgbWFrZSBzdXJlIHRoZSBkZXZpY2UKPiAgICAgICAg
ICAqIHRvcm4gZG93biBwcm9wZXJseSBvbiByZWJvb3Qvc2h1dGRvd24KPiAgICAgICAgICAqLwo+
ICAgICAgICAgaWYgKHJhZGVvbl9kZXZpY2VfaXNfdmlydHVhbCgpKQo+ICAgICAgICAgICAgICAg
ICByYWRlb25fcGNpX3JlbW92ZShwZGV2KTsKPiArCj4gKyAgICAgICAvKiBTb21lIGFkYXB0ZXJz
IG5lZWQgdG8gYmUgc3VzcGVuZGVkIGJlZm9yZSBhCj4gKyAgICAgICAqIHNodXRkb3duIG9jY3Vy
cyBpbiBvcmRlciB0byBwcmV2ZW50IGFuIGVycm9yCj4gKyAgICAgICAqIGR1cmluZyBrZXhlYy4K
PiArICAgICAgICovCj4gKyAgICAgICByYWRlb25fc3VzcGVuZF9rbXMoZGRldiwgdHJ1ZSwgdHJ1
ZSwgZmFsc2UpOwo+ICB9Cj4KPiAgc3RhdGljIGludCByYWRlb25fcG1vcHNfc3VzcGVuZChzdHJ1
Y3QgZGV2aWNlICpkZXYpCj4gLS0KPiAxLjguMy4xCj4KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4
