Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A9C87C63
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 16:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2E26EE11;
	Fri,  9 Aug 2019 14:13:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 41E4E6EE11
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 321A92B200F;
 Fri,  9 Aug 2019 16:13:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id pFvyOyxLGtKs; Fri,  9 Aug 2019 16:13:12 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 7C4B82B200E;
 Fri,  9 Aug 2019 16:13:12 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hw5dn-00084Q-TK; Fri, 09 Aug 2019 16:13:11 +0200
Subject: Re: libdrm patch merge request
To: "Chen, Guchun" <Guchun.Chen@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <BYAPR12MB27097A9CC4333FD798966B30F1D70@BYAPR12MB2709.namprd12.prod.outlook.com>
 <CADnq5_N5TrBKCH_S+=eDXxQQ-VwEvONn1aGyicSrL3B38BJhSA@mail.gmail.com>
 <DM6PR12MB27141A339F87664639DB5F9BF1D60@DM6PR12MB2714.namprd12.prod.outlook.com>
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
Message-ID: <2d11b7f4-c9f5-cdc4-9e23-e54ca470f0eb@daenzer.net>
Date: Fri, 9 Aug 2019 16:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB27141A339F87664639DB5F9BF1D60@DM6PR12MB2714.namprd12.prod.outlook.com>
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
Cc: "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Li, Candice" <Candice.Li@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

ClRoaXMgYnJva2UgdGhlIENJIHBpcGVsaW5lOgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5v
cmcvbWVzYS9kcm0vcGlwZWxpbmVzLzU0OTAzCgpMb29rcyBsaWtlIHRoZSBwcm9ibGVtIGlzIHRo
YXQgdGhlIGF1dG90b29scyBidWlsZCBkb2Vzbid0IHByb3Blcmx5CmRpc2FibGUgdGhlIGFtZGdw
dSB0ZXN0cyB3aGVuIHRoZSBqc29uLWMgbGlicmFyeSBpcyBtaXNzaW5nLiBJIHN1Z2dlc3QKdGhl
IGZvbGxvd2luZzoKCjEuIEFkZCBhIEhBVkVfSlNPTkMgZ3VhcmQgaW4gdGVzdHMvTWFrZWZpbGUu
YW0KMi4gQWRkIGxpYmpzb24tYy1kZXYgdG8gdGhlIHBhY2thZ2VzIGluc3RhbGxlZCBieSB0aGUg
b2xkZXN0LWF1dG90b29scwogICBqb2IgaW4gLmdpdGxhYi1jaS55bWwKCgpVbnRpbCBsaWJkcm0g
dXNlcyBHaXRMYWIgbWVyZ2UgcmVxdWVzdHMgdG8gY2F0Y2ggdGhpcyBraW5kIG9mIGlzc3VlCmJl
Zm9yZSBpdCBoaXRzIG1hc3RlciwgcGxlYXNlIHB1c2ggY2hhbmdlcyB0byBhIGJyYW5jaCBpbiBh
IGZvcmtlZApwZXJzb25hbCByZXBvc2l0b3J5IGFuZCBtYWtlIHN1cmUgdGhlIENJIHBpcGVsaW5l
IGNvbWVzIGJhY2sgZ3JlZW4KYmVmb3JlIGFza2luZyBmb3IgdGhlbSB0byBiZSBwdXNoZWQgdG8g
bWFzdGVyLgoKClRoYW5rcywKCgpPbiAyMDE5LTA4LTA5IDM6MjUgYS5tLiwgQ2hlbiwgR3VjaHVu
IHdyb3RlOgo+IFRoYW5rcywgQWxleC4KPiAKPiBSZWdhcmRzLAo+IEd1Y2h1bgo+IAo+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBn
bWFpbC5jb20+IAo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDksIDIwMTkgMToyNCBBTQo+IFRvOiBD
aGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFtZC5jb20+Cj4gQ2M6IERldWNoZXIsIEFsZXhhbmRl
ciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnOyBaaG91MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IExpLCBDYW5kaWNlIDxDYW5kaWNl
LkxpQGFtZC5jb20+OyBMaSwgRGVubmlzIDxEZW5uaXMuTGlAYW1kLmNvbT47IFpoYW5nLCBIYXdr
aW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+Cj4gU3ViamVjdDogUmU6IGxpYmRybSBwYXRjaCBt
ZXJnZSByZXF1ZXN0Cj4gCj4gRG9uZSEKPiAKPiBBbGV4Cj4gCj4gT24gVGh1LCBBdWcgOCwgMjAx
OSBhdCA1OjE4IEFNIENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNvbT4gd3JvdGU6Cj4+
Cj4+IEhpIEFsZXgsCj4+Cj4+Cj4+Cj4+IFdvdWxkIHlvdSBtaW5kIG1lcmdpbmcgYXR0YWNoZWQg
MyBwYXRjaGVzIHRvIGxpYmRybSBtYXN0ZXIgYnJhbmNoPwo+Pgo+PiBUaGVzZSBjaGFuZ2VzIGFy
ZSBpbXBsZW1lbnRlZCBmb3IgZ2Z4IGFuZCB1bWMgcmFzIGluamVjdCB1bml0IHRlc3QgYnkgYW1k
Z3B1X3Rlc3QuCj4+Cj4+IFRoYW5rcyBhIGxvdC4KPj4KPj4KPj4KPj4gUmVnYXJkcywKPj4KPj4g
R3VjaHVuCj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vYW1kLWdmeAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdm
eAo+IAoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAg
ICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAg
ICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
