Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7532A21
	for <lists+amd-gfx@lfdr.de>; Mon,  3 Jun 2019 09:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD99A89259;
	Mon,  3 Jun 2019 07:56:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 967F989259
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 Jun 2019 07:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 8D0802AA0E9;
 Mon,  3 Jun 2019 09:56:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id xFePeDr4B55v; Mon,  3 Jun 2019 09:56:07 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id BE6AB2A6016;
 Mon,  3 Jun 2019 09:56:06 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hXhp6-0002og-RL; Mon, 03 Jun 2019 09:56:04 +0200
Subject: Re: [PATCH] dri2: reply to client for WaitMSC request in any case
To: "Cui, Flora" <Flora.Cui@amd.com>
References: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
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
Message-ID: <29e3211b-9db3-7aa8-cbf2-4743fb965f60@daenzer.net>
Date: Mon, 3 Jun 2019 09:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559111780-32513-1-git-send-email-flora.cui@amd.com>
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

T24gMjAxOS0wNS0yOSA4OjM2IGEubS4sIEN1aSwgRmxvcmEgd3JvdGU6Cj4gb3RoZXJ3aXNlIGNs
aWVudCB3b3VsZCB3YWl0IGZvciByZXBseSBmb3JldmVyIGFuZCBkZXNrdG9wIGFwcGVhcnMgaGFu
Zy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGbG9yYSBDdWkgPGZsb3JhLmN1aUBhbWQuY29tPgo+IC0t
LQo+ICBzcmMvYW1kZ3B1X2RyaTIuYyB8IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvc3JjL2FtZGdwdV9kcmkyLmMgYi9zcmMvYW1kZ3B1
X2RyaTIuYwo+IGluZGV4IDQ0MzE2YWMuLjM0MzUzYTcgMTAwNjQ0Cj4gLS0tIGEvc3JjL2FtZGdw
dV9kcmkyLmMKPiArKysgYi9zcmMvYW1kZ3B1X2RyaTIuYwo+IEBAIC0xMDYyLDYgKzEwNjIsOSBA
QCBzdGF0aWMgaW50IGFtZGdwdV9kcmkyX3NjaGVkdWxlX3dhaXRfbXNjKENsaWVudFB0ciBjbGll
bnQsIERyYXdhYmxlUHRyIGRyYXcsCj4gIG91dF9jb21wbGV0ZToKPiAgCWlmICh3YWl0X2luZm8p
Cj4gIAkJYW1kZ3B1X2RyaTJfZGVmZXJyZWRfZXZlbnQoTlVMTCwgMCwgd2FpdF9pbmZvKTsKPiAr
Cj4gKwlEUkkyV2FpdE1TQ0NvbXBsZXRlKGNsaWVudCwgZHJhdywgdGFyZ2V0X21zYywgMCwgMCk7
Cj4gKwo+ICAJcmV0dXJuIFRSVUU7Cj4gIH0KPiAgCj4gCgpQbGVhc2UgY3JlYXRlIGEgbWVyZ2Ug
cmVxdWVzdDoKaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3hvcmcvZHJpdmVyL3hmODYt
dmlkZW8tYW1kZ3B1L21lcmdlX3JlcXVlc3RzL25ldwoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETD
pG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tCkxp
YnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFu
ZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
