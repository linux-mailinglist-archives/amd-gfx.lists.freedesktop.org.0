Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EB6ACCB
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 18:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17ACC6E0E3;
	Tue, 16 Jul 2019 16:31:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D56E0E3
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 16:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 0BAD92AA12C;
 Tue, 16 Jul 2019 18:31:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 4LY9cStXNEwq; Tue, 16 Jul 2019 18:31:11 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 46A712AA0E9;
 Tue, 16 Jul 2019 18:31:11 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hnQMA-0007Rn-1z; Tue, 16 Jul 2019 18:31:10 +0200
Subject: Re: HMM related use-after-free with amdgpu
To: Jason Gunthorpe <jgg@mellanox.com>
References: <9a38f48b-3974-a238-5987-5251c1343f6b@daenzer.net>
 <20190715172515.GA5043@mellanox.com>
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
Message-ID: <823db68e-6601-bb3a-0c1f-bfc5169cb7c9@daenzer.net>
Date: Tue, 16 Jul 2019 18:31:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190715172515.GA5043@mellanox.com>
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

T24gMjAxOS0wNy0xNSA3OjI1IHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBNb24s
IEp1bCAxNSwgMjAxOSBhdCAwNjo1MTowNlBNICswMjAwLCBNaWNoZWwgRMOkbnplciB3cm90ZToK
Pj4KPj4gV2l0aCBhIEtBU0FOIGVuYWJsZWQga2VybmVsIGJ1aWx0IGZyb20gYW1kLXN0YWdpbmct
ZHJtLW5leHQsIHRoZQo+PiBhdHRhY2hlZCB1c2UtYWZ0ZXItZnJlZSBpcyBwcmV0dHkgcmVsaWFi
bHkgZGV0ZWN0ZWQgZHVyaW5nIGEgcGlnbGl0IGdwdSBydW4uCj4gCj4gRG9lcyB0aGlzIGJyYW5j
aCB5b3UgYXJlIHRlc3RpbmcgaGF2ZSB0aGUgaG1tLmdpdCBtZXJnZWQ/IEkgdGhpbmsgZnJvbQo+
IHRoZSBuYW1lIGl0IGRvZXMgbm90PwoKSW5kZWVkLCBuby4KCgo+IFVzZSBhZnRlciBmcmVlJ3Mg
b2YgdGhpcyBuYXR1cmUgd2VyZSBzb21ldGhpbmcgdGhhdCB3YXMgZml4ZWQgaW4KPiBobW0uZ2l0
Li4KPiAKPiBJIGRvbid0IHNlZSBhbiBvYnZpb3VzIHdheSB5b3UgY2FuIGhpdCBzb21ldGhpbmcg
bGlrZSB0aGlzIHdpdGggdGhlCj4gbmV3IGNvZGUgYXJyYW5nZW1lbnQuLgoKSSB0cmllZCBtZXJn
aW5nIHRoZSBobW0tZGV2bWVtLWNsZWFudXAuNCBjaGFuZ2VzWzBdIGludG8gbXkgNS4yLnkgKwpk
cm0tbmV4dCBmb3IgNS4zIGtlcm5lbC4gV2hpbGUgdGhlIHJlc3VsdCBkaWRuJ3QgaGl0IHRoZSBw
cm9ibGVtLCBhbGwKR0xfQU1EX3Bpbm5lZF9tZW1vcnkgcGlnbGl0IHRlc3RzIGZhaWxlZCwgc28g
SSBzdXNwZWN0IHRoZSBwcm9ibGVtIHdhcwpzaW1wbHkgYXZvaWRlZCBieSBub3QgYWN0dWFsbHkg
aGl0dGluZyB0aGUgSE1NIHJlbGF0ZWQgZnVuY3Rpb25hbGl0eS4KCkl0J3MgcG9zc2libGUgdGhh
dCBJIG1hZGUgYSBtaXN0YWtlIGluIG1lcmdpbmcgdGhlIGNoYW5nZXMsIG9yIHRoYXQgSQptaXNz
ZWQgc29tZSBvdGhlciByZXF1aXJlZCBjaGFuZ2VzLiBCdXQgaXQncyBhbHNvIHBvc3NpYmxlIHRo
YXQgdGhlIEhNTQpjaGFuZ2VzIGJyb2tlIHRoZSBjb3JyZXNwb25kaW5nIHVzZXItcG9pbnRlciBm
dW5jdGlvbmFsaXR5IGluIGFtZGdwdS4KCgpbMF0gU3BlY2lmaWNhbGx5LCB0aGUgZm9sbG93aW5n
IChyYW5nZXMgb2YpIGNvbW1pdHM6Cgo5ZmZiZThhYzA1ZGJiNGFiNGE0ODM2YTU1YTQ3ZmM2YmU5
NDVhMzhmICgtPiBsb2NrZGVwX2Fzc2VydF9oZWxkX3dyaXRlKQplMWJmYTg3Mzk5ZTM3MjQ0NjQ1
NGVjYmFlYmEyODAwZjBhMzg1NzMzLi41ZGEwNGNjODZkMTIxNWZkOWZlMGU1Yzg4ZWFkNmU4NDI4
YTc1ZTU2CmZlYzg4YWIwYWY5NzA2YjIyMDFlNWRhZjM3N2M1MDMxYzYyZDExZjdeLi5mZWM4OGFi
MGFmOTcwNmIyMjAxZTVkYWYzNzdjNTAzMWM2MmQxMWY3CgotLSAKRWFydGhsaW5nIE1pY2hlbCBE
w6RuemVyICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpM
aWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBh
bmQgWCBkZXZlbG9wZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
