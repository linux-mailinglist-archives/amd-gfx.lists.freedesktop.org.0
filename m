Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE964289
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2019 09:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612D18920E;
	Wed, 10 Jul 2019 07:23:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAED38920E
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2019 07:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 066B22AA13F;
 Wed, 10 Jul 2019 09:22:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id QXJD5gsrwNv5; Wed, 10 Jul 2019 09:22:58 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 2E94B2AA115;
 Wed, 10 Jul 2019 09:22:58 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hl6wL-0006LW-SD; Wed, 10 Jul 2019 09:22:57 +0200
Subject: Re: [PATCH 1/3] drm/amdgpu: Add flag for allocating memory for
 sensitive data
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20190709053222.22588-1-Felix.Kuehling@amd.com>
 <b1a0638a-4be3-0a7b-7d29-309942f24263@daenzer.net>
 <da90e4c0-067b-2ffe-01df-f59c2b7ec556@amd.com>
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
Message-ID: <519e26e8-c363-2b4c-756c-d87fbe2543d9@daenzer.net>
Date: Wed, 10 Jul 2019 09:22:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <da90e4c0-067b-2ffe-01df-f59c2b7ec556@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0wOSA5OjAwIHAubS4sIEt1ZWhsaW5nLCBGZWxpeCB3cm90ZToKPiBPbiAyMDE5
LTA3LTA5IDY6MzQgYS5tLiwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+IE9uIDIwMTktMDctMDkg
NzozMiBhLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6Cj4+PiBUaGlzIG1lbW9yeSBhbGxvY2F0
aW9uIGZsYWcgd2lsbCBiZSB1c2VkIHRvIGluZGljYXRlIEJPcyBjb250YWluaW5nCj4+PiBzZW5z
aXRpdmUgZGF0YSB0aGF0IHNob3VsZCBub3QgYmUgbGVha2VkIHRvIG90aGVyIHByb2Nlc3Nlcy4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KPj4+IC0tLQo+Pj4gICBpbmNsdWRlL3VhcGkvZHJtL2FtZGdwdV9kcm0uaCB8IDQgKysr
Kwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9kcm0vYW1kZ3B1X2RybS5oIGIvaW5jbHVkZS91YXBpL2RybS9hbWRn
cHVfZHJtLmgKPj4+IGluZGV4IDYxODcwNDc4YmM5Yy4uNTg2NTljMjhjMjZlIDEwMDY0NAo+Pj4g
LS0tIGEvaW5jbHVkZS91YXBpL2RybS9hbWRncHVfZHJtLmgKPj4+ICsrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vYW1kZ3B1X2RybS5oCj4+PiBAQCAtMTMxLDYgKzEzMSwxMCBAQCBleHRlcm4gIkMiIHsK
Pj4+ICAgICogZm9yIHRoZSBzZWNvbmQgcGFnZSBvbndhcmQgc2hvdWxkIGJlIHNldCB0byBOQy4K
Pj4+ICAgICovCj4+PiAgICNkZWZpbmUgQU1ER1BVX0dFTV9DUkVBVEVfTVFEX0dGWDkJCSgxIDw8
IDgpCj4+PiArLyogRmxhZyB0aGF0IEJPIG1heSBjb250YWluIHNlbnNpdGl2ZSBkYXRhIHRoYXQg
bXVzdCBiZSBjbGVhcmVkIGJlZm9yZQo+Pj4gKyAqIHJlbGVhc2luZyB0aGUgbWVtb3J5Cj4+PiAr
ICovCj4+PiArI2RlZmluZSBBTURHUFVfR0VNX0NSRUFURV9WUkFNX1NFTlNJVElWRQkoMSA8PCA5
KQo+Pj4gICAKPj4+ICAgc3RydWN0IGRybV9hbWRncHVfZ2VtX2NyZWF0ZV9pbiAgewo+Pj4gICAJ
LyoqIHRoZSByZXF1ZXN0ZWQgbWVtb3J5IHNpemUgKi8KPj4+Cj4+IFRoaXMgZmxhZyBlc3NlbnRp
YWxseSBtZWFucyAiUGxlYXNlIGRvbid0IGxlYWsgbXkgQk8gY29udGVudHMiLgo+PiBTaW1pbGFy
bHksIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCBlc3NlbnRpYWxseSBtZWFucyAiUGxl
YXNlCj4+IGRvbid0IGxldCBtZSBzZWUgcHJldmlvdXMgbWVtb3J5IGNvbnRlbnRzIi4KPj4KPj4g
SSdkIGFyZ3VlIHRoYXQgbmVpdGhlciBmbGFnIHNob3VsZCByZWFsbHkgYmUgbmVlZGVkOyBCTyBj
b250ZW50cwo+PiBzaG91bGRuJ3QgYmUgbGVha2VkIGJ5IGRlZmF1bHQuCj4gCj4gTXkgY29uY2x1
c2lvbiBmcm9tIHByZXZpb3VzIGRpc2N1c3Npb25zIHdhcyB0aGF0IENSRUFURV9WUkFNX0NMRUFS
RUQgaGFzIAo+IG5vIHNlY3VyaXR5IGltcGxpY2F0aW9ucy4gSXQncyBiYXNpY2FsbHkgY29tcGxl
dGVseSBpbmVmZmVjdGl2ZSBhcyBhIAo+IHNlY3VyaXR5IG1lYXN1cmUuCgpBYnNvbHV0ZWx5LCB3
aGljaCBpcyB3aHkgSSBhcmd1ZWQgYWdhaW5zdCBpdCB3aGVuIGl0IHdhcyBwcm9wb3NlZC4KCj4g
SXQncyBtb3JlIGEgY29udmVuaWVuY2UgZmVhdHVyZS4gVGhlcmVmb3JlIEkgdGhpbmsgaXQgc3Rp
bGwgaGFzIGEgcGxhY2UKPiBhcyB0aGF0LgoKSXQnZCBiZSBhIG5vLW9wIGlmIG1lbW9yeSB3YXMg
YWx3YXlzIGNsZWFyZWQuIDopCgoKPiBJJ2QgYWdyZWUgb24gcHJpbmNpcGxlIHRoYXQgZGF0YSBz
aG91bGRuJ3QgYmUgbGVha2VkIGJ5IGRlZmF1bHQsIGJ1dCBpdCAKPiBoYXMgYmVlbiB0aGUgZGVm
YXVsdCBmb3IgYSBsb25nIHRpbWUuIE15IGltcHJlc3Npb24gd2FzIHRoYXQgZ3JhcGhpY3MgCj4g
Z3V5cyBjYXJlZCBtb3JlIGFib3V0IHBlcmZvcm1hbmNlIHRoYW4gc2VjdXJpdHkuIFNvIGNoYW5n
aW5nIHRoZSBkZWZhdWx0IAo+IG1heSBiZSBhIGhhcmQgc2VsbC4gT24gdGhlIGNvbXB1dGUgc2lk
ZSB3ZSBhbHJlYWR5IHRvb2sgYSBiaWcgCj4gcGVyZm9ybWFuY2UgaGl0IGJ5IGNsZWFyaW5nIGFs
bCBvdXIgVlJBTSwgc28gdGhpcyBjaGFuZ2Ugd291bGQgYmUgYW4gCj4gaW1wcm92ZW1lbnQgZm9y
IHVzLiBUaGVyZWZvcmUgSSB0aGluayBpdCBzdGlsbCBtYWtlcyBzZW5zZSB0byBsZXQgdGhlIAo+
IGFwcGxpY2F0aW9uIGNob29zZS4KCldoYXQgZXhhY3RseSBjb3VsZCB1c2Vyc3BhY2UgYmUgYWxs
b3dlZCB0byBjaG9vc2UgdGhvdWdoPyBJIGNhbiBvbmx5CnRoaW5rIG9mIGRpc2FibGluZyB0aGUg
Y2xlYXJpbmcgb2YgbWVtb3J5IGl0IGFsbG9jYXRlcyAoIlBsZWFzZSBsZWFrIG15CkJPIGNvbnRl
bnRzIiksIHdoaWNoIHNlZW1zIG9mIHJhdGhlciBkdWJpb3VzIHZhbHVlLgoKV2hhdCBtaWdodCBi
ZSBmZWFzaWJsZSBpcyBhbGxvd2luZyB0aGUgc3lzdGVtIGFkbWluaXN0cmF0b3IgdG8gZGlzYWJs
ZQppdCwgc2ltaWxhciB0byB0aGUgbWl0aWdhdGlvbnMgZm9yIE1lbHRkb3duL1NwZWN0cmUvLi4u
IHZ1bG5lcmFiaWxpdGllcy4KT1RPSCBJIGRvbid0IGtub3cgb2YgYW55IG1lY2hhbmlzbSBmb3Ig
ZGlzYWJsaW5nIHRoZSBjbGVhcmluZyBvZiBub3JtYWwKc3lzdGVtIFJBTSAod2hpY2ggaXMgYWxz
byBlZmZlY3RpdmUgYXQgbGVhc3QgdG8gc29tZSBkZWdyZWUgZm9yIEJPcwpvdXRzaWRlIG9mIFZS
QU0sIG1ha2luZyB0aGUgd2hvbGUgdGhpbmcgYSBiaXQgaW5jb25zaXN0ZW50KS4KCgotLSAKRWFy
dGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6
Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4
