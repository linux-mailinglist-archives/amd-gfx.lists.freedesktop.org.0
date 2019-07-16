Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFF6AE59
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 20:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9FC89DA2;
	Tue, 16 Jul 2019 18:18:08 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E0C89DA2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 18:18:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p17so21960338wrf.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 11:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tFVmE96hZiN7HFPIypSQJMgA2zK7b8H91G9uqg1FHEs=;
 b=SVx4hXa+bezjecxn9WKF08CybH7WhuZNKRbIhPNLVPEkU6AlBlZTsQCpYCorUiFWFJ
 /1TWG3gkvKk/RWxE4KF9cOIitjSZsZ3fI2LehC/Ic2jD/WINiv5qgxgsH7X0EAIuw1Va
 98+YDxE8Z2R3GPuvH3olhciFh3JhY+8CFmKvee/pEDzbFGKtf9AGXM8vXrqDU71TUdZk
 slY7wepsIuxhxnz2hVvKaa73XfApCLsoJJYasC6QDNFGvlvPjq0jclMqAAbGJa9lLlji
 5De4GoLeHNfpT10u00u5KKoBa9pqBD40PMWiok1hHU36zCVXwomXsX7/0BPd/HMBKUUS
 8Niw==
X-Gm-Message-State: APjAAAVvUz4bgap+lCRAkHdA6qB96vbSyCB9OR1LxCE/nvSIo1Bt7KWL
 uehE6t0h+Uir7ctCNaqA+jec2du+hUMxrVVSNPw=
X-Google-Smtp-Source: APXvYqyCHu81CG+PlVEBK87dHXvH5rkHK7MX4ndta4/qYTrZXZ/FWuDy2Iub9ZvZrFwYlv5BeuYJpJIqnwV60yzFP2w=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr32875978wrc.4.1563301085015; 
 Tue, 16 Jul 2019 11:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <1563300606-28434-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
In-Reply-To: <1563300606-28434-1-git-send-email-kmahlkuc@linux.vnet.ibm.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 16 Jul 2019 14:17:52 -0400
Message-ID: <CADnq5_NvBrRd61=a5XxvVKMs_+_JgBK8ALh_CgOTiG2ZVCEGKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Fix EEH during kexec
To: KyleMahlkuch <kmahlkuc@linux.vnet.ibm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tFVmE96hZiN7HFPIypSQJMgA2zK7b8H91G9uqg1FHEs=;
 b=DOKrX6o4spGobtmQUSvLtGjdjPvmkyaEcIN6+s/3r75DYK5AKxdVcU+k5PxjSRV8xy
 5iOuMps9R+LM74CmLIEd87XsZrdn+OG5XfaQvWuZ7ZpaO0uoJkIDNHmMcqRJHol2mxT9
 T/sPQT63t4BMrcyfuOYpBCuwdXaqtY9XEqpoYB2SF7CIk3zS/nE7xITKKXRh8ifkUE+C
 EFWCy0NYShMZaiJpg0gIrxY/1n7yrs9oLnZj7oKK/8XOUOjdslkcLjMvvCY0N8N4cXiV
 i39JLrIPcmjpUMFuagvy3fYgFbmOQikNOgXUv1VbaJZ+/sNGDUOjnaE3ch6IptOn/PQ4
 A3JQ==
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

