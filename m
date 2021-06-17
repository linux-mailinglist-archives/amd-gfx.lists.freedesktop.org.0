Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C33AB169
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Jun 2021 12:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964296E8E7;
	Thu, 17 Jun 2021 10:33:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id DEFB26E8E7
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Jun 2021 10:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 1BB5320201B;
 Thu, 17 Jun 2021 12:33:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mG2OyT7oVUwY; Thu, 17 Jun 2021 12:33:28 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id CDC7020201A;
 Thu, 17 Jun 2021 12:33:28 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1ltpKx-0001XS-Mv; Thu, 17 Jun 2021 12:33:27 +0200
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
References: <20210616104651.3004-1-michel@daenzer.net>
Subject: Re: [PATCH] drm/amdgpu: Call drm_framebuffer_init last for
 framebuffer init
Message-ID: <eb0ff799-0d2c-ce9e-20c5-da80bc11f77e@daenzer.net>
Date: Thu, 17 Jun 2021 12:33:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616104651.3004-1-michel@daenzer.net>
Content-Language: en-CA
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
Cc: Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNi0xNiAxMjo0NiBwLm0uLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPiBGcm9tOiBN
aWNoZWwgRMOkbnplciA8bWRhZW56ZXJAcmVkaGF0LmNvbT4KPiAKPiBPbmNlIGRybV9mcmFtZWJ1
ZmZlcl9pbml0IGhhcyByZXR1cm5lZCAwLCB0aGUgZnJhbWVidWZmZXIgaXMgaG9va2VkIHVwCj4g
dG8gdGhlIHJlZmVyZW5jZSBjb3VudGluZyBtYWNoaW5lcnkgYW5kIGNhbiBubyBsb25nZXIgYmUg
ZGVzdHJveWVkIHdpdGgKPiBhIHNpbXBsZSBrZnJlZS4gVGhlcmVmb3JlLCBpdCBtdXN0IGJlIGNh
bGxlZCBsYXN0Lgo+IAo+IEZpeGVzOiBmMjU4OTA3ZmRkODM1ZSAiZHJtL2FtZGdwdTogVmVyaWZ5
IGJvIHNpemUgY2FuIGZpdCBmcmFtZWJ1ZmZlciBzaXplIG9uIGluaXQuIgoKSW4gY2FzZSB0aGUg
Y29tbWl0IGxvZyB3YXNuJ3QgY2xlYXI6IElmIGRybV9mcmFtZWJ1ZmZlcl9pbml0IHJldHVybnMg
MCBidXQgaXRzIGNhbGxlciB0aGVuIHJldHVybnMgbm9uLTAsIHRoZXJlIHdpbGwgbGlrZWx5IGJl
IG1lbW9yeSBjb3JydXB0aW9uIGZpcmV3b3JrcyBkb3duIHRoZSByb2FkLiBUaGUgZm9sbG93aW5n
IGxlYWQgbWUgdG8gdGhpcyBmaXg6CgpbICAgMTIuODkxMjI4XSBrZXJuZWwgQlVHIGF0IGxpYi9s
aXN0X2RlYnVnLmM6MjUhClsuLi5dClsgICAxMi44OTEyNjNdIFJJUDogMDAxMDpfX2xpc3RfYWRk
X3ZhbGlkKzB4NGIvMHg3MApbLi4uXQpbICAgMTIuODkxMzI0XSBDYWxsIFRyYWNlOgpbICAgMTIu
ODkxMzMwXSAgZHJtX2ZyYW1lYnVmZmVyX2luaXQrMHhiNS8weDEwMCBbZHJtXQpbICAgMTIuODkx
Mzc4XSAgYW1kZ3B1X2Rpc3BsYXlfZ2VtX2ZiX3ZlcmlmeV9hbmRfaW5pdCsweDQ3LzB4MTIwIFth
bWRncHVdClsgICAxMi44OTE1OTJdICA/IGFtZGdwdV9kaXNwbGF5X3VzZXJfZnJhbWVidWZmZXJf
Y3JlYXRlKzB4MTBkLzB4MWYwIFthbWRncHVdClsgICAxMi44OTE3OTRdICBhbWRncHVfZGlzcGxh
eV91c2VyX2ZyYW1lYnVmZmVyX2NyZWF0ZSsweDEyNi8weDFmMCBbYW1kZ3B1XQpbICAgMTIuODkx
OTk1XSAgZHJtX2ludGVybmFsX2ZyYW1lYnVmZmVyX2NyZWF0ZSsweDM3OC8weDNmMCBbZHJtXQpb
ICAgMTIuODkyMDM2XSAgPyBkcm1faW50ZXJuYWxfZnJhbWVidWZmZXJfY3JlYXRlKzB4M2YwLzB4
M2YwIFtkcm1dClsgICAxMi44OTIwNzVdICBkcm1fbW9kZV9hZGRmYjIrMHgzNC8weGQwIFtkcm1d
ClsgICAxMi44OTIxMTVdICA/IGRybV9pbnRlcm5hbF9mcmFtZWJ1ZmZlcl9jcmVhdGUrMHgzZjAv
MHgzZjAgW2RybV0KWyAgIDEyLjg5MjE1M10gIGRybV9pb2N0bF9rZXJuZWwrMHhlMi8weDE1MCBb
ZHJtXQpbICAgMTIuODkyMTkzXSAgZHJtX2lvY3RsKzB4M2RhLzB4NDYwIFtkcm1dClsgICAxMi44
OTIyMzJdICA/IGRybV9pbnRlcm5hbF9mcmFtZWJ1ZmZlcl9jcmVhdGUrMHgzZjAvMHgzZjAgW2Ry
bV0KWyAgIDEyLjg5MjI3NF0gIGFtZGdwdV9kcm1faW9jdGwrMHg0My8weDgwIFthbWRncHVdClsg
ICAxMi44OTI0NzVdICBfX3NlX3N5c19pb2N0bCsweDcyLzB4YzAKWyAgIDEyLjg5MjQ4M10gIGRv
X3N5c2NhbGxfNjQrMHgzMy8weDQwClsgICAxMi44OTI0OTFdICBlbnRyeV9TWVNDQUxMXzY0X2Fm
dGVyX2h3ZnJhbWUrMHg0NC8weGFlCgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAg
ICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3
YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVs
b3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
