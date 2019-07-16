Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E36AD54
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 19:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3E4C6E155;
	Tue, 16 Jul 2019 17:04:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 143606E155
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 17:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 693AC2AA12C;
 Tue, 16 Jul 2019 19:04:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id NJeX02vqF-eQ; Tue, 16 Jul 2019 19:04:53 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id BB70E2AA0E9;
 Tue, 16 Jul 2019 19:04:53 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hnQsn-0007gH-EB; Tue, 16 Jul 2019 19:04:53 +0200
Subject: Re: HMM related use-after-free with amdgpu
To: Jason Gunthorpe <jgg@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
 <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
 <20190716163545.GF29741@mellanox.com>
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
Message-ID: <cc010b8d-0018-783a-648f-01099fc63352@daenzer.net>
Date: Tue, 16 Jul 2019 19:04:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716163545.GF29741@mellanox.com>
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

T24gMjAxOS0wNy0xNiA2OjM1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUdWUs
IEp1bCAxNiwgMjAxOSBhdCAwNjozMTowOVBNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToK
Pj4gT24gMjAxOS0wNy0xNSA3OjI1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+IE9u
IE1vbiwgSnVsIDE1LCAyMDE5IGF0IDA2OjUxOjA2UE0gKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdy
b3RlOgo+Pj4+Cj4+Pj4gV2l0aCBhIEtBU0FOIGVuYWJsZWQga2VybmVsIGJ1aWx0IGZyb20gYW1k
LXN0YWdpbmctZHJtLW5leHQsIHRoZQo+Pj4+IGF0dGFjaGVkIHVzZS1hZnRlci1mcmVlIGlzIHBy
ZXR0eSByZWxpYWJseSBkZXRlY3RlZCBkdXJpbmcgYSBwaWdsaXQgZ3B1IHJ1bi4KPj4+Cj4+PiBE
b2VzIHRoaXMgYnJhbmNoIHlvdSBhcmUgdGVzdGluZyBoYXZlIHRoZSBobW0uZ2l0IG1lcmdlZD8g
SSB0aGluayBmcm9tCj4+PiB0aGUgbmFtZSBpdCBkb2VzIG5vdD8KPj4KPj4gSW5kZWVkLCBuby4K
Pj4KPj4KPj4+IFVzZSBhZnRlciBmcmVlJ3Mgb2YgdGhpcyBuYXR1cmUgd2VyZSBzb21ldGhpbmcg
dGhhdCB3YXMgZml4ZWQgaW4KPj4+IGhtbS5naXQuLgo+Pj4KPj4+IEkgZG9uJ3Qgc2VlIGFuIG9i
dmlvdXMgd2F5IHlvdSBjYW4gaGl0IHNvbWV0aGluZyBsaWtlIHRoaXMgd2l0aCB0aGUKPj4+IG5l
dyBjb2RlIGFycmFuZ2VtZW50Li4KPj4KPj4gSSB0cmllZCBtZXJnaW5nIHRoZSBobW0tZGV2bWVt
LWNsZWFudXAuNCBjaGFuZ2VzWzBdIGludG8gbXkgNS4yLnkgKwo+PiBkcm0tbmV4dCBmb3IgNS4z
IGtlcm5lbC4gV2hpbGUgdGhlIHJlc3VsdCBkaWRuJ3QgaGl0IHRoZSBwcm9ibGVtLCBhbGwKPj4g
R0xfQU1EX3Bpbm5lZF9tZW1vcnkgcGlnbGl0IHRlc3RzIGZhaWxlZCwgc28gSSBzdXNwZWN0IHRo
ZSBwcm9ibGVtIHdhcwo+PiBzaW1wbHkgYXZvaWRlZCBieSBub3QgYWN0dWFsbHkgaGl0dGluZyB0
aGUgSE1NIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eS4KPj4KPj4gSXQncyBwb3NzaWJsZSB0aGF0IEkg
bWFkZSBhIG1pc3Rha2UgaW4gbWVyZ2luZyB0aGUgY2hhbmdlcywgb3IgdGhhdCBJCj4+IG1pc3Nl
ZCBzb21lIG90aGVyIHJlcXVpcmVkIGNoYW5nZXMuIEJ1dCBpdCdzIGFsc28gcG9zc2libGUgdGhh
dCB0aGUgSE1NCj4+IGNoYW5nZXMgYnJva2UgdGhlIGNvcnJlc3BvbmRpbmcgdXNlci1wb2ludGVy
IGZ1bmN0aW9uYWxpdHkgaW4gYW1kZ3B1Lgo+IAo+IE5vdCBzdXJlLCB0aGlzIHdhcyBhbGwgVGVz
dGVkIGJ5IHRoZSBBTUQgdGVhbSBzbyBpdCBzaG91bGQgd29yaywgSQo+IGhvcGUuCgpJdCBjYW4n
dCwgZHVlIHRvIHRoZSBpc3N1ZSBwb2ludGVkIG91dCBieSBMaW51cyBpbiB0aGUgImRybSBwdWxs
IGZvcgo1LjMtcmMxIiB0aHJlYWQ6IERSTV9BTURHUFVfVVNFUlBUUiBzdGlsbCBkZXBlbmRzIG9u
IEFSQ0hfSEFTX0hNTSwgd2hpY2gKbm8gbG9uZ2VyIGV4aXN0cywgc28gaXQgY2FuJ3QgYmUgZW5h
YmxlZC4KCkZpeGluZyB0aGF0IHVwIG1hbnVhbGx5LCBpdCBzdWNjZXNzZnVsbHkgZmluaXNoZWQg
YSBwaWdsaXQgcnVuIHdpdGggdGhhdApmdW5jdGlvbmFsaXR5IGVuYWJsZWQgYXMgd2VsbC4KCgot
LSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAg
aHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAg
IHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9hbWQtZ2Z4