T24gVHVlLCBKdWwgMTYsIDIwMTkgYXQgMjoxNSBQTSBLeWxlTWFobGt1Y2gKPGttYWhsa3VjQGxp
bnV4LnZuZXQuaWJtLmNvbT4gd3JvdGU6Cj4KPiBEdXJpbmcga2V4ZWMgc29tZSBhZGFwdGVycyBo
aXQgYW4gRUVIIHNpbmNlIHRoZXkgYXJlIG5vdCBwcm9wZXJseQo+IHNodXQgZG93biBpbiB0aGUg
cmFkZW9uX3BjaV9zaHV0ZG93bigpIGZ1bmN0aW9uLiBBZGRpbmcKPiByYWRlb25fc3VzcGVuZF9r
bXMoKSBmaXhlcyB0aGlzIGlzc3VlLgo+Cj4gU2luY2UgcmFkZW9uLmggaXMgbm93IGluY2x1ZGVk
IGluIHJhZGVvbl9kcnYuYyByYWRlb25faW5pdCgpIG5lZWRzCj4gYSBuZXcgbmFtZS4gSSBjaG9z
ZSByYWRlb25faW5pdGwoKS4gVGhpcyBjYW4gYmUgY2hhbmdlZCBpZiB0aGVyZSBpcwo+IGFub3Ro
ZXIgc3VnZ2VzdGlvbiBmb3IgYSBuYW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3lsZSBNYWhsa3Vj
aCA8S3lsZS5NYWhsa3VjaCBhdCBpYm0uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl9kcnYuYyB8IDE1ICsrKysrKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX2Rydi5jCj4gaW5kZXggMmU5NmM4OC4uNTUwZjliMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2Rydi5jCj4gQEAgLTMyLDYgKzMyLDcgQEAKPiAgI2luY2x1ZGUgPGRybS9kcm1Q
Lmg+Cj4gICNpbmNsdWRlIDxkcm0vcmFkZW9uX2RybS5oPgo+ICAjaW5jbHVkZSAicmFkZW9uX2Ry
di5oIgo+ICsjaW5jbHVkZSAicmFkZW9uLmgiCj4KPiAgI2luY2x1ZGUgPGRybS9kcm1fcGNpaWRz
Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jb25zb2xlLmg+Cj4gQEAgLTM0NCwxMSArMzQ1LDIxIEBA
IHN0YXRpYyBpbnQgcmFkZW9uX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPiAgc3Rh
dGljIHZvaWQKPiAgcmFkZW9uX3BjaV9zaHV0ZG93bihzdHJ1Y3QgcGNpX2RldiAqcGRldikKPiAg
ewo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRl
dik7Cj4gKyAgICAgICBzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9IGRkZXYtPmRldl9wcml2
YXRlOwo+ICsKPiAgICAgICAgIC8qIGlmIHdlIGFyZSBydW5uaW5nIGluIGEgVk0sIG1ha2Ugc3Vy
ZSB0aGUgZGV2aWNlCj4gICAgICAgICAgKiB0b3JuIGRvd24gcHJvcGVybHkgb24gcmVib290L3No
dXRkb3duCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmIChyYWRlb25fZGV2aWNlX2lzX3ZpcnR1
YWwoKSkKPiAgICAgICAgICAgICAgICAgcmFkZW9uX3BjaV9yZW1vdmUocGRldik7Cj4gKwo+ICsg
ICAgICAgLyogU29tZSBhZGFwdGVycyBuZWVkIHRvIGJlIHN1c3BlbmRlZCBiZWZvcmUgYQo+ICsg
ICAgICAgKiBzaHV0ZG93biBvY2N1cnMgaW4gb3JkZXIgdG8gcHJldmVudCBhbiBlcnJvcgo+ICsg
ICAgICAgKiBkdXJpbmcga2V4ZWMuCj4gKyAgICAgICAqLwo+ICsgICAgICAgaWYgKHJkZXYtPmZh
bWlseSA9PSBDSElQX0NBSUNPUykKCllvdSByZWFsbHkgc2hvdWxkIGJlIHN1c3BlbmRpbmcgZm9y
IGFsbCBhc2ljcywgbm90IGp1c3QgQ0FJQ09TLApvdGhlcndpc2UsIHlvdSBtYXkgaGF2ZSBlbmdp
bmVzIGluIHVzZS4KCkFsZXgKCj4gKyAgICAgICAgICAgICAgIHJhZGVvbl9zdXNwZW5kX2ttcyhk
ZGV2LCB0cnVlLCB0cnVlLCBmYWxzZSk7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHJhZGVvbl9wbW9w
c19zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiBAQCAtNTg5LDcgKzYwMCw3IEBAIHN0YXRp
YyBsb25nIHJhZGVvbl9rbXNfY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25l
ZCBpbnQgY21kLCB1bnNpZ25lCj4gICAgICAgICAuZHJpdmVyLnBtID0gJnJhZGVvbl9wbV9vcHMs
Cj4gIH07Cj4KPiAtc3RhdGljIGludCBfX2luaXQgcmFkZW9uX2luaXQodm9pZCkKPiArc3RhdGlj
IGludCBfX2luaXQgcmFkZW9uX2luaXRsKHZvaWQpCj4gIHsKPiAgICAgICAgIGlmICh2Z2Fjb25f
dGV4dF9mb3JjZSgpICYmIHJhZGVvbl9tb2Rlc2V0ID09IC0xKSB7Cj4gICAgICAgICAgICAgICAg
IERSTV9JTkZPKCJWR0FDT04gZGlzYWJsZSByYWRlb24ga2VybmVsIG1vZGVzZXR0aW5nLlxuIik7
Cj4gQEAgLTYyMSw3ICs2MzIsNyBAQCBzdGF0aWMgdm9pZCBfX2V4aXQgcmFkZW9uX2V4aXQodm9p
ZCkKPiAgICAgICAgIHJhZGVvbl91bnJlZ2lzdGVyX2F0cHhfaGFuZGxlcigpOwo+ICB9Cj4KPiAt
bW9kdWxlX2luaXQocmFkZW9uX2luaXQpOwo+ICttb2R1bGVfaW5pdChyYWRlb25faW5pdGwpOwo+
ICBtb2R1bGVfZXhpdChyYWRlb25fZXhpdCk7Cj4KPiAgTU9EVUxFX0FVVEhPUihEUklWRVJfQVVU
SE9SKTsKPiAtLQo+IDEuOC4zLjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
