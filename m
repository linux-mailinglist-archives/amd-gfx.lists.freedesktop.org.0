Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A2E2EBDD9
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Jan 2021 13:47:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15C389F6E;
	Wed,  6 Jan 2021 12:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C62C89F6E
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Jan 2021 12:47:29 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d26so2289543wrb.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 06 Jan 2021 04:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=froggi.es; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EtUMb99jTa+pkr+vpPX9iYpeZEYjyi+JwHm+4KML3Ew=;
 b=QVBhsGqE7vC3u0kCr6iYtzjdxxZBtNhS1jNwglKVxJjYuXnwHPEjfJgU8PBBlR4vv1
 3k4jCzl1QPSw2eUGLHt5VLEC0f/au0NtGDKI2bFbKqpLu/8zX0IUSfC4OIz2tasJ1/c/
 DWyoO9fEBmEeqZIXF5O1TmKgf31QmTrw5Sh+31fpH8/vN3QVwHyU7TZwNdszZI62J9rU
 a3Qlg3FTvAYSyu5MH0ZWlLDw9WrgHE72iqD2INb/OG8V5U3dbCTOsiJBiyfY3s+jorTN
 ldTeRForkEpr95Dof2L4a87dh6kiWzM+JWLNm0FjLaJncdVJaAmEGrhShy/sOv2Zr+pd
 tirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EtUMb99jTa+pkr+vpPX9iYpeZEYjyi+JwHm+4KML3Ew=;
 b=NL2o9GEXWu7re4ozQaggbPAQYnQoeEy7RHJqqUWsNfnwXpmSixxLgPdvigvnRc1drl
 YzR1VPGTR31dbfLGfZYlTPsAE30inkvRKMPSECnCYdnf3fvjGao8VFEA+A9qOGjANrp+
 bLdFp/wsiMhngqJJzuRi0gmLv/BCmTCZ2L4NInZkehqtZ3K/qLrT6lYoQP8QtkiCIZVK
 fb+0NuuLIlt0JFxAgsRnt0AT17ndld05geM7Xz4TZsVxphYwf2Mi8BQQ1x8IE525K9c9
 ZTQKvcC+0TsFQz1vz/yTl8BBAhR6TdAQ8CFSTSfHpJC8aaJPiOzVGoUsuf+BVJaZj/IZ
 YmTA==
X-Gm-Message-State: AOAM531BvdqlrhNbtH0LEr6CQwX38iFx1RbUn7kSxRviY47l9CADYv4Y
 FO14VyRs4Q6Jifzj1IXiSZF6bdfFhDp5sQ==
X-Google-Smtp-Source: ABdhPJy5e2Qv/IjU6pXGpu1jt+ZGNx6837yPupkMKrzv+yYIG7bUFF6r8fuM17uBhc6tlnCuqu07tQ==
X-Received: by 2002:adf:bc92:: with SMTP id g18mr4075018wrh.160.1609937247732; 
 Wed, 06 Jan 2021 04:47:27 -0800 (PST)
Received: from [192.168.0.61]
 (cpc89720-darl9-2-0-cust754.11-2.cable.virginm.net. [86.2.110.243])
 by smtp.gmail.com with ESMTPSA id o83sm2924869wme.21.2021.01.06.04.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 04:47:27 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: don't limit gtt size on apus
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20210105220359.1392555-1-joshua@froggi.es>
 <CADnq5_NcKG9H-dK0Kh2ksF8et+fnFkMdsejkg_RWrNeJ1JS4ng@mail.gmail.com>
 <6d6b0ae7-f732-167b-2bc1-6e517f6c8e99@froggi.es>
 <9902861e-77bd-d6dc-7284-0ad9bcf117b6@amd.com>
