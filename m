Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91FC8A16
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Oct 2019 15:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3041D89BBE;
	Wed,  2 Oct 2019 13:46:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 56056 seconds by postgrey-1.36 at gabe;
 Wed, 02 Oct 2019 13:32:15 UTC
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
 [192.185.146.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74CFE6E0D9
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 13:32:15 +0000 (UTC)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway33.websitewelcome.com (Postfix) with ESMTP id A7E34765A0
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Oct 2019 08:23:59 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id FebniV6hgHunhFebniCwnr; Wed, 02 Oct 2019 08:23:59 -0500
X-Authority-Reason: nr=8
Received: from [187.192.22.73] (port=47780 helo=[192.168.43.131])
 by gator4166.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1iFebm-000Xly-Mv; Wed, 02 Oct 2019 08:23:59 -0500
Subject: Re: [PATCH 1/2] drm/amdgpu/vcn: use amdgpu_ring_test_helper instead of
To: "Liu, Leo" <Leo.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191001221708.20185-1-leo.liu@amd.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gustavo@embeddedor.com; keydata=
 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
 VtSixD1uOgytAP7RWS474w==
Message-ID: <18891125-1a20-5c74-a8dd-7099754d2c16@embeddedor.com>
Date: Wed, 2 Oct 2019 08:23:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001221708.20185-1-leo.liu@amd.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.22.73
X-Source-L: No
X-Exim-ID: 1iFebm-000Xly-Mv
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [187.192.22.73]:47780
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 2
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Wed, 02 Oct 2019 13:46:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jzZA7oxzJXCngXh2yzVlScY837eEFS7enPYjO8PBk5c=; b=lKOwIBcc4MkexP+VXOwlVniH2w
 +fzk/+zi8nc3oxJtJsugMefSpY6ohtg3OIn8Z+hWRcM3R93nSxBfX2g3B8dRv0IsrC8bH8p4qhI9i
 0Tf1h2UsOSE2F7xnceQIfZ9VFyIhdRg7v6APT9rdWwZGzcdjgApjxURcYhow+KZ+afib72eJF1JVE
 r0ptzWqf/9jJeQWlBz03g/nFu6jsWLc3mYWT42SlEnDZqyeos+psrGykiac1WNm8JdBbTW/paUeQ/
 R2gwhe+ol9HEB9Vfs3BIMNOLL9wwMzD2ySfviCK4eMMSNdw1cypRntxPIHrJbw1/yY3CtvTQjwbVd
 42xxEOpw==;
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

CgpPbiAxMC8xLzE5IDE3OjE3LCBMaXUsIExlbyB3cm90ZToKPiBhbWRncHVfcmluZ190ZXN0X3Jp
bmcsIHNvIGl0IHdpbGwgZGV0ZXJtaW5lIHdoZXRoZXIgdGhlIHJpbmcgaXMgcmVhZHkKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBMZW8gTGl1IDxsZW8ubGl1QGFtZC5jb20+Cj4gQ2M6IEd1c3Rhdm8gQS4g
Ui4gU2lsdmEgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CgpBY2tlZC1ieTogR3VzdGF2byBBLiBS
LiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3Zjbl92MV8wLmMgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3Zjbl92Ml8wLmMgfCAyMSArKysrKystLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvdmNuX3YyXzUuYyB8IDE4ICsrKysrKy0tLS0tLS0tLS0tLQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNuX3YxXzAuYwo+IGluZGV4IDkzYjM1MDBlNTIyYi4uYjRmODRh
ODIwYTQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92MV8w
LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjFfMC5jCj4gQEAgLTIw
Miw3ICsyMDIsNiBAQCBzdGF0aWMgaW50IHZjbl92MV8wX2h3X2luaXQodm9pZCAqaGFuZGxlKQo+
ICAKPiAgCWZvciAoaSA9IDA7IGkgPCBhZGV2LT52Y24ubnVtX2VuY19yaW5nczsgKytpKSB7Cj4g
IAkJcmluZyA9ICZhZGV2LT52Y24uaW5zdC0+cmluZ19lbmNbaV07Cj4gLQkJcmluZy0+c2NoZWQu
cmVhZHkgPSB0cnVlOwo+ICAJCXIgPSBhbWRncHVfcmluZ190ZXN0X2hlbHBlcihyaW5nKTsKPiAg
CQlpZiAocikKPiAgCQkJZ290byBkb25lOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y25fdjJfMC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNuX3Yy
XzAuYwo+IGluZGV4IDQ2MjhmZDEwYTllYy4uMzhmNzg3YTU2MGNiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml8wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfMC5jCj4gQEAgLTI0NywzMCArMjQ3LDIxIEBAIHN0YXRpYyBp
bnQgdmNuX3YyXzBfaHdfaW5pdCh2b2lkICpoYW5kbGUpCj4gIAlhZGV2LT5uYmlvLmZ1bmNzLT52
Y25fZG9vcmJlbGxfcmFuZ2UoYWRldiwgcmluZy0+dXNlX2Rvb3JiZWxsLAo+ICAJCQkJCSAgICAg
cmluZy0+ZG9vcmJlbGxfaW5kZXgsIDApOwo+ICAKPiAtCXJpbmctPnNjaGVkLnJlYWR5ID0gdHJ1
ZTsKPiAtCXIgPSBhbWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Cj4gLQlpZiAocikgewo+IC0J
CXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Cj4gKwlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxw
ZXIocmluZyk7Cj4gKwlpZiAocikKPiAgCQlnb3RvIGRvbmU7Cj4gLQl9Cj4gIAo+ICAJZm9yIChp
ID0gMDsgaSA8IGFkZXYtPnZjbi5udW1fZW5jX3JpbmdzOyArK2kpIHsKPiAgCQlyaW5nID0gJmFk
ZXYtPnZjbi5pbnN0LT5yaW5nX2VuY1tpXTsKPiAtCQlyaW5nLT5zY2hlZC5yZWFkeSA9IHRydWU7
Cj4gLQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKPiAtCQlpZiAocikgewo+IC0J
CQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+ICsJCXIgPSBhbWRncHVfcmluZ190ZXN0X2hl
bHBlcihyaW5nKTsKPiArCQlpZiAocikKPiAgCQkJZ290byBkb25lOwo+IC0JCX0KPiAgCX0KPiAg
Cj4gIAlyaW5nID0gJmFkZXYtPnZjbi5pbnN0LT5yaW5nX2pwZWc7Cj4gLQlyaW5nLT5zY2hlZC5y
ZWFkeSA9IHRydWU7Cj4gLQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5nKHJpbmcpOwo+IC0JaWYg
KHIpIHsKPiAtCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+ICsJciA9IGFtZGdwdV9yaW5n
X3Rlc3RfaGVscGVyKHJpbmcpOwo+ICsJaWYgKHIpCj4gIAkJZ290byBkb25lOwo+IC0JfQo+ICAK
PiAgZG9uZToKPiAgCWlmICghcikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvdmNuX3YyXzUuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3Zjbl92Ml81LmMK
PiBpbmRleCBiZjg2MjZlMTViMDkuLmNjMTk0NDQ0MzYzZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvdmNuX3YyXzUuYwo+IEBAIC0yNTgsMjkgKzI1OCwyMyBAQCBzdGF0aWMgaW50IHZj
bl92Ml81X2h3X2luaXQodm9pZCAqaGFuZGxlKQo+ICAJCWFkZXYtPm5iaW8uZnVuY3MtPnZjbl9k
b29yYmVsbF9yYW5nZShhZGV2LCByaW5nLT51c2VfZG9vcmJlbGwsCj4gIAkJCQkJCSAgICAgcmlu
Zy0+ZG9vcmJlbGxfaW5kZXgsIGopOwo+ICAKPiAtCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9yaW5n
KHJpbmcpOwo+IC0JCWlmIChyKSB7Cj4gLQkJCXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Cj4g
KwkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfaGVscGVyKHJpbmcpOwo+ICsJCWlmIChyKQo+ICAJCQln
b3RvIGRvbmU7Cj4gLQkJfQo+ICAKPiAgCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNuLm51bV9l
bmNfcmluZ3M7ICsraSkgewo+ICAJCQlyaW5nID0gJmFkZXYtPnZjbi5pbnN0W2pdLnJpbmdfZW5j
W2ldOwo+ICAJCQlyaW5nLT5zY2hlZC5yZWFkeSA9IGZhbHNlOwo+ICAJCQljb250aW51ZTsKPiAt
CQkJciA9IGFtZGdwdV9yaW5nX3Rlc3RfcmluZyhyaW5nKTsKPiAtCQkJaWYgKHIpIHsKPiAtCQkJ
CXJpbmctPnNjaGVkLnJlYWR5ID0gZmFsc2U7Cj4gKwkJCXIgPSBhbWRncHVfcmluZ190ZXN0X2hl
bHBlcihyaW5nKTsKPiArCQkJaWYgKHIpCj4gIAkJCQlnb3RvIGRvbmU7Cj4gLQkJCX0KPiAgCQl9
Cj4gIAo+ICAJCXJpbmcgPSAmYWRldi0+dmNuLmluc3Rbal0ucmluZ19qcGVnOwo+IC0JCXIgPSBh
bWRncHVfcmluZ190ZXN0X3JpbmcocmluZyk7Cj4gLQkJaWYgKHIpIHsKPiAtCQkJcmluZy0+c2No
ZWQucmVhZHkgPSBmYWxzZTsKPiArCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7
Cj4gKwkJaWYgKHIpCj4gIAkJCWdvdG8gZG9uZTsKPiAtCQl9Cj4gIAl9Cj4gIGRvbmU6Cj4gIAlp
ZiAoIXIpCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
