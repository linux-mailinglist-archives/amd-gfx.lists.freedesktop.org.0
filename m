Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D122D3C1D
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 11:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BA96EBEC;
	Fri, 11 Oct 2019 09:18:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83FB6EBEC
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 09:18:56 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id y18so1577685wrn.5
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 02:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=6j9D8beg7Ywy3ykESMdBs1cvFaavOezn94Isrfh+pvA=;
 b=Sa4XSFME6hjxzLEikFsxVx1BLlMMS9pikeAvq11cmKyftOVk34XlUyTwyzHZHjU5K6
 i2peozyzazgS48kv9Jhl/Tv/9/pOJleoTR8Qwwpfk6ay1jUaRnv2W7b96VhVRO5tXoSe
 8TRte7t0xp3dOWfGROHXSheSyX0Ey6N4cQVlyQx6E254TV0iQquSAjBSYgB/SUWlZKQb
 /g8TKgLXDj1V6uR2xXKfamvy3rxViud2Tzo+TK8qkYz37QKgoB4kXKSz+uWMVm1ucpkC
 Se5Rk56he1VWzj8vgjn73KRjTRV1YGMQ7tnpuWjtYtLD4czVgrvTlPa2UN5DgsoFiIbF
 9KYQ==
X-Gm-Message-State: APjAAAWeFFfBAFG8c79HiFgw7JUavMkCL9kB9ZzJBVKbb1yh4rrIRG8n
 8i/LyHMXbPYbTXR/VTv8zto=
X-Google-Smtp-Source: APXvYqz2jNYhSDc0SnHGC0QW+VBzrgEDHCh23w/fzFbnHJ0xBDx1VRqjFeHBAMvkTg9u8vPXZATHJQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr11978084wrv.155.1570785535387; 
 Fri, 11 Oct 2019 02:18:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m18sm12414384wrg.97.2019.10.11.02.18.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Oct 2019 02:18:54 -0700 (PDT)
Subject: Re: [PATCH 00/15] Add BACO support for CI/VI asics
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20191011012135.18566-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b2d8cfa1-5c18-16b3-73fa-52d818f76c59@gmail.com>
Date: Fri, 11 Oct 2019 11:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191011012135.18566-1-alexander.deucher@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=6j9D8beg7Ywy3ykESMdBs1cvFaavOezn94Isrfh+pvA=;
 b=mXicGd/Rmg9K9nGxye/YkvDeBMHDWBB0rtxUEnx+VbBSXc3p3j34nwDU8lSpMM8cBf
 Q3AE/LZaz7joYKcoP+y7l5y4MZvl5AbOvpDl0sZQbXiblzgcznZoOU6wCe76nYX8Qq8n
 MZhGDV4IKmIz5ZQTwUx0nan9v/VVVZfhGTmBoTxMLpDA8jTQHU+FucpEDG+Mlh70Vt4Y
 kPboY6glRPfal7ADCiP1mVm1h3yPqYIk8FpJjvLgBQ0p1LM5w6X00oXlu8z3yTHBhFqp
 Qqsgy/ZepAoaYNIPbAnt22tMv0WfajvXn32qP54VMS75Pw/5Yv+LjR1l6boiVpwAIfJZ
 LqQg==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTEuMTAuMTkgdW0gMDM6MjEgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gVGhpcyBwYXRjaCBz