From: Joshua Ashton <joshua@froggi.es>
Message-ID: <a8f72dc6-8504-269e-56e8-699b20135a07@froggi.es>
Date: Wed, 6 Jan 2021 12:47:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <9902861e-77bd-d6dc-7284-0ad9bcf117b6@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiAxLzYvMjEgNzo1MiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwNS4wMS4y
MSB1bSAyMzozMSBzY2hyaWViIEpvc2h1YSBBc2h0b246Cj4+IE9uIDEvNS8yMSAxMDoxMCBQTSwg
QWxleCBEZXVjaGVyIHdyb3RlOgo+Pj4gT24gVHVlLCBKYW4gNSwgMjAyMSBhdCA1OjA1IFBNIEpv
c2h1YSBBc2h0b24gPGpvc2h1YUBmcm9nZ2kuZXM+IHdyb3RlOgo+Pj4+Cj4+Pj4gU2luY2UgY29t
bWl0IDI0NTYyNTIzNjg4YiAoIlJldmVydCAiZHJtL2FtZC9hbWRncHU6IHNldCBndHQgc2l6ZQo+
Pj4+IGFjY29yZGluZyB0byBzeXN0ZW0gbWVtb3J5IHNpemUgb25seSIiKSwgdGhlIEdUVCBzaXpl
IHdhcyBsaW1pdGVkIGJ5Cj4+Pj4gM0dpQiBvciBWUkFNIHNpemUuCj4+Pgo+Pj4gVGhlIGNvbW1p
dCBpbiBxdWVzdGlvbiB3YXMgdG8gZml4IGEgaGFuZyB3aXRoIGNlcnRhaW4gdGVzdHMgb24gQVBV
cy4KPj4+IFRoYXQgc2hvdWxkIGJlIHRlc3RlZCBhZ2FpbiBiZWZvcmUgd2UgcmUtZW5hYmxlIHRo
aXMuwqAgSWYgaXQgaXMgZml4ZWQsCj4+PiB3ZSBzaG91bGQganVzdCByZXZlcnQgdGhlIHJldmVy
dCByYXRoZXIgdGhhbiBzcGVjaWFsIGNhc2UgZEdQVXMuCj4+Pgo+Pj4gQWxleAo+Pj4KPj4KPj4g
SSB0aGluayB0aGUgY29tbWl0IGJlZm9yZSB0aGUgcmV2ZXJ0IChiYTg1MWVlZDg5NWMpIGhhcyBz
b21lIAo+PiBmdW5kYW1lbnRhbCBwcm9ibGVtczoKPj4KPj4gSXQgd2FzIGFsd2F5cyBzcGVjaWZ5
aW5nIG1heCgzR2lCLCAzLzR0aHMgUkFNKSBvZiBHVFQsIGV2ZW4gaWYgdGhhdCAKPj4gd291bGRu
J3QgZml0IGludG8gc2F5LCAxR2lCIG9yIDJHaUIgb2YgYXZhaWxhYmxlIFJBTS4KPj4KPj4gTGlt
aXRpbmcgR1RUIHRvIG1pbihtYXgoM0dpQiwgVlJBTSksIDMvNHRocyBSQU0pIHNpemUgb24gZEdQ
VXMgbWFrZXMgCj4+IHNlbnNlIGFsc28gYW5kIGlzIGEgc2Vuc2libGUgbGltaXQgdG8gYXZvaWQg
c2lsbHkgc2l0dWF0aW9ucyB3aXRoIAo+PiBvdmVyYWxsb2NhdGlvbiBhbmQgcG90ZW50aWFsIE9P
TS4KPj4KPj4gVGhpcyBwYXRjaCBzb2x2ZXMgYm90aCBvZiB0aG9zZSBpc3N1ZXMuCj4gCj4gTm8s
IEFsZXggaXMgcmlnaHQgdGhpcyBhcHByb2FjaCB3YXMgYWxyZWFkeSB0cmllZCBhbmQgaXQgY2F1
c2VzIHByb2JsZW1zLgo+IAo+IEFkZGl0aW9uYWwgdG8gdGhhdCB3aHkgc2hvdWxkIHRoaXMgYmUg
YW4gaXNzdWU/IEV2ZW4gd2hlbiBWUkFNIGlzIHZlcnkgCj4gc21hbGwgb24gQVBVcyB3ZSBzdGls
bCB1c2UgM0dpQiBvZiBHVFQuCj4gCj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCgpUaGUgcHJvYmxl
bSBpcyB0aGF0IDNHaUIgb2YgR1RUIGlzbid0IGVub3VnaCBmb3IgbW9zdCBtb2Rlcm4gZ2FtZXMu
IE15IApsYXB0b3AgaGFzIGEgMTI4TWlCIGNhcnZlb3V0IHdoaWNoIGlzIG5vdCBwb3NzaWJsZSB0
byBiZSBjb25maWd1cmVkIGluIAp0aGUgQklPUyBzbyBJIGFtIHN0dWNrIHdpdGggdGhhdCBzaXpl
IHdpdGhvdXQgZXh0cmEga2VybmVsIHBhcmFtZXRlcnMgCndoaWNoIHNob3VsZG4ndCBiZSBuZWNl
c3NhcnkuCgpJZiB5b3UgZGlzbGlrZSB0aGUgYXBwcm9hY2ggb2Yga2VlcGluZyB0aGUgZXh0cmEg
Y2hlY2sgZm9yIGRHUFVzIGFuZCAKbGltaXRpbmcgR1RUIHRoZXJlLCB0aGVuIEkgd291bGQgc2F5
IHRoYXQgd2Ugc2hvdWxkIHVzZQoJZ3R0X3NpemUgPSAzLzR0aHMgc3lzdGVtIG1lbW9yeQpmb3Ig
YWxsIGRldmljZXMgaW5zdGVhZCBvZgoJZ3R0X3NpemUgPSBtYXgoMy80dGhzIHN5c3RlbSBtZW1v
cnksIDNHaUIpCmFzIGl0IHdhcyBiZWZvcmUgdGhlIHJldmVydCwgYXMgaXQgaXMgcHJvYmxlbWF0
aWMgb24gc3lzdGVtcyB3aXRoIDwgM0dpQiAKb2Ygc3lzdGVtIG1lbW9yeS4KCi0gSm9zaGllIPCf
kLjinKgKCj4gCj4+Cj4+IC0gSm9zaGllIPCfkLjinKgKPj4KPj4+Cj4+Pj4KPj4+PiBUaGlzIGlz
IHByb2JsZW1hdGljIG9uIEFQVXMsIGVzcGVjaWFsbHkgd2l0aCBhIHNtYWxsIGNhcnZlb3V0Cj4+
Pj4gd2hpY2ggY2FuIGJlIGFzIGxvdyBhcyBhIGZpeGVkIDEyOE1pQiwgYXMgdGhlcmUgd291bGQg
YmUgdmVyeSBhIGxpbWl0ZWQKPj4+PiAzR2lCIGF2YWlsYWJsZSBmb3IgdmlkZW8gbWVtb3J5Lgo+
Pj4+IFRoaXMgb2J2aW91c2x5IGRvZXMgbm90IG1lZXQgdGhlIGRlbWFuZHMgb2YgbW9kZXJuIGFw
cGxpY2F0aW9ucy4KPj4+Pgo+Pj4+IFRoaXMgcGF0Y2ggbWFrZXMgaXQgc28gdGhlIEdUVCBzaXpl
IGhldXJpc3RpYyBhbHdheXMgdXNlcyAzLzR0aHMgb2YKPj4+PiB0aGUgc3lzdGVtIG1lbW9yeSBz
aXplIG9uIEFQVXMgKGxpbWl0aW5nIHRoZSBzaXplIGJ5IDNHaUIvVlJBTSBzaXplCj4+Pj4gb25s
eSBvbiBkZXZpY2VzIHdpdGggZGVkaWNhdGVkIHZpZGVvIG1lbW9yeSkuCj4+Pj4KPj4+PiBGaXhl
czogMjQ1NjI1MjM2ODhiICgiUmV2ZXJ0IGRybS9hbWQvYW1kZ3B1OiBzZXQgZ3R0IHNpemUgYWNj
b3JkaW5nIHRvCj4+Pj4gc3lzdGVtIG1lbW9yeSBzaXplIG9ubHkiKQo+Pj4+Cj4+Pj4gU2lnbmVk
LW9mZi1ieTogSm9zaHVhIEFzaHRvbiA8am9zaHVhQGZyb2dnaS5lcz4KPj4+PiAtLS0KPj4+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfMKgIDUgKysrLS0KPj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAxMiArKysrKysr
KystLS0KPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2Rydi5jIAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCj4+Pj4gaW5kZXggNzJlZmQ1NzllYzVlLi5hNWE0MWU5MjcyZDYgMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4gQEAgLTE5Miw4ICsxOTIs
OSBAQCBtb2R1bGVfcGFyYW1fbmFtZWQoZ2FydHNpemUsIGFtZGdwdV9nYXJ0X3NpemUsIAo+Pj4+
IHVpbnQsIDA2MDApOwo+Pj4+Cj4+Pj4gwqAgLyoqCj4+Pj4gwqDCoCAqIERPQzogZ3R0c2l6ZSAo
aW50KQo+Pj4+IC0gKiBSZXN0cmljdCB0aGUgc2l6ZSBvZiBHVFQgZG9tYWluIGluIE1pQiBmb3Ig
dGVzdGluZy4gVGhlIGRlZmF1bHQgCj4+Pj4gaXMgLTEgKEl0J3MgVlJBTSBzaXplIGlmIDNHQiA8
IFZSQU0gPCAzLzQgUkFNLAo+Pj4+IC0gKiBvdGhlcndpc2UgMy80IFJBTSBzaXplKS4KPj4+PiAr
ICogUmVzdHJpY3QgdGhlIHNpemUgb2YgR1RUIGRvbWFpbiBpbiBNaUIgZm9yIHRlc3RpbmcuIFRo
ZSBkZWZhdWx0IAo+Pj4+IGlzIC0xIChPbiBBUFVzIHRoaXMgaXMgMy80dGgKPj4+PiArICogb2Yg
dGhlIHN5c3RlbSBtZW1vcnk7IG9uIGRHUFVzIHRoaXMgaXMgM0dpQiBvciBWUkFNIHNpemVkLCAK
Pj4+PiB3aGljaGV2ZXIgaXMgYmlnZ2VyLAo+Pj4+ICsgKiB3aXRoIGFuIHVwcGVyIGJvdW5kIG9m
IDMvNHRoIG9mIHN5c3RlbSBtZW1vcnkuCj4+Pj4gwqDCoCAqLwo+Pj4+IMKgIE1PRFVMRV9QQVJN
X0RFU0MoZ3R0c2l6ZSwgIlNpemUgb2YgdGhlIEdUVCBkb21haW4gaW4gbWVnYWJ5dGVzICgtMSAK
Pj4+PiA9IGF1dG8pIik7Cj4+Pj4gwqAgbW9kdWxlX3BhcmFtX25hbWVkKGd0dHNpemUsIGFtZGdw
dV9ndHRfc2l6ZSwgaW50LCAwNjAwKTsKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIAo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jCj4+Pj4gaW5kZXggNGQ4ZjE5YWIxMDE0Li4yOTRmMjZmNGYzMTAgMTAw
NjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+Pj4gQEAg
LTE4NjUsOSArMTg2NSwxNSBAQCBpbnQgYW1kZ3B1X3R0bV9pbml0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2KQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBz
eXNpbmZvIHNpOwo+Pj4+Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2lf
bWVtaW5mbygmc2kpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd0dF9zaXpl
ID0gbWluKG1heCgoQU1ER1BVX0RFRkFVTFRfR1RUX1NJWkVfTUIgPDwgMjApLAo+Pj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFk
ZXYtPmdtYy5tY192cmFtX3NpemUpLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgodWludDY0X3Qpc2kudG90YWxyYW0gKiBz
aS5tZW1fdW5pdCAKPj4+PiAqIDMvNCkpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGd0dF9zaXplID0gKHVpbnQ2NF90KXNpLnRvdGFscmFtICogc2kubWVtX3VuaXQgKiAzLzQ7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogSWYgd2UgaGF2ZSBkZWRpY2F0
ZWQgbWVtb3J5LCBsaW1pdCBvdXIgR1RUIHNpemUgdG8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogM0dpQiBvciBWUkFNIHNpemUsIHdoaWNoZXZlciBpcyBiaWdnZXIKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKCEoYWRldi0+ZmxhZ3MgJiBBTURfSVNfQVBVKSkgewo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBndHRfc2l6ZSA9IAo+
Pj4+IG1pbihtYXgoQU1ER1BVX0RFRkFVTFRfR1RUX1NJWkVfTUIgPDwgMjAsCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
ZGV2LT5nbWMubWNfdnJhbV9zaXplKSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGd0dF9zaXplKTsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBlbHNlCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Z3R0X3NpemUgPSAodWludDY0X3QpYW1kZ3B1X2d0dF9zaXplIDw8IDIwOwo+Pj4+IC0tIAo+Pj4+
IDIuMzAuMAo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1h
biUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5p
ZyU0MGFtZC5jb20lN0MwZGZlMGQ0YjZmNjk0ZWY0YmQzYzA4ZDhiMWM5YWIwYiU3QzNkZDg5NjFm
ZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0NTQ4MjcwMDUyMTQ3MDQlN0NV
bmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklp
TENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9ZVQwWG13TlB6
QkMxbU9EWlFTZUhMbGNIenFVMkR0ZmIxRTNnb0pFeTJsQSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+
Pgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
