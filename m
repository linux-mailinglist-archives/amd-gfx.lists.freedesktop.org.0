Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ED26B77A
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jul 2019 09:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B72B6E27C;
	Wed, 17 Jul 2019 07:47:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 799A66E27C
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jul 2019 07:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id A066B2AA173;
 Wed, 17 Jul 2019 09:47:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id DmMfATDHPivo; Wed, 17 Jul 2019 09:47:04 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id AD78C2AA0DA;
 Wed, 17 Jul 2019 09:47:03 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hneeU-0003ZR-FM; Wed, 17 Jul 2019 09:47:02 +0200
Subject: Re: HMM related use-after-free with amdgpu
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 Jason Gunthorpe <jgg@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
 <20190716163545.GF29741@mellanox.com>
 <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
 <7b5daece-10ea-e96e-5e75-f6fa4e589d5e@amd.com>
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
Message-ID: <037ca75c-8aac-65a2-2f8d-6b2103089537@daenzer.net>
Date: Wed, 17 Jul 2019 09:47:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7b5daece-10ea-e96e-5e75-f6fa4e589d5e@amd.com>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0xNyAxMjoxMCBhLm0uLCBLdWVobGluZywgRmVsaXggd3JvdGU6Cj4gT24gMjAx
OS0wNy0xNiAxOjA0IHAubS4sIE1pY2hlbCBEw6RuemVyIHdyb3RlOgo+PiBPbiAyMDE5LTA3LTE2
IDY6MzUgcC5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gT24gVHVlLCBKdWwgMTYsIDIw
MTkgYXQgMDY6MzE6MDlQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+Pj4gT24gMjAx
OS0wNy0xNSA3OjI1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+Pj4gT24gTW9uLCBK
dWwgMTUsIDIwMTkgYXQgMDY6NTE6MDZQTSArMDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4+
Pj4+PiBXaXRoIGEgS0FTQU4gZW5hYmxlZCBrZXJuZWwgYnVpbHQgZnJvbSBhbWQtc3RhZ2luZy1k
cm0tbmV4dCwgdGhlCj4+Pj4+PiBhdHRhY2hlZCB1c2UtYWZ0ZXItZnJlZSBpcyBwcmV0dHkgcmVs
aWFibHkgZGV0ZWN0ZWQgZHVyaW5nIGEgcGlnbGl0IGdwdSBydW4uCj4+Pj4+IERvZXMgdGhpcyBi
cmFuY2ggeW91IGFyZSB0ZXN0aW5nIGhhdmUgdGhlIGhtbS5naXQgbWVyZ2VkPyBJIHRoaW5rIGZy
b20KPj4+Pj4gdGhlIG5hbWUgaXQgZG9lcyBub3Q/Cj4+Pj4gSW5kZWVkLCBuby4KPj4+Pgo+Pj4+
Cj4+Pj4+IFVzZSBhZnRlciBmcmVlJ3Mgb2YgdGhpcyBuYXR1cmUgd2VyZSBzb21ldGhpbmcgdGhh
dCB3YXMgZml4ZWQgaW4KPj4+Pj4gaG1tLmdpdC4uCj4+Pj4+Cj4+Pj4+IEkgZG9uJ3Qgc2VlIGFu
IG9idmlvdXMgd2F5IHlvdSBjYW4gaGl0IHNvbWV0aGluZyBsaWtlIHRoaXMgd2l0aCB0aGUKPj4+
Pj4gbmV3IGNvZGUgYXJyYW5nZW1lbnQuLgo+Pj4+IEkgdHJpZWQgbWVyZ2luZyB0aGUgaG1tLWRl
dm1lbS1jbGVhbnVwLjQgY2hhbmdlc1swXSBpbnRvIG15IDUuMi55ICsKPj4+PiBkcm0tbmV4dCBm
b3IgNS4zIGtlcm5lbC4gV2hpbGUgdGhlIHJlc3VsdCBkaWRuJ3QgaGl0IHRoZSBwcm9ibGVtLCBh
bGwKPj4+PiBHTF9BTURfcGlubmVkX21lbW9yeSBwaWdsaXQgdGVzdHMgZmFpbGVkLCBzbyBJIHN1
c3BlY3QgdGhlIHByb2JsZW0gd2FzCj4+Pj4gc2ltcGx5IGF2b2lkZWQgYnkgbm90IGFjdHVhbGx5
IGhpdHRpbmcgdGhlIEhNTSByZWxhdGVkIGZ1bmN0aW9uYWxpdHkuCj4+Pj4KPj4+PiBJdCdzIHBv
c3NpYmxlIHRoYXQgSSBtYWRlIGEgbWlzdGFrZSBpbiBtZXJnaW5nIHRoZSBjaGFuZ2VzLCBvciB0
aGF0IEkKPj4+PiBtaXNzZWQgc29tZSBvdGhlciByZXF1aXJlZCBjaGFuZ2VzLiBCdXQgaXQncyBh
bHNvIHBvc3NpYmxlIHRoYXQgdGhlIEhNTQo+Pj4+IGNoYW5nZXMgYnJva2UgdGhlIGNvcnJlc3Bv
bmRpbmcgdXNlci1wb2ludGVyIGZ1bmN0aW9uYWxpdHkgaW4gYW1kZ3B1Lgo+Pj4gTm90IHN1cmUs
IHRoaXMgd2FzIGFsbCBUZXN0ZWQgYnkgdGhlIEFNRCB0ZWFtIHNvIGl0IHNob3VsZCB3b3JrLCBJ
Cj4+PiBob3BlLgo+PiBJdCBjYW4ndCwgZHVlIHRvIHRoZSBpc3N1ZSBwb2ludGVkIG91dCBieSBM
aW51cyBpbiB0aGUgImRybSBwdWxsIGZvcgo+PiA1LjMtcmMxIiB0aHJlYWQ6IERSTV9BTURHUFVf
VVNFUlBUUiBzdGlsbCBkZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTSwgd2hpY2gKPj4gbm8gbG9uZ2Vy
IGV4aXN0cywgc28gaXQgY2FuJ3QgYmUgZW5hYmxlZC4KPiAKPiBBcyBmYXIgYXMgSSBjYW4gdGVs
bCwgTGludXMgZml4ZWQgdGhpcyB1cCBpbiBoaXMgbWVyZ2UgY29tbWl0IAo+IGJlODQ1NGFmYzUw
ZjQzMDE2Y2E4YjYxMzBkOTY3M2JkZDBiZDU2ZWMuCgpBaCEgVGhhdCdzIHRoZSBwaWVjZSBJIHdh
cyBtaXNzaW5nLCBzaW5jZSBJIGhhZCBtZXJnZWQgdGhlIGRybS1uZXh0CmNoYW5nZXMgYmVmb3Jl
IExpbnVzIGRpZC4gVGhhbmtzIEZlbGl4LgoKTm90ZSB0aGF0IEFGQUlDVCBpdCB3YXMgYmFzaWNh
bGx5IGx1Y2sgdGhhdCBMaW51cyBub3RpY2VkIHRoaXMgYW5kIGZpeGVkCml0IHVwLiBJdCB3b3Vs
ZCBiZSBiZXR0ZXIgbm90IHRvIHB1c2ggb3VyIGx1Y2sgbGlrZSB0aGlzLiA6KQoKCi0tIApFYXJ0
aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczov
L3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAg
ICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
