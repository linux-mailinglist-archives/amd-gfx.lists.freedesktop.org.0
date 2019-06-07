Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ECC3905D
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 17:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B87C89B27;
	Fri,  7 Jun 2019 15:51:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 104E689B27
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 15:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0BC532AA15F;
 Fri,  7 Jun 2019 17:51:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id wxmDOgjujDyj; Fri,  7 Jun 2019 17:51:46 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 479CC2AA0BF;
 Fri,  7 Jun 2019 17:51:46 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hZH9a-0001sD-MS; Fri, 07 Jun 2019 17:51:42 +0200
Subject: Re: [PATCH 10/24] drm/amd/display: Rework CRTC color management
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-11-Bhawanpreet.Lakha@amd.com>
 <a9b95680-66f6-6f1e-5741-0786c6eb6240@daenzer.net>
 <9c82a91b-971f-9531-0d12-77fcf6dbf46b@amd.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <3e5b0c1b-0958-8c39-0030-56c5cdf53574@daenzer.net>
Date: Fri, 7 Jun 2019 17:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9c82a91b-971f-9531-0d12-77fcf6dbf46b@amd.com>
Content-Language: en-CA
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
Cc: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNyAyOjI2IHAubS4sIEthemxhdXNrYXMsIE5pY2hvbGFzIHdyb3RlOgo+IE9u
IDYvNy8xOSAzOjU4IEFNLCBNaWNoZWwgRMOkbnplciB3cm90ZToKPj4gT24gMjAxOS0wNi0wNiAx
MDo1NCBwLm0uLCBCaGF3YW5wcmVldCBMYWtoYSB3cm90ZToKPj4+IEZyb206IE5pY2hvbGFzIEth
emxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KPj4+Cj4+PiBbV2h5XQo+Pj4g
VG8gcHJlcGFyZSBmb3IgdGhlIHVwY29taW5nIERSTSBwbGFuZSBjb2xvciBtYW5hZ2VtZW50IHBy
b3BlcnRpZXMKPj4+IHdlIG5lZWQgdG8gY29ycmVjdCBhIGxvdCBvZiB3cm9uZyBiZWhhdmlvciBh
bmQgYXNzdW1wdGlvbnMgbWFkZSBmb3IKPj4+IENSVEMgY29sb3IgbWFuYWdlbWVudC4KPj4+Cj4+
PiBUaGUgZG9jdW1lbnRhdGlvbiBhZGRlZCBieSB0aGlzIGNvbW1pdCBpbiBhbWRncHVfZG1fY29s
b3IgZXhwbGFpbnMKPj4+IGhvdyB0aGUgSFcgY29sb3IgcGlwZWxpbmUgd29ya3MgYW5kIGl0cyBs
aW1pdGF0aW9ucyB3aXRoIHRoZSBEUk0KPj4+IGludGVyZmFjZS4KPj4+Cj4+PiBUaGUgY3VycmVu
dCBpbXBsZW1lbnRhdGlvbiBkb2VzIHRoZSBmb2xsb3dpbmcgd3Jvbmc6Cj4+PiAtIEltcGxpY2l0
IHNSR0IgREdNIHdoZW4gbm8gQ1JUQyBER00gaXMgc2V0Cj4+PiAtIEltcGxpY2l0IHNSR0IgUkdN
IHdoZW4gbm8gQ1JUQyBSR00gaXMgc2V0Cj4+PiAtIE5vIHdheSB0byBzcGVjaWZ5IGEgbm9uLWxp
bmVhciBER00gbWF0cml4IHRoYXQgcHJvZHVjZXMgY29ycmVjdCBvdXRwdXQKPj4+IC0gTm8gd2F5
IHRvIHNwZWNpZnkgYSBjb3JyZWN0IFJHTSB3aGVuIGEgbGluZWFyIERHTSBpcyB1c2VkCj4+Pgo+
Pj4gV2UgaGFkIHdvcmthcm91bmRzIGZvciBwYXNzaW5nIGttc19jb2xvciB0ZXN0cyBidXQgbm90
IGFsbCBvZiB0aGUKPj4+IGJlaGF2aW9yIHdlIGhhZCB3cm9uZyB3YXMgY292ZXJlZCBieSB0aGVz
ZSB0ZXN0cyAoZXNwZWNpYWxseSB3aGVuCj4+PiBpdCBjb21lcyB0byBub24tbGluZWFyIERHTSku
IFRlc3RpbmcgYm90aCBER00gYW5kIFJHTSBhdCB0aGUgc2FtZSB0aW1lCj4+PiBpc24ndCBzb21l
dGhpbmcga21zX2NvbG9yIHRlc3RzIHdlbGwgZWl0aGVyLgo+Pj4KPj4+IFtIb3ddCj4+PiBUaGUg
c3BlY2lmaWNzIGZvciBob3cgY29sb3IgbWFuYWdlbWVudCB3b3JrcyBpbiBBTURHUFUgYW5kIHRo
ZSBuZXcKPj4+IGJlaGF2aW9yIGNhbiBiZSBmb3VuZCBieSByZWFkaW5nIHRoZSBkb2N1bWVudGF0
aW9uIGFkZGVkIHRvCj4+PiBhbWRncHVfZG1fY29sb3IuYyBmcm9tIHRoaXMgcGF0Y2guCj4+Pgo+
Pj4gQWxsIG9mIHRoZSBpbmNvcnJlY3QgY2FzZXMgZnJvbSB0aGUgb2xkIGltcGxlbWVudGF0aW9u
IGhhdmUgYmVlbgo+Pj4gYWRkcmVzc2VkIGZvciB0aGUgYXRvbWljIGludGVyZmFjZSwgYnV0IHRo
ZXJlIHN0aWxsIGEgZmV3IFRPRE9zIGZvcgo+Pj4gdGhlIGxlZ2FjeSBvbmUuCj4+Pgo+Pj4gTm90
ZTogdGhpcyBkb2VzIGNhdXNlIHJlZ3Jlc3Npb25zIGZvciBrbXNfY29sb3JAcGlwZS1hLWN0bS0q
IG92ZXIgSERNSS4KPj4+Cj4+PiBUaGUgcmVzdWx0IGxvb2tzIGNvcnJlY3QgZnJvbSB2aXN1YWwg
aW5zcGVjdGlvbiBidXQgdGhlIENSQyBubyBsb25nZXIKPj4+IG1hdGNoZXMuIEZvciByZWZlcmVu
Y2UsIHRoZSB0ZXN0IHdhcyBwcmV2aW91c2x5IGRvaW5nIHRoZSBmb2xsb3dpbmc6Cj4+Pgo+Pj4g
bGluZWFyIGRlZ2FtbWEgLT4gQ1RNIC0+IHNSR0IgcmVnYW1tYSAtPiBSR0IgdG8gWVVWICg3MDkp
IC0+IC4uLgo+Pj4KPj4+IE5vdyB0aGUgdGVzdCBpcyBkb2luZzoKPj4+Cj4+PiBsaW5lYXIgZGVn
YW1tYSAtPiBDVE0gLT4gbGluZWFyIHJlZ2FtbWEgLT4gUkdCIHRvIFlVViAoNzA5KSAtPiAuLi4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXps
YXVza2FzQGFtZC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogU3VuIHBlbmcgTGkgPFN1bnBlbmcuTGlA
YW1kLmNvbT4KPj4+IEFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFr
aGFAYW1kLmNvbT4KPj4KPj4gRG9lcyB0aGlzIGFkZHJlc3MgaHR0cHM6Ly9idWdzLmZyZWVkZXNr
dG9wLm9yZy8xMTA2NzcgPyBJZiBzbywgY2FuIHlvdQo+PiBhZGQgYSByZWZlcmVuY2UgdG8gdGhl
IGNvbW1pdCBsb2c/Cj4gCj4gSXQgdW5mb3J0dW5hdGVseSBkb2VzIG5vdC4gVGhlcmUgYXJlIHN0
aWxsIHNvbWUgcmVtYWluaW5nIGlzc3VlcyB3aXRoIAo+IGxlZ2FjeSBnYW1tYSBzdXBwb3J0IHRo
YXQgSSBpbnRlbmQgdG8gYWRkcmVzcyBhdCBzb21lIHBvaW50IC0gd2hpY2ggSSAKPiBsZWZ0IGlu
IHRoaXMgcGF0Y2ggYXMgVE9ET3MuCgpOb3RlIHRoYXQgdGhlIGJ1ZyByZXBvcnRlciBpcyB1c2lu
ZyB4Zjg2LXZpZGVvLWFtZGdwdSwgd2hpY2ggbm8gbG9uZ2VyCnVzZXMgbGVnYWN5IGdhbW1hIHdp
dGggREMsIHVubGVzcyBJIG1pc3VuZGVyc3RhbmQgd2hhdCB5b3UgbWVhbiBieSB0aGF0LgoKCi0t
IApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBo
dHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAg
fCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
