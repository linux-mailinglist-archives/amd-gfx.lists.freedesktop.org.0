Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C305C485B
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 09:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8F166E8ED;
	Wed,  2 Oct 2019 07:19:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1382B6E8F5
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 07:19:08 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id q17so18290066wrx.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 02 Oct 2019 00:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XW12xx9/dk5UUcuenRqKdnR9/Gd/EDDWyUxa5SXRraM=;
 b=YuW8akTDgHye87QPrbXGCcI9gbQvw9sxqNpxwzQUg86WcXyt7DcNnvZnQW+3Bk00nz
 ORyvUuUaKjkpBdUmNefz4As7bITFA4E5jlBP1AJ62Omr5ku+zsTLCyqZW/jK/TCJNTkE
 qexdrZ8ydZN2woY/OqkOALPfzijxa5SnrDd7Y6MLQVeDqOo1Prdns5bKVPFBCc4ZgQ2w
 IsA4AH6HXVnItfa4+sKnxBFAGk23ZdZvhDnHRWh2QnCSSfyYt9hanlOXCjythOcm9Xpe
 YQPeA5/S2vLDMdxIm4y21i05t0Nu+K+q/wtl8v5nzP9FMFaVXO0WLRWlzh2Iy3tfL40S
 Ailg==
X-Gm-Message-State: APjAAAVFHRslIy+iIoyWdQg8KnT0VdunY9rDGFgOydp1XrGHdVl3jo8h
 L+r5i+4QWYt4nIaEk3xiy/1JpyCG
