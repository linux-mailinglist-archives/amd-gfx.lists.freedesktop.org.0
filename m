Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6525D8D5F
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 12:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD2F6E915;
	Wed, 16 Oct 2019 10:10:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78CD6E915
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 10:10:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v17so2085360wml.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 03:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K1Je0AKv85c2rzRw22bIkqwCiooRtIjrmL+Iov4cvo4=;
 b=enEDj6GaFPofDl2HnfsFL6TyrDeG1HpDkWI/Pt1dEXHy7/VpNCwpguOzt63PPRXifT
 tMyLQ0GULGQQBBFlH8r3dpnlrHcQZwqSBjQxzaLO5PGwaftggNJit8QSJ+1prAf7DvQo
 UOoxmFX/2LeBJxDZWRm94tVOVbBwQXVJLOb6UWkARWTFI8w0DLDrtxjBX5MnUcoCISuZ
 Ny4A4ekQAr8yXE21kx+YwDRPsUAAkIulyWm/bprGxvWpoiwPiDaMnfnFpQSHW1xEUO3v
 F+PWjZA4n0BkJN80gOKKsk2FuwxOUJp+Lm2bZdV1XNqsL3DY365YTzNHvbXEas7eicDA
 JBWQ==
X-Gm-Message-State: APjAAAUENY+D49zMUUUT8gTpHfBvoCq9ht43Ujttu65EBFQzWbfjGD+G
 8IV9SF+MTHNEx8sj0cHwJ+j9yVcNhQjL2B0K/LO4Qw==
X-Google-Smtp-Source: APXvYqy2rA+EGck5v81e/DRUnx7Xjg1O46f4zGOPPp7KdLYQZuF0mDp+X/hYRBmlh+vs9ybtSJwRTb9HQpjuG5Df4+M=
X-Received: by 2002:a1c:d0:: with SMTP id 199mr2747238wma.67.1571220600321;
 Wed, 16 Oct 2019 03:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAP+8YyHjrmUXp7c1bR931WG8EyOwAUAZhw-=V0C3DORGq4Fp5A@mail.gmail.com>
 <acbe47bd-167c-7761-8534-d554cf2ef8f7@gmail.com>
In-Reply-To: <acbe47bd-167c-7761-8534-d554cf2ef8f7@gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Wed, 16 Oct 2019 12:09:49 +0200
Message-ID: <CAP+8YyFBY_sKN99n9fp7dYEbACCYjmbg+Niutq_bXid8H0X42w@mail.gmail.com>
Subject: Re: TTM refcount problem.
To: "Koenig, Christian" <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen-nl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K1Je0AKv85c2rzRw22bIkqwCiooRtIjrmL+Iov4cvo4=;
 b=1qgeEdC5YTX7zak9T/VB8A1r4Zp0H7w/r6zZfcv4Jjpd7jDc3ipZSc1VgLji96D6Du
 cGs/CofaN+GNyn/MguRCee6Z/3I9sxaEJKUOJh3IQ52e4+QfKgtIp9norIsh5WMYNEiI
 sutpCqPpvXkC2JuZB4i9WWA1hMNJWeVBWp/tdCAXgm5+JDW82cpWbU9/pXgpkWXvCfki
 F04epEr9M8m069U4x63eX2N6SzS9SNIZxF82t9mZUR/V5sOV3jykbtgL0PyzqgMViBsV
 3tedK7T1zvRW3M0B9Ima3NSaSCnYQq2hu0Hf4P4TyU0GQEX8UajKzIeHCEcVVcMtk3zR
 8eBQ==
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTE6MzIgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBJcyB0aGlzIGEga25vd24g
aXNzdWU/Cj4gTm8sIHRoYXQgbG9va3MgbGlrZSBhIG5ldyBvbmUgdG8gbWUuCj4KPiBJcyB0aGF0
IHNvbWVob3cgcmVwcm9kdWNpYmxlPwoKSSB0cmllZCBmaW5kaW5nIGEgcmVsaWFibGUgcmVwcm9k
dWNlciAob25seSBWdWxrYW4gQ1RTIHJ1bnMgdW5jb21tb25seQpjYXVnaHQgaXQpLCBidXQgY291
bGQgbm90IGZpbmQgYW55dGhpbmcgYmV0dGVyLgoKSG93ZXZlciB0aGlzIGlzc3VlIHNlZW1zIHRv
IGJlIGZpeGVkIHdpdGggb25lIG9mIHRoZSBmb2xsb3dpbmcgcGF0Y2hlcwpmcm9tIGRybS1taXNj
LWZpeGVzOgoKImRybS90dG06IGZpeCBoYW5kbGluZyBpbiB0dG1fYm9fYWRkX21lbV90b19scnUi
CiJkcm0vdHRtOiBmaXggYnVzeSByZWZlcmVuY2UgaW4gdHRtX21lbV9ldmljdF9maXJzdCIKCkkg
aGF2ZW4ndCBzZWVuIHRoZSBpc3N1ZSBpbiAxMDAgQ1RTIHJ1bnMuCgpUaGFua3MsCkJhcwoKPgo+
IENocmlzdGlhbi4KPgo+IEFtIDI5LjA3LjE5IHVtIDEwOjE0IHNjaHJpZWIgQmFzIE5pZXV3ZW5o
dWl6ZW46Cj4gPiBIaSBhbGwsCj4gPgo+ID4gSSBoYXZlIGEgVFRNIHJlZmNvdW50IGlzc3VlOgo+
ID4KPiA+IFsxNzM3NzQuMzA5OTY4XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0KPiA+IFsxNzM3NzQuMzA5OTcwXSBrZXJuZWwgQlVHIGF0IGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmM6MjAyIQo+ID4gWzE3Mzc3NC4zMDk5ODJdIGludmFsaWQgb3Bjb2RlOiAwMDAwIFsj
MV0gUFJFRU1QVCBTTVAgTk9QVEkKPiA+IFsxNzM3NzQuMzA5OTg1XSBDUFU6IDEzIFBJRDogMTI4
MjE0IENvbW06IGt3b3JrZXIvMTM6MiBOb3QgdGFpbnRlZAo+ID4gNS4yLjAtcmMxLWczZjJlNTE5
YjA5NzQgIzEwCj4gPiBbMTczNzc0LjMwOTk4Nl0gSGFyZHdhcmUgbmFtZTogVG8gQmUgRmlsbGVk
IEJ5IE8uRS5NLiBUbyBCZSBGaWxsZWQgQnkKPiA+IE8uRS5NLi9YMzk5IFRhaWNoaSwgQklPUyBQ
MS41MCAwOS8wNS8yMDE3Cj4gPiBbMTczNzc0LjMwOTk5NV0gV29ya3F1ZXVlOiBldmVudHMgdHRt
X2JvX2RlbGF5ZWRfd29ya3F1ZXVlIFt0dG1dCj4gPiBbMTczNzc0LjMxMDAwMF0gUklQOiAwMDEw
OnR0bV9ib19yZWZfYnVnKzB4NS8weDEwIFt0dG1dCj4gPiBbMTczNzc0LjMxMDAwMl0gQ29kZTog
YzAgYzMgYjggMDEgMDAgMDAgMDAgYzMgNjYgNjYgMmUgMGYgMWYgODQgMDAgMDAKPiA+IDAwIDAw
IDAwIDY2IDkwIDBmIDFmIDQ0IDAwIDAwIGYwIGZmIDhmIGE0IDAwIDAwIDAwIGMzIDBmIDFmIDAw
IDBmIDFmCj4gPiA0NCAwMCAwMCA8MGY+IDBiIDY2IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBm
IDFmIDQ0IDAwIDAwIDUzIDQ4IDhiIDA3Cj4gPiA0OCA4OQo+ID4gWzE3Mzc3NC4zMTAwMDNdIFJT
UDogMDAxODpmZmZmYjQyZTU1ODliZGU4IEVGTEFHUzogMDAwMTAyNDYKPiA+IFsxNzM3NzQuMzEw
MDA1XSBSQVg6IGZmZmZiNDJlNTU4OWJlNDAgUkJYOiBmZmZmOTM5NWZkMGNkOTA4IFJDWDoKPiA+
IGZmZmY5Mzk1ZmQwY2Q4ZjgKPiA+IFsxNzM3NzQuMzEwMDA2XSBSRFg6IGZmZmZiNDJlNTU4OWJl
NDAgUlNJOiBmZmZmOTM5YjU5YjY0ZjE4IFJESToKPiA+IGZmZmY5Mzk1ZmQwY2Q4N2MKPiA+IFsx
NzM3NzQuMzEwMDA3XSBSQlA6IGZmZmZmZmZmYzA5MzBmNDAgUjA4OiAwMDAwMDAwMDAwMTQwMDAw
IFIwOToKPiA+IGZmZmZmZmZmYzA5MWYxMDAKPiA+IFsxNzM3NzQuMzEwMDA4XSBSMTA6IGZmZmY5
Mzk5ZjY5YjA4MDAgUjExOiAwMDAwMDAwMDAwMDAwMDAxIFIxMjoKPiA+IDAwMDAwMDAwMDAwMDAw
MDAKPiA+IFsxNzM3NzQuMzEwMDA5XSBSMTM6IGZmZmY5Mzk1ZmQwY2Q4NTAgUjE0OiAwMDAwMDAw
MDAwMDAwMDAxIFIxNToKPiA+IDAwMDAwMDAwMDAwMDAwMDEKPiA+IFsxNzM3NzQuMzEwMDEwXSBG
UzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjkzOWI3ZDM0MDAwMCgwMDAwKQo+ID4g
a25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+ID4gWzE3Mzc3NC4zMTAwMTFdIENTOiAgMDAxMCBEUzog
MDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKPiA+IFsxNzM3NzQuMzEwMDEyXSBD
UjI6IDAwMDA3ZjRmNjQwMDg4MzggQ1IzOiAwMDAwMDAwNjQzYmFhMDAwIENSNDoKPiA+IDAwMDAw
MDAwMDAzNDA2ZTAKPiA+IFsxNzM3NzQuMzEwMDEzXSBDYWxsIFRyYWNlOgo+ID4gWzE3Mzc3NC4z
MTAwMTldICB0dG1fYm9fY2xlYW51cF9yZWZzKzB4MTYwLzB4MWUwIFt0dG1dCj4gPiBbMTczNzc0
LjMxMDAyNV0gIHR0bV9ib19kZWxheWVkX2RlbGV0ZSsweGE4LzB4MWUwIFt0dG1dCj4gPiBbMTcz
Nzc0LjMxMDAyOV0gIHR0bV9ib19kZWxheWVkX3dvcmtxdWV1ZSsweDE3LzB4NDAgW3R0bV0KPiA+
IFsxNzM3NzQuMzEwMDMzXSAgcHJvY2Vzc19vbmVfd29yaysweDFmZC8weDQzMAo+ID4gWzE3Mzc3
NC4zMTAwMzZdICB3b3JrZXJfdGhyZWFkKzB4MmQvMHgzZDAKPiA+IFsxNzM3NzQuMzEwMDM4XSAg
PyBwcm9jZXNzX29uZV93b3JrKzB4NDMwLzB4NDMwCj4gPiBbMTczNzc0LjMxMDA0MF0gIGt0aHJl
YWQrMHgxMTIvMHgxMzAKPiA+IFsxNzM3NzQuMzEwMDQyXSAgPyBrdGhyZWFkX2NyZWF0ZV9vbl9u
b2RlKzB4NjAvMHg2MAo+ID4gWzE3Mzc3NC4zMTAwNDVdICByZXRfZnJvbV9mb3JrKzB4MjIvMHg0
MAo+ID4gWzE3Mzc3NC4zMTAwNDhdIE1vZHVsZXMgbGlua2VkIGluOiBmdXNlIG5jdDY3NzUgaHdt
b25fdmlkCj4gPiBubHNfaXNvODg1OV8xIG5sc19jcDQzNyB2ZmF0IGZhdCBlZGFjX21jZV9hbWQg
a3ZtX2FtZCBrdm0gaXJxYnlwYXNzCj4gPiBhbWRncHUgYXJjNCBpd2xtdm0gbWFjODAyMTEgc25k
X3VzYl9hdWRpbyB1dmN2aWRlbyBzbmRfdXNibWlkaV9saWIKPiA+IHZpZGVvYnVmMl92bWFsbG9j
IGNyY3QxMGRpZl9wY2xtdWwgdmlkZW9idWYyX21lbW9wcwo+ID4gc25kX2hkYV9jb2RlY19yZWFs
dGVrIHZpZGVvYnVmMl92NGwyIGJ0dXNiIGdwdV9zY2hlZCBzbmRfcmF3bWlkaQo+ID4gdmlkZW9i
dWYyX2NvbW1vbiBzbmRfaGRhX2NvZGVjX2dlbmVyaWMgYnRydGwgdmlkZW9kZXYgY3JjMzJfcGNs
bXVsCj4gPiBidGJjbSBzbmRfc2VxX2RldmljZSBsZWR0cmlnX2F1ZGlvIHR0bSBidGludGVsIGdo
YXNoX2NsbXVsbmlfaW50ZWwKPiA+IHdtaV9ibW9mIG14bV93bWkgc25kX2hkYV9jb2RlY19oZG1p
IG1lZGlhIGJsdWV0b290aCBkcm1fa21zX2hlbHBlcgo+ID4gaXdsd2lmaSBzbmRfaGRhX2ludGVs
IGRybSBhZXNuaV9pbnRlbCBzbmRfaGRhX2NvZGVjIGpveWRldiBpbnB1dF9sZWRzCj4gPiBhZXNf
eDg2XzY0IHNuZF9oZGFfY29yZSBtb3VzZWRldiBldmRldiBjcnlwdG9fc2ltZCBjcnlwdGQgZWNk
aF9nZW5lcmljCj4gPiBsZWRfY2xhc3MgYWdwZ2FydCBzbmRfaHdkZXAgbWFjX2hpZCBjZGNfYWNt
IGdsdWVfaGVscGVyIGVjYyBzbmRfcGNtCj4gPiBpZ2Igc3lzY29weWFyZWEgcGNzcGtyIGNmZzgw
MjExIHN5c2ZpbGxyZWN0IHNuZF90aW1lciBzeXNpbWdibHQgc25kCj4gPiBmYl9zeXNfZm9wcyBj
Y3AgcHRwIHNvdW5kY29yZSBwcHNfY29yZSBybmdfY29yZSBrMTB0ZW1wIGkyY19hbGdvX2JpdAo+
ID4gc3A1MTAwX3RjbyBkY2EgaTJjX3BpaXg0IHJma2lsbCB3bWkgcGNjX2NwdWZyZXEgYnV0dG9u
IGFjcGlfY3B1ZnJlcQo+ID4gc2NoX2ZxX2NvZGVsIGlwX3RhYmxlcyB4X3RhYmxlcyBleHQ0IGNy
YzMyY19nZW5lcmljIGNyYzE2IG1iY2FjaGUgamJkMgo+ID4gc2RfbW9kCj4gPiBbMTczNzc0LjMx
MDA4NV0gIGhpZF9nZW5lcmljIHVzYmhpZCBoaWQgY3JjMzJjX2ludGVsIGFoY2kgeGhjaV9wY2kK
PiA+IGxpYmFoY2kgeGhjaV9oY2QgbGliYXRhIHVzYmNvcmUgc2NzaV9tb2QgdXNiX2NvbW1vbgo+
ID4gWzE3Mzc3NC4zMTAwOTRdIC0tLVsgZW5kIHRyYWNlIDFmOGQyMTk4MGMwYjNmZDUgXS0tLQo+
ID4gWzE3Mzc3NC4zMTAwOTddIFJJUDogMDAxMDp0dG1fYm9fcmVmX2J1ZysweDUvMHgxMCBbdHRt
XQo+ID4gWzE3Mzc3NC4zMTAwOTldIENvZGU6IGMwIGMzIGI4IDAxIDAwIDAwIDAwIGMzIDY2IDY2
IDJlIDBmIDFmIDg0IDAwIDAwCj4gPiAwMCAwMCAwMCA2NiA5MCAwZiAxZiA0NCAwMCAwMCBmMCBm
ZiA4ZiBhNCAwMCAwMCAwMCBjMyAwZiAxZiAwMCAwZiAxZgo+ID4gNDQgMDAgMDAgPDBmPiAwYiA2
NiAwZiAxZiA4NCAwMCAwMCAwMCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA1MyA0OCA4YiAwNwo+ID4g
NDggODkKPiA+IFsxNzM3NzQuMzEwMTAwXSBSU1A6IDAwMTg6ZmZmZmI0MmU1NTg5YmRlOCBFRkxB
R1M6IDAwMDEwMjQ2Cj4gPiBbMTczNzc0LjMxMDEwMV0gUkFYOiBmZmZmYjQyZTU1ODliZTQwIFJC
WDogZmZmZjkzOTVmZDBjZDkwOCBSQ1g6Cj4gPiBmZmZmOTM5NWZkMGNkOGY4Cj4gPiBbMTczNzc0
LjMxMDEwMl0gUkRYOiBmZmZmYjQyZTU1ODliZTQwIFJTSTogZmZmZjkzOWI1OWI2NGYxOCBSREk6
Cj4gPiBmZmZmOTM5NWZkMGNkODdjCj4gPiBbMTczNzc0LjMxMDEwM10gUkJQOiBmZmZmZmZmZmMw
OTMwZjQwIFIwODogMDAwMDAwMDAwMDE0MDAwMCBSMDk6Cj4gPiBmZmZmZmZmZmMwOTFmMTAwCj4g
PiBbMTczNzc0LjMxMDEwNF0gUjEwOiBmZmZmOTM5OWY2OWIwODAwIFIxMTogMDAwMDAwMDAwMDAw
MDAwMSBSMTI6Cj4gPiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbMTczNzc0LjMxMDEwNF0gUjEzOiBm
ZmZmOTM5NWZkMGNkODUwIFIxNDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6Cj4gPiAwMDAwMDAwMDAw
MDAwMDAxCj4gPiBbMTczNzc0LjMxMDEwNl0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdT
OmZmZmY5MzliN2QzNDAwMDAoMDAwMCkKPiA+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPiA+IFsx
NzM3NzQuMzEwMTA3XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgw
MDUwMDMzCj4gPiBbMTczNzc0LjMxMDEwN10gQ1IyOiAwMDAwN2Y0ZjY0MDA4ODM4IENSMzogMDAw
MDAwMDY0M2JhYTAwMCBDUjQ6Cj4gPiAwMDAwMDAwMDAwMzQwNmUwCj4gPiBbMTczNzc0LjMxMDEx
MF0gbm90ZToga3dvcmtlci8xMzoyWzEyODIxNF0gZXhpdGVkIHdpdGggcHJlZW1wdF9jb3VudCAx
Cj4gPgo+ID4KPiA+IFdpdGggYW1kLXN0YWdpbmctZHJtLW5leHQ6Cj4gPgo+ID4gY29tbWl0IDIw
ZDZiOWMzYjdmNDBlYzQyN2FmOTEyZDE0MGYyYmUwZGUwOThkMmQgKG9yaWdpbi9hbWQtc3RhZ2lu
Zy1kcm0tbmV4dCkKPiA+IEF1dGhvcjogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJl
ZGRlZG9yLmNvbT4KPiA+IERhdGU6ICAgTW9uIEp1bCAyMiAxMjo0NzoxNiAyMDE5IC0wNTAwCj4g
Pgo+ID4gICAgICBkcm0vYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTA6IEF2b2lkIGZhbGwtdGhy
b3VnaCB3YXJuaW5nCj4gPgo+ID4gd2l0aCBhIFZlZ2ExMC4KPiA+Cj4gPiBJcyB0aGlzIGEga25v
d24gaXNzdWU/Cj4gPgo+ID4gVGhhbmtzLAo+ID4gQmFzCj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
