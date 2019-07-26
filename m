Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3076173
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 11:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DA46E8C2;
	Fri, 26 Jul 2019 09:03:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0885D6E8C2
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 09:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id EBB902A6042;
 Fri, 26 Jul 2019 11:03:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id hv1Ul1RDPzJy; Fri, 26 Jul 2019 11:03:20 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 873152A6016;
 Fri, 26 Jul 2019 11:03:20 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hqw8G-0005Tu-6N; Fri, 26 Jul 2019 11:03:20 +0200
Subject: Re: [PATCH v5 4/4] drm/amd/display: enable S/G for RAVEN chip
To: christian.koenig@amd.com, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
References: <1564064683-31796-1-git-send-email-andrey.grodzovsky@amd.com>
 <1564064683-31796-5-git-send-email-andrey.grodzovsky@amd.com>
 <a1e2755c-142c-ceaf-9be4-1ffff4d25cea@gmail.com>
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
Message-ID: <8046a45b-bf49-ad47-8902-ad928dcc97b4@daenzer.net>
Date: Fri, 26 Jul 2019 11:03:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a1e2755c-142c-ceaf-9be4-1ffff4d25cea@gmail.com>
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
Cc: Alexander.Deucher@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, shirish.s@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yNiA5OjE0IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjUu
MDcuMTkgdW0gMTY6MjQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gRnJvbTogU2hpcmlz
aCBTIDxzaGlyaXNoLnNAYW1kLmNvbT4KPj4KPj4gZW5hYmxlcyBncHVfdm1fc3VwcG9ydCBpbiBk
bSBhbmQgYWRkcwo+PiBBTURHUFVfR0VNX0RPTUFJTl9HVFQgYXMgc3VwcG9ydGVkIGRvbWFpbgo+
Pgo+PiB2MjoKPj4gTW92ZSBCTyBwbGFjZW1lbnQgbG9naWMgaW50byBhbWRncHVfZGlzcGxheV9z
dXBwb3J0ZWRfZG9tYWlucwo+Pgo+PiB2MzoKPj4gVXNlIGFtZGdwdV9ib192YWxpZGF0ZV91c3dj
IGluIGFtZGdwdV9kaXNwbGF5X3N1cHBvcnRlZF9kb21haW5zLgo+Pgo+PiB2NDoKPj4gYW1kZ3B1
X2JvX3ZhbGlkYXRlX3Vzd2MgbW92ZWQgdG8gc2VwcGVyYXRlIHBhdGNoLgo+Pgo+PiBDaGFuZ2Ut
SWQ6IElmMzQzMDBiZWFhNjBiZTJkMzYxNzBiN2I1YjA5NmVjNjQ0NTAyYjIwCj4+IFNpZ25lZC1v
ZmYtYnk6IFNoaXJpc2ggUyA8c2hpcmlzaC5zQGFtZC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+PiAtLS0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuY8KgwqDCoMKgwqDCoCB8
IDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyB8IDIgKy0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfZGlzcGxheS5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rp
c3BsYXkuYwo+PiBpbmRleCBjYWM5OTc1Li43MzA0NWEzIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKPj4gQEAgLTUwNSw3ICs1MDUsNyBAQCB1
aW50MzJfdCBhbWRncHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhzdHJ1Y3QKPj4gYW1kZ3B1
X2RldmljZSAqYWRldikKPj4gwqDCoMKgwqDCoMKgICogQVBVcy4gU28gZm9yY2UgdGhlIEJPIHBs
YWNlbWVudCB0byBWUkFNIGluIGNhc2UgdGhpcwo+PiBhcmNoaXRlY3R1cmUKPj4gwqDCoMKgwqDC
oMKgICogd2lsbCBub3QgYWxsb3cgVVNXQyBtYXBwaW5ncy4KPj4gwqDCoMKgwqDCoMKgICovCj4+
IC3CoMKgwqAgaWYgKGFkZXYtPmFzaWNfdHlwZSA+PSBDSElQX0NBUlJJWk8gJiYgYWRldi0+YXNp
Y190eXBlIDwKPj4gQ0hJUF9SQVZFTiAmJgo+PiArwqDCoMKgIGlmIChhZGV2LT5hc2ljX3R5cGUg
Pj0gQ0hJUF9DQVJSSVpPICYmIGFkZXYtPmFzaWNfdHlwZSA8PQo+PiBDSElQX1JBVkVOICYmCj4g
Cj4gVGhpcyB3aG9sZSBhcHByb2FjaCBpcyBpbmNvcnJlY3Qgc2luY2Ugd2UgZG9uJ3QgY2hlY2sg
dGhlIGZsYWdzIG9mIHRoZQo+IGFjdHVhbGx5IEJPIHVzZWQgZm9yIHNjYW5vdXQgYW55IG1vcmUu
Cj4gCj4gQXMgSSB3cm90ZSBiZWZvcmUgaXQgaXMgc3RpbGwgcGVyZmVjdGx5IHBvc3NpYmxlIGFu
ZCB2YWxpZCB0aGF0Cj4gdXNlcnNwYWNlIG5ldmVyIHNldHMgdGhpcyBmbGFnLgoKT2ggcmlnaHQs
IG5vdyBJIGdldCB3aGF0IHlvdSBtZWFudCBiZWZvcmUhCgpJIGd1ZXNzIGFtZGdwdV9kaXNwbGF5
X3N1cHBvcnRlZF9kb21haW5zIG5lZWRzIHRvIHRha2UgdGhlIEJPIGZsYWdzIGFzIGEKcGFyYW1l
dGVyLCBhbmQgYWxzbyBjaGVjayB0aGF0IEFNREdQVV9HRU1fQ1JFQVRFX0NQVV9HVFRfVVNXQyBp
cwphY3R1YWxseSBzZXQuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAg
ICAgIHwgICAgICAgICAgICAgIGh0dHBzOi8vd3d3LmFtZC5jb20KTGlicmUgc29mdHdhcmUgZW50
aHVzaWFzdCAgICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
