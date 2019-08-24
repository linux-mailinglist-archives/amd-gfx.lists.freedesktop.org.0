Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D44C9BF81
	for <lists+amd-gfx@lfdr.de>; Sat, 24 Aug 2019 20:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113F6E0E2;
	Sat, 24 Aug 2019 18:59:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4F26E0E2
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 18:59:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so11550145wru.13
 for <amd-gfx@lists.freedesktop.org>; Sat, 24 Aug 2019 11:59:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=AXH6a/3wrRKfhOwZBtIvFTLpdtsYbgkpc4WpVTC+oBA=;
 b=OEvi0/qkEU/Z3d6LJJ5cGwRD8cXEnIQk523FRHGg2fFefEuNBXPs4zJNoqVr3uTz7R
 VVQ7uXgLEcUibTJQND6RShJn9QnANmF4FiR5OmBp/JeU8A32Wjqkc47yQgpoRS523bW8
 7BcoO+vHk3qi3HxBLI1zoYYV4HeMUq6Kq3NkEMdgsizXCeL/i0+BIBApQAvB0aHKfJoF
 7akcQBdQdzYcgRsX+k30rUjNIZQ7CyZOpFQn7gQe79UwMALpGTnUx9fTCzNKkHtl+Hyc
 sWuhEnCcrQK25ChIK87pxcL/s5mg8Uhadk3cXQZD4b5UVIobBFMg/o74iO4URi4y4NSz
 Nrnw==
X-Gm-Message-State: APjAAAVLTIlLbpTi6K8Rmpmdk06tcgAX2J0FCTjAslOAyJ7qQiVA/ySP
 4NGz7tjz9b4v1BQikGxj8agFYFD+
X-Google-Smtp-Source: APXvYqxZoRMKTdXxPPpcBUGN8KOqBlsIMykLkmbHAg03OysJkQjYX3YIN68iPBOPdLTUVv5cagXU8Q==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr12460235wrp.352.1566673180596; 
 Sat, 24 Aug 2019 11:59:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id e3sm14254986wrs.37.2019.08.24.11.59.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 11:59:39 -0700 (PDT)
Subject: Re: [PATCH 3/4] drm/amdgpu: Support snooped PTE flag
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190823213249.10749-1-Felix.Kuehling@amd.com>
 <20190823213249.10749-4-Felix.Kuehling@amd.com>
 <f09e6893-347b-4ade-76e5-ad37d8e4e782@gmail.com>
 <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <96b6ac1d-de87-3fdb-a531-af4b0a42f1d5@gmail.com>
