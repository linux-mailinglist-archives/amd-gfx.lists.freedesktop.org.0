Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D15800E
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 12:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952946E02A;
	Thu, 27 Jun 2019 10:17:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73B46E02A
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 10:17:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n4so1850231wrw.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 03:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mDADLAzP+kWaFTMUXKmThKbCgxKKoXarlJlzUL6IX9k=;
 b=cfrZ5PrLcZwl5U+XiS0bBk7wsp98vGYAccxdDpqnUsI0St6oEyvhcXMHxXlThePWTI
 dThdBrlbyPAhnjbCucOva0/HpoNtogD+L6umUrl5xrie0UO5aNyNnKrKTkfDcIgksvsp
 O7B9uC2GxpKXHBnUqHLKf6Bw86uRK5OeCNHw+Ke/jul2WvfxBFt313W+wNW0ylR3cgoq
 hmxgSlPBhH8TjUToO8Nd+MVQW3zYrYqaniqw53NidTPsHCw/OUIDyQ29MulU2XH7MT9U
 njNPKzqaahzo11hfumZ0fJTru9RAQc0+YN1/klym8N8Cko0b1ifXlF6a2GCk/hKelIi0
 r4OA==
X-Gm-Message-State: APjAAAU7ZuIOkMYI/1jGjkpLtwG/hj/XW3zx/LphTRcDQFpAqrUNfRi8
 4O5HHT1/doln4nzHJkbNaHV4cWT5
X-Google-Smtp-Source: APXvYqxRtKrpZ5rmardbsS3bZsiuhzUQFKaD8Y43mObDnbom2NS6iUHS8J9Oh0L1Swn2YlnCZ1KO3Q==
X-Received: by 2002:adf:df10:: with SMTP id y16mr2694396wrl.302.1561630662431; 
 Thu, 27 Jun 2019 03:17:42 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 72sm3006678wrk.22.2019.06.27.03.17.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 03:17:41 -0700 (PDT)
Subject: Re: [PATCH v2] drm/amdgpu: fix scheduler timeout calc
To: "Cui, Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1561629780-21649-1-git-send-email-flora.cui@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <379c7272-a581-d3f2-582c-fbb92d59f00f@gmail.com>
Date: Thu, 27 Jun 2019 12:17:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <1561629780-21649-1-git-send-email-flora.cui@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mDADLAzP+kWaFTMUXKmThKbCgxKKoXarlJlzUL6IX9k=;
 b=XLB35IIKbaT7JeulixQYy6STqxTSQWunOJS9K4T/GeOOUDwyBcnRSgW1vfNkuoxaXH
 f0Y+x/4JB3sUUnCi71d++dolFEhHFmIhYK8SEEjMG0BsOu6MhYI5+lK/1qh5sEcFCO99
 2WSQDGbSjMISktbzEvQTd4sFA+Sx0o/BbYY1U6vPieDKrl88BmhXNH8fLofBcCmWJSez
 g5bQQz3Bq1VvPEmReo495SSpQKS0xc6nfks3475pxrE9wkCcZwC4A/KvvYJgYoaTJofK
 cszLh1RDgzTasfAlsdiCAHuWu5q6yFv5LKnyG+E0/8aMeo1BHumA9tg8De3BhSepxcPn
 fMeA==
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

QW0gMjcuMDYuMTkgdW0gMTI6MDMgc2NocmllYiBDdWksIEZsb3JhOgo+IHNjaGVkdWxlciB0aW1l
b3V0IGlzIGluIGppZmZpZXMKPiB2MjogbW92ZSB0aW1lb3V0IGNoZWNrIHRvIGFtZGdwdV9kZXZp
Y2VfZ2V0X2pvYl90aW1lb3V0X3NldHRpbmdzIGFmdGVyCj4gcGFyc2luZyB0aGUgdmFsdWUKPgo+
IENoYW5nZS1JZDogSTI2NzA4YzE2M2RiOTQzZmY4ZDkzMGRkODFiY2FiNGI0YjlkODRlYjIKPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPgo+IC0tLQo+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgNyArKysrKy0tCj4gICAxIGZp
bGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IGU3NGExNzUuLmNjMjlkNzAgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTEzMDAsNyAr
MTMwMCw5IEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2JfdGltZW91dF9zZXR0aW5ncyhzdHJ1
Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkgKiBCeSBkZWZhdWx0IHRpbWVvdXQgZm9yIG5v
biBjb21wdXRlIGpvYnMgaXMgMTAwMDAuCj4gICAJICogQW5kIHRoZXJlIGlzIG5vIHRpbWVvdXQg
ZW5mb3JjZWQgb24gY29tcHV0ZSBqb2JzLgo+ICAgCSAqLwo+IC0JYWRldi0+Z2Z4X3RpbWVvdXQg
PSBhZGV2LT5zZG1hX3RpbWVvdXQgPSBhZGV2LT52aWRlb190aW1lb3V0ID0gMTAwMDA7Cj4gKwlh
ZGV2LT5nZnhfdGltZW91dCA9IFwKPiArCQlhZGV2LT5zZG1hX3RpbWVvdXQgPSBcCj4gKwkJYWRl
di0+dmlkZW9fdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXMoMTAwMDApOwoKT2YgaGFuZCB0aGF0
IGxvb2tzIHZlcnkgb2RkIHRvIG1lLiBUaGlzIGlzIG5vdCBhIG1hY3JvIHNvIHdoeSB0aGUgXCBo
ZXJlPwoKPiAgIAlhZGV2LT5jb21wdXRlX3RpbWVvdXQgPSBNQVhfU0NIRURVTEVfVElNRU9VVDsK
PiAgIAo+ICAgCWlmIChzdHJubGVuKGlucHV0LCBBTURHUFVfTUFYX1RJTUVPVVRfUEFSQU1fTEVO
VEgpKSB7Cj4gQEAgLTEzMTQsNyArMTMxNiw4IEBAIGludCBhbWRncHVfZGV2aWNlX2dldF9qb2Jf
dGltZW91dF9zZXR0aW5ncyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgIAkJCWlmICh0
aW1lb3V0IDw9IDApIHsKPiAgIAkJCQlpbmRleCsrOwo+ICAgCQkJCWNvbnRpbnVlOwo+IC0JCQl9
Cj4gKwkJCX0gZWxzZQo+ICsJCQkJdGltZW91dCA9IG1zZWNzX3RvX2ppZmZpZXModGltZW91dCk7
CgpZb3UgY2FuIGFjdHVhbGx5IHJlbW92ZSB0aGUgImlmICh0aW1lb3V0IDw9IDApIiBhcyB3ZWxs
LCAKbXNlY3NfdG9famlmZmllcyB3aWxsIGRvIHRoZSByaWdodCB0aGluZyBmb3IgbmVnYXRpdmUg
dmFsdWVzLgoKQ2hyaXN0aWFuLgoKPiAgIAo+ICAgCQkJc3dpdGNoIChpbmRleCsrKSB7Cj4gICAJ
CQljYXNlIDA6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
