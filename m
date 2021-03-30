Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EB034E8F9
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Mar 2021 15:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AAF16E8F3;
	Tue, 30 Mar 2021 13:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Tue, 30 Mar 2021 13:07:58 UTC
Received: from redcrew.org (redcrew.org [IPv6:2a02:2b88:2:1::1cde:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25F26E8D8;
 Tue, 30 Mar 2021 13:07:58 +0000 (UTC)
Received: from server.danny.cz (19.161.broadband4.iol.cz [85.71.161.19])
 by redcrew.org (Postfix) with ESMTP id D101369;
 Tue, 30 Mar 2021 15:00:06 +0200 (CEST)
Received: from talos.danny.cz (talos.danny.cz [192.168.160.68])
 by server.danny.cz (Postfix) with SMTP id 88900DA004;
 Tue, 30 Mar 2021 15:00:06 +0200 (CEST)
Date: Tue, 30 Mar 2021 15:00:04 +0200
From: Dan =?UTF-8?B?SG9yw6Fr?= <dan@danny.cz>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
Message-Id: <20210330150004.857ae73704c3533692cf79f0@danny.cz>
In-Reply-To: <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
 <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
 <bf9e05d4a6ece3e8bf1f732b011d3e54bbf8000e.camel@mengyan1223.wang>
 <84b3911173ad6beb246ba0a77f93d888ee6b393e.camel@mengyan1223.wang>
 <97c520ce107aa4d5fd96e2c380c8acdb63d45c37.camel@mengyan1223.wang>
 <7701fb71-9243-2d90-e1e1-d347a53b7d77@gmail.com>
 <368b9b1b7343e35b446bb1028ccf0ae75dc2adc4.camel@mengyan1223.wang>
 <71e3905a5b72c5b97df837041b19175540ebb023.camel@mengyan1223.wang>
 <c3caf16b-584a-3e4c-0104-15bb41613136@amd.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; powerpc64le-redhat-linux-gnu)
Mime-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Mar 2021 13:24:40 +0000
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xi Ruoyao <xry111@mengyan1223.wang>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAzMCBNYXIgMjAyMSAxNDo1NTowMSArMDIwMApDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgoKPiBBbSAzMC4wMy4yMSB1bSAxNDowNCBzY2hy
aWViIFhpIFJ1b3lhbzoKPiA+IE9uIDIwMjEtMDMtMzAgMDM6NDAgKzA4MDAsIFhpIFJ1b3lhbyB3
cm90ZToKPiA+PiBPbiAyMDIxLTAzLTI5IDIxOjM2ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+ID4+PiBBbSAyOS4wMy4yMSB1bSAyMToyNyBzY2hyaWViIFhpIFJ1b3lhbzoKPiA+Pj4+
IEhpIENocmlzdGlhbiwKPiA+Pj4+Cj4gPj4+PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBj
b25zdHJhaW50IGltcGxlbWVudGVkIHRvIGVuc3VyZSBgbnVtX2VudHJpZXMgJQo+ID4+Pj4gQU1E
R1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRSA9PSAwYC7CoCBGb3IgZXhhbXBsZSwgaW4gYGFtZGdw
dV92bV9ib19tYXAoKWA6Cj4gPj4+Pgo+ID4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgLyogdmFsaWRh
dGUgdGhlIHBhcmFtZXRlcnMgKi8KPiA+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIGlmIChzYWRkciAm
IEFNREdQVV9HUFVfUEFHRV9NQVNLIHx8IG9mZnNldCAmIEFNREdQVV9HUFVfUEFHRV9NQVNLCj4g
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUgPT0gMCB8fCBzaXplICYgQU1ER1BV
X0dQVV9QQUdFX01BU0spCj4gPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIC1FSU5WQUw7Cj4gPj4+Pgo+ID4+Pj4gLyogc25pcCAqLwo+ID4+Pj4KPiA+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgIHNhZGRyIC89IEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+ID4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqAgZWFkZHIgLz0gQU1ER1BVX0dQVV9QQUdFX1NJWkU7Cj4gPj4+Pgo+ID4+
Pj4gLyogc25pcCAqLwo+ID4+Pj4KPiA+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIG1hcHBpbmctPnN0
YXJ0ID0gc2FkZHI7Cj4gPj4+PiAgwqDCoMKgwqDCoMKgwqDCoCBtYXBwaW5nLT5sYXN0ID0gZWFk
ZHI7Cj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+IElmIHdlIHJlYWxseSB3YW50IHRvIGVuc3VyZSAobWFw
cGluZy0+bGFzdCAtIG1hcHBpbmctPnN0YXJ0ICsgMSkgJQo+ID4+Pj4gQU1ER1BVX0dQVV9QQUdF
U19JTl9DUFVfUEFHRSA9PSAwLCB0aGVuIHdlIHNob3VsZCByZXBsYWNlCj4gPj4+PiAiQU1ER1BV
X0dQVV9QQUdFX01BU0siCj4gPj4+PiBpbiAidmFsaWRhdGUgdGhlIHBhcmFtZXRlcnMiIHdpdGgg
IlBBR0VfTUFTSyIuCj4gPiBJdCBzaG91bGQgYmUgIn5QQUdFX01BU0siLCAiUEFHRV9NQVNLIiBo
YXMgYW4gb3Bwb3NpdGUgY29udmVudGlvbiBvZgo+ID4gIkFNREdQVV9HUFVfUEFHRV9NQVNLIiA6
KC4KPiA+Cj4gPj4+IFllYWgsIGdvb2QgcG9pbnQuCj4gPj4+Cj4gPj4+PiBJIHRyaWVkIGl0IGFu
ZCBpdCBicm9rZSB1c2Vyc3BhY2U6IFhvcmcgc3RhcnR1cCBmYWlscyB3aXRoIEVJTlZBTCB3aXRo
Cj4gPj4+PiB0aGlzCj4gPj4+PiBjaGFuZ2UuCj4gPj4+IFdlbGwgaW4gdGhlb3J5IGl0IGlzIHBv
c3NpYmxlIHRoYXQgd2UgYWx3YXlzIGZpbGwgdGhlIEdQVVZNIG9uIGEgNGsKPiA+Pj4gYmFzaXMg
d2hpbGUgdGhlIG5hdGl2ZSBwYWdlIHNpemUgb2YgdGhlIENQVSBpcyBsYXJnZXIuIExldCBtZSBk
b3VibGUKPiA+Pj4gY2hlY2sgdGhlIGNvZGUuCj4gPiBPbiBteSBwbGF0Zm9ybSwgdGhlcmUgYXJl
IHR3byBpc3N1ZXMgYm90aCBjYXVzaW5nIHRoZSBWTSBjb3JydXB0aW9uLiAgT25lIGlzCj4gPiBm
aXhlZCBieSBhZ2Q1Zi9saW51eEBmZTAwMWU3Lgo+IAo+IFdoYXQgaXMgZmUwMDFlNz8gQSBjb21t
aXQgaWQ/IElmIHllcyB0aGVuIHRoYXQgaXMgdG8gc2hvcnQgYW5kIEkgY2FuJ3QgCj4gZmluZCBp
dC4KCml0J3MgYSBnaXRsYWIgc2hvcnRjdXQgZm9yCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9hZ2Q1Zi9saW51eC8tL2NvbW1pdC9mZTAwMWU3MGE1NWQwMzc4MzI4NjEyYmUxZmRjM2Fi
ZmM2OGI5Y2NjCgoKCQlEYW4KPiAKPiA+ICAgIEFub3RoZXIgaXMgaW4gTWVzYSBmcm9tIHVzZXJz
cGFjZTogIGl0IHVzZXMKPiA+IGBkZXZfaW5mby0+Z2FydF9wYWdlX3NpemVgIGFzIHRoZSBhbGln
bm1lbnQsIGJ1dCB0aGUga2VybmVsIEFNREdQVSBkcml2ZXIKPiA+IGV4cGVjdHMgaXQgdG8gdXNl
IGBkZXZfaW5mby0+dmlydHVhbF9hZGRyZXNzX2FsaWdubWVudGAuCj4gCj4gTWhtLCBsb29raW5n
IGF0IHRoZSBrZXJuZWwgY29kZSBJIHdvdWxkIHJhdGhlciBzYXkgTWVzYSBpcyBjb3JyZWN0IGFu
ZCAKPiB0aGUga2VybmVsIGRyaXZlciBpcyBicm9rZW4uCj4gCj4gVGhlIGdhcnRfcGFnZV9zaXpl
IGlzIGxpbWl0ZWQgYnkgdGhlIENQVSBwYWdlIHNpemUsIGJ1dCB0aGUgCj4gdmlydHVhbF9hZGRy
ZXNzX2FsaWdubWVudCBpc24ndC4KPiAKPiA+IElmIHdlIGNhbiBtYWtlIHRoZSBjaGFuZ2UgdG8g
ZmlsbCB0aGUgR1BVVk0gb24gYSA0ayBiYXNpcywgd2UgY2FuIGZpeCB0aGlzIGlzc3VlCj4gPiBh
bmQgbWFrZSB2aXJ0dWFsX2FkZHJlc3NfYWxpZ25tZW50ID0gNEsuICBPdGhlcndpc2UsIHdlIHNo
b3VsZCBmb3J0aWZ5IHRoZQo+ID4gcGFyYW1ldGVyIHZhbGlkYXRpb24sIGNoYW5naW5nICJBTURH
UFVfR1BVX1BBR0VfTUFTSyIgdG8gIn5QQUdFX01BU0siLiAgVGhlbiB0aGUKPiA+IHVzZXJzcGFj
ZSB3aWxsIGp1c3QgZ2V0IGFuIEVJTlZBTCwgaW5zdGVhZCBvZiBhIHNsaWVudCBWTSBjb3JydXB0
aW9uLiAgQW5kCj4gPiBzb21lb25lIHNob3VsZCB0ZWxsIE1lc2EgZGV2ZWxvcGVycyB0byBmaXgg
dGhlIGNvZGUgaW4gdGhpcyBjYXNlLgo+IAo+IEkgcmF0aGVyIHNlZSB0aGlzIGFzIGEga2VybmVs
IGJ1Zy4gQ2FuIHlvdSB0ZXN0IGlmIHRoaXMgY29kZSBmcmFnbWVudCAKPiBmaXhlcyB5b3VyIGlz
c3VlOgo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMgCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKPiBpbmRl
eCA2NGJlYjMzOTk2MDQuLmUxMjYwYjUxN2UxYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfa21zLmMKPiBAQCAtNzgwLDcgKzc4MCw3IEBAIGludCBhbWRncHVfaW5mb19p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkIAo+ICpkYXRhLCBzdHJ1Y3QgZHJtX2Zp
bGUgKmZpbHApCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+dmlydHVhbF9hZGRyZXNzX2FsaWdubWVu
dCA9IAo+IG1heCgoaW50KVBBR0VfU0laRSwgQU1ER1BVX0dQVV9QQUdFX1NJWkUpOwo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2luZm8tPnB0ZV9mcmFnbWVudF9zaXplID0g
KDEgPDwgCj4gYWRldi0+dm1fbWFuYWdlci5mcmFnbWVudF9zaXplKSAqIEFNREdQVV9HUFVfUEFH
RV9TSVpFOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9pbmZvLT5nYXJ0X3Bh
Z2Vfc2l6ZSA9IEFNREdQVV9HUFVfUEFHRV9TSVpFOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9pbmZvLT5nYXJ0X3BhZ2Vfc2l6ZSA9IAo+IGRldl9pbmZvLT52aXJ0dWFsX2Fk
ZHJlc3NfYWxpZ25tZW50Owo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2lu
Zm8tPmN1X2FjdGl2ZV9udW1iZXIgPSBhZGV2LT5nZnguY3VfaW5mby5udW1iZXI7Cj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfaW5mby0+Y3VfYW9fbWFzayA9IGFkZXYtPmdm
eC5jdV9pbmZvLmFvX2N1X21hc2s7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
ZXZfaW5mby0+Y2VfcmFtX3NpemUgPSBhZGV2LT5nZnguY2VfcmFtX3NpemU7Cj4gCj4gCj4gVGhh
bmtzLAo+IENocmlzdGlhbi4KPiAKPiA+IC0tCj4gPiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFu
MTIyMy53YW5nPgo+ID4gU2Nob29sIG9mIEFlcm9zcGFjZSBTY2llbmNlIGFuZCBUZWNobm9sb2d5
LCBYaWRpYW4gVW5pdmVyc2l0eQo+ID4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cg==