X-Google-Smtp-Source: APXvYqzKS6RKFqxUIkFi58XyxeNJV8rJ6cGbpU6Ecp/kwzt6IWtovQyKveGj5KKtNswZLUPp+v01vQ==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr1402156wrr.152.1570000745755; 
 Wed, 02 Oct 2019 00:19:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 79sm7552822wmb.7.2019.10.02.00.19.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 00:19:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead of
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191001221708.20185-1-leo.liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e0305baf-dce7-381a-6aea-a4f3508d59d0@gmail.com>
Date: Wed, 2 Oct 2019 09:19:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001221708.20185-1-leo.liu@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XW12xx9/dk5UUcuenRqKdnR9/Gd/EDDWyUxa5SXRraM=;
 b=C7FMbmFGE6f0ZPKMFG8gr9oWZY6BlCTx0hIOhGaO7m+mcOk/o+kLAHZjSxBR+ifKYk
 5HFW0QlVxRfDXdoE+R3jRxWbIKZk/VyuD+0EFR3bCpQW2EFpaCE1gq1Hfwt5bYhe2dCH
 Dovhq85fxzh4MbygemI7TlXZgg4bDhNpuy1aibUlaDDDPKMHkxp5ygsFyVZM8RD6FKJn
 NcMCJyUOMIE5DW1e991tfYouaHKZ45Qm5vjDKo2+vyZ48un+GrUjl9r5XlO8RnvyBNke
 qHRyqrQD+lFXVpigUYU+SZW4bz3FUeQs/x9TTJetm7vP/enEZ3VtXF9hFwy8yV4b4A5k
 Go8A==
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
Cc: "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDIuMTAuMTkgdW0gMDA6MTcgc2NocmllYiBMaXUsIExlbzoKPiBhbWRncHVfcmluZ190ZXN0
X3JpbmcsIHNvIGl0IHdpbGwgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHJpbmcgaXMgcmVhZHkKPgo+
IFNpZ25lZC1vZmYtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KPiBDYzogR3VzdGF2byBB
LiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgoKPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgfCAgMSAtCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jIHwgMjEgKysrKysrLS0tLS0tLS0t
LS0tLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgMTggKysr
KysrLS0tLS0tLS0tLS0tCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI4
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3Zjbl92MV8wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCj4gaW5k
ZXggOTNiMzUwMGU1MjJiLi5iNGY4NGE4MjBhNDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3Zjbl92MV8wLmMKPiBAQCAtMjAyLDcgKzIwMiw2IEBAIHN0YXRpYyBpbnQgdmNuX3YxXzBf
aHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNu
Lm51bV9lbmNfcmluZ3M7ICsraSkgewo+ICAgCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0LT5yaW5n
X2VuY1tpXTsKPiAtCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7Cj4gICAJCXIgPSBhbWRncHVf
cmluZ190ZXN0X2hlbHBlcihyaW5nKTsKPiAgIAkJaWYgKHIpCj4gICAJCQlnb3RvIGRvbmU7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4gaW5kZXggNDYyOGZkMTBhOWVjLi4z
OGY3ODdhNTYwY2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNu
X3YyXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKPiBA
QCAtMjQ3LDMwICsyNDcsMjEgQEAgc3RhdGljIGludCB2Y25fdjJfMF9od19pbml0KHZvaWQgKmhh
bmRsZSkKPiAgIAlhZGV2LT5uYmlvLmZ1bmNzLT52Y25fZG9vcmJlbGxfcmFuZ2UoYWRldiwgcmlu
Zy0+dXNlX2Rvb3JiZWxsLAo+ICAgCQkJCQkgICAgIHJpbmctPmRvb3JiZWxsX2luZGV4LCAwKTsK
PiAgIAo+IC0JcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOwo+IC0JciA9IGFtZGdwdV9yaW5nX3Rl
c3RfcmluZyhyaW5nKTsKPiAtCWlmIChyKSB7Cj4gLQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxz
ZTsKPiArCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsKPiArCWlmIChyKQo+ICAg
CQlnb3RvIGRvbmU7Cj4gLQl9Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNuLm51
bV9lbmNfcmluZ3M7ICsraSkgewo+ICAgCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0LT5yaW5nX2Vu
Y1tpXTsKPiAtCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7Cj4gLQkJciA9IGFtZGdwdV9yaW5n
X3Rlc3RfcmluZyhyaW5nKTsKPiAtCQlpZiAocikgewo+IC0JCQlyaW5nLT5zY2hlZC5yZWFkeSA9
IGZhbHNlOwo+ICsJCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsKPiArCQlpZiAo
cikKPiAgIAkJCWdvdG8gZG9uZTsKPiAtCQl9Cj4gICAJfQo+ICAgCj4gICAJcmluZyA9ICZhZGV2
LT52Y24uaW5zdC0+cmluZ19qcGVnOwo+IC0JcmluZy0+c2NoZWQucmVhZHkgPSB0cnVlOwo+IC0J
ciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKPiAtCWlmIChyKSB7Cj4gLQkJcmluZy0+
c2NoZWQucmVhZHkgPSBmYWxzZTsKPiArCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5n
KTsKPiArCWlmIChyKQo+ICAgCQlnb3RvIGRvbmU7Cj4gLQl9Cj4gICAKPiAgIGRvbmU6Cj4gICAJ
aWYgKCFyKQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
NS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYwo+IGluZGV4IGJmODYy
NmUxNWIwOS4uY2MxOTQ0NDQzNjNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3Zjbl92Ml81LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25f
djJfNS5jCj4gQEAgLTI1OCwyOSArMjU4LDIzIEBAIHN0YXRpYyBpbnQgdmNuX3YyXzVfaHdfaW5p
dCh2b2lkICpoYW5kbGUpCj4gICAJCWFkZXYtPm5iaW8uZnVuY3MtPnZjbl9kb29yYmVsbF9yYW5n
ZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsCj4gICAJCQkJCQkgICAgIHJpbmctPmRvb3JiZWxs
X2luZGV4LCBqKTsKPiAgIAo+IC0JCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Cj4g
LQkJaWYgKHIpIHsKPiAtCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPiArCQlyID0gYW1k
Z3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7Cj4gKwkJaWYgKHIpCj4gICAJCQlnb3RvIGRvbmU7
Cj4gLQkJfQo+ICAgCj4gICAJCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5n
czsgKytpKSB7Cj4gICAJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5jW2ldOwo+
ICAgCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPiAgIAkJCWNvbnRpbnVlOwo+IC0JCQly
ID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwo+IC0JCQlpZiAocikgewo+IC0JCQkJcmlu
Zy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPiArCQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVy
KHJpbmcpOwo+ICsJCQlpZiAocikKPiAgIAkJCQlnb3RvIGRvbmU7Cj4gLQkJCX0KPiAgIAkJfQo+
ICAgCj4gICAJCXJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19qcGVnOwo+IC0JCXIgPSBh
bWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Cj4gLQkJaWYgKHIpIHsKPiAtCQkJcmluZy0+c2No
ZWQucmVhZHkgPSBmYWxzZTsKPiArCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7
Cj4gKwkJaWYgKHIpCj4gICAJCQlnb3RvIGRvbmU7Cj4gLQkJfQo+ICAgCX0KPiAgIGRvbmU6Cj4g
ICAJaWYgKCFyKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
