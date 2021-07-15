Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB5F3CA399
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Jul 2021 19:07:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890AD6E82A;
	Thu, 15 Jul 2021 17:07:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3814F6E82A
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Jul 2021 17:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 6A0B720201E;
 Thu, 15 Jul 2021 19:07:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id n33mXFi4lw5O; Thu, 15 Jul 2021 19:07:24 +0200 (CEST)
Received: from thor (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id C077A20201D;
 Thu, 15 Jul 2021 19:07:23 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1m44pW-0003N7-GW; Thu, 15 Jul 2021 19:07:22 +0200
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <a4ba9456-812b-5280-75fd-6dd66d1f9718@riseup.net>
 <22c25fa6-b3eb-b778-8598-3ce1947a3d0b@daenzer.net>
 <CADnq5_OVjssNi2niLZQs-TOyN5T5EFOnpwmpmbvHRgh_M0B=wg@mail.gmail.com>
 <7a9f2682-559d-57ec-4879-b1e6f743c375@daenzer.net>
 <CADnq5_O+FjF0R0OEMyPZ-hzg7d2Fx87NBUjax8_XLF4b71oKmg@mail.gmail.com>
 <7ecaff42-68e4-7566-0da1-fa3475fcacb3@daenzer.net>
 <CADnq5_MEFyQA6s7+4FKKq3qT_6i2ue=n5+CswPpB3H5Kt3ybuw@mail.gmail.com>
 <65f5567e-4c5c-6e20-a379-e7182bcacb1f@daenzer.net>
 <c2b9b42d-55e1-fa5d-8e10-ea474fcd9221@daenzer.net>
 <BL1PR12MB514478C04EC9E42F39F9C8BDF7039@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5e2067cd-62fe-d3c5-ea0d-69393b0d7883@daenzer.net>
 <7f461adc-8868-0b76-cedb-d8be8d527218@daenzer.net>
Subject: Re: AMDGPU error: "[drm:amdgpu_dm_atomic_commit_tail [amdgpu]]
 *ERROR* Waiting for fences timed out!"
Message-ID: <aaa5b549-6cb5-4030-e383-aeb9f470b96d@daenzer.net>
Date: Thu, 15 Jul 2021 19:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7f461adc-8868-0b76-cedb-d8be8d527218@daenzer.net>
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
Cc: xgqt <xgqt@riseup.net>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAyMS0wNy0wOCA2OjEzIHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+IE9uIDIwMjEt
MDYtMjkgMTI6MzYgcC5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIwMjEtMDYtMjgg
NzoxNiBwLm0uLCBEZXVjaGVyLCBBbGV4YW5kZXIgd3JvdGU6Cj4+Pgo+Pj4gVGhhbmtzIGZvciBu
YXJyb3dpbmcgdGhpcyBkb3duLsKgIFRoZXJlIGlzIG5ldyBQQ08gU0RNQSBmaXJtd2FyZSBhdmFp
bGFibGUgKGF0dGFjaGVkKS7CoCBDYW4geW91IHRyeSBpdD8KPj4KPj4gU3VyZSwgSSdsbCB0cnkg
aXQsIHRoYW5rcy4KPiAKPiBTbyBmYXIsIHNvIGdvb2Q7IG5vIGhhbmcgaW4gYSB3ZWVrLiBJJ2xs
IHRyeSB0aGUgcmVzdCBvZiB0aGUgbmV3IGZpcm13YXJlIGFzIHdlbGwgbm93LCB3aWxsIGZvbGxv
dyB1cCBpZiB0aGVyZSdzIGEgaGFuZyBhZ2Fpbi4KClVuZm9ydHVuYXRlbHksIEkgaGl0IGEgaGFu
ZyBhZ2FpblswXSB3aXRoIHRoZSBuZXcgZmlybXdhcmUuIEknbSBub3cgYmFjayB0byB0ZXN0aW5n
IHdpdGggdGhlIG9sZCBTRE1BIGZpcm13YXJlLgoKQlRXLCBzaW5jZSB0aGUgc3ltcHRvbXMgaW5j
bHVkZSBHUFUgcGFnZSBmYXVsdHMsIHNvbWV0aGluZyBtaWdodCBiZSBnb2luZyB3cm9uZyB3aXRo
IEdQVSBwYWdlIHRhYmxlIHVwZGF0ZXMgdmlhIFNETUEuCgoKWzBdIFRyaWdnZXJlZCBieSBmdXJp
b3VzbHkgcmVzaXppbmcgdGhlIGd0azQtZGVtbyAiT3BlbkdMIFRyYW5zaXRpb25zIGFuZCBFZmZl
Y3RzIiB3aW5kb3csIHdoaWNoIGluIGEgV2F5bGFuZCBzZXNzaW9uIEkgY2FuIG90aGVyd2lzZSBy
ZWNvbW1lbmQgYXMgYSBqYXctZHJvcHBpbmcgZXhwZXJpZW5jZS4gOikKCi0tIApFYXJ0aGxpbmcg
TWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRo
YXQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAg
ICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
