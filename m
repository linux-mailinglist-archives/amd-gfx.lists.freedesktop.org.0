Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E358132E550
	for <lists+amd-gfx@lfdr.de>; Fri,  5 Mar 2021 10:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FE2B6EB35;
	Fri,  5 Mar 2021 09:53:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD906EB35
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Mar 2021 09:53:15 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id mm21so2194825ejb.12
 for <amd-gfx@lists.freedesktop.org>; Fri, 05 Mar 2021 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Se4pN4pynpEUwVeSF+zz7AZd114mnEgqBzao/fN1/cg=;
 b=OOy8rUW48DHkkz7SKC8LVmlw9S/eoh35Ls3pLZni2tkIHoGmxKFMzbqxHZdaXJbk7e
 SLsFld+iiQpv4PqBPby3MRR9VJ2T16ZceyB8vaNharGgNv/xgVZDR+FfzO6hjZTPY1d0
 E5VpvjYQxhI4FUTGWIi0oMbWH+Is+QUqFbeSfoUNDWXM7OsIgoNcRWptEQsfVDqGiTRv
 XAj22f6CMcyMBpqhUceAgTjYm1DzXPCw5Pn7vdHctEORbcXuXSFwDLGZASzIvJl7TkyI
 QonsfwdsTo1m7mZRb6j+8lSpzin+sN7wnAfX+s3BIOMG/RWYctxkxxK1pKIV0mmDgtYY
 Oo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Se4pN4pynpEUwVeSF+zz7AZd114mnEgqBzao/fN1/cg=;
 b=W9tRMkdVeH+OW+pv6clQL/FOAcW5qm4lc0IvbOvJGtwIC6k6eRtKvltrKdqmVi0hil
 +r1PwgbZewVa/CTmwIRpb+ukCjFPSO9/tIBLs3/R8KbzM6G448G5yil+4UpahmVvkz7D
 luykPjBC0A6odSJBzncO4FPKEgh4Uff6o36qIzM3bevfSqHXXRN33svfhJC6Z/HQC+RJ
 AuGxsMgEMraGOMBlsZ7CSL5NerAyG1fmTOC/Ze9tLlU5FzNEnbSGOBoGzfcNKukNTFOt
 etJ/PDjPy+x6fuyCb6hkaYjW63HWF7Ua1WD2u3ebS/+OuJ5b39FqqUBe8sYMZJ9pwuig
 56BQ==
X-Gm-Message-State: AOAM533HBblqUKliRXpCp+vvehSL2NpbqnJZIpeegadbeLGD+kQeWot2
 kVMhBUktAHS0A1Cicq4RAzZtK13jFzrIlg==
X-Google-Smtp-Source: ABdhPJxWuaApoC0Nje7xSmzw7WgwkZGPGASERjL+h1Bv2pSFx6Q/CDnzqpHF01L3UN1wHuop5pIJVg==
X-Received: by 2002:a17:906:2dda:: with SMTP id
 h26mr1535612eji.163.1614937993877; 
 Fri, 05 Mar 2021 01:53:13 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:23ea:890a:84c3:71ab?
 ([2a02:908:1252:fb60:23ea:890a:84c3:71ab])
 by smtp.gmail.com with ESMTPSA id a3sm1229099ejv.40.2021.03.05.01.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Mar 2021 01:53:13 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: Fix some unload driver issues
To: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210305090429.452241-1-Emily.Deng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8a33dfef-a761-9e5a-fd19-64045cfad657@gmail.com>
Date: Fri, 5 Mar 2021 10:53:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210305090429.452241-1-Emily.Deng@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDUuMDMuMjEgdW0gMTA6MDQgc2NocmllYiBFbWlseSBEZW5nOgo+IElmIGhhdmUgbWVtb3J5
IGxlYWssIG1heWJlIGl0IHdpbGwgaGF2ZSBpc3N1ZSBpbgo+IHR0bV9ib19mb3JjZV9saXN0X2Ns
ZWFuLT4gdHRtX21lbV9ldmljdF9maXJzdC4KPgo+IFNldCBhZGV2LT5nYXJ0LnB0ciB0byBudWxs
IHRvIGF2b2lkIHRvIGNhbGwKPiBhbWRncHVfZ21jX3NldF9wdGVfcGRlIHRvIGNhdXNlIHB0ciBp
c3N1ZSBwb2ludGVyIHdoZW4KPiBjYWxsaW5nIGFtZGdwdV9nYXJ0X3VuYmluZCBpbiBhbWRncHVf
Ym9fZmluaSB3aGljaCBpcyBhZnRlciBnYXJ0X2ZpbmkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBFbWls
eSBEZW5nIDxFbWlseS5EZW5nQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9nYXJ0LmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nYXJ0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4gaW5k
ZXggMjM4MjNhNTczNzRmLi5mMWVkZTRiNDNkMDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nYXJ0LmMKPiBAQCAtMjAyLDYgKzIwMiw3IEBAIHZvaWQgYW1kZ3B1X2dh
cnRfdGFibGVfdnJhbV9mcmVlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+ICAgCQlyZXR1
cm47Cj4gICAJfQo+ICAgCWFtZGdwdV9ib191bnJlZigmYWRldi0+Z2FydC5ibyk7Cj4gKwlhZGV2
LT5nYXJ0LnB0ciA9IE5VTEw7Cj4gICB9Cj4gICAKPiAgIC8qCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK
