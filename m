Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CAE2EA684
	for <lists+amd-gfx@lfdr.de>; Tue,  5 Jan 2021 09:23:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F2096E060;
	Tue,  5 Jan 2021 08:23:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from m158.mail.126.com (m158.mail.126.com [220.181.15.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFBF89D73;
 Tue,  5 Jan 2021 02:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=6bc1o
 998dk7FAYMFESeaKIy7QWQqMDy4TUvJAKLZkrY=; b=V8V/O+AqiJMHG26zdln3a
 l9uOoUJvHhQLOqkV8T3KF/Ng03OoHVJ9lxgxSMU55dCqVAPoVtI1uc23yqJ5Tlv1
 v0CCOTVB2178voihG9dvCh6yskyiAk6is/V5elOwZQ5UWocoacgQdyrUxE/3GhLB
 +d3oIC+u+p+iQtG2v0Mv18=
Received: from bodefang$126.com ( [36.112.86.8] ) by ajax-webmail-wmsvr8
 (Coremail) ; Tue, 5 Jan 2021 10:43:41 +0800 (CST)
X-Originating-IP: [36.112.86.8]
Date: Tue, 5 Jan 2021 10:43:41 +0800 (CST)
From: bodefang  <bodefang@126.com>
To: "Alex Deucher" <alexdeucher@gmail.com>
Subject: Re:Re: [PATCH] drm/radeon:avoid null pointer dereference when dev
 is not bound
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20201118(ab4b390f)
 Copyright (c) 2002-2021 www.mailtech.cn 126com
In-Reply-To: <CADnq5_NhD5WUft5BnBrSjMn4x=5tb5Pje1_BUJyu60FtiFpNpw@mail.gmail.com>
References: <1609057469-3844200-1-git-send-email-bodefang@126.com>
 <CADnq5_NhD5WUft5BnBrSjMn4x=5tb5Pje1_BUJyu60FtiFpNpw@mail.gmail.com>
X-CM-CTRLDATA: 8CaLiGZvb3Rlcl9odG09MjUyMjo1Ng==
MIME-Version: 1.0
Message-ID: <42261169.1535.176d06dbef6.Coremail.bodefang@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: CMqowAB3Nrpe0vNf1wXzAA--.62514W
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbitQoR11pECyftbwABsI
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:23:38 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, "Deucher,
 Alexander" <alexander.deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1880876000=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1880876000==
Content-Type: multipart/alternative; 
	boundary="----=_Part_19672_1635439350.1609814621942"

------=_Part_19672_1635439350.1609814621942
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SSB1c2Ugc3RhdGljIGFuYWx5c2lzIHRvb2wgdG8gZmluZCB0aGVzZSBmdW5jcyBhcmUgc2ltaWxh
ciB0byB0aGUgY29tbWl0PDBmYTM3NWU2YmM5MD4oZHJtL3JvY2tjaGlwOiBGaXggc3VzcGVuZCBj
cmFzaCB3aGVuIGRybSBpcyBub3QgYm91bmQpLHNvIGl0J3MganVzdCBkZWZlbnNpdmUsIApJIGhh
dmVuJ3QgYWN0dWFsbHkgaGl0dGVkIHRoaXMuCgoKCgoKCgpBdCAyMDIxLTAxLTA1IDAxOjAwOjI3
LCAiQWxleCBEZXVjaGVyIiA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPk9uIFN1biwg
RGVjIDI3LCAyMDIwIGF0IDM6NTYgUE0gRGVmYW5nIEJvIDxib2RlZmFuZ0AxMjYuY29tPiB3cm90
ZToKPj4KPj4gW1doeV0KPj4gU2ltaWxhciB0byBjb21taXQ8MGZhMzc1ZTY+LiBJZiB0aGUgc2V0
X3N0YXRlL2Nhbl9zd2l0Y2ggY29kZSBhY2Nlc3MgdGhlIGRybV9kZXZpY2Ugd2hlbiBkZXYgaXMg
bm90IGJvdW5kLAo+PiBhIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBjYW4gaGFwcGVuLgo+Pgo+
PiBbSG93XQo+PiBBZGQgc2FuaXR5IGNoZWNrcyB0byBwcmV2ZW50IGl0Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBEZWZhbmcgQm8gPGJvZGVmYW5nQDEyNi5jb20+Cj4KPkFyZSB5b3UgYWN0dWFsbHkg
aGl0dGluZyB0aGlzIG9yIGlzIHRoaXMganVzdCBkZWZlbnNpdmU/ICBJIGRvbid0Cj50aGluayB3
ZSBjYW4gYWN0dWFsbHkgZ2V0IGludG8gYSBzdGF0ZSB3aGVyZSB0aGlzIHdvdWxkIGJlIGEgcHJv
YmxlbS4KPgo+QWxleAo+Cj4+IC0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZGV2aWNlLmMgfCA2ICsrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYwo+PiBpbmRleCAyNjZlM2Ni
Li41MGExYTYwIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
ZXZpY2UuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYwo+
PiBAQCAtMTIyNCw2ICsxMjI0LDkgQEAgc3RhdGljIHZvaWQgcmFkZW9uX3N3aXRjaGVyb29fc2V0
X3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBlbnVtIHZnYV9zd2l0Y2hlcm8KPj4gIHsKPj4g
ICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+
Pgo+PiArICAgICAgIGlmICghZGV2KQo+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiArCj4+
ICAgICAgICAgaWYgKHJhZGVvbl9pc19weChkZXYpICYmIHN0YXRlID09IFZHQV9TV0lUQ0hFUk9P
X09GRikKPj4gICAgICAgICAgICAgICAgIHJldHVybjsKPj4KPj4gQEAgLTEyNTcsNiArMTI2MCw5
IEBAIHN0YXRpYyB2b2lkIHJhZGVvbl9zd2l0Y2hlcm9vX3NldF9zdGF0ZShzdHJ1Y3QgcGNpX2Rl
diAqcGRldiwgZW51bSB2Z2Ffc3dpdGNoZXJvCj4+ICBzdGF0aWMgYm9vbCByYWRlb25fc3dpdGNo
ZXJvb19jYW5fc3dpdGNoKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+PiAgewo+PiAgICAgICAgIHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7Cj4+ICsKPj4gKyAg
ICAgICBpZiAoIWRldikKPj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4KPj4gICAg
ICAgICAvKgo+PiAgICAgICAgICAqIEZJWE1FOiBvcGVuX2NvdW50IGlzIHByb3RlY3RlZCBieSBk
cm1fZ2xvYmFsX211dGV4IGJ1dCB0aGF0IHdvdWxkIGxlYWQgdG8KPj4gLS0KPj4gMi43LjQKPj4K
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
------=_Part_19672_1635439350.1609814621942
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjogMDsiPkkgdXNlIHN0YXRpYyBh
bmFseXNpcyB0b29sIHRvIGZpbmQgdGhlc2UgZnVuY3MgYXJlIHNpbWlsYXIgdG8gdGhlIGNvbW1p
dCZsdDswZmEzNzVlNmJjOTAmZ3Q7KGRybS9yb2NrY2hpcDogRml4IHN1c3BlbmQgY3Jhc2ggd2hl
biBkcm0gaXMgbm90IGJvdW5kKSxzbyBpdCdzIGp1c3QgZGVmZW5zaXZlLCZuYnNwOzwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjogMDsiPkkgaGF2ZW4ndCBhY3R1YWxseSBoaXR0ZWQgdGhpcy48L2Rp
dj48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJyPjwvcD48cCBzdHlsZT0ibWFyZ2luOiAwOyI+PGJy
PjwvcD48cHJlPkF0IDIwMjEtMDEtMDUgMDE6MDA6MjcsICJBbGV4IERldWNoZXIiICZsdDthbGV4
ZGV1Y2hlckBnbWFpbC5jb20mZ3Q7IHdyb3RlOgomZ3Q7T24gU3VuLCBEZWMgMjcsIDIwMjAgYXQg
Mzo1NiBQTSBEZWZhbmcgQm8gJmx0O2JvZGVmYW5nQDEyNi5jb20mZ3Q7IHdyb3RlOgomZ3Q7Jmd0
OwomZ3Q7Jmd0OyBbV2h5XQomZ3Q7Jmd0OyBTaW1pbGFyIHRvIGNvbW1pdCZsdDswZmEzNzVlNiZn
dDsuIElmIHRoZSBzZXRfc3RhdGUvY2FuX3N3aXRjaCBjb2RlIGFjY2VzcyB0aGUgZHJtX2Rldmlj
ZSB3aGVuIGRldiBpcyBub3QgYm91bmQsCiZndDsmZ3Q7IGEgbnVsbCBwb2ludGVyIGRlcmVmZXJl
bmNlIGNhbiBoYXBwZW4uCiZndDsmZ3Q7CiZndDsmZ3Q7IFtIb3ddCiZndDsmZ3Q7IEFkZCBzYW5p
dHkgY2hlY2tzIHRvIHByZXZlbnQgaXQuCiZndDsmZ3Q7CiZndDsmZ3Q7IFNpZ25lZC1vZmYtYnk6
IERlZmFuZyBCbyAmbHQ7Ym9kZWZhbmdAMTI2LmNvbSZndDsKJmd0OwomZ3Q7QXJlIHlvdSBhY3R1
YWxseSBoaXR0aW5nIHRoaXMgb3IgaXMgdGhpcyBqdXN0IGRlZmVuc2l2ZT8gIEkgZG9uJ3QKJmd0
O3RoaW5rIHdlIGNhbiBhY3R1YWxseSBnZXQgaW50byBhIHN0YXRlIHdoZXJlIHRoaXMgd291bGQg
YmUgYSBwcm9ibGVtLgomZ3Q7CiZndDtBbGV4CiZndDsKJmd0OyZndDsgLS0tCiZndDsmZ3Q7ICBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyB8IDYgKysrKysrCiZndDsmZ3Q7
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCiZndDsmZ3Q7CiZndDsmZ3Q7IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jCiZndDsmZ3Q7IGluZGV4IDI2NmUzY2IuLjUw
YTFhNjAgMTAwNjQ0CiZndDsmZ3Q7IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2RldmljZS5jCiZndDsmZ3Q7ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rl
dmljZS5jCiZndDsmZ3Q7IEBAIC0xMjI0LDYgKzEyMjQsOSBAQCBzdGF0aWMgdm9pZCByYWRlb25f
c3dpdGNoZXJvb19zZXRfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGVudW0gdmdhX3N3aXRj
aGVybwomZ3Q7Jmd0OyAgewomZ3Q7Jmd0OyAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYg
PSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiZndDsmZ3Q7CiZndDsmZ3Q7ICsgICAgICAgaWYgKCFk
ZXYpCiZndDsmZ3Q7ICsgICAgICAgICAgICAgICByZXR1cm47CiZndDsmZ3Q7ICsKJmd0OyZndDsg
ICAgICAgICBpZiAocmFkZW9uX2lzX3B4KGRldikgJmFtcDsmYW1wOyBzdGF0ZSA9PSBWR0FfU1dJ
VENIRVJPT19PRkYpCiZndDsmZ3Q7ICAgICAgICAgICAgICAgICByZXR1cm47CiZndDsmZ3Q7CiZn
dDsmZ3Q7IEBAIC0xMjU3LDYgKzEyNjAsOSBAQCBzdGF0aWMgdm9pZCByYWRlb25fc3dpdGNoZXJv
b19zZXRfc3RhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGVudW0gdmdhX3N3aXRjaGVybwomZ3Q7
Jmd0OyAgc3RhdGljIGJvb2wgcmFkZW9uX3N3aXRjaGVyb29fY2FuX3N3aXRjaChzdHJ1Y3QgcGNp
X2RldiAqcGRldikKJmd0OyZndDsgIHsKJmd0OyZndDsgICAgICAgICBzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwomZ3Q7Jmd0OyArCiZndDsmZ3Q7ICsgICAg
ICAgaWYgKCFkZXYpCiZndDsmZ3Q7ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7CiZndDsm
Z3Q7CiZndDsmZ3Q7ICAgICAgICAgLyoKJmd0OyZndDsgICAgICAgICAgKiBGSVhNRTogb3Blbl9j
b3VudCBpcyBwcm90ZWN0ZWQgYnkgZHJtX2dsb2JhbF9tdXRleCBidXQgdGhhdCB3b3VsZCBsZWFk
IHRvCiZndDsmZ3Q7IC0tCiZndDsmZ3Q7IDIuNy40CiZndDsmZ3Q7CiZndDsmZ3Q7IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCiZndDsmZ3Q7IGFtZC1nZngg
bWFpbGluZyBsaXN0CiZndDsmZ3Q7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCiZndDsm
Z3Q7IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo8L3ByZT48L2Rpdj48YnI+PGJyPjxzcGFuIHRpdGxlPSJuZXRlYXNlZm9vdGVyIj48cD4mbmJz
cDs8L3A+PC9zcGFuPg==
------=_Part_19672_1635439350.1609814621942--


--===============1880876000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--===============1880876000==--