Date: Sat, 24 Aug 2019 20:59:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a7f9ad48-2e46-5415-e2a8-1738a101d716@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=AXH6a/3wrRKfhOwZBtIvFTLpdtsYbgkpc4WpVTC+oBA=;
 b=cywdymEdj07xl65E1kuDlgDETYxFYgKQUI5vbLCO1HP94awettj7ZQ+gpN1qebFTA7
 bpwhOQeuPnInuqk/8lmxQPw4lCVl/MUDDa9JEQPLQhc3PlPjYIWHy7qFAe04Nz9S7kxN
 CB3Bgp/TO0DFt8yFpLjShVajaiwInok53yShBU9sEt7ukoTEWOwsx6oFAGDWEOyBheYT
 CxSvaf5yhImCGuJXGZmxOf2jvn0TuQE2BaJCVpLmvKshi/FL2TjLXH0pymqsgtZ0oaYm
 +IetmsZVvf8uhlfv+G5WLARNoLgoepZDcpFEPYxNIZcY43Y3IEYPvsMtLRv0rJq1eziJ
 Ltmw==
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
Cc: "Zeng, Oak" <Oak.Zeng@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjQuMDguMTkgdW0gMTg6MjQgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gT24gMjAxOS0w
OC0yNCA3OjEzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyMy4wOC4xOSB1bSAyMzoz
MyBzY2hyaWViIEt1ZWhsaW5nLCBGZWxpeDoKPj4+IEZyb206IE9hayBaZW5nIDxPYWsuWmVuZ0Bh
bWQuY29tPgo+Pj4KPj4+IFNldCBzbm9vcGVkIFBURSBmbGFnIGFjY29yZGluZyB0byBtYXBwaW5n
IGZsYWcuIFdyaXRlIHJlcXVlc3QgdG8gYQo+Pj4gcGFnZSB3aXRoIHNub29wZWQgYml0IHNldCwg
d2lsbCBzZW5kIG91dCBpbnZhbGlkYXRlIHByb2JlIHJlcXVlc3QKPj4+IHRvIFRDQyBvZiB0aGUg
cmVtb3RlIEdQVSB3aGVyZSB0aGUgdnJhbSBwYWdlIHJlc2lkZXMuCj4+Pgo+Pj4gQ2hhbmdlLUlk
OiBJNzk5ZjY4ZWM3YTVhMWFiZjMyMDc1ZjVlZjMxMDUxNjQxYTBiMzczNgo+Pj4gU2lnbmVkLW9m
Zi1ieTogT2FrIFplbmcgPE9hay5aZW5nQGFtZC5jb20+Cj4+PiAtLS0KPj4+ICDCoCBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jIHwgMyArKysKPj4+ICDCoCAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2dtY192OV8wLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Z21jX3Y5XzAuYwo+Pj4gaW5kZXggOWFhZmNkYTZjNDg4Li44YTdjNGVjNjlhZTggMTAwNjQ0Cj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nbWNfdjlfMC5jCj4+PiBAQCAtNjA0LDYgKzYwNCw5
IEBAIHN0YXRpYyB1aW50NjRfdCBnbWNfdjlfMF9nZXRfdm1fcHRlX2ZsYWdzKHN0cnVjdAo+Pj4g
YW1kZ3B1X2RldmljZSAqYWRldiwKPj4+ICDCoMKgwqDCoMKgIGlmIChmbGFncyAmIEFNREdQVV9W
TV9QQUdFX1BSVCkKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcHRlX2ZsYWcgfD0gQU1ER1BVX1BU
RV9QUlQ7Cj4+PiAgwqAgK8KgwqDCoCBpZiAoZmxhZ3MgJiBBTURHUFVfVk1fUEFHRV9JTlZBTElE
QVRFX1BST0JFKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHB0ZV9mbGFnIHw9IEFNREdQVV9QVEVfU05P
T1BFRDsKPj4+ICsKPj4gVGhhdCBpcyBzdGlsbCBhIE5BSyB3aXRob3V0IGZ1cnRoZXIgY2hlY2tz
LiBXZSBuZWVkIHRvIG1ha2UgYWJzb2x1dGVseQo+PiBzdXJlIHRoYXQgd2UgZG9uJ3Qgc2V0IHRo
aXMgd2hlbiBQQ0llIHJvdXRpbmcgaXMgaW4gdXNlLgo+IFRoZSBvbmx5IHBsYWNlIHdoZXJlIEFN
REdQVV9WTV8uLi4gZmxhZ3MgYXJlIGFjY2VwdGVkIGZyb20gdXNlciBtb2RlCj4gc2VlbXMgdG8g
YmUgYW1kZ3B1X2dlbV92YV9pb2N0bC4gSXQgaGFzIGFuIGV4cGxpY2l0IHNldCBvZiB2YWxpZF9m
bGFncwo+IGl0IGFjY2VwdHMuIFRoZSBuZXcgSU5WQUxJREFURV9QUk9CRSBmbGFnIGlzIG5vdCBw
YXJ0IG9mIGl0LiBUaGF0IG1lYW5zCj4gdXNlciBtb2RlIHdpbGzCoCBub3QgYmUgYWJsZSB0byBz
ZXQgaXQgZGlyZWN0bHkuIElmIHdlIGFkZGVkIGl0IHRvIHRoZQo+IHNldCBvZiB2YWxpZF9mbGFn
cyBpbiBhbWRncHVfZ2VtX3ZhX2lvY3RsLCB3ZSdkIG5lZWQgdG8gYWRkIGFwcHJvcHJpYXRlCj4g
Y2hlY2tzIGF0IHRoZSBzYW1lIHRpbWUuCj4KPiBLRkQgZG9lcyBub3QgZXhwb3NlIEFNREdQVV9W
TV8uLi4gZmxhZ3MgZGlyZWN0bHkgdG8gdXNlciBtb2RlLiBJdCBvbmx5Cj4gc2V0cyB0aGUgSU5W
QUxJREFURV9QUk9CRSBmbGFnIGluIGtlcm5lbCBtb2RlIGZvciBtYXBwaW5ncyBpbiB0aGUgc2Ft
ZQo+IFhHTUkgaGl2ZSBvbiBBcnR1cnVzIChpbiBwYXRjaCA0KS4KPgo+IElmIHRoZXJlIGlzIHNv
bWV0aGluZyBJJ20gbWlzc2luZywgcGxlYXNlIHBvaW50IGl0IG91dC4gQnV0IEFGQUlDVCB0aGUK
PiBjaGVja2luZyB0aGF0IGlzIGN1cnJlbnRseSBkb25lIHNob3VsZCBzYXRpc2Z5IHlvdXIgcmVx
dWlyZW1lbnRzLgoKVGhlIGhhcmR3YXJlIGJlaGF2aW9yIGRlcGVuZHMgb24gdGhlIHBsYWNlbWVu
dCBvZiB0aGUgYnVmZmVyLCBzbyBhdCBiYXJlIAptaW5pbXVtIHdlIG5lZWQgdG8gY2hlY2sgaWYg
aXQncyBwb2ludGluZyB0byBQQ0llIG9yIGxvY2FsIChjaGVjayB0aGUgCnN5c3RlbSBiaXQpLgoK
QnV0IGV2ZW4gaWYgaXQncyBsb2NhbCB3aGF0IGlzIHRoZSBiZWhhdmlvciBmb3IgbG9jYWwgbWVt
b3J5PyBFLmcuIG5vdCAKYWNjZXNzZWQgdGhyb3VnaCBYR01JPwoKQXMgZmFyIGFzIEkgY2FuIHNl
ZSB3aGF0IHdlIG5lZWQgdG8gY2hlY2sgaGVyZSBpcyB0aGF0IHRoaXMgaXMgYSByZW1vdGUgCmFj
Y2VzcyBvdmVyIFhHTUkgYW5kIHRoZW4gKGFuZCBvbmx5IHRoZW4hKSB3ZSBhcmUgYWxsb3dlZCB0
byBzZXQgdGhlIApzbm9vcCBiaXQgb24gdGhlIFBURS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4K
PiBSZWdhcmRzLAo+ICAgwqAgRmVsaXgKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+PiAgwqDCoMKgwqDC
oCByZXR1cm4gcHRlX2ZsYWc7Cj4+PiAgwqAgfQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4