ZXQgZW5hYmxlcyBCQUNPIENJIGFuZCBWSSBhc2ljcy4gIEJBQ08gaXMKPiBCdXMgQWN0aXZlIENo
aXAgT2ZmLiAgSXQgYWxsb3dzIHVzIHRvIHR1cm4gb2ZmIHRoZSBHUFUKPiB3aGlsZSBzdGlsbCBr
ZWVwaW5nIHRoZSBidXMgaW50ZXJmYWNlIHVwLCBzbyB0aGUgZGV2aWNlCj4gZG9lcyBub3QgZGlz
YXBwZWFyIGZyb20gdGhlIHN5c3RlbS4gIFBvd2VyWHByZXNzIGFuZAo+IEh5YnJpZCBHcmFwaGlj
cyBsYXB0b3BzIHN1cHBvcnQgQk9DTyAoQnVzIE9mZiBDaGlwIE9mZikKPiB3aGljaCBpcyBjb250
cm9sbGVkIGJ5IEFDUEkuICBCQUNPIHdhcyBjb25jZWl2ZWQgYXMKPiBhIHBvd2VyIHNhdmluZyBm
ZWF0dXJlLCBidXQgd2UgYWxzbyB1c2UgaXQgZm9yIHJlc2V0Cj4gc2luY2UgdGhlIGNoaXAgZ2V0
cyBwb3dlcmVkIGRvd24uICBUaGVzZSBwYXRjaGVzIGFyZQo+IGEgcHJlLXJlcXVpc2l0ZSBmb3Ig
dXNpbmcgQkFDTyBhcyBhIHBvd2VyIHNhdmluZwo+IGZlYXR1cmUgd2hpY2ggd2lsbCBmb2xsb3cg
aW4gYW5vdGhlciBwYXRjaCBzZXQuCj4KPiBCQUNPIGlzIHdvcmtpbmcgd2VsbCBvbiBWSSBwYXJ0
cy4gIEkgaGF2ZW4ndCBnb3R0ZW4KPiBpdCB3b3JraW5nIHlldCBvbiBDSSBwYXJ0cywgYnV0IEkn
bSBpbmNsdWRpbmcgdGhlCj4gY29kZSBmb3IgcmVmZXJlbmNlIGlmIGFueW9uZSB3YW50cyB0byBw
bGF5IHdpdGggaXQuCgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiBmb3IgdGhlIHNlcmllcy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4KPiBBbGV4
IERldWNoZXIgKDE1KToKPiAgICBkcm0vYW1kZ3B1OiBhZGQgbmV3IEJJRiA0LjEgcmVnaXN0ZXIg
Zm9yIEJBQ08KPiAgICBkcm0vYW1kZ3B1OiBhZGQgbmV3IEJJRiA1LjAgcmVnaXN0ZXIgZm9yIEJB
Q08KPiAgICBkcm0vYW1kZ3B1OiBhZGQgbmV3IFNNVSA3LjAuMSByZWdpc3RlcnMgZm9yIEJBQ08K
PiAgICBkcm0vYW1kZ3B1OiBhZGQgbmV3IFNNVSA3LjEuMiByZWdpc3RlcnMgZm9yIEJBQ08KPiAg
ICBkcm0vYW1kZ3B1OiBhZGQgbmV3IFNNVSA3LjEuMyByZWdpc3RlcnMgZm9yIEJBQ08KPiAgICBk
cm0vYW1kZ3B1L3Bvd2VycGxheTogYWRkIGNvcmUgc3VwcG9ydCBmb3IgcHJlLVNPQzE1IGJhY28K
PiAgICBkcm0vYW1kZ3B1L3Bvd2VycGxheTogYWRkIHN1cHBvcnQgZm9yIEJBQ08gb24gdG9uZ2EK
PiAgICBkcm0vYW1kZ3B1L3Bvd2VycGxheTogYWRkIHN1cHBvcnQgZm9yIEJBQ08gb24gSWNlbGFu
ZAo+ICAgIGRybS9hbWRncHUvcG93ZXJwbGF5OiBhZGQgc3VwcG9ydCBmb3IgQkFDTyBvbiBwb2xh
cmlzCj4gICAgZHJtL2FtZGdwdS9wb3dlcnBsYXk6IGFkZCBzdXBwb3J0IGZvciBCQUNPIG9uIFZl
Z2FNCj4gICAgZHJtL2FtZGdwdS9wb3dlcnBsYXk6IGFkZCBzdXBwb3J0IGZvciBCQUNPIG9uIEZp
amkKPiAgICBkcm0vYW1kZ3B1L3Bvd2VycGxheTogYWRkIHN1cHBvcnQgZm9yIEJBQ08gb24gQ0kK
PiAgICBkcm0vYW1kZ3B1L3Bvd2VycGxheTogc3BsaXQgb3V0IGNvbW1vbiBzbXU3IEJBQ08gY29k
ZQo+ICAgIGRybS9hbWRncHUvcG93ZXJwbGF5OiB3aXJlIHVwIEJBQ08gdG8gcG93ZXJwbGF5IEFQ
SSBmb3Igc211Nwo+ICAgIGRybS9hbWRncHU6IGVuYWJsZSBCQUNPIHJlc2V0IGZvciBTTVU3IGJh
c2VkIGRHUFVzICh2MikKPgo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lrLmMgICAg
ICAgICAgICAgIHwgIDQ4ICsrKy0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npay5o
ICAgICAgICAgICAgICB8ICAgMyArCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92aS5j
ICAgICAgICAgICAgICAgfCAgODQgKysrKysrLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmkuaCAgICAgICAgICAgICAgIHwgICAzICsKPiAgIC4uLi9kcm0vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvYmlmL2JpZl80XzFfZC5oICB8ICAgMSArCj4gICAuLi4vaW5jbHVkZS9hc2ljX3JlZy9i
aWYvYmlmXzRfMV9zaF9tYXNrLmggICAgfCAgIDIgKwo+ICAgLi4uL2RybS9hbWQvaW5jbHVkZS9h
c2ljX3JlZy9iaWYvYmlmXzVfMF9kLmggIHwgICAxICsKPiAgIC4uLi9pbmNsdWRlL2FzaWNfcmVn
L2JpZi9iaWZfNV8wX3NoX21hc2suaCAgICB8ICAgMiArCj4gICAuLi4vYW1kL2luY2x1ZGUvYXNp
Y19yZWcvc211L3NtdV83XzBfMV9kLmggICAgfCAgIDEgKwo+ICAgLi4uL2luY2x1ZGUvYXNpY19y
ZWcvc211L3NtdV83XzBfMV9zaF9tYXNrLmggIHwgICAyICsKPiAgIC4uLi9hbWQvaW5jbHVkZS9h
c2ljX3JlZy9zbXUvc211XzdfMV8yX2QuaCAgICB8ICAgMSArCj4gICAuLi4vaW5jbHVkZS9hc2lj
X3JlZy9zbXUvc211XzdfMV8yX3NoX21hc2suaCAgfCAgIDIgKwo+ICAgLi4uL2FtZC9pbmNsdWRl
L2FzaWNfcmVnL3NtdS9zbXVfN18xXzNfZC5oICAgIHwgICAxICsKPiAgIC4uLi9pbmNsdWRlL2Fz
aWNfcmVnL3NtdS9zbXVfN18xXzNfc2hfbWFzay5oICB8ICAgMiArCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9NYWtlZmlsZSAgfCAgIDMgKy0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NpX2JhY28uYyB8IDE5NSArKysrKysrKysrKysrKysK
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NpX2JhY28uaCB8ICAyOSAr
KysKPiAgIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvY29tbW9uX2JhY28uYyB8ICAx
OSArKwo+ICAgLi4uL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9jb21tb25fYmFjby5oIHwg
IDEzICsKPiAgIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvZmlqaV9iYWNvLmMgICB8
IDE5NiArKysrKysrKysrKysrKysKPiAgIC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
ZmlqaV9iYWNvLmggICB8ICAyOSArKysKPiAgIC4uLi9kcm0vYW1kL3Bvd2VycGxheS9od21nci9w
b2xhcmlzX2JhY28uYyAgICB8IDIyMiArKysrKysrKysrKysrKysrKwo+ICAgLi4uL2RybS9hbWQv
cG93ZXJwbGF5L2h3bWdyL3BvbGFyaXNfYmFjby5oICAgIHwgIDI5ICsrKwo+ICAgLi4uL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2JhY28uYyAgIHwgIDkxICsrKysrKysKPiAgIC4u
Li9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19iYWNvLmggICB8ICAzMiArKysKPiAg
IC4uLi9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19od21nci5jICB8ICAgNCArCj4g
ICAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3RvbmdhX2JhY28uYyAgfCAyMzEgKysr
KysrKysrKysrKysrKysrCj4gICAuLi4vZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Rvbmdh
X2JhY28uaCAgfCAgMjkgKysrCj4gICAyOCBmaWxlcyBjaGFuZ2VkLCAxMjY0IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NpX2JhY28uYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2NpX2JhY28uaAo+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2ZpamlfYmFjby5j
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdt
Z3IvZmlqaV9iYWNvLmgKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9wb2xhcmlzX2JhY28uYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3BvbGFyaXNfYmFjby5oCj4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211N19i
YWNvLmMKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9od21nci9zbXU3X2JhY28uaAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG93ZXJwbGF5L2h3bWdyL3RvbmdhX2JhY28uYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3RvbmdhX2JhY28uaAo+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxp
bmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
