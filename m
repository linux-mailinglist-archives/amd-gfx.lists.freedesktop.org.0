Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24DA7080
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 18:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8088982C;
	Tue,  3 Sep 2019 16:40:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id E667489686;
 Tue,  3 Sep 2019 16:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id C88342B2001;
 Tue,  3 Sep 2019 18:40:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id OTzcp-hFgXy5; Tue,  3 Sep 2019 18:40:45 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 819202AA15E;
 Tue,  3 Sep 2019 18:40:45 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.92.1)
 (envelope-from <michel@daenzer.net>)
 id 1i5BrI-0007pS-6D; Tue, 03 Sep 2019 18:40:44 +0200
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
To: Sasha Levin <sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
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
Message-ID: <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
Date: Tue, 3 Sep 2019 18:40:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903162519.7136-44-sashal@kernel.org>
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
Cc: Yu Zhao <yuzhao@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS0wOS0wMyA2OjIzIHAubS4sIFNhc2hhIExldmluIHdyb3RlOgo+IEZyb206IFl1IFpo
YW8gPHl1emhhb0Bnb29nbGUuY29tPgo+IAo+IFsgVXBzdHJlYW0gY29tbWl0IDg5ZjIzYjZlZmVm
NTU0NzY2MTc3YmY1MWFhNzU0YmNlMTRjM2U3ZGEgXQoKSG9sZCB5b3VyIGhvcnNlcyEKClRoaXMg
Y29tbWl0IGFuZCBjNGEzMmIyNjZkYTdiYjcwMmU2MDM4MWNhMGMzNWVhZGRiYzg5YTZjIGhhZCB0
byBiZQpyZXZlcnRlZCwgYXMgdGhleSBjYXVzZWQgcmVncmVzc2lvbnMuIFNlZSBjb21taXRzCjI1
ZWM0MjllODZiYjc5MGU0MDM4N2E1NTBmMDUwMWQwYWM1NWE0N2MgJgo5MmIwNzMwZWFmMmQ1NDlm
ZGZiMTBlY2M4YjcxZjM0YjlmNDcyYzEyIC4KCgpUaGlzIGlzbid0IGJvbHN0ZXJpbmcgY29uZmlk
ZW5jZSBpbiBob3cgdGhlc2UgcGF0Y2hlcyBhcmUgc2VsZWN0ZWQuLi4KSSdtIGFsc28gYSBsaXR0
bGUgbmVydm91cyBhYm91dCBvdGhlcnMgd2hpY2ggY2hhbmdlIHZhbHVlcyBieSBhbiBvcmRlcgpv
ZiBtYWduaXR1ZGUuIFRoZXJlIHdlcmUgY2FzZXMgYmVmb3JlIHdoZXJlIHN1Y2ggcGF0Y2hlcyB3
ZXJlIGJhY2twb3J0ZWQKdG8gYnJhbmNoZXMgd2hpY2ggZGlkbid0IGhhdmUgb3RoZXIgY29ycmVz
cG9uZGluZyBjaGFuZ2VzLCBzbyB0aGV5IGVuZGVkCnVwIGJyZWFraW5nIHN0dWZmIGluc3RlYWQg
b2YgZml4aW5nIGFueXRoaW5nLgoKCi0tIApFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCkxpYnJlIHNvZnR3YXJl
IGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVsb3Bl
cgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
