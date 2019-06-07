Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E630385D5
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 09:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9796C89C8D;
	Fri,  7 Jun 2019 07:58:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7627789C8D
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 07:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 92AE82A6045;
 Fri,  7 Jun 2019 09:58:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id p8AUi4nyIrw8; Fri,  7 Jun 2019 09:58:36 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D4E1C2A6042;
 Fri,  7 Jun 2019 09:58:35 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hZ9lh-0007ia-71; Fri, 07 Jun 2019 09:58:33 +0200
Subject: Re: [PATCH 10/24] drm/amd/display: Rework CRTC color management
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <20190606205501.16505-1-Bhawanpreet.Lakha@amd.com>
 <20190606205501.16505-11-Bhawanpreet.Lakha@amd.com>
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
Message-ID: <a9b95680-66f6-6f1e-5741-0786c6eb6240@daenzer.net>
Date: Fri, 7 Jun 2019 09:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606205501.16505-11-Bhawanpreet.Lakha@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNi0wNiAxMDo1NCBwLm0uLCBCaGF3YW5wcmVldCBMYWtoYSB3cm90ZToKPiBGcm9t
OiBOaWNob2xhcyBLYXpsYXVza2FzIDxuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20+Cj4gCj4g
W1doeV0KPiBUbyBwcmVwYXJlIGZvciB0aGUgdXBjb21pbmcgRFJNIHBsYW5lIGNvbG9yIG1hbmFn
ZW1lbnQgcHJvcGVydGllcwo+IHdlIG5lZWQgdG8gY29ycmVjdCBhIGxvdCBvZiB3cm9uZyBiZWhh
dmlvciBhbmQgYXNzdW1wdGlvbnMgbWFkZSBmb3IKPiBDUlRDIGNvbG9yIG1hbmFnZW1lbnQuCj4g
Cj4gVGhlIGRvY3VtZW50YXRpb24gYWRkZWQgYnkgdGhpcyBjb21taXQgaW4gYW1kZ3B1X2RtX2Nv
bG9yIGV4cGxhaW5zCj4gaG93IHRoZSBIVyBjb2xvciBwaXBlbGluZSB3b3JrcyBhbmQgaXRzIGxp
bWl0YXRpb25zIHdpdGggdGhlIERSTQo+IGludGVyZmFjZS4KPiAKPiBUaGUgY3VycmVudCBpbXBs
ZW1lbnRhdGlvbiBkb2VzIHRoZSBmb2xsb3dpbmcgd3Jvbmc6Cj4gLSBJbXBsaWNpdCBzUkdCIERH
TSB3aGVuIG5vIENSVEMgREdNIGlzIHNldAo+IC0gSW1wbGljaXQgc1JHQiBSR00gd2hlbiBubyBD
UlRDIFJHTSBpcyBzZXQKPiAtIE5vIHdheSB0byBzcGVjaWZ5IGEgbm9uLWxpbmVhciBER00gbWF0
cml4IHRoYXQgcHJvZHVjZXMgY29ycmVjdCBvdXRwdXQKPiAtIE5vIHdheSB0byBzcGVjaWZ5IGEg
Y29ycmVjdCBSR00gd2hlbiBhIGxpbmVhciBER00gaXMgdXNlZAo+IAo+IFdlIGhhZCB3b3JrYXJv
dW5kcyBmb3IgcGFzc2luZyBrbXNfY29sb3IgdGVzdHMgYnV0IG5vdCBhbGwgb2YgdGhlCj4gYmVo
YXZpb3Igd2UgaGFkIHdyb25nIHdhcyBjb3ZlcmVkIGJ5IHRoZXNlIHRlc3RzIChlc3BlY2lhbGx5
IHdoZW4KPiBpdCBjb21lcyB0byBub24tbGluZWFyIERHTSkuIFRlc3RpbmcgYm90aCBER00gYW5k
IFJHTSBhdCB0aGUgc2FtZSB0aW1lCj4gaXNuJ3Qgc29tZXRoaW5nIGttc19jb2xvciB0ZXN0cyB3
ZWxsIGVpdGhlci4KPiAKPiBbSG93XQo+IFRoZSBzcGVjaWZpY3MgZm9yIGhvdyBjb2xvciBtYW5h
Z2VtZW50IHdvcmtzIGluIEFNREdQVSBhbmQgdGhlIG5ldwo+IGJlaGF2aW9yIGNhbiBiZSBmb3Vu
ZCBieSByZWFkaW5nIHRoZSBkb2N1bWVudGF0aW9uIGFkZGVkIHRvCj4gYW1kZ3B1X2RtX2NvbG9y
LmMgZnJvbSB0aGlzIHBhdGNoLgo+IAo+IEFsbCBvZiB0aGUgaW5jb3JyZWN0IGNhc2VzIGZyb20g
dGhlIG9sZCBpbXBsZW1lbnRhdGlvbiBoYXZlIGJlZW4KPiBhZGRyZXNzZWQgZm9yIHRoZSBhdG9t
aWMgaW50ZXJmYWNlLCBidXQgdGhlcmUgc3RpbGwgYSBmZXcgVE9ET3MgZm9yCj4gdGhlIGxlZ2Fj
eSBvbmUuCj4gCj4gTm90ZTogdGhpcyBkb2VzIGNhdXNlIHJlZ3Jlc3Npb25zIGZvciBrbXNfY29s
b3JAcGlwZS1hLWN0bS0qIG92ZXIgSERNSS4KPiAKPiBUaGUgcmVzdWx0IGxvb2tzIGNvcnJlY3Qg
ZnJvbSB2aXN1YWwgaW5zcGVjdGlvbiBidXQgdGhlIENSQyBubyBsb25nZXIKPiBtYXRjaGVzLiBG
b3IgcmVmZXJlbmNlLCB0aGUgdGVzdCB3YXMgcHJldmlvdXNseSBkb2luZyB0aGUgZm9sbG93aW5n
Ogo+IAo+IGxpbmVhciBkZWdhbW1hIC0+IENUTSAtPiBzUkdCIHJlZ2FtbWEgLT4gUkdCIHRvIFlV
ViAoNzA5KSAtPiAuLi4KPiAKPiBOb3cgdGhlIHRlc3QgaXMgZG9pbmc6Cj4gCj4gbGluZWFyIGRl
Z2FtbWEgLT4gQ1RNIC0+IGxpbmVhciByZWdhbW1hIC0+IFJHQiB0byBZVVYgKDcwOSkgLT4gLi4u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1
c2thc0BhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBTdW4gcGVuZyBMaSA8U3VucGVuZy5MaUBhbWQu
Y29tPgo+IEFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4KCkRvZXMgdGhpcyBhZGRyZXNzIGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvMTEw
Njc3ID8gSWYgc28sIGNhbiB5b3UKYWRkIGEgcmVmZXJlbmNlIHRvIHRoZSBjb21taXQgbG9nPwoK
Ci0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICBodHRwczovL3d3dy5hbWQuY29tCkxpYnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAg
ICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3BlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
